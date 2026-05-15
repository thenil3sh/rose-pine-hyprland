local set = hl.env;

set('QT_QPA_PlATFORMTHEME'  , 'qt6ct')
set('QT_QPA_PlATFORM'       , 'wayland')

-- Some defaults
set('XCURSOR_SIZE'          , '30')
set('ELECTRON_OZONE_PLATFORM_HINT', 'wayland')
set('GSK_RENDERER'          , 'cairo')

-- Hyprcursor
set('HYPRCURSOR_THEME'      , 'Phinger Cursors Gruvbox Material')
set('HYPRCURSOR_SIZE'       , '24')

-- Android Studio
set('ANDROID_EMULATOR_USE_SYSTEM_LIBS', '1')
set('VK_ICD_FILENAMES'      , '/usr/share/vulkan/icd.d/intel_icd.x86_64.json')

-- XDG_RUNTIME
set('XDG_CURRENT_DESKTOP'   ,'Hyprland')
set('XDG_SESSION_DESKTOP'   ,'Hyprland')
set('XDG_SESSION_TYPE'      ,'wayland')
set('GTK_USE_PORTAL'        ,'1')
