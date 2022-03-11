# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| nickname           | string | null: false, unique: true |
| email              | string | null: false               |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| info               | text       | null: false                    |
| category           | string     | null: false                    |
| status             | string     | null: false                    |
| shipping_fee       | string     | null: false                    |
| prefecture         | string     | null: false                    |
| scheduled          | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| order              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : order 

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | string     | null: false                    |
| month              | date       | null: false                    |
| year               | date       | null: false                    |
| cvc                | string     | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| addresses          | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item