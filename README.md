# Qmealsについて

### 講師の方へ
別レポジトリで作業していたのですが、解消できないコンフリクトの影響によりこちらで作業している状態です。
Readmeの内容は退避していたものを再現しましたが、プルリクなどの一部情報が消えてしまっている点ご留意ください。

## ◼︎サービスの概要
「時短」「手軽に」をモットーに、料理の楽しさを知ってもらう為のアプリです。<br>

## ◼︎サービスに込めた想い
本サービスを作成するにあたり、自身の2つの体験をもとに、アプリの着想を得ました。<br>

`1.食材を使い切ることができない。`<br>
`2.時間短縮となる料理を作りたい。`<br>

このアプリでは、上記のギャップを解消し、「料理の楽しさ・奥深さ」を再認識することを第一に考えました。<br>
その為、本アプリは、`手軽にできる料理のライフハック`として通常のレシピアプリとは差別化を図りました。<br>

主な差別化として、<br>
`・買い物リスト`<br>
`・料理の知恵を共有する掲示板`<br>

このような`あったら便利な機能`を実装し、アプリを使用する動機付けになればと思います。

## ◼︎ターゲット層
下記ユーザーがが対象です。<br>

・忙しい人(サラリーマン・OL)<br>
・普段料理をしない人<br>
・余り物で料理をしたい人<br>
・時短で料理をしたい人<br>

## ◼︎サービスの利用イメージ
・レシピの投稿、閲覧。<br>
・レシピをもとに、食材の「お買い物リスト」へ登録。<br>
・食材が余っている際に、時短レシピの検索ができる。<br>

  ex).検索時に、料理時間で絞り込み可能。<br>
  ex).使用したい食材をタグから検索できる。<br>

・自身の料理知恵袋の共有(料理知恵袋の掲示板作成・閲覧)<br>

ex).「にんじんはどこに栄養が集中するか。」「お肉は常温で回答しておく理由」など<br>

## ◼︎機能

### ◼︎MVP
・会員登録<br>
・ログイン<br>
・パスワードリセット<br>
・お問い合わせ機能<br>
・レシピ投稿<br>
・コメント投稿<br>
・ブックマーク<br>
・レシピの検索<br>
・検索機能<br>
・ブックマーク機能<br>
・食材の買い物リスト登録<br>
・知恵袋の投稿(料理に関する豆知識など)<br>
・海外の料理レシピを検索(EdamamAPIを使用)<br>

### ◼︎追加での実装
・通知機能(LINEのAPIを使用)
・レーティング機能

## ◼︎使用技術・バージョン管理
[![言語バッジ](https://img.shields.io/badge/-Ruby-CC342D.svg?logo=ruby&style=flat-square&logoColor=white)](https://www.ruby-lang.org/)
[![フレームワークバッジ](https://img.shields.io/badge/-Ruby%20on%20Rails-CC0000.svg?logo=ruby-on-rails&style=flat-square&logoColor=white)](https://rubyonrails.org/)
[![Dockerバッジ](https://img.shields.io/badge/-Docker-2496ED.svg?logo=docker&style=flat-square&logoColor=white)](https://www.docker.com/)
[![HTMLバッジ](https://img.shields.io/badge/-HTML5-E34F26.svg?logo=html5&style=flat-square&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML)
[![CSSバッジ](https://img.shields.io/badge/-CSS3-1572B6.svg?logo=css3&style=flat-square&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/CSS)
[![JavaScriptバッジ](https://img.shields.io/badge/-JavaScript-F7DF1E.svg?logo=javascript&style=flat-square&logoColor=black)](https://developer.mozilla.org/en-US/docs/Web/JavaScript)


| カテゴリー     | 技術                      |
| -------------- | ----------------------- |
| フロントエンド | HTML, CSS, JavaScript、React   |
| バックエンド   | Ruby 3.2.2, Ruby on Rails 7.x RSpec |
| データベース   |  MySQL   |
| 環境   |  Docker   |
| API   |  EdamamAPI   |
| 高度な機能   | オートコンプリート    |
| その他ライブラリ         |Fly.io |
| デザイン       |Figma           |

## ◼︎ER図・インフラ構成図
・画面遷移図
https://www.figma.com/file/TQS7LWbK0NfAG8z4oiTpoJ/MVP%E3%80%90%E7%94%BB%E9%9D%A2%E8%A8%AD%E8%A8%88%E5%9B%B3%E3%80%91?type=design&node-id=0-1&mode=design&t=IYLgSD2NiqYko7xC-0

## ◼︎ER図・インフラ構成図
【左側】
[![Image from Gyazo](https://i.gyazo.com/798f9f68ab862457cb1c755a85f46d0a.png)](https://gyazo.com/798f9f68ab862457cb1c755a85f46d0a)
【右側】
[![Image from Gyazo](https://i.gyazo.com/93cf3a5a5b23106cb97d3b263e5546e5.png)](https://gyazo.com/93cf3a5a5b23106cb97d3b263e5546e5)

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