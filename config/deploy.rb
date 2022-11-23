# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "my_app_name"
set :repo_url, "git@example.com:me/my_repo.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

# capistranoのバージョンを記載。固定のバージョンを利用し続け、バージョン変更によるトラブルを防止する
lock '3.1'

# Capistranoのログの表示に利用する
set :application, 'furima-38247'

# どのリポジトリからアプリをpullするかを指定する
set :repo_url,  'git@github.com:TAKUYA34/furima-38247.git'

# バージョンが変わっても共通で参照するディレクトリを指定
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.6.5' #カリキュラム通りに進めた場合、’2.6.5’ です

# どの公開鍵を利用してデプロイするか
set :ssh_options, auth_methods: ['publickey'],
                                  keys: ['~/.ssh/ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC180ethyfZivFmBUbP9Y2UgY/gzpjBOubsetUPB3WTmaXVQ6GAOxNtel2wwkw7ZnLTjXocog5gHoRuUp0vJzfbVyh4J1G9pCdxsMNLrIhyOCPoFewOqGF+8UkE0TzNueAHBpw14nkb/Bi4os4eekFu92iGpNpD7qszLckiz/YxhV+czt/5U+4tUZTElhuG8XqMbW04ovJPQ3E24bfh3+cH9C5wm8U7VH/jfrQuVyUhW6rR573PvynMadIiRxIOLt6jaZg18T5Lzt/81axz/fs/9I30zV9Ohv/A9kC2itDTdqcCFmnhHKxsmyLxCbElb3SJajPibvE1uqFpGI9JivPEERJg/contV6wN1J64N1qaZ7so+Q2Zo1C6KrcVUe7j4yLmO0l2tUzzK54wdpwKSqTc+vRNwXIit1iDUAcahYgfoj7236i0hGzTQxIT5vc5CWC5gAJVbOprRgF4NNJQzpkq9JIpt/Mw+9Qn9WwfDwqm+gH3n3QlIMlRB22jNnZ2btSaF3F8e5jXARGbC4ADISJzyxudohQ8k2SouEWHirlCw6hrKM/mSG0GubQEdAfaTGGkmysIdX3SNoyfnXom3+yPqPEJy9sguEPoo1deyAkIdjHzdNajj06GGZh0lSPQwKjil5OC9z4aFsKHBRe3JMMppbR42Y3wDpLYASYOcU2Xw== ec2-user@ip-172-31-4-138.ap-northeast-1.compute.internal.pem'] 

# プロセス番号を記載したファイルの場所
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

# Unicornの設定ファイルの場所
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

# デプロイ処理が終わった後、Unicornを再起動するための記述
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
