-- https://sqlzoo.net/wiki/SELECT_names
-- DONE TODO: 15题
-- 1.
-- like 
-- %
select
    name
from
    world
where
    name like 'Y%';

-- 2.
select
    name
from
    world
where
    name like '%y';

-- 3.
select
    name
from
    world
where
    name like '%x%';

-- 4.
select
    name
from
    world
where
    name like '%land';

-- 5.
select
    name
from
    world
where
    name like 'C%ia';

-- 6.
select
    name
from
    world
where
    name like '%oo%';

-- 7.
select
    name
from
    world
where
    name like '%a%a%a%';

-- 8.
-- _ 占位符 表示一个任意字符
select
    name
from
    world
where
    name like '_t%';

-- 9.
select
    name
from
    world
where
    name like '%o__o%';

-- 10.
-- len()
select
    name
from
    world
where
    len(name) = 4;

-- 11.
select
    name
from
    world
where
    name = capital;

-- 12.
-- concat() 字符串拼接 中间不会加空格
select
    name
from
    world
where
    capital = concat(name, ' City');

-- 13.
-- like 和 concat()一起用
select
    capital,
    name
from
    world
where
    capital like concat('%', name, '%');

-- 14.
select
    capital,
    name
from
    world
where
    capital like concat(name, '%')
    and capital <> name;

-- 15.
-- replace()
-- TODO: 网站上提交半天没反应 不知道抽什么风
select
    name,
    replace(capital, name, '') as extension
from
    world
where
    capital like concat(name, '%')
    and capital <> name;