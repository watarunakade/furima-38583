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

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| kana_family_name   | string | null: false |
| kana_first_name    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :addressees

## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| item_name          | string     | null: false                    |
| item_text          | text       | mull: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| area_id            | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| send_day_id        | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :purchase

## purchaseテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| -----------                    |
| item_id            | references | null: false, foreign_key: true |
| addressee_id       | references | null: false, foreign_key: true |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :addressee

## addresseeテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| -----------                    |
| address            | text       | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |
| purchase_id        | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one    :purchase