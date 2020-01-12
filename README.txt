Initialization
tbxmanager restorepath
addpath 'path_to_casadi-windows-matlabR2016a-v3.5.1'
import casadi.*
cd c:\gurobi900\win64\matlab 
gurobi_setup 


1.
quad = Quad();
Tf = 1.0;
x0 = zeros(12,1);
u = [1;1;1;1];
sim = ode45(@(t, x) quad.f(x, u), [0, Tf], x0);
quad.plot(sim, u);


2.
[xs,us] = quad.trim();
sys = quad.linearize(xs, us);
[sys_x, sys_y, sys_z, sys_yaw] = quad.decompose(sys, xs, us);


3.1
Ts = 1/5; 
quad = Quad(Ts); 
[xs, us] = quad.trim(); 
sys = quad.linearize(xs, us); 
 [sys_x, sys_y, sys_z, sys_yaw] = quad.decompose(sys, xs, us);
mpc_x = MPC_Control_x(sys_x, Ts);
ux = mpc_x.get_u([0;0;-0.1;0.1])

3.2
Ts = 1/5; 
quad = Quad(Ts); 
[xs, us] = quad.trim(); 
sys = quad.linearize(xs, us); 
 [sys_x, sys_y, sys_z, sys_yaw] = quad.decompose(sys, xs, us);
mpc_x = MPC_Control_x(sys_x, Ts);
ux = mpc_x.get_u([0;0;-0.1;0.1], -2)

4.
Ts = 1/5; 
quad = Quad(Ts); 
[xs, us] = quad.trim(); 
sys = quad.linearize(xs, us);
[sys_x, sys_y, sys_z, sys_yaw] = quad.decompose(sys, xs, us);
mpc_x = MPC_Control_x(sys_x, Ts);
mpc_y = MPC_Control_y(sys_y, Ts);
mpc_z = MPC_Control_z(sys_z, Ts);
mpc_yaw = MPC_Control_yaw(sys_yaw, Ts);
sim = quad.sim(mpc_x, mpc_y, mpc_z, mpc_yaw);
quad.plot(sim);



5.
BIAS = -0.1;
Ts = 1/5;
quad = Quad(Ts);
[xs, us] = quad.trim(); 
sys = quad.linearize(xs, us);
[sys_x, sys_y, sys_z, sys_yaw] = quad.decompose(sys, xs, us);
mpc_x = MPC_Control_x(sys_x, Ts);
mpc_y = MPC_Control_y(sys_y, Ts);
mpc_z = MPC_Control_z(sys_z, Ts);
mpc_yaw = MPC_Control_yaw(sys_yaw, Ts);
sim = quad.sim(mpc_x, mpc_y, mpc_z, mpc_yaw,BIAS);
quad.plot(sim);


6.
quad = Quad(); 
CTRL = ctrl_NMPC(quad);
sim = quad.sim(CTRL)
quad.plot(sim)

For plot of deliverable 3.1 and 3.2 we create a specified draw.m function in folder 3.1 and 3.2:
Get plots for deliverable 3.1 by call the following in the terminal:
draw("3_1", 'x');
 draw("3_1", 'y');
draw("3_1", 'z');
draw("3_1", "yaw") 
Get plots for deliverable 3.2 by call the following in the terminal:
draw("3_2", 'x');
draw("3_2", 'y');
draw("3_2", 'z');
draw("3_2", "yaw")


