% 绘制三种类型的B样条曲线
clear all;
%控制顶点
P = [9.036145, 21.084337, 37.607573, 51.893287, 61.187608;
    51.779661, 70.084746, 50.254237, 69.745763, 49.576271];

n = 4;
%这里的n不为控制顶点P的数量，n其实为控制顶点P的数量-1，这个值要注意要与P对应
k = 2; 
%B样条曲线的次数，B样条阶数=k+1，这个值注意越大算法复杂度越大
%k=5时，电脑16g内存受不了了

flag = 2;
% flag = 1，绘制均匀B样条曲线，不经过起点和终点
% flag = 2, 绘制准均匀B样条曲线，经过起点和终点
% flag = 3, 绘制分段Bezier曲线，经过起点和终点

switch flag
    case 1
        NodeVector = linspace(0, 1, n+k+2); 
        % 均匀B样条的节点矢量数目等于控制顶点个数n+1与B样条阶数k+1之和
        %这里把节点取值归一化，但事实上不影响最后的曲线点计算结果
        %因为最后关于节点取值的运算是节点之间的除法运算
        
        % 绘制样条曲线
        plot(P(1, 1:n+1), P(2, 1:n+1),...
                        'o','LineWidth',1,...
                        'MarkerEdgeColor','k',...
                        'MarkerFaceColor','g',...
                        'MarkerSize',6);%画出控制顶点的位置
        line(P(1, 1:n+1), P(2, 1:n+1));%连接控制顶点
        Nik = zeros(n+1, 1); 
        %不同控制点对应的基函数计算结果(权值)，其长度与控制点长度一致
        for u = k/(n+k+1) : 0.001 : (n+1)/(n+k+1)
            %设置u取样值,对应归一化后的[k(B样条曲线的次数),n+1(控制顶点P的数量)]
            %相当于取值为[k(B样条曲线的次数),n+2(控制顶点P的数量))
            % for u = 0 : 0.005 : 1 这个是原程序测试
            for i = 0 : 1 : n %与控制顶点对应
                Nik(i+1, 1) = BaseFunction(i, k , u, NodeVector);
                %计算每个控制定点对应的基函数取值
            end
        p_u = P * Nik;
        %控制定点对应的基函数取值(权重)与控制定点左边相乘得到B样条轨迹坐标
        line(p_u(1,1), p_u(2,1), 'Marker','.','LineStyle','-', 'Color',[.3 .6 .9]);
        %画出设置u取样值对应的曲线中的点，点全部汇合在一起就绘制出曲线
        end
    case 2
        NodeVector = U_quasi_uniform(n, k); % 准均匀B样条的节点矢量
        DrawSpline(n, k, P, NodeVector);
    case 3
        NodeVector = U_piecewise_Bezier(n, k);  % 分段Bezier曲线的节点矢量
        DrawSpline(n, k, P, NodeVector);
    otherwise
        fprintf('error!\n');
end