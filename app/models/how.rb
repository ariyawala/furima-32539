class How < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'テレビ、ラジオや新聞等の宣伝' },
    { id: 3, name: 'インターネット検索結果' },
    { id: 4, name: 'インターネット上の広告' },
    { id: 5, name: 'ソーシャルネットワーク' },
    { id: 6, name: 'イベント' },
    { id: 7, name: '知人、友人からの紹介' },
    { id: 8, name: '以前に利用した' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :details
end
