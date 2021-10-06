function [F] = my_fourier(I)
    F = zeros(size(I,1),size(I,2));
    N1 = size(I,1);
    N2 = size(I,2);
    for k1=1:N1
        for k2=1:N2
            for n1=1:N1
                for n2=1:N2
                    F(k1,k2) = F(k1,k2) + I(n1,n2)*exp(-1j*2*pi*(k1-1)*(n1-1)/N1)*exp(-1j*2*pi*(k2-1)*(n2-1)/N2);
                end
            end
        end
    end
end
