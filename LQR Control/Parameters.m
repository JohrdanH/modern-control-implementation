clc;clear all
A=[0 1;1000 0]
B=[0;20]
C=[1 0]
D=[0]

for i=0:3
Q=[1000 0;0 1];
R=1;
[K,P,E]=lqr(A,B,Q,R)  
% P>0 y autov=v.propios del L.C:, K = ganacia bde retroalimentación.
%matriz del observador
% asignación de polos en -1,-2 e -3
%L = place(A',C', [-1 -2 -3])';
[S,autov,Lt]=care(A',C',eye(2),1);
L=Lt';
N=1/dcgain(ss(A-B*K,B,C,D));
eig(A-B*K)
 sim proyecto_lqr_simulado
subplot(1,2,1)
 plot(time,y,'LineWidth',2-i/2);
 title('Salida y(t)')
  hold on
grid on
subplot(1,2,2)
 hold on
  plot(time,u,'LineWidth',2-i/2);
  title ('Esfuerzo de control u(t)')
 grid on
end
grid on
legend('R=1','R=10','R=100','R=1000')
hold off