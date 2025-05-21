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
usersテーブル
カラム名	             データ型     制約	                        補足
nickname	            string	      null: false	              ユーザー名
email	  　            string	      null: false, unique: true	  Deviseで必須
encrypted_password	    string	      null: false	              Deviseで必須
encrypted_password      string        null: false                 Deviseで自動生成（パスワード）   |
last_name	            string	      null: false	              苗字（全角）
first_name	            string	      null: false	              名前（全角）
last_name_kana          string	      null: false	              苗字カナ（全角カタカナ）
first_name_kana	        string	      null: false	              名前カナ（全角カタカナ）
birthday	            date	      null: false	              生年月日


商品出品機能に必要なテーブル
itemsテーブル
カラム名	             データ型	  制約	　　　　　　　           補足
name	　　            string	　　   null: false	　　　         商品名
description	            text          null: false                 商品説明
category_id             integer       null: false	              ActiveHash
status_id	            integer	      null: false	              ActiveHash（商品の状態）
shipping_fee_id	        integer	      null: false	              ActiveHash（配送料の負担）
area_id	                integer	      null: false	              ActiveHash（発送元地域）
day_id	                integer	      null: false	              ActiveHash（発送までの日数）
price	                integer	      null: false	              販売価格
user	                references	  null: false,                出品者との関連
                                      foreign_key: true	


商品購入機能に必要なテーブル（2つ）
orderテーブル(購入情報)
カラム名	             データ型	   制約	　　　　　　             補足
user	                references	  null: false	　　　　　     購入者
item	                references	  null: false	　　　　　     購入された商品

addressesテーブル(配送先)
カラム名	            データ型	　制約	　　　　　　             補足
order	　　            references	  null: false	　　　         購入情報と紐づく
postal_code             string	　　  ull: false	　　　         郵便番号（例：123-4567）
area_id	                integer	　　  null: false	　　　         ActiveHash（都道府県）
city	　　            string        null: false	　　　         市区町村
street	　　            string        null: false	　　　         番地
building　　            string		　　　　　　　　　              建物名（任意）
phone_number            string        null: false	　　          電話番号


