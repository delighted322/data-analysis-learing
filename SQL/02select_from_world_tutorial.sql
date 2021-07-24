-- https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial
-- DONE
-- select from world tutorial

-- 1.
-- 运行顺序：from -> select
select
    name,
    continent,
    population
from
    world;

-- 2.
-- from -> where -> select
select
    name
from
    world
where
    population > 200000000;

-- 3.
select
    name,
    gdp / population
from
    world
where
    population >= 200000000;

-- 4.
select
    name,
    population / 1000000
from
    world
where
    continent = 'South America';

-- 5.
-- in
select
    name,
    population
from
    world
where
    name in ('France', 'Germany', 'Italy');

-- 6.
-- like
select
    name
from
    world
where
    name like '%United%';

-- 7.
-- or
-- from -> where -> select
select
    name,
    population,
    area
from
    world
where
    area > 3000000
    or population > 250000000;

-- 8.
-- xor 异或 相同为0 不同为1 不是SQL的标准语法
-- 可以用下面的语法代替
-- a XOR b = (a AND NOT b) OR (NOT a AND b)
select
    name,
    population,
    area
from
    world
where
    (
        area > 3000000
        and population <= 250000000
    )
    or (
        area <= 3000000
        and population > 250000000
    );

-- 9.
-- round() 四舍五入保留几位小数
select
    name,
    round(population / 1000000, 2),
    round(gdp / 1000000000, 2)
from
    world
where
    continent = 'South America';

-- 10.
-- round(colName,-3) 整数部分精度取值
select
    name,
    round(gdp / population, -3)
from
    world
where
    gdp > 1000000000000;

-- 11.
-- len()
select
    name,
    capital
from
    world
where
    len(name) = len(capital);

-- 12.
-- left() 取字符串的前几个字符
-- 不等于 <>
select
    name,
    capital
from
    world
where
    left(name, 1) = left(capital, 1)
    and name <> capital;

-- 13.
select
    name
from
    world
where
    name not like '% %'
    and (
        name like '%a%'
        and name like '%e%'
        and name like '%i%'
        and name like '%o%'
        and name like '%u%'
    );