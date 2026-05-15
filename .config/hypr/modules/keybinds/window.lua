local mainMod = 'SUPER + '
local shift = 'SHIFT + '
local dsp = hl.dsp;
local bind = hl.bind;


-- Change focus
local focus = hl.dsp.focus;
bind(mainMod .. 'down'              , focus({ direction = 'down' }))
bind(mainMod .. 'up'                , focus({ direction = 'up' }))
bind(mainMod .. 'left'              , focus({ direction = 'left' }))
bind(mainMod .. "right"             , focus({ direction = 'right' }))


-- Switch Workspaces
for i = 1, 10 do
    local num = i % 10 -- 10 maps to key 0
    bind(mainMod .. num             , hl.dsp.focus({ workspace = i }))
    bind(mainMod .. shift .. num    , hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows
bind(mainMod .. " + mouse:272"      , dsp.window.drag(), { mouse = true })
bind(mainMod .. " + mouse:273"      , dsp.window.resize(), { mouse = true })



local layout = hl.dsp.layout;

-- Scrolling Layout
bind(mainMod .. 'period'            , layout('mov +col'))
bind(mainMod .. 'comma'             , layout('mov -col'))
bind(mainMod .. shift .. 'period'   , layout('swapcol l'))
bind(mainMod .. shift .. 'comma'    , layout('swapcol r'))
bind(mainMod .. 'slash'             , layout('promote'))
bind(mainMod .. 'f'                 , layout('togglefit'))
bind(mainMod .. 'n'                 , layout('colresize -0.2'))
bind(mainMod .. 'm'                 , layout('colresize +0.2'))



-- Workspace Switch
-- NOTE: Switches workspaces in ascending order of their id
local function next_workspace()
    local workspaces = hl.get_workspaces()
    table.sort(workspaces, function(a, b)
        return a.id < b.id
    end)
    for i, ws in ipairs(workspaces) do
        if ws.active then
            local next_ws = workspaces[i + 1] or workspaces[1]
            hl.dispatch(
                hl.dsp.focus({
                    workspace = next_ws
                })
            )
            break
        end
    end
end

hl.bind(mainMod .. 'Tab'            , next_workspace)