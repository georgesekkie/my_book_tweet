class Scraping
  # ■MyBookTweetを完成させよう！
  # スクレイピングを利用し、あたかも自分が本のタイトルと画像を投稿したように見せるMyBookTweetを作成していただきます
  # ①bookmeterのページを1〜100ページまで取得(https://bookmeter.com/books/1 ~ https://bookmeter.com/books/100)
  # ②それぞれ取得したページをタイトルを→textカラムへ、画像を→imageへ保存する
  # ③同じ情報が入った場合は弾くようにする
  # ④100ページまで情報を取得したらこの全体の処理を終了する

  def self.get_tweet
    next_num = "1"
    while true do
      agent = Mechanize.new

      # ①linkに個々の本のページURLを代入する
      link = "https://bookmeter.com/books/"

      page = agent.get(link)
      # ②ページからタイトル・画像をtext, imageという変数に代入する
      # ヒント1: page.at()を使用する
      # ヒント2: テキストをとりたい場合は「.inner_text」、画像URLをとりたい場合は「[:src]」を利用する

      tweet = Tweet.where(text: text).first_or_initialize

      # ③同じ情報が入った場合は弾くようにする
      # ヒント: first_or_initializeメソッドを使用しましょう

      tweet.text = text
      tweet.image = image
      tweet.user_id = 1
      tweet.save
      # ④100ページまで情報を取得したらこの全体の処理を終了する
      break if もし100ページまで情報を取得したらという条件を書く
      next_num = (next_num.to_i + 1).to_s
    end
  end
end
