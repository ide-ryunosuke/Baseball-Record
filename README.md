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
|plate_appearance|integer|default: 0|     <!-- 打席数 -->
|at_bat|integer|default: 0|               <!-- 打数 -->
|hit|integer|default: 0|                  <!-- 安打 -->
|runs_batted_in|integer|default: 0|       <!-- 打点 -->
|sacrafice|integer|default: 0|            <!-- 犠打 -->
|walk|integer|default: 0|                 <!-- 四死球 -->
|strikeout|integer|default: 0|            <!-- 三振 -->
|stolen_base|integer|default: 0|          <!-- 盗塁 -->
|run|integer|default: 0|                  <!-- 得点 -->
|home_run|integer|default: 0|             <!-- 本塁打 -->
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
