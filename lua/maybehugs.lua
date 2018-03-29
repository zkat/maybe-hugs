Cutie = {}

function Cutie:new(huggable)
  local newCutie = {huggable = huggable}
  self.__index = self
  return setmetatable(newCutie, self)
end

function Cutie:maybeHug()
  if self.huggable then
    return 'Hugs!'
  else
    return 'Empathy!'
  end
end

local sam = Cutie:new(true)
local alex = Cutie:new(false)

print(sam:maybeHug())
-- "Hugs!"

print(alex:maybeHug())
-- "Empathy!"
