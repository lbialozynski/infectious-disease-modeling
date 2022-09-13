clear
clc

b=[0.5 0.8 1.1 1.4 1.7 2];
colors='rgcbmk';

hold on
for i=1:length(b)
    
    k=1/3;
    tspan=[0,120];
    init=[1;1.27*10^-6;0];
    
    [t,x] = ode45(@(t,x) sir(t,x,b(i),k), tspan, init);
    
    plot(t, x(:,2), colors(i),'DisplayName',"b="+num2str(b(i)))
end
legend()
%plot(t, x(:,1), 'b', t, x(:,2), 'r', t, x(:,3), 'g')
%%
k=[0.1 0.2 0.3 0.4 0.45 0.5];
colors='rgcbmk';

hold on
for i=1:length(k)
    
    b=1/2;
    tspan=[0,300];
    init=[1;1.27*10^-6;0];
    
    [t,x] = ode45(@(t,x) sir(t,x,b,k(i)), tspan, init);
    
    plot(t, x(:,2), colors(i),'DisplayName',"k="+num2str(k(i)))
end
legend()

%%
b=1; k=1/3;
tspan=[0,200];
init=[1;1.27*10^-6;0];
[t,x] = ode45(@(t,x) sir(t,x,b,k), tspan, init);
plot(t, x(:,1), 'b', t, x(:,2), 'r', t, x(:,3), 'g')

[inf_max,index]=max(x(:,2))
t_max=t(index)

max(x(:,2))

index_percent = find(x(:,2)<0.01);
t_percent=t(index_percent)

%find(x(:,2)<0.01)

%%
x = 7*[1:13];
y = [14, 28, 50, 66, 156, 190, 156, 108, 68, 77, 33, 65, 24];
yyaxis left
plot(x,y)
hold on

b=2; k=1/3;
tspan=[0,150];
init=[1;1.27*10^-6;0];
[t,x] = ode45(@(t,x) sir(t,x,b,k), tspan, init);
yyaxis right
plot(t, x(:,2), 'r')
ylim([0,0.6])
xline(7*[1:21])

function dxdt = sir(t,x,b,k)
    dxdt = zeros(3,1);
    dxdt(1) = -b*x(1)*x(2);
    dxdt(2) = b*x(1)*x(2) - k*x(2);
    dxdt(3) = k*x(2);
end