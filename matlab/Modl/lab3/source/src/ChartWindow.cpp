#include "ChartWindow.h"
#include "ui_ChartWindow.h"

namespace
{
	QString GenerateChartName(int readerNumber)
	{
		return QString(u8"Зависимость числа считанных символов %1 процессов чтения от вероятности процесса записи").arg(readerNumber);
	}
}

ChartWindow::ChartWindow(QWidget * parent)
	: QMainWindow(parent)
	, ui(new Ui::ChartWindow())
{
	ui->setupUi(this);
	ui->progressBar->setMaximum(0);
	ui->groupBox->setTitle(u8"Количество процессов чтения");

	m_messageLabel = new QLabel(this);
	
	m_updateTimer = new QTimer(this);
	m_updateTimer->setInterval(1000 / 30);
	connect(m_updateTimer, &QTimer::timeout, this, &ChartWindow::OnUpdate);
	m_updateTimer->start();

	ui->statusBar->addPermanentWidget(m_messageLabel);
}

ChartWindow::~ChartWindow()
{
	delete ui;
	m_updateTimer->deleteLater();
	m_messageLabel->deleteLater();
}

void ChartWindow::AddResult(int readerNumber, double x, double y)
{
	auto chartInfo = GetChartInfo(readerNumber);
	if (!chartInfo)
	{
		LogError(readerNumber, QString(u8"Не удалось добавить результат вычислений для графика с %1 процессами чтения!").arg(readerNumber));
		return;
	}	
	chartInfo->series->append(x, y);
		
	chartInfo->xMin = std::min(chartInfo->xMin,x);
	chartInfo->xMax = std::max(chartInfo->xMax,x);
	chartInfo->yMin = std::min(chartInfo->yMin,y);
	chartInfo->yMax = std::max(chartInfo->yMax,y);

	auto chart = chartInfo->series->chart();
	chart->axes(Qt::Vertical).first()->setRange(chartInfo->yMin * 0.99, chartInfo->yMax * 1.01);
	chart->axes(Qt::Horizontal).first()->setRange(chartInfo->xMin * 0.99, chartInfo->xMax * 1.01);
}

void ChartWindow::LogError(int readerNumber, const QString & desc)
{
	m_messages.emplace_back(readerNumber, desc, m_messageLabel);
}

void ChartWindow::OnUpdate()
{
	if (!m_messages.empty())
	{
		auto & msg = m_messages.front();
		if (!msg.IsReady())
		{
			auto msec = m_updateTimer->interval();
			msg.Update(msec);
		}
		else
		{
			m_messages.pop_front();
		}
		
	}
}

ChartWindow::ChartViewInfo* ChartWindow::GetChartInfo(int readerNumber)
{
	auto it = m_charts.find(readerNumber);
	if (it == m_charts.end())
	{
		return nullptr;
	}
	return &it->second;
}

ChartWindow::StatusBarMessage::StatusBarMessage(int readerNumber, const QString & desc, QLabel* label)
	: _label(label)
	, _desc(desc)
	, _msecToNormalTotal(1000)
	, _msecToFadeTotal(3000)
{	
	_desc[0] = _desc[0].toLower();
	_desc = QString(u8"Ошибка при работе с %1 процессами чтения: ").arg(readerNumber) + _desc;
}

bool ChartWindow::StatusBarMessage::IsReady() const
{
	return _msecToFade >= _msecToFadeTotal;
}

void ChartWindow::StatusBarMessage::Update(int msec)
{
	if (!_started)
	{
		_label->setText(_desc);
		_started = true;
	}
	
	// [0:255]
	int background = 0;
	int text = 255;
		
	if (_msecToNormal < _msecToNormalTotal)
	{
		auto normalCoef = std::clamp(_msecToNormal / static_cast<float>(_msecToNormalTotal), 0.0f, 1.0f);
		background = (1.0f - normalCoef) * 255;
		_msecToNormal += msec;
	}
	else
	{
		auto fadeCoef = std::clamp(_msecToFade / static_cast<float>(_msecToFadeTotal), 0.0f, 1.0f);
		text = (1.0f - fadeCoef) * 255;
		_msecToFade += msec;
	}
	
	auto styleSheet = QString("QLabel { background-color: rgba(255, 0, 0, %1); color: rgba(0, 0, 0, %2) }")
		.arg(background)
		.arg(text);
	_label->setStyleSheet(styleSheet);
}

void ChartWindow::CreateChart(int readerNumber)
{
	if (GetChartInfo(readerNumber))
	{
		std::cerr << "Attempting to create chart with " << readerNumber << " number of reader processes repeatedly!";
		return;
	}

	auto chartName = GenerateChartName(readerNumber);
	
	auto chart = new QChart();
	auto serials = new QLineSeries(this);


	chart->addSeries(serials);
	chart->setTitle(chartName);
	chart->createDefaultAxes();

	auto axises = chart->axes();
	axises[0]->setTitleText(u8"Вероятность процесса записи");
	axises[1]->setTitleText(u8"Количество считанных символов");
	
	auto chartView = new QChartView(chart, this);
    chartView->setRenderHint(QPainter::Antialiasing);
	
	ChartViewInfo viewInfo;
	viewInfo.series = serials;
	viewInfo.tabIndex = ui->tabWidget->count();
	viewInfo.name = std::move(chartName);
	
	m_charts.emplace(readerNumber, viewInfo);
	ui->tabWidget->addTab(chartView, QString::number(readerNumber));
}

void ChartWindow::AddTaskNumber(int n)
{
	ui->progressBar->setRange(0, ui->progressBar->maximum() + n);
}

void ChartWindow::OnCompleteTask()
{
	ui->progressBar->setValue(ui->progressBar->value() + 1);
}