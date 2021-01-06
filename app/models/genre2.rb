class Genre2 < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ファッション' },
    { id: 3, name: '美容・健康' },
    { id: 4, name: 'ライフスタイル' },
    { id: 5, name: '旅行' },
    { id: 6, name: 'グルメ' },
    { id: 7, name: 'スポーツ' },
    { id: 8, name: 'ゲーム' },
    { id: 9, name: '動物' },
    { id: 10, name: '経済' },
    { id: 11, name: 'IT・テクノロジー' },
    { id: 12, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :details
end