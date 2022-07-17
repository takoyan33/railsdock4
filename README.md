## プロジェクトのタイトル

北星学園大学掲示板

https://rails-docker-portfolio2.herokuapp.com/

## プロジェクトの概要説明

北星学園大学掲示板では、北星学園大学での講義やサークルなどの悩みや相談などを投稿できるweb サイトです。

2022 年の 4月頃から制作を始めました。

実装した機能としては、記事投稿・編集・削除機能と会員登録・編集・削除機能を実装しています。

## 使用言語、環境

使用言語：Ruby

フレームワーク：Ruby on Rails

データベース：MySQL

環境：Dokcer

ライブラリ：kaminari

## デプロイ方法

 docker buildx build . --platform linux/amd64 -t username/rails-docker-portfolio2:latest

 docker tag username/rails-docker-portfolio2 registry.heroku.com/rails-docker-portfolio2/web

 docker push registry.heroku.com/rails-docker-portfolio2/web

 heroku container:release web -a rails-docker-portfolio2


### 今後の計画

・Reactの導入

・Rspecの導入
