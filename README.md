done-list
=========

その日やったことをesaにコピペしやすくするツール

※ 24時間以内に更新された購読中のIssue/PRをリポジトリ毎にlist

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
$ bundle exec ruby done_list.rb

or

alias donelist='/bin/bash -lc "cd ~/github/done-list && bundle exec ruby done_list.rb"'
$ donelist
```

## result

```
## fukayatsu/hoge/pull
- [x] [Tweak comment editing](https://github.com/fukayatsu/hoge/pull/511)
- [x] [Add quote-comment with 'r'](https://github.com/fukayatsu/hoge/pull/512)
- [ ] [Add repost with 'p'](https://github.com/fukayatsu/hoge/pull/513)
- [ ] [Notify changes message via webhooks](https://github.com/fukayatsu/hoge/pull/515)
- [x] [Insert image into caret position](https://github.com/fukayatsu/hoge/pull/516)

## fukayatsu/hoge/issues
- [x] [文字を選択してストックしたり、コメントしたりできるようにする](https://github.com/fukayatsu/hoge/issues/254)

## fukayatsu/piyo/issues
- [x] [ねむいのを直す](https://github.com/fukayatsu/piyo/issues/1)
...
```
