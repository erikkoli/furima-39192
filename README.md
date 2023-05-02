# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |
| birth_year_id      | integer | null: false               |
| birth_month_id     | integer | null: false               |
| birth_day_id       | integer | null: false               |

## exhibits テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product      | string     | null: false                    |
| explain      | text       | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| postage_id   | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| days_id      | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

## purchases テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| exhibit  | references | null: false, foreign_key: true |

## addresses テーブル

| Column        | Type       | Options                         |
| ------------- | ---------- | ------------------------------- |
| post_code     | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city          | string     | null: false                     |
| house_number  | string     | null: false                     |
| building      | string     |                                 |
| phone_number  | string     | null: false, limit:11           |
| user          | references | null: false, foreign_key: true  |