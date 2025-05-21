# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
ユーザー管理機能に必要なテーブル
## items テーブル

| Column           | Type       | Options                        | Description                 |
|------------------|------------|---------------------------------|-----------------------------|
| name             | string     | null: false                    | 商品名                      |
| description      | text       | null: false                    | 商品説明                    |
| category_id      | integer    | null: false                    | カテゴリー（ActiveHash）    |
| status_id        | integer    | null: false                    | 商品の状態（ActiveHash）    |
| shipping_fee_id  | integer    | null: false                    | 配送料負担（ActiveHash）    |
| area_id          | integer    | null: false                    | 発送元地域（ActiveHash）    |
| day_id           | integer    | null: false                    | 発送までの日数（ActiveHash）|
| price            | integer    | null: false                    | 販売価格                    |
| user             | references | null: false, foreign_key: true | 出品者（ユーザー）          |

### Association

- belongs_to :user  
- has_one :order


商品出品機能に必要なテーブル
## items テーブル

| Column           | Type       | Options                        | Description                 |
|------------------|------------|---------------------------------|-----------------------------|
| name             | string     | null: false                    | 商品名                      |
| description      | text       | null: false                    | 商品説明                    |
| category_id      | integer    | null: false                    | カテゴリー（ActiveHash）    |
| status_id        | integer    | null: false                    | 商品の状態（ActiveHash）    |
| shipping_fee_id  | integer    | null: false                    | 配送料負担（ActiveHash）    |
| area_id          | integer    | null: false                    | 発送元地域（ActiveHash）    |
| day_id           | integer    | null: false                    | 発送までの日数（ActiveHash）|
| price            | integer    | null: false                    | 販売価格                    |
| user             | references | null: false, foreign_key: true | 出品者（ユーザー）          |

### Association

- belongs_to :user  
- has_one :order

商品購入機能に必要なテーブル（2つ）
## orders テーブル

| Column | Type       | Options                        | Description      |
|--------|------------|---------------------------------|------------------|
| user   | references | null: false, foreign_key: true | 購入者（ユーザー）|
| item   | references | null: false, foreign_key: true | 購入された商品    |

### Association

- belongs_to :user  
- belongs_to :item  
- has_one :address

addressesテーブル(配送先)
## addresses テーブル

| Column        | Type       | Options                        | Description           |
|---------------|------------|---------------------------------|-----------------------|
| order         | references | null: false, foreign_key: true | 紐づく購入情報        |
| postal_code   | string     | null: false                    | 郵便番号（例:123-4567）|
| area_id       | integer    | null: false                    | 都道府県（ActiveHash） |
| city          | string     | null: false                    | 市区町村              |
| street        | string     | null: false                    | 番地                  |
| building      | string     |                                | 建物名（任意）        |
| phone_number  | string     | null: false                    | 電話番号              |

### Association

- belongs_to :order

