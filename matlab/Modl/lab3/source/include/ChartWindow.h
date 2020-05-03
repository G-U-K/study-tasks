#pragma once

namespace Ui
{
	class ChartWindow;
}

class ChartWindow : public QMainWindow
{
	Q_OBJECT
public:
	ChartWindow(QWidget * parent = nullptr);
	~ChartWindow();
	void CreateChart(int readerNumber);

public slots:
	void AddTaskNumber(int n);
	void OnCompleteTask();
	
	void AddResult(int readerNumber, double x, double y);
	void LogError(int readerNumber, const QString & desc);

private slots:
	void OnUpdate();
	
private:
	struct ChartViewInfo
	{
		QLineSeries *	series = nullptr;
		double			xMin = 0.0, xMax = 0.0;
		double			yMin = 0.0, yMax = 0.0;
		int				tabIndex = 0;
		QString			name;
	};
	ChartViewInfo * GetChartInfo(int readerNumber);

	class StatusBarMessage
	{
	public:
		StatusBarMessage(int readerNumber, const QString & desc, QLabel * label);

		bool IsReady() const;	
		void Update(int msec);
		
	private:
		QString				_desc;
		QLabel *			_label;
		int					_msecToNormalTotal = 0;
		int					_msecToFadeTotal = 0;
		int					_msecToNormal = 0;
		int					_msecToFade = 0;
		bool				_started = false;
	};
	
	QTimer *						m_updateTimer = nullptr;	
	QLabel *						m_messageLabel = nullptr;
	list<StatusBarMessage>			m_messages;
	map<int, ChartViewInfo>			m_charts;
	Ui::ChartWindow *				ui = nullptr;
};
