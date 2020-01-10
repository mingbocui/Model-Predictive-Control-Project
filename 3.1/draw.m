function draw = draw(mpc,xs,us,Ts)
    draw=0;

%     x0 = [0;0;0;0;0;0;0;0;0;2;0;0];
    x0 = [0;0;0;2];
    sol.x(:,1) = x0;

    i = 1;
%       try
      while norm(sol.x(:,end)) > 1e-3 % Simulate until convergence
          
          [uopt,infeasible] = mpc.ctrl_opt{sol.x(:,i),xs,us};
          if infeasible == 1, error('Error in optimizer - could not solve the problem'); end
          % Extract the optimal input
          sol.u(:,i) = uopt;
          % Apply the optimal input to the system
          sol.x(:,i+1) = mpc.A*sol.x(:,i) + mpc.B*sol.u(:,i);
          i = i + 1;
          sol.i = i;
      end
%       catch
%         error('---> Initial state is outside the feasible set <---\n');
%       end
      sol.t = 0:Ts:(sol.i-1)*Ts;
      
      
      figure;plot(sol.t,sol.x(1,:),'-b','markersize',10,'linewidth',1);title("vel pitch");ylabel('rad/s');xlabel("time(s)");hold on;saveas(gcf,"vel_pitch.jpg");

      figure; plot(sol.t,sol.x(2,:),'-b','markersize',10,'linewidth',1);title("pitch");ylabel('rad');xlabel("time(s)");hold on;saveas(gcf,"pitch.jpg");
      figure; plot(sol.t,sol.x(3,:),'-b','markersize',20,'linewidth',1);title("vel x");ylabel('m/s');xlabel("time(s)");hold on;saveas(gcf,"vel_x.jpg");
      figure; plot(sol.t,sol.x(4,:),'-b','markersize',20,'linewidth',1);title("x");ylabel('m');xlabel("time(s)");hold on;saveas(gcf,"x.jpg");

      


end