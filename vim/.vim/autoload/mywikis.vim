function! mywikis#load()
  function! VimwikiLinkHandler(link)
    " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
    "   1) [[vfile:~/Code/PythonProject/abc123.py]]
    "   2) [[vfile:./|Wiki Home]]
    let link = a:link
    if link =~# '^vfile:'
      let link = link[1:]
    else
      return 0
    endif
    let link_infos = vimwiki#base#resolve_link(link)
    if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
    else
      exe 'tabnew ' . fnameescape(link_infos.filename)
      return 1
    endif
  endfunction

  " Default wiki
  let wiki_1 = {}
  let wiki_1.path = '~/Dropbox/Documents/Wikis/Default'

  " Public wiki
  let wiki_2 = {}
  let wiki_2.auto_export = 1
  let wiki_2.path = '~/Dropbox/Documents/Wikis/Public'
  let wiki_2.path_html = '~/Dropbox/Public'
  let wiki_2.output_dir = '~/Dropbox/Public'
  let wiki_2.template_ext = '.html'
  let wiki_2.template_default = 'bootstrap3'
  let wiki_2.template_path = '~/Dropbox/Documents/Wikis/templates'
  let wiki_2.template_ext = '.html'

  " Work Glossary(mostly genetic stuffs)
  let wiki_3 = {}
  let wiki_3.path = '~/Dropbox/Documents/Wikis/Glossary'

  " Labbooks (beit personal or work...don't care)
  let wiki_4 = {}
  let wiki_4.path = '~/Dropbox/Documents/Wikis/Labbooks'

  " Journal wiki
  let wiki_5 = {}
  let wiki_5.path = '~/Dropbox/Documents/Wikis/Journal'
  let wiki_5.diary_header = 'Journal'
  let wiki_5.diary_index = 'index'
  let wiki_5.diary_rel_path = ''

  let g:vimwiki_hl_headers = 1
  let g:vimwiki_list = [wiki_1, wiki_2, wiki_3, wiki_4, wiki_5]

  augroup wiki
    autocmd BufNewFile,BufRead *.wiki map <Leader>wk :s/\%V\(.*\)\%V/\~\~ \1 \~\~/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>wc :s/\%V\(.*\)\%V/`\1`/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>we :s/\%V\(.*\)\%V/_\1_/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>wb :s/\%V\(.*\)\%V/*\1*/g<CR>:let @/ = ""<CR>
    autocmd BufNewFile,BufRead *.wiki map <Leader>wS :VWS 

    "autocmd BufNewFile,BufRead *.wiki :imap hr ----
    autocmd BufNewFile,BufRead *.wiki set foldmethod=manual
    autocmd BufNewFile,BufRead *.wiki set nonu

    nmap <Leader>wT <Plug>VimwikiTabnewLink
    nmap <Leader>tt <Plug>VimwikiToggleListItem
    nmap <Leader>wl :lopen<CR>
    nmap <Leader>wL :lclose<CR>
    nmap <Leader>wn :lnext<CR>
    nmap <Leader>wp :lprevious<CR>
  augroup end
endfunction
