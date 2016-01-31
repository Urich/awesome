-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local vicious = require("vicious")
local lain = require("lain")
local alttab = require("alttab")
local blingbling = require('blingbling')
local os = require('os')
local autofocus = require("awful.autofocus")
awful.rules = require("awful.rules")

-- os.setlocale("ru_RU.UTF-8")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}
--
function msgDebug(message)
   naughty.notify({ preset = naughty.config.presets.critical,
                    title = "Debug Message",
                    text = message })
end

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init("/usr/share/awesome/themes/default/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "terminator"
editor = "gvim"
editor_cmd = editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
	lain.layout.termfair,
    lain.layout.uselesstile,
--    lain.layout.centerwork,
--    awful.layout.suit.floating,
--    awful.layout.suit.tile,
--    awful.layout.suit.tile.left,
--    awful.layout.suit.tile.bottom,
--    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
--    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
--    awful.layout.suit.max.fullscreen,
--    awful.layout.suit.magnifier
}

lain.layout.termfair.nmaster = 3
lain.layout.termfair.ncol = 1

lain.layout.centerwork.top_left = 0
lain.layout.centerwork.top_right = 1
lain.layout.centerwork.bottom_left = 2
lain.layout.centerwork.bottom_right = 3

theme.useless_gap_width = "5"
-- }}}

key_V              = "#55"
key_Z              = "#52"
key_Y               = "#29"
key_J                = "#44"
key_K               = "#45"
key_N               = "#57"
key_M               = "#58"
key_F                = "#41"
key_R               = "#27"
key_L                = "#46"
key_C               = "#54"
key_W               = "#25"
key_X                = "#53"
key_Q                = "#24"
key_H                = "#43"
key_Tab             = "#23"
key_Tilda           = "#49"
key_U                  = "#30"
key_E                  = "#26"
key_T                   = "#28"
key_P                   = "#33"
key_O                   = "#32"
key_Return          = "#36"
key_Left               = "#113"
key_Right            = "#114"
key_Esc               = "#9"
key_Print              = "#107"
key_Alt_R             = "#108"
key_Alt_L              = "#64"
key_Space           = "#65"
key_Ctrl_R           = "#105"
key_Ctrl_L            = "#37"
key_Home            = "#110"
key_F1                   = "#67"
key_Mute               = "#121"
key_Vol_Down     = "#122"
key_Vol_Up          = "#123"
mouse_left			= 1
mouse_right			= 3

-- {{{ Wallpaper
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end

local mywallpaper = os.getenv("HOME") .. "/.config/awesome/urich/wallpaper/404.jpg"
gears.wallpaper.maximized(mywallpaper, 1, true)
--gears.wallpaper.maximized(mywallpaper, 2, true)
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "desktop", "develop", "debug", "web" }, s, layouts[1])
end

awful.layout.set(awful.layout.suit.fair, tags[1][1])
awful.layout.set(awful.layout.suit.max, tags[1][2])
awful.layout.set(lain.layout.uselesstile, tags[1][3])
awful.layout.set(awful.layout.suit.max, tags[1][4])
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "Restart", function() awful.util.spawn("sudo shutdown -r now") end },
   { "Shutdown", function() awful.util.spawn("sudo shutdown -h now") end },
   { "Suspend", function() awful.util.spawn("sudo pm-suspend") end },
   { "Hibernate", function () awful.util.spawn("pm-hibernate") end },
   { "Reload", awesome.restart },
   { "Logout", awesome.quit }
}

mymainmenu = awful.menu({ items = { { "Power", myawesomemenu, beautiful.awesome_icon },
                                    { "Terminal", terminal },
									{ "Edit Config", editor_cmd .. " " .. awesome.conffile }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()

-- Виджет переключения клавиатуры
kbdcfg = {}
kbdcfg.cmd = "xkblayout-state print %n"
kbdcfg.pathimage = os.getenv("HOME") .. "/.config/awesome/urich/icon/"
kbdcfg.layout = { { "us", "" }, { "ru", "" } }
--kbdcfg.current = 1  -- de is our default layout
--kbdcfg.widget = wibox.widget.textbox()
kbdcfg.widget = wibox.widget.imagebox()
--kbdcfg.widget:set_text(" " .. kbdcfg.layout[kbdcfg.current][1] .. " ")
kbdcfg.widget:set_image(kbdcfg.pathimage .. kbdcfg.layout[1][1] .. ".png")
kbdcfg.widget.bg_align = "center"
kbdcfg.widget.bg_resize = true
kbdcfg.switch = function ()
 -- kbdcfg.current = kbdcfg.current % #(kbdcfg.layout) + 1
 -- local t = kbdcfg.layout[kbdcfg.current]
  --kbdcfg.widget:set_text(" " .. t[1] .. " ")
 -- kbdcfg.widget:set_image(kbdcfg.pathimage .. t[1] .. ".png")
	local handle = io.popen(kbdcfg.cmd)
	local lang = handle:read("*a")
	handle:close()
	if "Russian" == lang then
 		kbdcfg.widget:set_image( kbdcfg.pathimage .. kbdcfg.layout[2][1] .. ".png" )
  --		msgDebug(  kbdcfg.pathimage .. kbdcfg.layout[2][1] .. ".png")
	end
	if "English" == lang then
 		kbdcfg.widget:set_image( kbdcfg.pathimage .. kbdcfg.layout[1][1] .. ".png" )
--		msgDebug( kbdcfg.pathimage .. kbdcfg.layout[1][1] .. ".png" )
	end
end
kbdcfg.switch_click = function ()
	local handle = io.popen(kbdcfg.cmd)
	local lang = handle:read("*a")
	handle:close()
  	msgDebug( kbdcfg.pathimage .. kbdcfg.layout[2][1] .. ".png")
	if "Russian" == lang then
 		kbdcfg.widget:set_image( kbdcfg.pathimage .. kbdcfg.layout[1][1] .. ".png" )
  --		msgDebug(  kbdcfg.pathimage .. kbdcfg.layout[2][1] .. ".png")
	end
	if "English" == lang then
 		kbdcfg.widget:set_image( kbdcfg.pathimage .. kbdcfg.layout[2][1] .. ".png" )
--		msgDebug( kbdcfg.pathimage .. kbdcfg.layout[1][1] .. ".png" )
	end
end
 -- Mouse bindings
kbdcfg.widget:buttons(
 awful.util.table.join(awful.button({}, 1, function () kbdcfg.switch_click() end))
 --awful.util.table.join(awful.key({ }, "#110", function () kbdcfg.switch_click() end))
)

local function outputs()
	local outputs = {}
	local xrandr = io.popen("xrandr -q")
	if xrandr then
		for line in xrandr:lines() do
			output = line:match("^([%w-]+) connected ")
			if output then
				outputs[#outputs + 1] = output
			end
		end
		xrandr:close()
	end
	return outputs
end

xrandr = { }
xrandr.menu = awful.menu()
xrandr.widget = wibox.widget.textbox()
xrandr.widget:set_text(" Screen ")
xrandr.init = function()
	local out = outputs()
	local mode = {"1024x768", "1400x1050", "1600x1200", "1920x1080"}
	for _, o in pairs(out) do
		for _, m in pairs(mode) do		
			xrandr.menu:add({ o .. " " .. m,
			function()
			--	msgDebug(o .. " " .. m)
				awful.util.spawn("xrandr --output " .. o .. " --mode " .. m)
			end }, #xrandr.menu+1);
		end
	end
end
xrandr.show = function() xrandr.menu:toggle() end

xrandr.widget:buttons(awful.util.table.join(awful.button({ }, 1, function () xrandr.show() end)))
xrandr:init()

-- Инициализация виджета
--datewidget = wibox.widget.textbox()
-- Регистрация
--vicious.register(datewidget, vicious.widgets.date, "%b %d, %R", 60)
--local calendar = blingbling.calendar(datawidget)

calendar = blingbling.calendar.new({type = "imagebox", image = beautiful.calendar_icon})
--calendar:set_cell_padding(4)
--calendar:set_columns_lines_titles_text_color(beautiful.text_font_color_2)
--calendar:set_title_text_color(beautiful.bg_focus)
--calendar:set_link_to_external_calendar(true)

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    --local right_layout = wibox.layout.align.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
--    right_layout:add(mytextclock)
    right_layout:add(xrandr.widget)
    right_layout:add(kbdcfg.widget)
--    right_layout:add(datewidget)
    right_layout:add(calendar)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, key_Left,   awful.tag.viewprev       ),
    awful.key({ modkey,           }, key_Right,  awful.tag.viewnext       ),
    awful.key({ modkey,           }, key_Escape, awful.tag.history.restore),

    awful.key({ modkey,           }, key_J,
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, key_K,
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, key_W, function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, key_J, function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, key_K, function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, key_J, function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, key_K, function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, key_U, awful.client.urgent.jumpto),
    awful.key({ modkey,           }, key_Tab,
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, key_Return, function () awful.util.spawn(terminal) end),
    awful.key({ modkey, "Control" }, key_R, awesome.restart),
    awful.key({ modkey, "Shift"   }, key_Q, awesome.quit),

    awful.key({ modkey,           }, key_L,     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, key_H,     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, key_H,     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, key_L,     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, key_H,     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, key_L,     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, key_Space, function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, key_Space, function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, key_N, awful.client.restore),

    -- Prompt
    awful.key({ modkey },            key_R,     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, key_X,
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, key_P, function() menubar.show() end),

	awful.key({ "Mod1" }, "Tab",
       function ()
          alttab.switch(1, "Alt_L", "Tab", "ISO_Left_Tab")
       end),
	awful.key({ "Mod1", "Shift"  }, "Tab",
       function ()
          alttab.switch(-1, "Alt_L", "Tab", "ISO_Left_Tab")
       end),
    awful.key({ "Mod1", "Alt_R" }, "Shift_R", function () kbdcfg.switch() end),
    awful.key({ "Mod1", "Alt_L" }, "Shift_L", function () kbdcfg.switch() end)
--	awful.key({ "Mod1", }, "Tab",
--        function ()
--            awful.client.focus.history.previous()
--            if client.focus then
--                client.focus:raise()
--            end
--        end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, key_F,      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, key_C,      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, key_Space,  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, key_Return, function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, key_O,      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, key_T,      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, key_N,
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, key_M,
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
--    awful.key({ "Alt" }, "Shift", function () kbdcfg.switch() end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
--	{ rule = { class = "Plugin-container" },
--	  properties = { floating = true, width = 1900, height = 1024 } },
	{ rule = { class = "Firefox" },
      properties = { tag = tags[1][4] } },
	{ rule = { class = "Skype" },
      properties = { tag = tags[1][1] } },
	{ rule = { class = "Steam" },
      properties = { tag = tags[1][4] } },
	{ rule = { class = "pidgin" },
      properties = { tag = tags[1][1] } },
--    { rule = { instance = "plugin-container" },
--      properties = { floating = true } },
	{ rule = { class = "Clementine" },
      properties = { tag = tags[1][4] } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },
}
-- }}}

mytimer=timer{timeout=2}
mytimer:connect_signal("timeout",
    function () for i,c in ipairs(client.get(mouse.screen)) do
        if c:tags()[mouse.screen] == awful.tag.selected(mouse.screen) then
            naughty.notify({title=c.class,text=c.role})
            naughty.notify({title=c.class,text=c.instance})
        end
    end
end)
--mytimer:start()
--
client.connect_signal("focus", function(c)
 if  c.name == "plugin-container" then
 	--msgDebug(c.name)
	c.fullscreen = true
    --flash_client = c
    --mt = timer({timeout=0.1})
    --mt:connect_signal("timeout",function() flash_client.fullscreen = true
    --mt:stop() end)
    --mt:start()      
 end
end)

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    --c:connect_signal("mouse::enter", function(c)
    --    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
    --        and awful.client.focus.filter(c) then
    --        client.focus = c
    --    end
    --end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
--

function dpms(c)
    if c then
        awful.util.spawn_with_shell("xset s off")
		awful.util.spawn_with_shell("xset -dpms")
--		msgDebug("true")
    else
        awful.util.spawn_with_shell("xset s on && xset +dpms &")
--		msgDebug("false")
    end
end

function run_once(cmd)
  findme = cmd
  firstspace = cmd:find(" ")
  if firstspace then
    findme = cmd:sub(0, firstspace-1)
  end
  awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. cmd .. ")")
end

function run_start()
	dpms(true)
end

run_start();
run_once("dropbox");
run_once("conky");
run_once("pidgin");
run_once("skype");


