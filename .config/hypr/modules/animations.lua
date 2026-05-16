local curve = require('modules.curves')

local animation = hl.animation;

animation {
    leaf = 'windowsIn',
    enabled = true,
    speed = 5,
    bezier = curve.easeOutBack,
    style = 'popin 80%'
}

animation {
    leaf = 'windowsOut',
    enabled = true,
    speed = 4,
    bezier = curve.easeOutBack,
    style = 'popin 90%'
}

animation {
    leaf = 'windowsMove',
    enabled = true,
    speed = 5,
    bezier = curve.easeOutBack
}

animation {
    leaf = 'border',
    speed = 10,
    enabled = true,
    bezier = curve.default,
}

animation {
    leaf = 'borderangle',
    speed = 8,
    enabled = true,
    bezier = curve.default
}

animation {
    leaf = 'fade',
    enabled = true,
    speed = 5,
    bezier = curve.default
}

animation {
    leaf = 'workspaces',
    enabled = true,
    speed = 5,
    bezier = curve.default,
    style = 'slidefadevert 15%'
}



