function y = Structured(N, I_0,T,r,delta,vol,  a , b )

Call = blsprice(I_0,I_0 * b ,r,T,vol,delta);
y = N*exp(-r*T) +  N * a * Call; 

end