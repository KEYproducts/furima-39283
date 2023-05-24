# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :items
- has_many :orders
- has_one :profile

## profiles テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| birth_year      | integer    | null: false                    |
| birth_month     | integer    | null: false                    |
| birth_day       | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| shipping_fee    | integer    | null: false                    |
| shipping_origin | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order
- has_one_attached :image

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | string     | null: false                    |
| prefecture  | integer    | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     | null: false                    |
| telephone   | integer    | null: false                    |
| order       | references | null: false, foreign_key: true |

### Association
- belongs_to :order