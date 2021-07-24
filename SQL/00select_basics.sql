-- https://sqlzoo.net/wiki/SELECT_basics
-- DONE
-- 1.
select
    population
from
    world
where
    name = 'Germany';

-- 2.
-- in
select
    name,
    population
from
    world
where
    name in ('Sweden', 'Norway', 'Denmark');

-- 3.
-- between and 包括边界值
select
    name,
    area
from
    world
where
    area between 200000
    and 250000;