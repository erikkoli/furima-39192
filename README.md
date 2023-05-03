# テーブル設計

## users テーブル

| Column                | Type    | Options                   |
| --------------------- | ------- | ------------------------- |
| nickname              | string  | null: false, unique: true |
| last_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name_kana        | string  | null: false               |
| first_name_kana       | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| birthday              | date    | null: false               |

has_many :exhibits
has_many :purchases

## exhibits テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product      | string     | null: false                    |
| explain      | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| prefecture_id| integer    | null: false                    |
| shipment_id  | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

belongs_to :user
has_one :purchase

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| exhibit  | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :exhibit
has_one :address

## addresses テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| post_code     | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city          | string     | null: false                     |
| house_number  | string     | null: false                     |
| building      | string     |                                 |
| phone_number  | string     | null: false, limit:11           |
| purchase      | references | null: false, foreign_key: true  |

belongs_to :purchase