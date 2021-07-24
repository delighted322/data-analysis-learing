-- https://sqlzoo.net/wiki/Window_LAG
-- TODO: 第4题
-- 1.
-- day(),month()
select
    name,
    day(whn),
    confirmed,
    deaths,
    recovered
from
    covid
where
    name = 'Spain'
    and month(whn) = 3
order by
    whn;

-- 2.
-- lag() 必须和over一起用
select
    name,
    day(whn),
    confirmed,
    lag(confirmed, 1) over (
        partition by name
        order by
            whn
    )
from
    covid
where
    name = 'Italy'
    and month(whn) = 3
order by
    whn;

-- 3.
select
    name,
    day(whn),
    confirmed - lag(confirmed, 1) over(
        partition by name
        order by
            whn
    )
from
    covid
where
    name = 'Italy'
    and month(whn) = 3
order by
    whn;

-- 4.
-- weekday(whn) = 0 => 周一
-- TODO: 这一题判定系统有问题
select
    *,
    weekday(whn)
from
    covid
where
    name = 'Italy';

-- 5.
-- TODO: 
-- 6.
SELECT
    name,
    confirmed,
    RANK() OVER (
        ORDER BY
            confirmed DESC
    ) rc,
    deaths,
    rank() over (
        order by
            deaths desc
    ) rd
FROM
    covid
WHERE
    whn = '2020-04-20'
ORDER BY
    confirmed DESC;

-- 7.
-- TODO: 
select
    *
from
    covid
    join world on covid.name = world.name;

-- 8.
-- TODO: 
select
    *
from
    (
        select
            whn,
            name,
            confirmed - lag(confirmed, 1) over(
                partition by name
                order by
                    whn
            ) nc
        from
            covid
    ) as new