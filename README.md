# README

This README would normally document whatever steps are necessary to get the
application up and running.

# DB 設計

## users table
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| first_name         | string              | null: false             |
| last_name          | string              | null: false             |
| first_name_kana    | string              | null: false             |
| last_name_kana     | string              | null: false             |
| birthday           | date                | null: false             |

### Association

* has_many :items
* has_one : deliver address

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| item_name                           | string     | null: false       |
| explanation                         | string     | null: false       |
| category                            | string     | null: false       |
| condition_id                        | integer    | null: false       |
| delivery_fee_id                     | integer    | null: false       |
| ship_from_location_id               | integer    | null: false       |
| delivery_period_id                  | integer    | null: false       | 
| price                               | integer    | null: false       | 

### Association

* belongs_to :user

## deliver address table
| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| item                                | references | foreign_key: true |
| postal code                         | string     | null: false       |
| prefecture_id                       | integer    | null: false       |
| city                                | string     | null: false       |
| house_number                        | string     | null: false       |
| building_name                       | string    
| telephone                           | string     | unique: true      | 

### Association

* belongs_to :user

## orders table
| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| user                                | references | foreign_key: true |
| item                                | references | foreign_key: true |

### Association

* belongs_to : user
* belongs_to : item


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
