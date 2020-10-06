% ����� �������������� ����� ����� - ������������ ���������� ����� �
% ��������



% ��� �� ������
% hotel('����� ��������',����� 0-5).
%
% ��� � ��������� �������
% room('����� ��������','�����',����).

hotel('������',3).
hotel('�������',1).
hotel('����',3).
hotel('������',4).
hotel('�����',5).
hotel('������� ������',5).

room('������� ������','������',220).
room('������','���������',299).
room('����','208',61).
room('�������','�72',200).
room('�����','����� �������',249).
room('������� ������','������',121).
room('�����','����� ����',630).
room('������','52',70).
room('������','01',250).
room('����','152',521).
room('�������','�123',250).
room('������','�������',211).
room('������� ������','�����',150).
room('�������','�225',150).
room('������','�����',50).

% ����� ����� �� ������
f_hotel_by_class(Class):-hotel(X,Class),write(X),nl,fail.

% ������� ��� ������ ������
show_all_rooms:-room(Hotel,Room,Price),
	writef('%16l%16l%w\n',[Hotel,Room,Price]),fail.

% ������� ������ ������ � ����� ���� Bound
rooms_restricted_by_price(Bound):-room(Hotel,Room,Price),Price<Bound,
	writef('%16l%16l%w\n',[Hotel,Room,Price]),fail.

% ������ �������������� ����� ����� N ��������
splitter(N):-writef('%r\n',['-',N]).


menu:-write('�������� ����:'),nl,
	write('1 - ����� ����� �� ������'),nl,
	write('2 - ������� ���������� � ���� ��������� �������'),nl,
	write('3 - ����� ������ � ����� �� ����� �����...'),nl,
	splitter(47),
	write('�������� ����� ����'),nl,
	read(Item),switch(Item).

switch(1):-write('������ ������ ����� ����������?'),nl,
	read(Class),
	write('��������� �����:'),nl,
	splitter(35),
	f_hotel_by_class(Class),
	splitter(35),
	menu.

switch(2):-write('��� ��������� ������'),nl,
	writef('%15l|%15l|%w\n',['�������� �����','�������� ������','���� �� �����']),
	splitter(47),
	show_all_rooms,
	splitter(47),
	menu.

switch(3):-write('������� ������� ����'),nl,
	read(Bound),
	writef('%15l|%15l|%w\n',['�������� �����','�������� ������','���� �� �����']),
	splitter(47),
	rooms_restricted_by_price(Bound),
	splitter(47),
	menu.

% ����� ����� - ���� ����
main:-menu.
