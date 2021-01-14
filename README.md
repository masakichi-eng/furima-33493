# README
## users テーブル

| Column             | Type   | Options                   |
| -------------------| ------ | --------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| sei_kanji          | string | null: false               |
| mei_kanji          | string | null: false               |
| sei_katakana       | string | null: false               |
| mei_katakana       | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column        | Type       | Options          |
| --------------| -----------| -----------------|
| category_id   | integer    | null: false      |
| state_id      | integer    | null: false      |
| burden_id     | integer    | null: false      |
| prefecture_id | integer    | null: false      |
| ship_day_id   | integer    | null: false      |
| name          | string     | null: false      |
| explanation   | text       | null: false      |
| price         | integer    | null: false      |
| user          | references | foreign_key true |

### Association
- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column  | Type       | Options         |
| --------| -----------| ----------------|
| user    | references |foreign_key true |
| item    | references |foreign_key true |



### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column        | Type       | Options         |
| --------------| -----------| ----------------|
| postal        | string     | null: false     |
| prefecture_id | integer    | null: false     |
| city          | string     | null: false     |
| address       | string     | null: false     |
| building      | string     |                 |
| phone_number  | string     | null: false     |
| purchase      | references |foreign_key true |


### Association
- belongs_to :purchase
