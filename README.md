# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| name               | string              | null: false               |
| mail               | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| first_name         | string              | null: false               |
| first_name_kn      | string              | null: false               |
| last_name          | string              | null: false               |
| last_name_kn       | string              | null: false               |
| birth_id           | integer             | null: false               |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| product                             | text       | null: false                    |
| explanation                         | text       | null: false                    |
| category_id                         | integer    | null: false                    |
| situation_id                        | integer    | null: false                    |
| delivery_charge_id                  | integer    | null: false                    |
| sender_id                           | integer    | null: false                    |
| shipping_id                         | integer    | null: false                    |
| price                               | integer    | null: false                    |
| user                                | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shi_add

## shi_add table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| post_code        | string     | null: false                    |
| prefectures_id   | integer    | null: false                    |
| locality         | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | null: false                    |
| phone            | string     | null: false                    |

### Association

- belong_to :order




