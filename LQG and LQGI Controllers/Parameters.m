clear all;clc;
A=[0 1;1000 0]
Bu=[0;20]
Bw=[1;1]
C=[1 0]
D=[0]

[u,tt]=gensig('square',3,10,0.001);
randn('seed',0);
w=(0.02)*randn(length(tt),1);
v=(0.01)*randn(length(tt),1);
Qo=cov(w);
Ro=cov(v);
Q=[1000 0;0 1];
R=1;
[K,P,E]=lqr(A,Bu,Q,R)
N=1/dcgain(A-Bu*K,Bu,C,0)
Gext=ss(A,[Bu Bw],C,[D D])
[Gk,Kf,Pf]=kalman(Gext,Qo,Ro)
