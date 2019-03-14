"
" Filename: autoload/lightline/colorscheme/ayu_light.vim
" Author: wasabi315
" Licence: MIT
"

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:black     = ["#5C6773", "NONE"]
let s:red       = ["#F07178", "NONE"]
let s:blue      = ["#36A3D9", "NONE"]
let s:orange    = ["#F29718", "NONE"]
let s:green     = ["#86B300", "NONE"]
let s:yellow    = ["#E7C547", "NONE"]
let s:white     = ["#F3F3F3", "NONE"]
let s:dullWhite = ["#F0EEE4", "NONE"]

let s:p.normal.left    = [ [ s:black, s:dullWhite ], [ s:black, s:white ] ]
let s:p.normal.middle  = [ [ s:black, s:white ] ]
let s:p.normal.right   = [ [ s:black, s:white ], [ s:black, s:white ] ]
let s:p.normal.warning = [ [ s:white, s:yellow ] ]
let s:p.normal.error   = [ [ s:white, s:red ] ]

let s:p.inactive.left   = [ [ s:black, s:dullWhite ], [ s:black, s:white ] ]
let s:p.inactive.middle = [ [ s:black, s:white ] ]
let s:p.inactive.right  = [ [ s:black, s:dullWhite ], [ s:black, s:white ] ]

let s:p.insert.left  = [ [ s:white, s:green ], [ s:black, s:white ] ]
let s:p.replace.left = [ [ s:white, s:blue ], [ s:black, s:white ] ]
let s:p.visual.left  = [ [ s:white, s:orange ], [ s:black, s:white ] ]

let s:p.tabline.left   = [ [ s:black, s:white ] ]
let s:p.tabline.middle = [ [ s:black, s:white ] ]
let s:p.tabline.right  = [ [ s:black, s:white ] ]
let s:p.tabline.tabsel = [ [ s:black, s:dullWhite ] ]

let g:lightline#colorscheme#ayu_light#palette = lightline#colorscheme#flatten(s:p)
