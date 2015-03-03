function inv_sr=invShiftRows(state)
inv_sr(1,:)=state(1,:);
    for i=2:4
        inv_sr(i,:)=circshift(state(i,:),-(i-1)*[0,3]);
    end
end