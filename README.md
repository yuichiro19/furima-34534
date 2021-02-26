# テーブル設計

## users テーブル

| Column     | Type      | Options     |
| ---------- | --------- | ----------- |
| name       | string    | null: false |
| password   | string    | null: false |
| email      | string    | null: false |
| real_name  | string    | null: false |
| hurigana   | string    | null: false |
| birthday   | integer   | null: false |

### Association

- has_many :items
- has_many :credit_cards
- has_many :shipping_addresses
- has_many :purchase_datas

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| text             | text       | null: false                    | 
| image            |            |                                |
| price            | integer    | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| area             | string     | null: false                    |
| date_of_shipment | string     | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase-data

## credit_cards テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| card_number          | integer    | null: false                    | 
| cvc                  | integer    | null: false                    | 
| card_expiration_date | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many purchase_datas

## shipping_addresses テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| address | string     | null: false                    | 
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase_datas

## purchase_datas テーブル
| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |
| credit_card      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address
- belongs_to :credit_card