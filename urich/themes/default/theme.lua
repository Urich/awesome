---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "Terminus 9"

theme.bg_normal     = "#222222"
theme.bg_focus      = "#535d6c"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#aaaaaa"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.border_width  = 1
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

theme.path = os.getenv("HOME") .. "/.config/awesome/urich/themes/default/"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = theme.path .. "taglist/squarefw.png"
theme.taglist_squares_unsel = theme.path .. "taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.path .. "submenu.png"
theme.menu_height = 15
theme.menu_width  = 100

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.path .. "titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.path .. "titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme.path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = theme.path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = theme.path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = theme.path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = theme.path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = theme.path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = theme.path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = theme.path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = theme.path .. "titlebar/maximized_focus_active.png"

theme.wallpaper = theme.path .. "background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = theme.path .. "layouts/fairhw.png"
theme.layout_fairv = theme.path .. "layouts/fairvw.png"
theme.layout_floating  = theme.path .. "layouts/floatingw.png"
theme.layout_magnifier = theme.path .. "layouts/magnifierw.png"
theme.layout_max = theme.path .. "layouts/maxw.png"
theme.layout_fullscreen = theme.path .. "layouts/fullscreenw.png"
theme.layout_tilebottom = theme.path .. "layouts/tilebottomw.png"
theme.layout_tileleft   = theme.path .. "layouts/tileleftw.png"
theme.layout_tile = theme.path .. "layouts/tilew.png"
theme.layout_tiletop = theme.path .. "layouts/tiletopw.png"
theme.layout_spiral  = theme.path .. "layouts/spiralw.png"
theme.layout_dwindle = theme.path .. "layouts/dwindlew.png"

theme.awesome_icon = "/usr/share/awesome/icons/awesome16.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
