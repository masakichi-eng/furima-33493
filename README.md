# README
## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ------------|
| nick-name     | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name-kanji    | string | null: false |
| name-katakana | string | null: false |
| birthday      | string | null: false |

### Association
- has_many :items

## items テーブル

| Column      | Type       | Options     |
| ------------| -----------| ------------|
| seller      | string     | null: false |
| category    | string     | null: false |
| state       | string     | null: false |
| burden      | string     | null: false |
| ship-area   | string     | null: false |
| ship-day    | string     | null: false |
| i-name      | string     | null: false |
| explanation | text       | null: false |
| price       | string     | null: false |
| image       |            |             |
| user        | references |             |

### Association
- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column      | Type       | Options     |
| ------------| -----------| ------------|
| card-number | string     | null: false |
| expiration  | string     | null: false |
| security    | string     | null: false |


### Association
- belongs_to :items
- has_one :shipping

## shipping テーブル

| Column      | Type       | Options     |
| ------------| -----------| ------------|
| seller      | string     | null: false |
| category    | string     | null: false |
| state       | string     | null: false |
| burden      | string     | null: false |
| ship-area   | string     | null: false |
| ship-day    | string     | null: false |


### Association
- belongs_to :purchase