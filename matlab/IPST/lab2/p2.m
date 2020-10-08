function IPST_lab2_p2(fig_kind,r,h)
% —троит график куба или конуса по выбору пользовател€.
% IPST_lab2_p2(fig_kind,r,h)
% Ц дл€ куба Ц это идентификатор и длина ребра Ц СкубТ, r.
% Ц дл€ конуса Ц это идентификатор, высота, радиус основани€ Ц СконусТ, h, r.
fig_kind=input('¬ведите фигуру(куб / конус):\n','s');
figure;
if strcmpi(fig_kind,'куб')
    r = input('ƒлина ребра куба:\n');
    X = [0 r 0 0 0 0; r r r 0 r r; r r r 0 r r; 0 r 0 0 0 0];
    Y = [0 0 0 0 0 r;0 r 0 0 0 r; 0 r r r r r; 0 0 r r r r];
    Z = [0 0 r 0 0 0; 0 0 r r 0 0; r r r r 0 r; r r r 0 0 r];
    r=r/2;
    mesh(X-r,Y-r,Z-r, 'FaceAlpha', '0.2'),title('куб')
    axis([-r r -r r -r r]*1.5)
    hidden on
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');
elseif strcmpi(fig_kind,'конус')
    h=input('¬ысота конуса:\n');
    r=input('–адиус основани€ конуса:\n');
    [x,y]=meshgrid(linspace(-2*r,2*r,41));
    z = h-sqrt(x.^2+y.^2)*h/r;
    mesh(x,y,z,'FaceAlpha', '0.5'),title('конус')
    c_xy = 1.5;
    c_z = 1.2;
    axis([-c_xy*r c_xy*r -c_xy*r c_xy*r -h/6 c_z*h])
    hidden off
    xlabel('x,\rightarrow');
    ylabel('y,\rightarrow');
    zlabel('z,\rightarrow');
else
    disp('Ќекорректно указана фигура')
end
end