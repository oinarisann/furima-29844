# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| psaaword_confirmation | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birthday_year         | string | null: false |
| birthday_month        | string | null: false |
| birthday_day          | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| user_id              | references | null: false, foreign_key: true |
| product_name         | string     | null: false |
| description_of_items | string     | null: false |
| price                | integer    | null: false |
| category             | integer    | null: false |
| status               | integer    | null: false |


### Association

- belongs_to :user
- has_many :comments
- has_many :purchases
- has_many :images

## coments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |
| content   | string     |                                |

### Association

- belongs_to :item
- belongs_to :user

## images テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      | string     |                                |
| item_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :item

## purchase テーブル(購入)

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |
| card_number | string     | null: false |
| exp_month   | string     | null: false |
| exp_yaer    | string     | null: false |
| cvc         | string     | null: false |

### Association

- belongs_to :user
- has_many   :addresses

## addresses テーブル(住所)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false |<!-- 郵便番号 -->
| prefecture       | integer    | null: false |<!-- 都道府県 -->
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     |             |
| telephone_number | string     | null: false |
| charges          | integer    | null: false |<!-- 送料の負担 -->
| shipping_date    | integer    | null: false |<!-- 発送日 -->

### Association

- belongs_to :purchase
