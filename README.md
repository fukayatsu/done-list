done-list
=========

その日やったことをesaにコピペしやすくするツール

※ 24時間以内に更新された && assined && closedなissueをリポジトリ毎にlist

# setup

```
$ git clone https://github.com/fukayatsu/done-list
$ cd done-list
$ bundle install
```

## setup github access token

- goto: https://github.com/settings/applications#personal-access-tokens
- generate new token
- cp .env.sample .env
- fill the token in .env

# usage

```
bundle exec ruby done_list.rb
```
