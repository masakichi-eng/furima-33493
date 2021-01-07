# README
## users テーブル

| Column             | Type   | Options     |
| -------------------| ------ | ------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| sei_kanji          | string | null: false |
| mei_kanji          | string | null: false |
| sei_katakana       | string | null: false |
| mei_katakana       | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options          |
| --------------| -----------| -----------------|
| seller        | string     | null: false      |
| category_id   | integer    | null: false      |
| state_id      | integer    | null: false      |
| burden_id     | integer    | null: false      |
| prefecture_id | integer    | null: false      |
| ship-day_id   | integer    | null: false      |
| i_name        | string     | null: false      |
| explanation   | text       | null: false      |
| price         | integer    | null: false      |
| image         | image      | null: false      |
| user_id       | references | foreign_key true |

### Association
- belongs_to :user
- has_many :purchases

## purchase テーブル

| Column  | Type       | Options         |
| --------| -----------| ----------------|
| user_id | references |foreign_key true |
| item_id | references |foreign_key true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column        | Type    | Options     |
| --------------| --------| ------------|
| postal        | integer | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building      | string  |             |
| phone_number  | string  | null: false |



### Association
- belongs_to :purchase