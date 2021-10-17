-- inputSource
-- from https://qiita.com/mishiwata1015/items/fb7527e5b45f84a90eec
local simpleCmd = false
local map = hs.keycodes.map

local function kanaSwitchEvent(event)
    local c = event:getKeyCode()
    local f = event:getFlags()
    if event:getType() == hs.eventtap.event.types.keyDown then
        if f['cmd'] then
            simpleCmd = true
        end
    elseif event:getType() == hs.eventtap.event.types.flagsChanged then
        if not f['cmd'] then
            if simpleCmd == false then
                if c == map['cmd'] then
                    hs.keycodes.setMethod('Romaji')
                    -- hs.keycodes.setLayout("ABC")
                    -- 'ABC'では動作しない
                elseif c == map['rightcmd'] then
                    hs.keycodes.setMethod('Hiragana')
                end
            end
            simpleCmd = false
        end
    end
end

kanaSwitcher = hs.eventtap.new(
  {hs.eventtap.event.types.keyDown, hs.eventtap.event.types.flagsChanged},
  kanaSwitchEvent
)
kanaSwitcher:start()

-- window manager
-- from https://qiita.com/kabosu3d/items/66f6727f1140497b2cf7
--[[
hs.window.animationDuration = 0
units = {
  right50       = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50        = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  top50         = { x = 0.00, y = 0.00, w = 1.00, h = 0.50 },
  bot50         = { x = 0.00, y = 0.50, w = 1.00, h = 0.50 },
  maximum       = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}

mash = { 'option', 'ctrl', 'cmd' }
hs.hotkey.bind(mash, 'right', function() hs.window.focusedWindow():move(units.right50,    nil, true) end)
hs.hotkey.bind(mash, 'left', function() hs.window.focusedWindow():move(units.left50,     nil, true) end)
hs.hotkey.bind(mash, 'up', function() hs.window.focusedWindow():move(units.top50,      nil, true) end)
hs.hotkey.bind(mash, 'down', function() hs.window.focusedWindow():move(units.bot50,      nil, true) end)
hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximum,  nil, true) end)
]]
-- end window manager
