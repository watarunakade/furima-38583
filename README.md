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
| name               | string | null: false |
| kana_name          | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :item
- has_many :comment

## items テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| item_text          | text   | mull: false |
| category           | string | null: false |
| area               | string | null: false |
| postage            | string | null: false |
| send_day           | string | null: false |
| price              | string | null: false |

### Association

- belongs_to :user
- has_many :comment

##comments テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| comment_text       | text   | null: false |

### Association

- belongs_to :user
- belongs_to :item