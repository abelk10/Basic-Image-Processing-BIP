function H = pmHOG_binner(PHI, MAG)
    H = zeros(1,9);
    for i=1:9
        mini = 20*(i-1)-90;
        maxi = 20*i-90;
        LOG_MASK = (PHI >= mini & PHI < maxi);
        m = MAG(LOG_MASK);
        H(i) = sum(m,'all');
    end
end
