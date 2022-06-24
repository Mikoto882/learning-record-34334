# アプリ名

学習記録アプリケーション

# 概要

このアプリケーションでは自分が学習した内容についてまとめたり、他人に質問したい内容を投稿することができます。投稿した記録に対して他人がコメントを残したり、質問内容であればコメント形式で回答することもできます。マイページボタンを押せば、自分の今までの投稿を確認することができます。また、プロフィールを変更することもできます。投稿検索機能を使うことで自分が探したいキーワードをすぐに探すこともできます。

# 本番環境

<https://learning-record-34334.herokuapp.com/>

ログイン情報（テスト用）

・Eメール : learn@test
・パスワード : study1234

# 制作背景

勉強することに大きな苦手意識を持っている人でも学習に対するモチベーションを上げるための手段の一つとして作成しました。また、分からない箇所があれば気軽に質問できるように作りました。投稿した記録は他人がコメントすることでお互いを励まし合うなどのコミュニケーションを取ることも目的になります。

# DEMO

## トップページ

<img src="https://i.gyazo.com/62a478bf998c2757c3ad0144839c1eb5.png">

## 新規記録投稿機能

issuesに貼り付けていますのでそちらからご参照ください

## コメント投稿機能

issuesに貼り付けていますのでそちらからご参照ください

## 投稿検索機能

issuesに貼り付けていますのでそちらからご参照ください

# 工夫したポイント

・ターゲットは高校生に絞っています。中にはクラブなどの活動であまり時間が取れないことを想定し、少ない手数で記録を投稿できるように、トップページに新規記録を投稿できるボタンを設置しました。
・トップページからマイページに飛べるようにしたり、ログアウトできるようにしました。
・トップページは記録一覧とマイアカウントについて区別するようにメインサイドとバーサイドを分けました。

# 使用技術

## バックエンド

Ruby, Ruby on Rails

## フロントエンド

HTML, CSS, Javascript

## データベース

MySQL, SequelPro

## インフラ

AWS(EC2)

## Webサーバー（本番環境）

Google Chrome

## アプリケーションサーバー（本番環境）

Google Chrome

## ソース管理

GitHub GitHubDesktop

## テスト

RSpec

## エディタ

VSCode

# 課題や今後実装したい機能

・記録投稿に対するコメントのやり取りによってコミュニティが形成されることで、フォロー機能があればさらに利用しやすくなれると考えています。
・記録投稿一覧を見た時に、ユーザーの識別がしにくいことから、ユーザーのアイコン（画像）を設定できる機能を取り付けたい。
・記録投稿する際に、1度に複数画像を投稿できる機能を追加したい。
・他人の気に入った投稿をマイページに保存できる機能を追加したい。

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| introduction       | text    |                           |
| grade_id           | integer |                           |

### Association

- has_many :learns
- has_many :comments

## learns テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| description   | text       |                   |
| subject_id    | integer    | null: false       |
| study_hour    | string     |                   |
| study_minutes | string     |                   |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| content | text       | null: false       |
| user    | references | foreign_key: true |
| learn   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :learn
