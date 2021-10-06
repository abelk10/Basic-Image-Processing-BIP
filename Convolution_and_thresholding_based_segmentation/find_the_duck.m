function duck = find_the_duck(I)
    duck = squeeze(I(:,:,3))<70;
end