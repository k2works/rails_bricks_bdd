RailsBricks入門
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

# 参照 #

[RailsBricks](http://www.railsbricks.net/)

[Heroku](https://www.heroku.com/)

[Getting Started with Rails 4.x on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails4)

[Railsの多言語化対応 I18nのやり方を整理してみた！【国際化/英語化】](http://morizyun.github.io/blog/i18n-english-rails-ruby-many-languages/)

[amatsuda / i18n_generators](https://github.com/amatsuda/i18n_generators)

[Rails4時代の高速テスト環境 Rspec+Guard+FactoryGirl+Spring[NEW!]](http://qiita.com/unosk/items/c2e2bbc31d97e92803dc)

[guard / guard-rspec](https://github.com/guard/guard-rspec)

[guard / guard-livereload](https://github.com/guard/guard-livereload)


