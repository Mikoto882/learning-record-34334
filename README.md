# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association

- has_many :learns
- has_many :comments
- has_one :profile

## learns テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| description   | text       |                   |
| subject       | integer    | null: false       |
| study_hour    | string     |                   |
| study_minutes | string     |                   |
| user          | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| content | text       | null: false       |
| user    | references | foreign_key: true |
| learn   | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :learn

## profiles テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| introduction | text       |                   |
| grade        | integer    |                   |
| user         | references | foreign_key: true |

### Association

- belongs_to :user
