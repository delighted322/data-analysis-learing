-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial
-- DONE
-- TODO: 第7题 第5题
-- 1.
select
    name
from
    world
where
    population > (
        select
            population
        from
            world
        where
            name = 'Russia'
    );

-- 2.
select
    name
from
    world
where
    continent = 'Europe'
    and gdp / population > (
        select
            gdp / population
        from
            world
        where
            name = 'United Kingdom'
    );

-- 3.
select
    name,
    continent
from
    world
where
    continent = (
        select
            continent
        from
            world
        where
            name = 'Argentina'
    )
    or continent = (
        select
            continent
        from
            world
        where
            name = 'Australia'
    )
order by
    name;

-- 4.
select
    name,
    population
from
    world
where
    population > (
        select
            population
        from
            world
        where
            name = 'Canada'
    )
    and population < (
        select
            population
        from
            world
        where
            name = 'Poland'
    );

-- 5.*******
-- TODO: 数字和字符串拼接 类型转换
select
    name,
    concat(
        cast(
            round(
                (
                    population / (
                        select
                            population
                        from
                            world
                        where
                            name = 'Germany'
                    )
                ),
                2
            ) * 100 as int
        ),
        '%'
    )
from
    world
where
    continent = 'Europe';

-- 6.
-- TODO: 100 > null => false
select
    name
from
    world
where
    gdp > all(
        select
            gdp
        from
            world
        where
            continent = 'Europe'
            and gdp is not null
    );

-- 7.
-- 表链接做法 TODO: 
select
    world.continent,
    world.name,
    t.area
from
    world
    inner join (
        select
            continent,
            max(area) as area
        from
            world
        group by
            continent
    ) as t on world.continent = t.continent
    and world.area = t.area;

-- 子查询做法 TODO: 要搞一下 整不会了
select
    continent,
    name,
    area
from
    world
where
    area = (
        select
            max(area) as max
        from
            world w
        where
            world.continent = w.continent
        group by
            continent
    );

-- sqlzoo给的做法 TODO: 要理解一下
SELECT
    continent,
    name,
    area
FROM
    world x
WHERE
    area >= ALL (
        SELECT
            area
        FROM
            world y
        WHERE
            y.continent = x.continent
            AND area > 0
    );

-- 也是子查询
select
    world.continent,
    world.name,
    world.area
from
    world,
    (
        select
            continent,
            max(area) m
        from
            world
        group by
            continent
    ) w
where
    world.area = w.m
    and world.continent = w.continent -- 8.
select
    world.continent,
    world.name
from
    world
where
    world.name = (
        select
            min(name)
        from
            world w
        where
            w.continent = world.continent
    );

-- 9.
select
    name,
    continent,
    population
from
    world w1
where
    continent in(
        select
            continent
        from
            world w2
        group by
            continent
        having
            max(population) <= 25000000
    );

-- 10.
-- TODO: 3 * all()不行 应该all()里面 select 3 * population
select
    name,
    continent
from
    world
where
    world.population / 3 > all(
        select
            population
        from
            world w2
        where
            world.continent = w2.continent
            and world.name <> w2.name
    );