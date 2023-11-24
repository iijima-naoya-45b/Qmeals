# 時短レシピアプリ「Qmeals」の概要

## サービスURL
https://qmeals-app.onrender.com/

## ◼︎サービスの概要
「時短」「手軽」をモットーとしたレシピアプリです。<br>

## ◼︎サービスに込めた想い
本サービスを作成するにあたって、自身の2つの体験をもとに、アプリの着想を得ました。<br>

`1.一部の食材を使い切ることができない。`<br>
`2.時間短縮で料理を作りたい。`<br>

本アプリでは、上記のギャップを解消し、「料理の楽しさ・奥深さ」を体験できることを第一に考えました。<br>

また、本アプリと既存レシピアプリとの主な差別化として、下記を意識しました。<br>
`・買い物リスト`<br>
`・レシピから直接買うものを追加できる`<br>
`・料理の知恵を共有する掲示板`<br>
これらの`既存アプリにはない機能`を意識して実装し、`普段料理しないユーザーの獲得`に注力しました。

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
| レシピの検索機能 | 料理の知恵袋の検索機能 |
| --- | --- |
[![レシピの検索機能](https://i.gyazo.com/9dc25b140975db0974e9abc692c9750c.gif)](https://gyazo.com/9dc25b140975db0974e9abc692c9750c)| [![料理の知恵袋](https://i.gyazo.com/c36b70774e4307c71219a0d0ed4fced2.gif)](https://gyazo.com/c36b70774e4307c71219a0d0ed4fced2)
| レシピのお気に入り機能 | 料理の知恵袋のお気に入り機能 |
| [![お気に入り機能](https://i.gyazo.com/91e106ce34876e8b85bd71c2eef41407.gif)](https://gyazo.com/91e106ce34876e8b85bd71c2eef41407) | [![料理の知恵袋のお気に入り機能](https://i.gyazo.com/a811c80433836ceb118cf28a864c04a9.gif)](https://gyazo.com/a811c80433836ceb118cf28a864c04a9)
| レシピのコメント機能 | 料理の知恵袋のコメント機能 |
[![レシピのコメント機能](https://i.gyazo.com/4e1642f9a3865988a543abecda3ae4ad.gif)](https://gyazo.com/4e1642f9a3865988a543abecda3ae4ad)|[![料理の知恵袋の投稿機能](https://i.gyazo.com/b3fdf1553503fbad712d3e574d1c6855.gif)](https://gyazo.com/b3fdf1553503fbad712d3e574d1c6855)
| レシピの投稿機能 | 海外のレシピ検索機能① |
[![Image from Gyazo](https://i.gyazo.com/46fd543ef883857ab69474ed390d06d3.gif)](https://gyazo.com/46fd543ef883857ab69474ed390d06d3)| [![レシピ検索機能](https://i.gyazo.com/f1f3becda4d423b39d51ebd96a24b973.gif)](https://gyazo.com/f1f3becda4d423b39d51ebd96a24b973) |
| 海外のレシピ検索機能② | 海外のレシピ検索機能③ |
[![海外のレシピ検索機能②](https://i.gyazo.com/f84877a777960c3707d5cfe91ea37e07.gif)](https://gyazo.com/f84877a777960c3707d5cfe91ea37e07)|[![海外のレシピ検索機能③](https://i.gyazo.com/0392a2078a4a7fd86ab934082ca9fbb4.gif)](https://gyazo.com/0392a2078a4a7fd86ab934082ca9fbb4)
| お買い物リストに登録 |　レシピからお買い物リストに登録 |
[![お買い物リストに登録](https://i.gyazo.com/595d236d79c447fd0ec0020229aa3e1c.gif)](https://gyazo.com/595d236d79c447fd0ec0020229aa3e1c)|[![レシピからお買い物リストに登録](https://i.gyazo.com/c1815d9ba20b5bb400c9ee2e28c3afbe.gif)](https://gyazo.com/c1815d9ba20b5bb400c9ee2e28c3afbe)

# 作業する上で気をつけたポイント
・テーブル数や必要な機能が多く、コードの量が膨れてしまい管理が大変であること、工数管理が煩雑になることを認識していました。<br>この課題に対処するために、以下のポイントに重点を置いて機能を実装しました。<br>

### 1.スモールステップでの開発作業
機能ごとに小さなステップで開発を進め、段階的な実装を心がけました。<br>これにより、大規模なコードベースの管理や変更が必要な場合でも、問題を早期に発見しやすくなりました。

### 2.コードの可読性
コードの複雑性が増す中で、可読性を重視しました。<br>明確な変数名、メソッドの抽象化、そしてコメントの活用により、コードの理解が容易になるよう心がけました。

### 3.技術選定と実装の容易性
技術選定の際には、実装が容易でありながらも理解しやすいものを選択しました。<br>これにより、開発効率を向上させつつ、チームメンバー間での共通理解を促進しました。

### 4.DRY原則に基づく処理の共通化
同様の処理が複数箇所で行われる場合、DRY原則に基づいて共通のメソッドやモジュールにまとめ、コードの重複を避けました。<br>これにより、保守性を向上させました。

### 5.工数管理の徹底
並行してプロジェクト全体を管理していたため、工数管理に特に注意を払いました。<br>`Issue管理`を徹底し、進捗や問題点を明確にし、両プロジェクト全体の透明性を確保しました。<br>

※上記PjのGitHub及び、Linkは下記。<br>
URL: https://loguma.onrender.com/ <br>
Github: https://github.com/kucyaman/team_project

# ◼︎こだわりポイント

## ◼︎機能について<br>
### 1.海外レシピの検索機能<br>
課題: `EdamamsAPI`を使用した海外のレシピ検索時に、`日本語検索非対応`、`タイトルが英語で返却される`、`英語での遷移`などの問題が生じました。<br>
対策: `DeepL翻訳API`を活用して、海外APIとのギャップを埋め、ユーザーフレンドリーな設計を追求しました。UIでは海外のレシピを`カード形式`で表示し、海外の雰囲気を演出しました。<br>

### 2.メインの投稿機能<br>
課題: 投稿フォームで`6つのテーブル`に対して更新をかける必要があり、開発の複雑性化すること・保守性が低くなることを懸念しました。<br>
対策: `form-object`を導入し、`Viewの可読性`、`modelの責務をformで明示`しました。<br>その他accepts_nested_attributes_forを検討しましたが、こちらの方法は非推奨であったこと、改修時のコストがform-objectことを吟味し前者を選択しました。<br>
その他: お気に入りやコメント機能などのAjax化にはRails7系のHotwireを利用し、JavaScriptを使用せずに実装。機能数が多いため、工数を短縮できる前者を採用しました。<br>

## ◼︎UIについて<br>
レシピ系のアプリであるため、食欲を促進させるカラーを主軸に考えました。<br>初めは3台栄養バランスをイメージカラーとして考えましたが、第三者のフィードバックを受けて色の変更を行いました。<br>温かみのある色を使用し、既存アプリで共通している色を取り入れ、UIの向上に努めました。

## ◼︎テーブルについて<br>
メインの投稿機能のテーブル数が増加したため、似た構成の部分に関しては画面構成やカラム名を統一し、viewのテンプレートを使い回すことで、実装の作業負荷を軽減しました。<br>

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

## 画面遷移図
https://www.figma.com/file/TQS7LWbK0NfAG8z4oiTpoJ/MVP%E3%80%90%E7%94%BB%E9%9D%A2%E8%A8%AD%E8%A8%88%E5%9B%B3%E3%80%91?type=design&node-id=0-1&mode=design&t=IYLgSD2NiqYko7xC-0

## インフラ構成図
[![インフラ構成図](https://i.gyazo.com/53b3eda9563c47ebfc2b5e798eb310ec.png)](https://gyazo.com/53b3eda9563c47ebfc2b5e798eb310ec)

## ◼︎ER図
【左側】
[![Image from Gyazo](https://i.gyazo.com/798f9f68ab862457cb1c755a85f46d0a.png)](https://gyazo.com/798f9f68ab862457cb1c755a85f46d0a)
【右側】
[![Image from Gyazo](https://i.gyazo.com/93cf3a5a5b23106cb97d3b263e5546e5.png)](https://gyazo.com/93cf3a5a5b23106cb97d3b263e5546e5)

## ◼︎今後の展望について
1.Rspec<br>
スピードを重視し、目検証の部分のテストコードを充実させ、アプリの品質を確保します。Rspecを活用して、機能の正確性や安定性をテストすることで、ユーザーエクスペリエンスを向上させます。

2.管理画面の作成<br>
今後は管理画面も整備し、効果的な運用が可能な状態を目指します。管理画面を通じてデータの管理や分析を行いやすくすることで、運営効率を向上させます。

3.Raty機能<br>
食べログのような評価機能を導入し、ユーザーからの評価を受けやすい機能を提供します。Raty機能を組み込むことで、ユーザーコミュニケーションを促進し、アプリの人気向上を図ります。

4.その他UX<br>
アップロードなどの処理が重くなる場合に備えて、パフォーマンスの改善に注力します。ユーザーエクスペリエンス向上のため、快適な操作環境を提供することが目標です。

これらの展望を実現するために、迅速で効果的な開発プロセスやテスト手法を導入し、ユーザーとのコミュニケーションを大切にしながら、アプリの継続的な改善を進めていく予定です。

## ◼︎環境構築
※dockerを使用した環境構築ですが、EdamamsAPIやDeepLなどのキー情報は`.env`で管理しておりますのでClone時に想定しないerrorを可能性があります。ご容赦ください。

1.Dockerを使った環境構築<br>
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
