# テーブル設計

## users テーブル

| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| name                 | string | null: false               |
| encrypted_password   | string | null: false               |
| email                | string | null: false, unique: true |
| family_name          | string | null: false               |
| first_name           | string | null: false               |
| family_name_hurigana | string | null: false               |
| first_name_hurigana  | string | null: false               |
| birthday             | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| text                | text       | null: false                    | 
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    | 
| shipping_fee_id     | integer    | null: false                    |
| prefucture_id       | integer    | null: false                    |
| date_of_shipment_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## shipping_addresses テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefucture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    | 
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## purchases テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address