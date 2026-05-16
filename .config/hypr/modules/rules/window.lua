local layer_rule = hl.layer_rule;

layer_rule {
    name = 'swaync',

    match = {
        namespace = '(swaync-notification-window|swaync-control-center)',

    },
    blur = true,
    ignore_alpha = 0.4
}

layer_rule {
    name = 'swayosd',
    match = {
        namespace = '^(swayosd)$'
    },

    blur = true,
    ignore_alpha = 0.3
}

layer_rule {
    name = 'noctalia',
    match = {
        namespace = '(^noctalia-background-.*$|noctalia-bar-.*$)'
    },
    ignore_alpha = 0.6,
    blur = true,
    blur_popups = true,
}
