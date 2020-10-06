% Чтобы форматирование имело смысл - использовать моноширный шрифт в
% оболочке



% Инф об отелях
% hotel('Отель Название',класс 0-5).
%
% Инф о свободных номерах
% room('Отель Название','номер',цена).

hotel('Космос',3).
hotel('Петушки',1).
hotel('Мари',3).
hotel('Реанис',4).
hotel('ОТЕЛЬ',5).
hotel('Золотое яблоко',5).

room('Золотое яблоко','ролекс',220).
room('Реанис','перфоманс',299).
room('Мари','208',61).
room('Петушки','п72',200).
room('ОТЕЛЬ','номер премиум',249).
room('Золотое яблоко','феникс',121).
room('ОТЕЛЬ','номер люкс',630).
room('Космос','52',70).
room('Космос','01',250).
room('Мари','152',521).
room('Петушки','п123',250).
room('Реанис','комедия',211).
room('Золотое яблоко','маркс',150).
room('Петушки','п225',150).
room('Реанис','драма',50).

% поиск отеля по классу
f_hotel_by_class(Class):-hotel(X,Class),write(X),nl,fail.

% вывести все номера отелей
show_all_rooms:-room(Hotel,Room,Price),
	writef('%16l%16l%w\n',[Hotel,Room,Price]),fail.

% вывести номера отелей с ценой ниже Bound
rooms_restricted_by_price(Bound):-room(Hotel,Room,Price),Price<Bound,
	writef('%16l%16l%w\n',[Hotel,Room,Price]),fail.

% печать разделительной линии длины N символов
splitter(N):-writef('%r\n',['-',N]).


menu:-write('Элементы МЕНЮ:'),nl,
	write('1 - Поиск отеля по классу'),nl,
	write('2 - Вывести информацию о всех свободных номерах'),nl,
	write('3 - Найти номера с ценой за сутки менее...'),nl,
	splitter(47),
	write('Выберите пункт меню'),nl,
	read(Item),switch(Item).

switch(1):-write('Какого класса отель интересует?'),nl,
	read(Class),
	write('Найденные отели:'),nl,
	splitter(35),
	f_hotel_by_class(Class),
	splitter(35),
	menu.

switch(2):-write('Все свободные номера'),nl,
	writef('%15l|%15l|%w\n',['Название отеля','название номера','цена за сутки']),
	splitter(47),
	show_all_rooms,
	splitter(47),
	menu.

switch(3):-write('Укажите крайнюю цену'),nl,
	read(Bound),
	writef('%15l|%15l|%w\n',['Название отеля','название номера','цена за сутки']),
	splitter(47),
	rooms_restricted_by_price(Bound),
	splitter(47),
	menu.

% точка входа - тоже меню
main:-menu.
