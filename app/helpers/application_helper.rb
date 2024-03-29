module ApplicationHelper
  def default_meta_tags
    {
      site: 'PhonicsTrainer',
      title: '英語の音とスペルを学習するサービス',
      reverse: true,
      charset: 'utf-8',
      description: 'PhonicsTrainerを通して、英語の音とスペルの繋がりに気付き、英語学習を楽しもう！',
      keywords: '英語、英語学習、フォニックス',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'), # 配置するパスやファイル名によって変更すること
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end
end
