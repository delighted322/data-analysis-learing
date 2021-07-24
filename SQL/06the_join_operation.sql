-- https://sqlzoo.net/wiki/The_JOIN_operation
-- TODO: 11题 13题
-- DONE
-- 1.
select
    matchid,
    player
from
    goal
where
    teamid = 'GER';

-- 2.
select
    id,
    stadium,
    team1,
    team2
from
    game
where
    id = 1012;

-- 3.
-- join on
select
    player,
    teamid,
    stadium,
    mdate
from
    goal
    join game on game.id = goal.matchid
where
    teamid = 'GER';

-- 4.
-- Show the team1, team2 and player for 
-- every goal scored by a player called 
-- Mario player LIKE 'Mario%'
select
    team1,
    team2,
    player
from
    game
    join goal on game.id = goal.matchid
where
    player like 'Mario%' -- 5.
    -- Show player, teamid, coach, gtime 
    -- for all goals scored in the first 
    -- 10 minutes gtime<=10
select
    player,
    teamid,
    coach,
    gtime
from
    goal
    join eteam on goal.teamid = eteam.id
where
    gtime <= 10;

-- 6.
-- List the dates of the matches 
-- and the name of the team in which 
-- 'Fernando Santos' was the team1 coach.
select
    mdate,
    teamname
from
    game
    join eteam on game.team1 = eteam.id
where
    coach = 'Fernando Santos';

-- 7.
-- List the player for every goal scored 
-- in a game where the stadium was 
-- 'National Stadium, Warsaw'
select
    player
from
    goal
    join game on game.id = goal.matchid
where
    game.stadium = 'National Stadium, Warsaw';

-- 8.
-- show the name of all players who 
-- scored a goal against Germany.
select
    distinct player
from
    goal
    join game on game.id = goal.matchid
where
    goal.teamid <> 'GER'
    and (
        game.team1 = 'GER'
        or game.team2 = 'GER'
    );

-- 9.
-- Show teamname and the total number 
-- of goals scored.
select
    teamname,
    count(player)
from
    eteam
    join goal on goal.teamid = eteam.id
group by
    teamname;

-- 10.
-- Show the stadium and the number of 
-- goals scored in each stadium.
select
    stadium,
    count(player)
from
    goal
    join game on game.id = goal.matchid
group by
    stadium;

-- 11.******
-- TODO: 再看看
-- For every match involving 'POL', 
-- show the matchid, date and the number 
-- of goals scored.
select
    id,
    mdate,
    count(player)
from
    game
    join goal on game.id = goal.matchid
where
    team1 = 'POL'
    or team2 = 'POL'
group by
    id,
    mdate;

-- 12.
-- For every match where 'GER' scored, 
-- show matchid, match date and the number 
-- of goals scored by 'GER'
select
    id,
    mdate,
    count(player)
from
    game
    join goal on game.id = goal.matchid
where
    teamid = 'GER'
group by
    id,
    mdate;

-- 13.
-- TODO: 再练一下
-- case when
-- 要注意0比0的情况
-- 左链接 保留左侧表格的所有数据 右侧表格没有的值会显示为null
select
    mdate,
    team1,
    sum(
        case
            when teamid = team1 then 1
            else 0
        end
    ) as score1,
    team2,
    sum(
        case
            when teamid = team2 then 1
            else 0
        end
    ) as score2
from
    game
    left join goal on game.id = goal.matchid
group by
    mdate,
    matchid,
    team1,
    team2;