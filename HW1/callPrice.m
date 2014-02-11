function [ P ] = callPrice(N,S,T,r,delta,sigma,a,b)
	K=b.*S;
	PV_0 = N.*(exp(1)^(-r.*T));
	d1 = (log(S./K) + ((r - delta) + (sigma.^2)./2).*(T))./(sigma.*sqrt(T));
	d2 = d1 - sigma.*sqrt(T);
	CO_PV_0 = normcdf(d1).*S.*exp(1)^(-delta.*T) - normcdf(d2).*K.*exp(1)^(-r.*T);
	P = PV_0 + a.*N.*CO_PV_0;
end