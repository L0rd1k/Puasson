% ��������� ��������: d^2phi/dx^2+d^2phi/dy^2=f(x,y) � ������������� ������� [0,L1]x[0,L1]
% ������� �������: phi(x,0)=10, phi(x,1)=-10, phi(0,y)=phi(1,y)=5
function z = puasson(NumKnot1,NumKnot2,IterationNumber,phi)
global x y H1 H2 H3 Om1 L1 L2 % hx2 hy2 Omega
% ���������� �������� ���������� �� ������ ���� ������������� ��������
f = potential(NumKnot1,NumKnot2,x,y,L1,L2);
for k=1:IterationNumber % ���� �� ���������
    for j=2:NumKnot2 % ���� �� ����� ����� 120
        for i=2:NumKnot1 % ���� �� ����� ����� 200
            COMA=H1*(phi(i+1,j)+phi(i-1,j))+ H2*(phi(i,j+1)+phi(i,j-1))-H3*f(i,j); % ����������
            phi(i,j)=Om1*phi(i,j)+COMA;
        end;
    end;
    if k==1
        q=phi; % ���������� ������� �� 1-� ���� ��������
    else
        q = cat(2,q,phi); % ���������� ������� ���������� �������
    end;
end;
z=q;


