vim.g.dashboard_custom_header = {
    '          ▀████▀▄▄              ▄█ ',
    '            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ',
    '    ▄        █          ▀▀▀▀▄  ▄▀  ',
    '   ▄▀ ▀▄      ▀▄              ▀▄▀  ',
    '  ▄▀    █     █▀   ▄█▀▄      ▄█    ',
    '  ▀▄     ▀▄  █     ▀██▀     ██▄█   ',
    '   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ',
    '    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ',
    '   █   █  █      ▄▄           ▄▀   ',
    '                                   ',
    '               PikaVim             ',
}

vim.g.dashboard_custom_section = {
    a = {
      description = {'  New File              :enew'},
      command = ':enew' },
    b = {
      description = {'  Find files            <C-p>'},
      command = ':FzfLua files cmd=rg\\ --files\\ --hidden\\ --no-ignore-vcs\\ -g\\ "!.git/*"' },
    c = {
      description = {'  Find Word             <C-g>'},
      command = ':FzfLua live_grep' },
    d = {
      description = {'  Find Marks              ,fm'},
      command = ':FzfLua marks' },
    e = {
      description = {'  Transparency          <\\-T>'},
      command = ':Transparency' },
    f = {
      description = {'  File Explorer         <C-o>'},
      command = ':CHADopen' },
    g = {
        description = {'  Exit                     :q'},
        command = ':q' },
}
