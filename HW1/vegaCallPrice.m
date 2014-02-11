function [ Vega ] = vegaCallPrice(N,S,T,r,delta,sigma,a,b)
	Vega = (callPrice(N,S,T,r,delta,sigma+0.0001,a,b) - callPrice(N,S,T,r,delta,sigma-0.0001,a,b))/0.0002;
end