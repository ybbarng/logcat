" Vim syntax file
" Language:		logcat
" Maintainers:		Naseer Ahmed <naseer.ahmed@gmail.com>
"			Lertsenem <lertsenem@yahoo.fr>
" Latest Revision:	2013-06-19

if exists("b:current_syntax")
    finish
endif

" Particular settings
set nonumber
colorscheme default

" Define colors
hi def log_date_color ctermfg=242
hi def log_hour_color ctermfg=167
hi def log_millisec_color ctermfg=168

hi def log_processNumber_color ctermfg=178
hi def log_threadNumber_color ctermfg=180
hi def log_tag_color ctermfg=105

hi def kw_fatal_color ctermfg=177
hi def kw_error_color ctermfg=red
hi def kw_warning_color ctermfg=130
hi def kw_info_color ctermfg=darkgreen
hi def kw_debug_color ctermfg=25
hi def kw_verbose_color ctermfg=white

" Define regions
syn region reg_date start="^" end="$" fold transparent contains=log_date keepend

" Define keywords
syn keyword log_fatal contained F
syn keyword log_error contained E
syn keyword log_warning contained W
syn keyword log_info contained I
syn keyword log_debug contained D
syn keyword log_verbose contained V

syn cluster log_types contains=log_fatal,log_error,log_warning,log_info,log_debug,log_verbose

" Define matches
syn match log_date contained '^\d\d-\d\d' nextgroup=log_hour skipwhite
syn match log_hour contained '\d\d:\d\d:\d\d' nextgroup=log_millisec skipwhite
syn match log_millisec contained '\.\d\d\d' nextgroup=log_processNumber skipwhite
syn match log_processNumber contained '\d\+' nextgroup=log_threadNumber skipwhite
syn match log_threadNumber contained '\d\+' nextgroup=log_type skipwhite
syn match log_type contained '\S' contains=@log_types nextgroup=log_tag skipwhite
syn match log_tag contained '[^:]\+'

" Define links
hi def link log_date log_date_color
hi def link log_hour log_hour_color
hi def link log_millisec log_millisec_color
hi def link log_processNumber log_processNumber_color
hi def link log_threadNumber log_threadNumber_color
hi def link log_tag log_tag_color

hi def link log_fatal kw_fatal_color
hi def link log_error kw_error_color
hi def link log_warning kw_warning_color
hi def link log_info kw_info_color
hi def link log_debug kw_debug_color
hi def link log_verbose kw_verbose_color
