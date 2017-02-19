---------------------------
-- Default awesome theme --
---------------------------

local theme = {}

theme.confdir       = os.getenv("HOME") .. "/.config/awesome/urich/themes/usc"
theme.wallpaper     = theme.confdir .. "/../../wallpaper/404.jpg"
theme.font          = "Terminus 10"

-- theme.bg_normal     = "#222222"
-- theme.bg_focus      = "#535d6c"
-- theme.bg_urgent     = "#ff0000"
-- theme.bg_minimize   = "#444444"
-- theme.bg_systray    = theme.bg_normal
-- 
-- theme.fg_normal     = "#aaaaaa"
-- theme.fg_focus      = "#ffffff"
-- theme.fg_urgent     = "#ffffff"
-- theme.fg_minimize   = "#ffffff"
-- 
-- theme.useless_gap   = 0
-- theme.border_width  = 1
-- theme.border_normal = "#000000"
-- theme.border_focus  = "#535d6c"
-- theme.border_marked = "#91231c"

theme.menu_bg_normal                = "#000000"
theme.menu_bg_focus                 = "#000000"
theme.bg_normal                     = "#000000"
theme.bg_focus                      = "#000000"
theme.bg_urgent                     = "#000000"
theme.fg_normal                     = "#aaaaaa"
theme.fg_focus                      = "#ff8c00"
theme.fg_urgent                     = "#af1d18"
theme.fg_minimize                   = "#ffffff"
theme.fg_black                      = "#424242"
theme.fg_red                        = "#ce5666"
theme.fg_green                      = "#80a673"
theme.fg_yellow                     = "#ffaf5f"
theme.fg_blue                       = "#7788af"
theme.fg_magenta                    = "#94738c"
theme.fg_cyan                       = "#778baf"
theme.fg_white                      = "#aaaaaa"
theme.fg_blu                        = "#8ebdde"
theme.border_width                  = "1"
theme.border_normal                 = "#1c2022"
theme.border_focus                  = "#606060"
theme.border_marked                 = "#3ca4d8"
theme.menu_width                    = "110"
theme.menu_border_width             = "0"
theme.menu_fg_normal                = "#aaaaaa"
theme.menu_fg_focus                 = "#ff8c00"
theme.menu_bg_normal                = "#050505dd"
theme.menu_bg_focus                 = "#050505dd"


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
--theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
--theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

theme.taglist_squares_sel           = theme.confdir .. "/taglist/square_a.png"
theme.taglist_squares_unsel         = theme.confdir .. "/taglist/square_b.png"

--theme.tasklist_disable_icon         = true
--theme.tasklist_floating             = ""
--theme.tasklist_maximized_horizontal = ""
--theme.tasklist_maximized_vertical   = ""

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme.confdir .. "/icons/submenu.png"
theme.menu_height = 20
theme.menu_width  = 200

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = theme.confdir .. "/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = theme.confdir .. "/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = theme.confdir .. "/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = theme.confdir .. "/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = theme.confdir .. "/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = theme.confdir .. "/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active   = theme.confdir .. "/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active    = theme.confdir .. "/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = theme.confdir .. "/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = theme.confdir .. "/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active   = theme.confdir .. "/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active    = theme.confdir .. "/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = theme.confdir .. "/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = theme.confdir .. "/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active   = theme.confdir .. "/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active    = theme.confdir .. "/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = theme.confdir .. "/layouts/fairhw.png"
theme.layout_fairv      = theme.confdir .. "/layouts/fairvw.png"
theme.layout_floating   = theme.confdir .. "/layouts/floatingw.png"
theme.layout_magnifier  = theme.confdir .. "/layouts/magnifierw.png"
theme.layout_max        = theme.confdir .. "/layouts/maxw.png"
theme.layout_fullscreen = theme.confdir .. "/layouts/fullscreenw.png"
theme.layout_tilebottom = theme.confdir .. "/layouts/tilebottomw.png"
theme.layout_tileleft   = theme.confdir .. "/layouts/tileleftw.png"
theme.layout_tile       = theme.confdir .. "/layouts/tilew.png"
theme.layout_tiletop    = theme.confdir .. "/layouts/tiletopw.png"
theme.layout_spiral     = theme.confdir .. "/layouts/spiralw.png"
theme.layout_dwindle    = theme.confdir .. "/layouts/dwindlew.png"
theme.layout_cornernw   = theme.confdir .. "/layouts/cornernww.png"
theme.layout_cornerne   = theme.confdir .. "/layouts/cornernew.png"
theme.layout_cornersw   = theme.confdir .. "/layouts/cornersww.png"
theme.layout_cornerse   = theme.confdir .. "/layouts/cornersew.png"

theme.awesome_icon = theme.confdir .. "/icons/awesome32.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
