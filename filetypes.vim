if exists('did_load_filetypes') | fini | en
au! BufRead,BufNewFile *.haml         setfiletype haml
endif
