ylabel('Base Rate')

b1 = (0.1:0.1:1);
a1= b1;
for i = 1:numel(b1)
    a1(i) = fzero( @(x) (Structured(100, 100, 5, 0.05, 0.02, 0.2, ...
        x ,b1(i) ) - 100) , 0);
end


a2 = (0.005:0.001:0.015);
b2 = a2;
for i = 1:numel(b2)
    b2(i) = fzero( @(x) (Structured(100, 100, 5, 0.05, 0.02, 0.2, ...
        a2(i) , x) - 100) , 1);
end

sigma = fzero( @(x) (Structured(100, 100, 5, 0.05, 0.02, x, ...
        0.01 , 1) - 100) , 1)
%Graph starts here
subplot(2,1,1)
plot(b1,a1) 
axis([0 1.1 0 0.015])
xlabel('Base Rate (b)')
ylabel('Participation Rate (a)')

subplot(2,1,2)
plot(a2,b2)
axis([0.004 0.016 0 1.5])
xlabel('Participation Rate (a)')
ylabel('Base Rate (b)')