# テーブル設計

## Users table

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| kana_family_name   | string  | null: false               |
| kana_first_name    | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## Items table

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| condition_id     | integer    | null: false       |
| bear_shipping_id | integer    | null: false       |
| prefecture_id    | integer    | null: false       |
| shipment_day_id  | integer    | null: false       |
| price            | integer    | null: false       |
| user             | references | foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchase

## Purchases table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## Addresses table

| Column        | Type       | Options                   |
| ------------- | ---------- | ------------------------- |
| postal_code   | integer    | null: false               |
| prefecture_id | integer    | null: false               |
| city          | string     | null: false               |
| house_number  | string     | null: false               |
| building_name | string     |                           |
| mobile_number | integer    | null: false, unique: true |
| purchase      | references | foreign_key: true         |

### Association
- belongs_to :purchase