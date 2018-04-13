function res = to_gray(g)
	[res, map] = rgb2ind(g);
	res = ind2gray(res, map);
	res = uint8((res .* 255) ./ max(res(:)));
endfunction