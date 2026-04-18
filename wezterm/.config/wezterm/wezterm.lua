local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
    {
        family = "Comic Code Ligatures",
        weight = "Medium",
        harfbuzz_features = { "calt=1", "liga=1" },
    },
})
config.font_size = 17.0
config.font_rules = {
    {
        italic = true,
        font = wezterm.font("Comic Code Ligatures", { weight = "DemiBold", italic = true }),
    },
    {
        italic = true,
        intensity = "Bold",
        font = wezterm.font("Comic Code Ligatures", { weight = "Bold", italic = true }),
    },
    {
        intensity = "Bold",
        font = wezterm.font("Comic Code Ligatures", { weight = "Bold" }),
    },
}

config.harfbuzz_features = { "calt=1", "liga=1" }

config.cell_width = 1.0
config.line_height = 1.0

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.force_reverse_video_cursor = false

config.colors = {
    foreground = "#CDD6F4",
    background = "#11111B",

    cursor_bg = "#F5E0DC",
    cursor_fg = "#1E1E2E",
    cursor_border = "#F5E0DC",

    selection_fg = "#1E1E2E",
    selection_bg = "#F5E0DC",

    ansi = {
        "#45475A", -- color0
        "#F38BA8", -- color1
        "#A6E3A1", -- color2
        "#F9E2AF", -- color3
        "#89B4FA", -- color4
        "#F5C2E7", -- color5
        "#94E2D5", -- color6
        "#BAC2DE", -- color7
    },
    brights = {
        "#585B70", -- color8
        "#F38BA8", -- color9
        "#A6E3A1", -- color10
        "#F9E2AF", -- color11
        "#89B4FA", -- color12
        "#F5C2E7", -- color13
        "#94E2D5", -- color14
        "#A6ADC8", -- color15
    },

    -- Tab bar colors (matching kitty catppuccin tab config)
    tab_bar = {
        background = "#11111B",
        active_tab = {
            bg_color = "#CBA6F7",
            fg_color = "#11111B",
            intensity = "Bold",
        },
        inactive_tab = {
            bg_color = "#181825",
            fg_color = "#CDD6F4",
        },
        inactive_tab_hover = {
            bg_color = "#1E1E2E",
            fg_color = "#CDD6F4",
        },
        new_tab = {
            bg_color = "#181825",
            fg_color = "#CDD6F4",
        },
        new_tab_hover = {
            bg_color = "#1E1E2E",
            fg_color = "#CDD6F4",
        },
    },

    -- Split/pane border colors (from kitty + tmux catppuccin)
    split = "#6C7086",
}

config.background = {
    {
        source = { Color = "#11111B" },
        width = "100%",
        height = "100%",
    },
    {
        source = { File = wezterm.config_dir .. "/kitty_bg.png" },
        width = "Cover",
        height = "Cover",
        opacity = 0.15,
    },
}

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}
config.macos_window_background_blur = 0

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.tab_max_width = 30
config.show_tab_index_in_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false

config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.check_for_updates = false
config.audible_bell = "Disabled"

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
    { key = "a", mods = "LEADER|CTRL", action = act.SendKey({ key = "a", mods = "CTRL" }) },

    {
        key = "|",
        mods = "LEADER|SHIFT",
        action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },

    { key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },

    { key = "LeftArrow", mods = "SHIFT", action = act.ActivateTabRelative(-1) },
    { key = "RightArrow", mods = "SHIFT", action = act.ActivateTabRelative(1) },

    { key = "S", mods = "LEADER|SHIFT", action = act.PaneSelect({ mode = "MoveToNewTab" }) },

    { key = "l", mods = "LEADER|CTRL", action = act.SendKey({ key = "l", mods = "CTRL" }) },

    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },

    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

    { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },

    { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
    { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },

    { key = "s", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },

    { key = "d", mods = "LEADER", action = act.DetachDomain("CurrentPaneDomain") },

    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

    {
        key = ",",
        mods = "LEADER",
        action = act.PromptInputLine({
            description = "Enter new tab name",
            action = wezterm.action_callback(function(window, pane, line)
                if line then
                    window:active_tab():set_title(line)
                end
            end),
        }),
    },

    { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
    { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
    { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
    { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
    { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
    { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
    { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
    { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
    { key = "9", mods = "LEADER", action = act.ActivateTab(8) },
    { key = "0", mods = "LEADER", action = act.ActivateTab(9) },

    { key = "1", mods = "CMD", action = act.ActivateTab(0) },
    { key = "2", mods = "CMD", action = act.ActivateTab(1) },
    { key = "3", mods = "CMD", action = act.ActivateTab(2) },
    { key = "4", mods = "CMD", action = act.ActivateTab(3) },
    { key = "5", mods = "CMD", action = act.ActivateTab(4) },
    { key = "6", mods = "CMD", action = act.ActivateTab(5) },
    { key = "7", mods = "CMD", action = act.ActivateTab(6) },
    { key = "8", mods = "CMD", action = act.ActivateTab(7) },
    { key = "9", mods = "CMD", action = act.ActivateTab(8) },

    { key = ";", mods = "CMD", action = act.Search({ CaseSensitiveString = "" }) },

    { key = "=", mods = "CMD", action = act.IncreaseFontSize },
    { key = "+", mods = "CMD|SHIFT", action = act.IncreaseFontSize },
    { key = "-", mods = "CMD", action = act.DecreaseFontSize },
    { key = "0", mods = "CMD", action = act.ResetFontSize },
    { key = "=", mods = "CTRL|SHIFT", action = act.IncreaseFontSize },
    { key = "-", mods = "CTRL|SHIFT", action = act.DecreaseFontSize },
    { key = "Backspace", mods = "CTRL|SHIFT", action = act.ResetFontSize },

    { key = "H", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "J", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Down", 5 }) },
    { key = "K", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "L", mods = "LEADER|SHIFT", action = act.AdjustPaneSize({ "Right", 5 }) },

    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
}

local copy_mode = nil
if wezterm.gui then
    copy_mode = wezterm.gui.default_key_tables().copy_mode
end

config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = act.PasteFrom("Clipboard"),
    },
}

wezterm.on("update-status", function(window, pane)
    local workspace = window:active_workspace()
    local leader = window:leader_is_active() and "🌁 " or ""

    window:set_right_status(wezterm.format({
        { Background = { Color = "#181825" } },
        { Foreground = { Color = "#CBA6F7" } },
        { Text = "  " },
        { Text = leader },
        { Text = workspace },
        { Text = "  " },
    }))

    window:set_left_status("")
end)

return config
