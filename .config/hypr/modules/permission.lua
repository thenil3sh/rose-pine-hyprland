local permission = hl.permission

local type = {
    screencopy = 'screencopy',
    plugin = 'plugin',
    keyboard = 'keyboard',
    cursor = 'cursorpos'
}

local mode = {
    allow = 'allow',
    ask = 'ask',
    deny = 'deny'
}


permission {
    binary = '/usr/bin/grim',
    type = type.screencopy,
    mode = mode.allow
}

permission {
    binary = '/usr/bin/wf-recorder',
    type = type.screencopy,
    mode = mode.allow
}

permission {
    binary = '/usr/bin/hyprpm',
    type = type.plugin,
    mode = mode.ask
}

permission {
    binary = '/usr/bin/grim',
    type = type.screencopy,
    mode = mode.allow
}

permission {
    binary = '/usr/bin/hyprlock',
    type = type.screencopy,
    mode = mode.allow
}