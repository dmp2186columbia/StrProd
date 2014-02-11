function [ Theta ] = thetaCallPrice(N,S,T,r,delta,sigma,a,b)
	Theta = (callPrice(N,S,T+0.0001,r,delta,sigma,a,b) - callPrice(N,S,T-0.0001,r,delta,sigma,a,b))/0.0002;
end