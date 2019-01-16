function fib1(m)
  a, b, r = 0, 1, {}
  for i = 1, m do r[i], a, b = b, b, a + b end
  return r
end

function fib2(m, a, b)
  return m < 1 and {} or {b or 1, unpack(fib2(m - 1, b or 1, (a or 0) + (b or 1)))}
end

local function fib3(t, n)
  t[n] = t[n - 1] + t[n - 2]
  return t[n]
end

fib = {1, 1}
setmetatable(fib, {__index = fib3})
