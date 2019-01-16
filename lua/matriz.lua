function mba()
  local ba = {}
  for i = 1, 10 do
    ba[i] = {}
    for j = 1, 10 do
      ba[i][j] = i * j
    end
  end
  return ba
end

function mts(ba)
  s = ''
  for i, v in pairs(ba) do
    for j, n in pairs(v) do
      s = s .. string.format('  %03d', n)
    end
    s = s .. '\n'
  end
  print(s)
end