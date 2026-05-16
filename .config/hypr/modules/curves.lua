---@enum Curve
local curve = {
    default = 'default',
    easeOutQuint = 'easeOutQuint',
    easeInOutCubic = 'easeInOutCubic',
    linear = 'linear',
    almostLinear = 'almostLinear',
    quick = 'quick',
    myBezier = 'myBezier',
    easeOut = 'easeOut',
    bouncy = 'bouncy',
    easeInBack = 'easeInBack',
    easeOutBack = 'easeOutBack'
}

---@enum CurveType
local type = {
    bezier = 'bezier',
    spring = 'spring'
}

---@param c { name: Curve, p1: number[], p2: number[] }
local function bezier(c)
    hl.curve(c.name, {
        type = type.bezier,
        points = { c.p1, c.p2 }
    })
end

---@param c { name: Curve, p1: number[], p2: number[] }
local function spring(c)
    hl.curve(c.name, {
        type = type.spring,
        points = { c.p1, c.p2 }
    })
end

bezier {
    name = curve.easeOutQuint,
    p1 = { 0.23, 1 },
    p2 = { 0.32, 1 }
}

bezier {
    name = curve.easeInOutCubic,
    p1 = { 0.65, 0.05 },
    p2 = { 0.36, 1 },
}

bezier {
    name = curve.linear,
    p1 = { 0, 0 },
    p2 = { 1, 1 }
}

bezier {
    name = curve.almostLinear,
    p1 = { 0.5, 0.5 },
    p2 = { 0.75, 1 }
}

bezier {
    name = curve.quick,
    p1 = { 0.15, 0 },
    p2 = { 0.1, 1 }
}

bezier{
    name = curve.myBezier,
    p1 = { 0.05, 0.9 },
    p2 = { 0.1, 1.05 },
}

bezier {
    name = curve.easeOut,
    p1 = { 0, 0 },
    p2 = { 0, 1 }
}


bezier {
    name = curve.bouncy,
    p1 = { 0.65, 0 },
    p2 = { 0.35, 1 }
}


bezier {
    name = curve.easeInBack,
    p1 = { 0.77, 0 },
    p2 = { 0.64, -0.31 }
}

bezier {
    name = curve.easeOutBack,
    p1 = { 0.07, 1.36 },
    p2 = { 0.64, 0.97 }
}

return curve
