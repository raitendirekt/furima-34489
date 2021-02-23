# テーブル設計

## Users table

| Column           | Type    | Options                           |
| ---------------- | ------- | --------------------------------- |
| nickname         | string  | null: false                       |
| email            | string  | null: false, unique: true         |
| password         | string  | null: false                       |
| family_name      | string  | null: false, Full-width character |
| first_name       | string  | null: false, Full-width character |
| kana_family_name | string  | null: false, Full-width character |
| kana_first_name  | string  | null: false, Full-width character |
| birthday         | integer | null: false                       |

### Association

- has_many :items
- has_many :purchases

## Items table

| Column           | Type    | Options                              |
| ---------------- | ------- | ------------------------------------ |
| name             | string  | null: false, Maximum 40 characters   |
| description      | text    | null: false, Maximum 1000 characters |
| category         | integer | null: false                          |
| condition        | integer | null: false                          |
| bear_shipping    | integer | null: false                          |
| region           | integer | null: false                          |
| shipment_days    | integer | null: false                          |
| price            | integer | null: false                          |


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
| prefecture    | integer    | null: false               |
| city          | string     | null: false               |
| house_number  | string     | null: false               |
| building_name | string     |                           |
| mobile_number | integer    | null: false, unique: true |
| purchase      | references | foreign_key: true         |

### Association
- belongs_to :purchase