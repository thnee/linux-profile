-- {{{ CPU usage

-- cpu icon
cpuicon = widget({ type = "imagebox" })
cpuicon.image = image(beautiful.widget_cpu)

-- check for cpugraph_enable == true in config
if cpugraph_enable then
    -- Initialize widget
    cpugraph  = awful.widget.graph()

    -- Graph properties
    cpugraph:set_width(40):set_height(16)
    cpugraph:set_background_color(beautiful.fg_off_widget)
    cpugraph:set_gradient_angle(0):set_gradient_colors({
       beautiful.fg_end_widget, beautiful.fg_center_widget, beautiful.fg_widget
    })

    -- Register graph widget
    vicious.register(cpugraph,  vicious.widgets.cpu,      "$1")
end

-- cpu text widget
cpuwidget = widget({ type = "textbox" }) -- initialize
vicious.register(cpuwidget, vicious.widgets.cpu, cputext_format, 3) -- register

-- temperature
tzswidget = widget({ type = "textbox" })
vicious.register(tzswidget, vicious.widgets.thermal,
    function (widget, args)
        if args[1] > 0 then
            tzfound = true
            return " " .. args[1] .. "C°"
        else return "" 
        end
    end
    , 19, "thermal_zone0")

-- }}}
