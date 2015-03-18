function! mywikis#load()
  " Default wiki
  let wiki_1 = {}
  let wiki_1.path = '~/Dropbox/Wikis/Default'
  let wiki_1.syntax = 'markdown'
  let wiki_1.ext = '.md'
  let wiki_1.diary_header = 'Journal'
  let wiki_1.diary_index = 'journal'
  let wiki_1.diary_rel_path = 'journal/'

  " Public wiki
  let wiki_2 = {}
  let wiki_2.auto_export = 1
  let wiki_2.path = '~/Dropbox/Wikis/Public'
  let wiki_2.path_html = '~/Dropbox/Public'
  let wiki_2.output_dir = '~/Dropbox/Public'
  let wiki_2.template_ext = '.html'
  let wiki_2.template_default = 'bootstrap3'
  let wiki_2.template_path = '~/Dropbox/Wikis/templates'
  let wiki_2.template_ext = '.html'

  let g:vimwiki_hl_headers = 1
  let g:vimwiki_list = [wiki_1, wiki_2]

  augroup wiki
    autocmd BufNewFile,BufRead *.md map <Leader>wk :s/\%V\(.*\)\%V/\~\~ \1 \~\~/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.md map <Leader>wc :s/\%V\(.*\)\%V/` \1 `/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.md map <Leader>we :s/\%V\(.*\)\%V/_\1_/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.md map <Leader>wb :s/\%V\(.*\)\%V/*\1*/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.md map <Leader>wS :VWS 

    "autocmd BufNewFile,BufRead *.wiki :imap hr ----
    autocmd BufNewFile,BufRead *.md set foldmethod=manual
    autocmd BufNewFile,BufRead *.md set nonu

    nmap <Leader>wT <Plug>VimwikiTabnewLink
    nmap <Leader>tt <Plug>VimwikiToggleListItem
    nmap <Leader>wl :lopen<CR>
    nmap <Leader>wn :lnext<CR>
    nmap <Leader>wp :lprevious<CR>
  augroup end
endfunction
