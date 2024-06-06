local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.color_scheme = "nordfox"
config.window_background_opacity = 0.95
config.font = wezterm.font("JetBrainsMono Nerd Font", {
    weight = "Medium"
})
config.font_size = 16
config.mouse_wheel_scrolls_tabs = false
config.window_close_confirmation = "NeverPrompt"
config.audible_bell = "Disabled"
config.window_decorations = "RESIZE"
config.scrollback_lines = 10000
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
config.tab_bar_at_bottom = false

-- Dim inactive panes
config.inactive_pane_hsb = {
    saturation = 0.25,
    brightness = 0.5
}

config.keys = {{
    key = "%",
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitHorizontal({
        domain = "CurrentPaneDomain"
    })
}, {
    key = '"',
    mods = "CTRL|SHIFT",
    action = wezterm.action.SplitVertical({
        domain = "CurrentPaneDomain"
    })
}, {
    key = "d",
    mods = "SUPER|SHIFT",
    action = wezterm.action.SplitVertical({
        domain = "CurrentPaneDomain"
    })
}}

wezterm.on("update-status", function(window, pane)
    -- Workspace name
    local stat = window:active_workspace()
    local stat_color = "#f7768e"
    -- It's a little silly to have workspace name all the time
    -- Utilize this to display LDR or current key table name
    if window:active_key_table() then
        stat = window:active_key_table()
        stat_color = "#7dcfff"
    end
    if window:leader_is_active() then
        stat = "LDR"
        stat_color = "#bb9af7"
    end

    local basename = function(s)
        -- Nothing a little regex can't fix
        return string.gsub(s, "(.*[/\\])(.*)", "%2")
    end

    -- Current working directory
    local cwd = pane:get_current_working_dir()
    if cwd then
        if type(cwd) == "userdata" then
            -- Wezterm introduced the URL object in 20240127-113634-bbcac864
            cwd = basename(cwd.file_path)
        else
            -- 20230712-072601-f4abf8fd or earlier version
            cwd = basename(cwd)
        end
    else
        cwd = ""
    end

    -- Current command
    local cmd = pane:get_foreground_process_name()
    -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
    cmd = cmd and basename(cmd) or ""

    -- Time
    local time = wezterm.strftime("%H:%M")

    -- Left status (left of the tab line)
    window:set_left_status(wezterm.format({{
        Foreground = {
            Color = stat_color
        }
    }, {
        Text = "  "
    }, {
        Text = wezterm.nerdfonts.oct_table .. "  " .. stat
    }, {
        Text = " |"
    }}))

    -- Right status
    window:set_right_status(wezterm.format({ -- Wezterm has a built-in nerd fonts
    -- https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    {
        Text = wezterm.nerdfonts.md_folder .. "  " .. cwd
    }, {
        Text = " | "
    }, {
        Foreground = {
            Color = "#e0af68"
        }
    }, {
        Text = wezterm.nerdfonts.fa_code .. "  " .. cmd
    }, "ResetAttributes", {
        Text = " | "
    }, {
        Text = wezterm.nerdfonts.md_clock .. "  " .. time
    }, {
        Text = "  "
    }}))
end)
return config
