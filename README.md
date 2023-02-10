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

| Column             | Type   | Options                       |
| ------------------ | ------ | -----------                   |
| nickname           | string | null: false                   |
| email              | string | null: false, uniqueness: true |
| encrypted_password | string | null: false                   |
| family_name        | string | null: false                   |
| first_name         | string | null: false                   |
| kana_family_name   | string | null: false                   |
| kana_first_name    | string | null: false                   |
| birthday           | date   | null: false                   |

### Association

- has_many :items
- has_many :purchases

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
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| -----------                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| -----------                    |
| post_code          | string     | null: false                    |
| city_id            | integer    | null: false                    |
| address            | string     | null: false                    |
| address_number     | string     | null: false                    |
| building           | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase