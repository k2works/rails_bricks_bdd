[![Hack k2works/rails_bricks_bdd on Nitrous.IO](https://d3o0mnbgv6k92a.cloudfront.net/assets/hack-s-v1-7475db0cf93fe5d1e29420c928ebc614.png)](https://www.nitrous.io/hack_button?source=embed&runtime=rails&repo=k2works%2Frails_bricks_bdd&file_to_open=README.md)

RailsBricks入門(BDD適用編)
===================

# 目的 #
RailsBrickを使ってBDD環境を構築する

# 前提 #
| ソフトウェア   | バージョン   | 備考        |
|:---------------|:-------------|:------------|
| OS X           |10.8.5        |             |
| ruby           |2.1.1         |             |
| rvm            |1.24.0        |             |
| rbricks        |2.0.5         |             |
| heroku-toolbelt |3.6.0        |             |

+ [Herokuにサインアップしている](https://id.heroku.com/signup/devcenter)
+ [Heroku Toolbeltをインストールしている](https://toolbelt.heroku.com/)
+ [LiveReloadをChromeにインストールしている](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei)

# 構成 #
+ [環境セットアップ](#1)
+ [アプリケーションのセットアップ](#2)
+ [アプリケーションのデプロイ](#3)
+ [日本語対応](#4)
+ [Rspecテスト環境構築](#5)
+ [Cucumberテスト環境構築](#6)
+ [ドキュメント環境構築](#7)

# 詳細 #

## <a name="1">環境セットアップ</a> ##

    $ rvm install 2.0.0
    $ rvm gemset create github
    $ rvm use ruby-2.0.0@github
    $ echo rvm use ruby-2.0.0@github >> .rvmrc
    $ gem install railsbricks
    $ gem install rails -no-ri -no-rdoc --version=4.0.4

## <a name="2">アプリケーションのセットアップ</a> ##

[RailsBricks入門参照](https://github.com/k2works/rails_bricks_introduction)

## <a name="3">アプリケーションのデプロイ</a> ##

[RailsBricks入門参照](https://github.com/k2works/rails_bricks_introduction)

## <a name="4">日本語対応</a> ##

[RailsBricks入門参照](https://github.com/k2works/rails_bricks_introduction)

## <a name="5">Rspecテスト環境構築</a> ##

### Gemfileの編集 ###

以下のgemを追加してbundle実行

    gem "guard-rspec",
    gem "factory_girl_rails",
    gem "spring"
    gem "guard-livereload", require: false
    gem "spring-commands-rspec"

### spec_helperの設定 ###

以下を追加

    config.before(:all) do
      FactoryGirl.reload
    end

### Guardの設定 ###

以下のコマンドを実行してGuardflileを生成する

    $ guard init rspec livereload

生成されたGuardfileの以下の行を変更する

    guard :rspec do

    guard :rspec, cmd: 'spring rspec -f doc' do

実行して確認する

    $ guard

### Procfileの編集 ###

Procfileに以下の内容を追加する

    guard: bundle exec guard


## <a name="6">Cucumberテスト環境構築</a> ##

### Gemfileの編集 ###

以下のgemを追加してbundle実行

    gem "cucumber-rails", require: false
    gem "database_cleaner"
    gem "guard-cucumber"

### Cucumberセットアップ ###

    $ rails g cucumber:install
      create  config/cucumber.yml
      create  script/cucumber
       chmod  script/cucumber
      create  features/step_definitions
      create  features/support
      create  features/support/env.rb
       exist  lib/tasks
      create  lib/tasks/cucumber.rake
        gsub  config/database.yml
        gsub  config/database.yml
       force  config/database.yml

### Cucumberの実行 ###

    $ rake cucumber
    /Users/k2works/.rvm/rubies/ruby-2.0.0-p247/bin/ruby -S bundle exec cucumber  --profile default
    Using the default profile...
    0 scenarios
    0 steps
    0m0.000s

### Guardファイル追加 ###

    $guard init cucumber

## <a name="7">ドキュメント環境構築</a> ##

以下のGemを追加してbundle実行

```Ruby
gem 'yard', :require => false
gem 'yard-cucumber', :require => false
gem 'redcarpet'
gem 'guard-yard'
gem 'yard-rails-plugin', :git => 'https://github.com/ogeidix/yard-rails-plugin.git', :tag => 'v0.0.1'
gem 'guard-ctags-bundler'
```

### .yardoptsの追加 ###
```
--charset UTF-8
"{lib,app,features}/**/*.{rb,feature}" --plugin yard-cucumber
```

### Yardの実行 ###
```
$ yard
$ yard server
$ open http://localhost:8808
```

### Guardファイル追加 ###
```
$ guard init yard
```

### Guard実行
```
$guard
12:23:38 - INFO - Guard is using TerminalTitle to send notifications.
12:23:38 - INFO - [Guard::Yard] Stopping YARD Documentation Server.
12:23:38 - INFO - [Guard::Yard] Starting YARD Documentation Server.
>> YARD 0.8.7.4 documentation server at http://0.0.0.0:8808
[2014-04-21 12:23:39] INFO  WEBrick 1.3.1
[2014-04-21 12:23:39] INFO  ruby 2.0.0 (2013-06-27) [x86_64-darwin12.5.0]
[2014-04-21 12:23:39] WARN  TCPServer Error: Address already in use - bind(2)
[2014-04-21 12:23:39] INFO  WEBrick::HTTPServer#start: pid=88760 port=8808
12:23:40 - INFO - [Guard::Yard] Server successfully started.
12:23:40 - INFO - Guard::RSpec is running
12:23:40 - INFO - Running all features
Disabling profiles...


0 scenarios
0 steps
0m0.000s

12:23:45 - INFO - Guard is now watching at '/Users/k2works/projects/github/rails_bricks_bdd'
[1] guard(main)>
```
guard実行時にYardサーバーが実行されるので_http://localhost:8808_にアクスすればドキュメントを閲覧できる。画面が文字化けしてる場合はエンコードをUnicode(UTF-8)に変更する。

Yardドキュメント生成時に```invalid byte sequence in UTF-8```が発生した場合は以下をコンソルールで実行する。
```
$export LANG=ja_JP.eucJP
```
# 参照 #

[RailsBricks](http://www.railsbricks.net/)

[Heroku](https://www.heroku.com/)

[Getting Started with Rails 4.x on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4)

[Railsの多言語化対応 I18nのやり方を整理してみた！【国際化/英語化】](http://morizyun.github.io/blog/i18n-english-rails-ruby-many-languages/)

[amatsuda / i18n_generators](https://github.com/amatsuda/i18n_generators)

[Rails4時代の高速テスト環境 Rspec+Guard+FactoryGirl+Spring[NEW!]](http://qiita.com/unosk/items/c2e2bbc31d97e92803dc)

[guard / guard-rspec](https://github.com/guard/guard-rspec)

[guard / guard-livereload](https://github.com/guard/guard-livereload)

[cucumber / cucumber-rails](https://github.com/cucumber/cucumber-rails)

[panthomakos/guard-yard](https://github.com/panthomakos/guard-yard)

[ogeidix/yard-rails-plugin](https://github.com/ogeidix/yard-rails-plugin)

[Introducing the Nitrous.IO Hack Button: Bring Your Code to Life](http://blog.nitrous.io/2014/04/16/nitrousio-hack-button.html)

[Ruby 1.9 Encoding Issues, Again.](http://gnuu.org/2009/11/02/ruby-1-9-encoding-issues-again/)
