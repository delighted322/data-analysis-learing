-- https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial
-- DONE
-- TODO: 14题
-- 1.
select
    *
from
    nobel
where
    yr = 1950;

-- 2.
select
    winner
from
    nobel
where
    yr = 1962
    and subject = 'Literature';

-- 3.
select
    yr,
    subject
from
    nobel
where
    winner = 'Albert Einstein';

-- 4.
select
    winner
from
    nobel
where
    yr >= 2000
    and subject = 'Peace';

-- 5.
select
    *
from
    nobel
where
    subject = 'Literature'
    and yr between 1980
    and 1989;

-- 6.
-- in
select
    *
from
    nobel
where
    winner in (
        'Theodore Roosevelt',
        'Woodrow Wilson',
        'Jimmy Carter',
        'Barack Obama'
    );

-- 7.
-- left() 或者 like
select
    winner
from
    nobel
where
    -- left(winner,4) = 'John';
    winner like 'John%';

-- 8.
select
    *
from
    nobel
where
    (
        subject = 'Physics'
        and yr = 1980
    )
    or (
        subject = 'Chemistry'
        and yr = 1984
    );

-- 9.
-- not in
select
    *
from
    nobel
where
    yr = 1980
    and subject not in ('Chemistry', 'Medicine');

-- 10.
select
    *
from
    nobel
where
    (
        subject = 'Medicine'
        and yr < 1910
    )
    or (
        subject = 'Literature'
        and yr >= 2004
    );

-- 11.
-- 
select
    *
from
    nobel
where
    winner = 'PETER GRÜNBERG';

-- 12.
-- TODO: 
-- EUGENE O'NEILL
select
    *
from
    nobel
where
    winner = 'EUGENE O''NEILL';

-- 13.
select
    winner,
    yr,
    subject
from
    nobel
where
    left(winner, 3) = 'Sir'
order by
    yr desc,
    winner;

-- 14.
-- 表达式subject IN ('Chemistry','Physics')可以用作值 - 它将是0或1。
-- 按主题和获奖者名称排序显示 1984 年的获奖者和主题；但最后列出化学和物理。
-- FIXME: 
with sub as(
    select
        *,
        case
            when subject in('Chemistry', 'Physics') then 1
            else 0
        end as temp
    from
        nobel
)
select
    subject,
    winner
from
    sub
where
    yr = 1984
order by
    temp,
    winner;

-- 不晓得为啥就是不得行 离谱
SELECT
    winner,
    subject
FROM
    nobel
WHERE
    yr = 1984
ORDER BY
    subject IN ('Physics', 'Chemistry'),
    subject,
    winner