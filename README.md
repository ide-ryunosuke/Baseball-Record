# Baseball results management app

It is an application to manage the batting score of baseball.

* Ruby version 2.3.1

* Rails version 5.2.3

## users table
|Column|Type|Options|
|------|----|-------|
|name|string|index :true, null :false, unique :true|
|email|string|null :false|
### Association
- has_many :teams
- has_many :members
- has_many :scores
- has_many :groups

## members table
|Column|Type|Options|
|------|----|-------|
|nickname|string||
|team_id|integer||
|user_id|integer||
|group_id|integer||
### Association
- has_many :scores, dependent: :destroy
- belongs_to :group
- belongs_to :user
- belongs_to :team

## scores table
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|member_id|integer||
|batting_average|integer|default: 0|
|plate_appearance|integer|default: 0|
|at_bat|integer|default: 0|
|hit|integer|default: 0|
|runs_batted_in|integer|default: 0|
|sacrafice|integer|default: 0|
|walk|integer|default: 0|
|strikeout|integer|default: 0|
|stolen_base|integer|default: 0|
|run|integer|default: 0|
|home_run|integer|default: 0|
|on_base_percentage|integer|default: 0|
### Association
- belongs_to :member
- belongs_to :user

## teams table
|Column|Type|Options|
|------|----|-------|
|user_id|integer||
|team_name|string|null: false|
### Association
- has_many :groups, dependent: :destroy
- belongs_to :user

## groups table
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false|
|team_id|integer||
|user_id|integer||
### Association
- has_many :members, dependent: :destroy
- belongs_to :team
- belongs_to :user
