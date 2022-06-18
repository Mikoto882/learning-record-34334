# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| introduction       | text    |                           |
| grade_id           | integer |                           |

### Association

- has_many :learns
- has_many :comments

## learns テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| title         | string     | null: false       |
| description   | text       |                   |
| subject_id    | integer    | null: false       |
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
