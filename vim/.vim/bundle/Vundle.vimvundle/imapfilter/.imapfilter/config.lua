options.create = true
year           = os.date("%Y")
month          = os.date("%m")
umich          = IMAP {
  server       = '',
  username     = '',
  password     = '',
  ssl          = 'ssl3'
}

function archive_folder(folder)
  folder_year = folder..'/'..year
  find_or_create_folder(folder_year)

  folder_year_month = folder_year..'/'..month
  find_or_create_folder(folder_year_month)

  messages = umich[folder]:select_all()
  messages:move_messages(umich[folder_year_month])

  messages = umich[folder_year_month]:is_unseen()
  messages:mark_seen()
end

function find_or_create_folder(folder)
  exist, unread, unseen = umich[folder]:check_status()
  if (exist > 4000000000) then
    umich:create_mailbox(folder)
  end
end

function apply_filters()
  archive_folder('Archive')
  archive_folder('Sent')
end

-- become_daemon(300,apply_filters)
apply_filters()
