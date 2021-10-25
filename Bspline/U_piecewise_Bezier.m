% U_piecewise_Bezier.m文件
function NodeVector = U_piecewise_Bezier(n, k)
% 分段Bezier曲线的节点向量计算，共n+1个控制顶点，k次B样条
% 分段Bezier端节点重复度为k+1，内间节点重复度为k,且满足n/k为正整数

if ~mod(n, k) && (~mod(k, 1) && k>=1)   % 满足n是k的整数倍且k为正整数
    NodeVector = zeros(1, n+k+2);   % 节点矢量长度为n+k+2
    NodeVector(1, n+2 : n+k+2) = ones(1, k+1);  % 右端节点置1

    piecewise = n / k;      % 设定内节点的值
    Flg = 0;
    if piecewise > 1
        for i = 2 : piecewise
            for j = 1 : k
                NodeVector(1, k+1 + Flg*k+j) = (i-1)/piecewise;
            end
            Flg = Flg + 1;
        end
    end

else
    fprintf('error!\n');
end