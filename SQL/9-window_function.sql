-- https://sqlzoo.net/wiki/Window_functions
-- TODO: 第4题
-- 1.
select
    lastName,
    party,
    votes
from
    ge
where
    constituency = 'S14000024'
    and yr = 2017
order by
    votes desc;

-- 2.
-- rank() over
select
    party,
    votes,
    rank() over (
        order by
            votes desc
    ) as posn
from
    ge
where
    constituency = 'S14000024'
    and yr = 2017
order by
    party;

-- 3.
-- partition by
select
    yr,
    party,
    votes,
    rank() over (
        partition by yr
        order by
            votes desc
    ) as posn
from
    ge
where
    constituency = 'S14000021';

-- 4.
-- TODO: rank() 和order by的运行顺序是什么样的，为什么order by可以根据rank出来的字段进行排序
select
    constituency,
    party,
    votes,
    rank() over(
        partition by constituency
        order by
            votes desc
    ) as posn
from
    ge
where
    constituency between 'S14000021'
    and 'S14000026'
    and yr = 2017
order by
    posn,
    constituency;

-- 5.
-- 子查询这里要给表一个名字不然会报错
select
    constituency,
    party
from
    (
        select
            constituency,
            party,
            votes,
            rank() over(
                partition by constituency
                order by
                    votes desc
            ) as posn
        from
            ge
        where
            constituency between 'S14000021'
            and 'S14000026'
            and yr = 2017
    ) temp
where
    posn = 1;

-- 6.
select
    party,
    count(constituency)
from
    (
        select
            constituency,
            party,
            votes,
            rank() over(
                partition by constituency
                order by
                    votes desc
            ) as posn
        from
            ge
        where
            left(constituency,1) = 'S'
            and yr = 2017
    ) temp
where
    posn = 1
group by
    party;