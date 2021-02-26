# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| encrypted_password   | string | null: false |
| email                | string | null: false |
| real_family_name     | string | null: false |
| real_first_name      | string | null: false |
| family_name_hurigana | string | null: false |
| first_name_hurigana  | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :shipping_addresses
- has_many :purchase_datas

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| text             | text       | null: false                    | 
| price            | integer    | null: false                    |
| category         | string     | null: false                    |
| status           | integer    | null: false                    | 
| shipping_fee     | integer    | null: false                    |
| area             | integer    | null: false                    |
| date_of_shipment | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_data

## shipping_addresses テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | integer    | null: false                    |
| prefucture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    | 
| building     | string     |                                |
| phone_number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase_datas

## purchase_datas テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item