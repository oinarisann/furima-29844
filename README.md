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
| birthday              | date   | null: false |


### Association

- has_many :items
- has_many :coments
- has_many :purchases

## items テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| user                 | references | null: false, foreign_key: true |
| name                 | string     | null: false |
| description          | text       | null: false |
| price                | integer    | null: false |
| category_id          | integer    | null: false |
| status_id            | integer    | null: false |
| charges_id           | integer    | null: false |<!-- 送料の負担 -->
| prefecture_id        | integer    | null: false |<!-- 都道府県 -->
| shipping_date_id     | integer    | null: false |<!-- 発送までの日数 -->

### Association

- belongs_to :user
- has_one :comment
- has_one :purchase

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
- has_one    :address

## addresses テーブル(住所)

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| purchase         | references | null: false, foreign_key: true |
| postal_code      | string     | null: false |<!-- 郵便番号 -->
| prefecture_id    | integer    | null: false |<!-- 都道府県 -->
| city             | string     | null: false |
| house_number     | string     | null: false |
| building_name    | string     |             |
| telephone_number | string     | null: false |


### Association

- belongs_to :purchase
