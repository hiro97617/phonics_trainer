# README
# phonics_trainer
■ サービス概要
スペルが苦手な人や英語初学者に
スペルのルールや英語の音を分かりやすく教えゲーム感覚で学べる
英語学習ツールです。

■　　メインのターゲットユーザー
スペル習いたてor苦手な英語学習者(特に小学生や中学生)
彼らにスペルを教えるのに苦労している先生方や勉強を見る保護者の方


■　　ユーザーが抱える課題
英語を学ぶときに苦労するものの１つがスペルを覚えること。
ここで躓き英語が嫌いになることが多々ある。
たとえ躓かなくても、覚えるのに多くの時間を費やすケースもある。
これに対する手立てが「大量に書く」や「気合い」ぐらいしかない。
文部科学省が発行する学習指導要領には以下のように書いてある。
日本語と英語の音声の特徴や違いに気付かせることに十分留意する必要がある
中学校の外国語科において，発音と綴りを関連付けて指導することとしている。
発音と綴つづりとを関連付けて指導すること。(中学校の学習指導要領より)
上記のように書いてあり発音と綴りの関連性や英語の音の指導は必要とされているが、先生方は学んできたわけだはないのでその指導部分に苦労することが予想される。


■　　解決方法
英検１級に合格して実際に高等学校で教鞭をとっていた元英語教員エンジニアがフォニックスやフォニミックスに関するアプリを提供することで、学習者は英語の音やスペルを楽しく覚えられ、先生方は音や発音の指導を導入できるハードルを低下させられる。

■　　実装機能（以下の例は実際のアプリの機能から一部省略しています）
【現時点】
  - 学習者の機能
　　・phonicsの問題を解ける
　　・ログイン機能(ID/password, twitter認証)
  - 管理者の機能
　　・問題の作成や、レッスン・おすすめ動画の埋め込みができる
　　・ユーザーの削除、編集、一覧機能
  - 学習者の機能
    .phonicsに関するオススメ動画やレッスンを提供する機能
    .ログイン機能
    ・問題を解き、結果をツイッターでシェアできる機能
    .ユーザーレベルと経験値の機能
    .ダッシュボードのデザインを改良
【今後、実装予定の機能】
  - レコメンド問題機能
  - ユーザーの正誤判定結果を収集する機能
  - 団体登録(塾や英会話学校などのスクール向き)
　　・代表者は講師(教師)の登録、生徒の登録ができる
　　・代表者はクラスの登録ができる
　　・代表者と講師は、生徒の学習状況を閲覧できる
　　・代表者と講師は、全体の正答率や点双列相関係数(得意な人と苦手な人の差が出る問題)のデータに基づき、生徒の正誤を分析できる。→授業や復習・フィードバックに役に立てるため。


■　　なぜこのサービスを作りたいのか？

生徒を見て、スペルに苦しむ高校生や必死に何度も書いて覚える生徒を見て、早い段階でスペルや音のことを学べばもっと楽になるのにって思ってた。
幸いにも僕や僕の弟は小さい頃に英会話教室で、音や音とスペルのつながりに関してレッスンを受けられたため、英語で苦労せず更に英語が好きになったり、他の勉強などに費やすことができた。
もし僕の見ていた生徒が僕たちの学んだようなことを勉強していたら、変わったかもしれないと思うと、もっと早くに広めたいなと思う。
更に、これは生徒だけではなく、教壇に立っている先生や保護者・講師などに伝わるのも生徒と伝わるのと同様に大切なことだと思う。
文部科学省の学習指導要領が改定されるているが、現実問題として、現場の教員はキャッチアップできないほど多忙している。または、そのような情報にアクセスできないのが現状だ。このように苦しむ生徒や先生方の力になれればなと思う！
これができたら、学習指導要領のような指導や学びの個別化を達成でき、真の意味で寄り添った教育につながる。

■　　スケジュール
企画〜技術調査：3/19 〆切
README〜ER図作成：4/15 〆切
企画・実装：4/17 ~ 5/31
MVP: 5/31 〆切
本リリース: 6/17


■　　画面遷移

https://www.figma.com/file/ks9280BDkcYQmVqpAGgWLh/phonics_trainer?node-id=0%3A1&t=EUyt1NO3Qn6voRZM-1

![ER図](https://i.gyazo.com/245aa2ef6d2ab954eae80d05ff9a5cbe.png)