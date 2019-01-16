function avg(l)
	local res = 0
	for i = 1, #l do
		res = res + l[i]
	end
	return res / #l
end

function speed_test()
    local tt = os.clock()
    local res, v, n = {}, 0, 100
    for i = 1, n do
        local t = os.clock()
        for j = 1, n ^ 2 do
			v = v + n * i * j
		end
        res[i] = os.clock() - t
	end
    print('menor:', math.min(unpack(res)))
    print('maior:', math.max(unpack(res)))
    print('média:', avg(res))
    print('total:', os.clock() - tt)
end
