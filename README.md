# 時短レシピアプリ「Qmeals」の概要

## サービスURL
https://qmeals-app.onrender.com/

## ◼︎サービスの概要
「時短」「手軽に」をモットーとしたレシピアプリです。<br>

## ◼︎サービスに込めた想い
本サービスを作成するにあたり、自身の2つの体験をもとに、アプリの着想を得ました。<br>

`1.食材を使い切ることができない。`<br>
`2.時間短縮となる料理を作りたい。`<br>

本アプリでは、上記のギャップを解消し、「料理の楽しさ・奥深さ」を体験できることを第一に考えました。<br>

また、本アプリと既存レシピアプリとの主な差別化として、<br>
`・買い物リスト`<br>
`・レシピから直接買うものを追加できる`<br>
`・料理の知恵を共有する掲示板`<br>

上記のような`既存アプリにはない機能`を意識して実装し、普段料理しないユーザーの獲得に注力しました。

## ◼︎ターゲット層
下記のようなユーザーが対象です。<br>

・忙しい人(サラリーマン・OL)<br>
・普段料理をしない人<br>
・余り物で料理をしたい人<br>
・時短で料理をしたい人<br>

## ◼︎機能
・会員登録<br>
・ログイン<br>
・パスワードリセット<br>
・お問い合わせ機能<br>
・レシピ投稿<br>
Ajaxにて実装
　・コメント投稿<br>
　・ブックマーク<br>
・レシピの検索<br>
・検索機能<br>
・ブックマーク機能<br>
・食材の買い物リスト登録<br>
・知恵袋の投稿(料理に関する豆知識など)<br>
・海外の料理レシピを検索(EdamamAPIを使用)<br>

## ◼︎サービスの利用イメージ(詳細は下記の画面紹介と併せてご確認ください。)
・レシピの投稿、閲覧。<br>
・レシピをもとに、食材の「お買い物リスト」へ登録。<br>
・検索機能からレシピや料理の知恵を検索できる<br>

  ex).検索時に、料理時間で絞り込み可能。<br>
  ex).使用したい食材をタグから検索できる。<br>

・自身の料理知恵袋の共有(料理知恵袋の掲示板作成・閲覧)<br>
ex).「野菜を腐りづらくする秘訣」「お肉は常温で解凍しておく理由」など<br>

## ◼︎画面紹介
| レシピのお気に入り機能 | 料理の知恵袋のお気に入り機能 |
| --- | --- |
| [![お気に入り機能](https://i.gyazo.com/91e106ce34876e8b85bd71c2eef41407.gif)](https://gyazo.com/91e106ce34876e8b85bd71c2eef41407) | [![料理の知恵袋のお気に入り機能](https://i.gyazo.com/a811c80433836ceb118cf28a864c04a9.gif)](https://gyazo.com/a811c80433836ceb118cf28a864c04a9)
| レシピのコメント機能 | 料理の知恵袋のコメント機能 |
[![レシピのコメント機能](https://i.gyazo.com/4e1642f9a3865988a543abecda3ae4ad.gif)](https://gyazo.com/4e1642f9a3865988a543abecda3ae4ad)|[![料理の知恵袋の投稿機能](https://i.gyazo.com/b3fdf1553503fbad712d3e574d1c6855.gif)](https://gyazo.com/b3fdf1553503fbad712d3e574d1c6855)
| レシピの投稿機能 | 海外のレシピ検索機能① |
[![Image from Gyazo](https://i.gyazo.com/46fd543ef883857ab69474ed390d06d3.gif)](https://gyazo.com/46fd543ef883857ab69474ed390d06d3)| [![レシピ検索機能](https://i.gyazo.com/f1f3becda4d423b39d51ebd96a24b973.gif)](https://gyazo.com/f1f3becda4d423b39d51ebd96a24b973) |
| 海外のレシピ検索機能② | 海外のレシピ検索機能③ |
[![海外のレシピ検索機能②](https://i.gyazo.com/f84877a777960c3707d5cfe91ea37e07.gif)](https://gyazo.com/f84877a777960c3707d5cfe91ea37e07)[![海外のレシピ検索機能③](https://i.gyazo.com/0392a2078a4a7fd86ab934082ca9fbb4.gif)](https://gyazo.com/0392a2078a4a7fd86ab934082ca9fbb4)
| お買い物リストに登録 |　レシピからお買い物リストに登録 |
[![お買い物リストに登録](https://i.gyazo.com/595d236d79c447fd0ec0020229aa3e1c.gif)](https://gyazo.com/595d236d79c447fd0ec0020229aa3e1c)|[![レシピからお買い物リストに登録](https://i.gyazo.com/c1815d9ba20b5bb400c9ee2e28c3afbe.gif)](https://gyazo.com/c1815d9ba20b5bb400c9ee2e28c3afbe)

## ◼︎こだわりポイント
今回こだわった点は、UIです。
◼︎イメージカラーとして、食事を連想させるようなカラーであることに焦点を当てて、作成いたしました。画面遷移図の段階では3台栄養バランスをイメージしたカラーで作成いたしましが、アプリを触っていただき、「あまり食欲をそそらない色である」とご指摘をいただきました。
そこで、改めて既存アプリを調査した際に、「温かみのある色」を使用しているポイントに注目しました。また、イメージカラーで差別化を図ることを念頭においていましたが、既存アプリで重複している色を選定して再度作成し、アプリのUI向上に努めました。


## ◼︎使用技術・バージョン管理
[![言語バッジ](https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=flat-square&logoColor=white)](https://www.ruby-lang.org/)
[![フレームワークバッジ](https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000.svg?logo=ruby-on-rails&style=flat-square&logoColor=white)](https://rubyonrails.org/)
[![Dockerバッジ](https://img.shields.io/badge/-Docker-2496ED.svg?logo=docker&style=flat-square&logoColor=white)](https://www.docker.com/)
[![HTMLバッジ](https://img.shields.io/badge/-HTML5-E34F26.svg?logo=html5&style=flat-square&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML)
[![CSSバッジ](https://img.shields.io/badge/-CSS3-1572B6.svg?logo=css3&style=flat-square&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/CSS)


| カテゴリー     | 技術                      |
| -------------- | ----------------------- |
| フロントエンド | HTML, CSS |
| バックエンド   | Ruby 3.2.2, Ruby on Rails 7.0.4 RSpec |
| データベース   |  PostgresSQL |
| 環境   |  Docker   |
| API   |  EdamamAPI   |
| 高度な機能   | オートコンプリート    |
| その他ライブラリ         |Bootstrap5 |
| デザイン       |Figma           |
| インフラ         |render AWS-S3 |

## ◼︎ER図・インフラ構成図
・画面遷移図
https://www.figma.com/file/TQS7LWbK0NfAG8z4oiTpoJ/MVP%E3%80%90%E7%94%BB%E9%9D%A2%E8%A8%AD%E8%A8%88%E5%9B%B3%E3%80%91?type=design&node-id=0-1&mode=design&t=IYLgSD2NiqYko7xC-0

## ◼︎ER図
【左側】
[![Image from Gyazo](https://i.gyazo.com/798f9f68ab862457cb1c755a85f46d0a.png)](https://gyazo.com/798f9f68ab862457cb1c755a85f46d0a)
【右側】
[![Image from Gyazo](https://i.gyazo.com/93cf3a5a5b23106cb97d3b263e5546e5.png)](https://gyazo.com/93cf3a5a5b23106cb97d3b263e5546e5)

## ◼︎今後の展望について
1.Rspec<br>
スピード重視で目検証の部分のテストコードを厚くして、アプリの品質を担保したいと考えております。

2.管理画面の作成<br>
ユーザーが触っていただけるように急いで作成いたしましたので、管理画面も作成し、適切な運用ができるように心がけていきたいです。

3.Raty機能<br>
食べログのような評価機能を実装し、よりユーザーからの関心を惹きやすい機能実装を考えております。

4.その他UX<br>
アップロードなどで処理が重くなる場合があるので、パフォーマンス改善を図りたいと思います。

## ◼︎環境構築
1.Dockerを使った環境準備<br>
`docker compose build`<br>

2.railsサーバーの起動<br>
`docker compose up -d`<br>

3.Gemのインストール<br>
`docker compose exec web bundle install`<br>

4.node_modulesのインストール<br>
`docker compose exec web yarn install`<br>

5.データベースの作成<br>
`docker compose exec web rails db:create`<br>

6.マイグレーションの適用<br>
`docker compose exec web rails db:migrate`<br>
