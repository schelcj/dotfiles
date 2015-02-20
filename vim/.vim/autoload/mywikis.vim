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

  let wiki_3 = {}
  let wiki_3.path = '~/Dropbox/Wikis/Labbooks'
  let wiki_3.syntax = 'markdown'
  let wiki_3.ext = '.md'

  let wiki_4 = {}
  let wiki_4.path = '~/Dropbox/Wikis/SPH-ICS'
  let wiki_4.syntax = 'markdown'
  let wiki_4.ext = '.md'

  let wiki_5 = {}
  let wiki_5.path = '~/Dropbox/Wikis/Biostat'
  let wiki_5.syntax = 'markdown'
  let wiki_5.ext = '.md'

  let wiki_6 = {}
  let wiki_6.path = '~/Dropbox/Wikis/ConcertPharma'
  let wiki_6.syntax = 'markdown'
  let wiki_6.ext = '.md'

  let wiki_7 = {}
  let wiki_7.path = '~/Dropbox/Wikis/Flux'
  let wiki_7.syntax = 'markdown'
  let wiki_7.ext = '.md'

  let wiki_8 = {}
  let wiki_8.path = '~/Dropbox/Wikis/CSG'
  let wiki_8.syntax = 'markdown'
  let wiki_8.ext = '.md'

  let g:vimwiki_hl_headers = 1
  let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4, wiki_5, wiki_6, wiki_7, wiki_8]

  augroup wiki
    autocmd BufNewFile,BufRead *.wiki map <Leader>wk :s/\%V\(.*\)\%V/\~\~ \1 \~\~/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>wp :s/\%V\(.*\)\%V/` \1 `/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>we :s/\%V\(.*\)\%V/_\1_/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>wb :s/\%V\(.*\)\%V/*\1*/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>wS :VWS 

    "autocmd BufNewFile,BufRead *.wiki :imap hr ----
    autocmd BufNewFile,BufRead *.wiki set foldmethod=manual
    autocmd BufNewFile,BufRead *.wiki set nonu
    nmap <Leader>wT <Plug>VimwikiTabnewLink
    nmap <Leader>tt <Plug>VimwikiToggleListItem
  augroup end
endfunction
