clear all;clc;
%% State-Space Model
A=[1 4;2 1];
B=[1;1];
C=[0 1];
D=0;
Q=[0 0;0 1000];
R=[0.5];
%[K,P,E]=lqr(A,B,Q,R);
[P,E,K]=care(A,B,Q,R);
[S,autov,Lt]=care(A',C',[0 0;0 1000],0.5);
Lop=Lt';
N=1/dcgain(A-B*K,B,C,0);
L=acker(A',C',[-1 -2])';% Observer gain by pole placement
%[S,autov,Lt]=care(A',C',10*eye(3),1);