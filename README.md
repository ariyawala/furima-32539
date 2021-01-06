# テーブル設計

## users table

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| email              | string | null: false                |
| encrypted_password | string | null: false                |
| nickname           | string | null: false , unique: true |
| last_name          | string | null: false                |
| first_name         | string | null: false                |
| last_name_kana     | string | null: false                |
| first_name_kana    | string | null: false                |
| birthday           | date   | null: false                |

### Association

- has_many :items
- has_many :orders
- has_one :detail

## details table

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| age       | string     | null: false       |
| gender_id | integer    | null: false       |
| genre1_id | integer    | null: false       |
| genre2_id | integer    | null: false       |
| genre3_id | integer    | null: false       |
| how_id    | integer    | null: false       |
| user      | references | foreign_key: true |

### Association

- belongs_to :user

## items table

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| item_name          | string     | null: false       |
| item_description   | text       | null: false       |
| price              | integer    | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| prefecture_id      | integer    | null: false       |
| dispatch_timing_id | integer    | null: false       |
| user               | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses table

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| zip           | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |
| phone_no      | string     | null: false       |
| order         | references | foreign_key: true |

### Association

- belongs_to :order

## comments table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
