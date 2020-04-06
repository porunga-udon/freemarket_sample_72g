class CardsController < ApplicationController
  def new
    @contents = ["お知らせ","やることリスト","いいね！一覧","出品する","下書き一覧","出品した商品-取引中","出品した商品-取引中","出品した商品-売却済み","購入した商品-取引中","購入した商品-過去の取引","ニュース一覧","評価一覧","ガイド","お問い合わせ"]
    @options = ["プロフィール","発送元・お届先住所変更","支払い方法","メール/パスワード","本人情報","電話番号の確認","ログアウト"]
    
    @bland = ["//pcweb-assets.mercdn.net/assets/img/card/visa.svg?1152353370","//pcweb-assets.mercdn.net/assets/img/card/master-card.svg?1152353370","//pcweb-assets.mercdn.net/assets/img/card/saison-card.svg?1152353370","//pcweb-assets.mercdn.net/assets/img/card/jcb.svg?1152353370","//pcweb-assets.mercdn.net/assets/img/card/american_express.svg?1152353370","//pcweb-assets.mercdn.net/assets/img/card/dinersclub.svg?1152353370","//pcweb-assets.mercdn.net/assets/img/card/discover.svg?1152353370"]
  end
end
