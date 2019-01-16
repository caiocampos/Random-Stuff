point = {}

setmetatable(point,
  {
    __call = function(x,y)
      local t = {}
      t.x = x;
      t.y = y;
      setmetatable(t, {__index = point})
      return t
    end
  }
)

function point:setx(x)
  self.x = x
  return self
end

function point:sety(y)
  self.y = y
  return self
end