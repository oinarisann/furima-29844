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
| birthday              | string | null: false |


### Association

- has_many :items
- has_many :coments
- has_many :purchases

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| user                 | references | null: false, foreign_key: true |
| product_name         | string     | null: false |
| description_of_items | text       | null: false |
| price                | integer    | null: false |
| category             | integer    | null: false |
| status               | integer    | null: false |
| image                | string     | null: false |
| charges              | integer    | null: false |<!-- 送料の負担 -->
| prefecture           | integer    | null: false |<!-- 都道府県 -->
| shipping_date        | integer    | null: false |<!-- 発送日 -->

### Association

- belongs_to :user
- has_many :comments
- has_many :purchases

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| comment   | text       |                                |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル(購入)

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :addresse

## addresses テーブル(住所)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchases        | references | null: false, foreign_key: true |
| postal_code      | string     | null: false |<!-- 郵便番号 -->
| prefecture       | integer    | null: false |<!-- 都道府県 -->
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     |             |
| telephone_number | string     | null: false |


### Association

- belongs_to :purchase
