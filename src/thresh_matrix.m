function x = thresh_matrix(matrix,value)
	[row col] = size(matrix)
	x = 255.*ones(row,col); 
	for i = 2:row-2
		for j = 2:col-2
			right = matrix(i+1,j);
			down = matrix(i,j+1);
			up = matrix(i,j-1);
			left = matrix(i-1,j);
			if(right*left > 0 && abs(right-left) > value)
				x(i,j) = 0;	
			end
			if(up*down > 0 && abs(up-down) > value)
				x(i,j) = 0;	
			end



	end

end
