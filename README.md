# Baseball results management app

It is an application to manage the batting score of baseball.

* Ruby version 2.3.1

* Rails version 5.2.3

## member table
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|score_id|integer||
|team_id|integer||
### Association
- has_many :scores
- belongs_to :group

## game table
|Column|Type|Options|
|------|----|-------|
|game_name|string||
### Association
- has_many :scores

## score table
|Column|Type|Options|
|------|----|-------|
|member_id|integer||
|game_id|integer||
|batting_average|integer||
|plate_appearance|integer||
|at_bat|integer||
|hit|integer||
|runs_batted_in|integer||
|sacrafice|integer||
|walk|integer||
|strikeout|integer||
|stolen_base|integer||
|run|integer||
|home_run|integer||
|on_base_percentage|integer||
### Association
- belongs_to :member
- belongs_to :game

## team table
|Column|Type|Options|
|------|----|-------|
|team_name|||
### Association
- has_many :groups

## group table
|Column|Type|Options|
|------|----|-------|
|group_name|string||
|team_id|integer||
### Association
has_many :members
belongs_to :team
