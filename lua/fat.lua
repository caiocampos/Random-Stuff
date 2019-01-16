function fat1(n)
  local r = 1
  for i = 2, n do
    r = r * i
  end
  return r
end

function fat2(n)
  return n < 1 and 1 or n * fat2(n - 1)
end

local function fat3(t, n)
  t[n] = n * t[n - 1]
  return t[n]
end

fat = {1}
setmetatable(fat, {__index = fat3})