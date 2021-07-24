-- https://sqlzoo.net/wiki/SUM_and_COUNT
-- DONE

-- 1.
-- sum() 求和
select
    sum(population)
from
    world;

-- 2.
-- distinct 去重删除
select
    distinct continent
from
    world;

-- 3.
-- sum()
select
    sum(gdp)
from
    world
where
    continent = 'Africa';

-- 4.
-- count()
select
    count(name)
from
    world
where
    area >= 1000000;

-- 5.
-- in
select
    sum(population)
from
    world
where
    name in ('Estonia', 'Latvia', 'Lithuania');

-- 6.
-- from -> group by -> select
select
    continent,
    count(name)
from
    world
group by
    continent;

-- 7.
-- from -> where -> group by -> select
select
    continent,
    count(name)
from
    world
where
    population >= 10000000
group by
    continent;

-- 8.
-- having 只能基于group by的非聚合字段和聚合运算的结果进行筛选
-- from -> group by -> having -> select
select
    continent
from
    world
group by
    continent
having
    sum(population) > 100000000;