# テーブル設計

## users(ユーザー情報） テーブル

| Column             | Type   | Options     
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false, unique: true |


### Association

-has_many :tweets
-has_one :profile


## tweets(投稿情報） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| text               | text       | null: false                    |
| hashtag            | string     | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association
-belongs_to :user
-has_many :comments
-has_many :tags, through: :tweet_users


## favorites(いいね機能)テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :tweet


## profiles(ユーザー詳細情報） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| information        | text       | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

-belongs_to :user


## comments(コメント） テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| tweet              | references | null: false, foreign_key: true |


### Association

-belongs_to :user
-belongs_to :tweet


## tweet_tags テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| tweet              | references | null: false, foreign_key: true |
| tag                | references | null: false, foreign_key: true |


### Association

-belongs_to :tweet
-belongs_to :tag


## tags テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     |                                |


has_many :tweet_tags
has_many :tweets, through: :tweet_tags
