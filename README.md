# README


* ...
機能：
ユーザー登録
材料登録
製品登録
棚卸し日登録
材料発注計画
生産計画
材料到着情報
生産情報
材料棚卸し結果
製品棚卸し結果

* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false ,unique: true |
| encrypted_password | string | null: false               |




## Material_num テーブル

| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| product_number | string     | null: false                     |
| name           | text       | null: fa0lse                    |


### Association

- has_many :Material_buy
- has_many :Material_plan
- has_many :Material_count
- has_many :Product_num

## Product_num テーブル

| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| product_number  | string     | null: false                     |
| name            | text       | null: false                    |
| material_count  | string     | null: false                    |
| Material_num_id | text       | null: false,foreignkey: true   |


### Association

- belongs_to :Material_num
- has_many   :Prodact_plan
- has_many   :Product_count
- has_many   :Product_make

## count_day テーブル

| Column      | Type       | Options                            |
| ----------- | ---------- | ---------------------------------- |
| inventory_day   | date     | null: false                     |
| inventory_finish| string   | null: false                    |


### Association

- has_many   :Prodact_plan
- has_many   :Product_count
- has_many   :Product_make
- has_many   :Material_plan
- has_many   :Material_count
- has_many   :Material_buy

## Material_count テーブル

| Column          | Type       | Options                         |
| -----------     | ---------- | ------------------------------ |
| count           | string     | null: false                    |
| count_day_id    | string     | null: false,foreignkey: true   |
| Material_num_id | string     | null: false,foreignkey: true   |


### Association

- belongs_to :Material_num
- belongs_to :Count_day

## Product_count テーブル

| Column          | Type       | Options                         |
| -----------     | ---------- | ------------------------------ |
| count           | string     | null: false                    |
| count_day_id    | string     | null: false,foreignkey: true   |
| Product_num_id | string     | null: false,foreignkey: true   |


### Association

- belongs_to :Product_num
- belongs_to :Count_day


## Material_plan テーブル

| Column          | Type       | Options                         |
| -----------     | ---------- | ------------------------------ |
| buy_day         | date       | null: false                    |
| count           | string     | null: false                    |
| count_day_id    | string     | null: false,foreignkey: true   |
| Material_num_id | string     | null: false,foreignkey: true   |


### Association

- belongs_to :Material_num
- belongs_to :Count_day

## Prodact_plan テーブル

| Column          | Type       | Options                         |
| -----------     | ---------- | ------------------------------ |
| buy_day         | date       | null: false                    |
| count           | string     | null: false                    |
| count_day_id    | string     | null: false,foreignkey: true   |
| Product_num_id | string     | null: false,foreignkey: true   |


### Association

- belongs_to :Product_num
- belongs_to :Count_day


## Material_buy テーブル

| Column          | Type       | Options                         |
| -----------     | ---------- | ------------------------------ |
| buy_day         | date       | null: false                    |
| count           | string     | null: false                    |
| count_day_id    | string     | null: false,foreignkey: true   |
| Material_num_id | string     | null: false,foreignkey: true   |


### Association

- belongs_to :Material_num
- belongs_to :Count_day


## Product_make テーブル

| Column          | Type       | Options                         |
| -----------     | ---------- | ------------------------------ |
| buy_day         | date       | null: false                    |
| count           | string     | null: false                    |
| count_day_id    | string     | null: false,foreignkey: true   |
| Product_num_id | string     | null: false,foreignkey: true   |


### Association

- belongs_to :Product_num
- belongs_to :Count_day

* ...