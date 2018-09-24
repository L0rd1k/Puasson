% Уравнение Пуассона: d^2phi/dx^2+d^2phi/dy^2=f(x,y) в прямоугольной области [0,L1]x[0,L1]
% Краевые условия: phi(x,0)=10, phi(x,1)=-10, phi(0,y)=phi(1,y)=5
function z = puasson(NumKnot1,NumKnot2,IterationNumber,phi)
global x y H1 H2 H3 Om1 L1 L2 % hx2 hy2 Omega
% Возвращает значение потенциала на каждом шаге итерационного процесса
f = potential(NumKnot1,NumKnot2,x,y,L1,L2);
for k=1:IterationNumber % цикл по итерациям
    for j=2:NumKnot2 % цикл по узлам сетки 120
        for i=2:NumKnot1 % цикл по узлам сетки 200
            COMA=H1*(phi(i+1,j)+phi(i-1,j))+ H2*(phi(i,j+1)+phi(i,j-1))-H3*f(i,j); % Релаксация
            phi(i,j)=Om1*phi(i,j)+COMA;
        end;
    end;
    if k==1
        q=phi; % Сохранение решения на 1-м шаге итерации
    else
        q = cat(2,q,phi); % сохранение каждого следующего решения
    end;
end;
z=q;


