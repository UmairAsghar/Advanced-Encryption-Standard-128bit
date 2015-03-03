function sr=shiftRows(state)
sr(1,:)=state(1,:);
    for i=2:4
        sr(i,:)=circshift(state(i,:),(i-1)*[0,3]);
    end
end