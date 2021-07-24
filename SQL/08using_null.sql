-- https://sqlzoo.net/wiki/Using_Null
-- DONE
-- 1.
select
    name
from
    teacher
where
    dept is null;

-- 2.
-- inner join 只保留两张表中匹配上的数据
select
    teacher.name,
    dept.name
from
    teacher
    join dept on teacher.dept = dept.id;

-- 3.
-- left join
select
    teacher.name,
    dept.name
from
    teacher
    left join dept on teacher.dept = dept.id;

-- 4.
-- right join
select
    teacher.name,
    dept.name
from
    teacher
    right join dept on teacher.dept = dept.id;

-- 5.
-- coalesce(x,y) 返回传入的参数中第一个非空值
select
    name,
    coalesce(mobile, '07986 444 2266')
from
    teacher;

-- 6.
select
    teacher.name,
    coalesce(dept.name, 'None')
from
    teacher
    left join dept on teacher.dept = dept.id;

-- 7.
select
    count(name),
    count(mobile)
from
    teacher;

-- 8.
-- 注意两张表中重名的字段
select
    dept.name,
    count(teacher.name)
from
    dept
    left join teacher on teacher.dept = dept.id
group by
    dept.name;

-- 9.
-- case when
select
    name,
    case
        when dept = 1
        or dept = 2 then 'Sci'
        else 'Art'
    end
from
    teacher;

-- 10
select
    name,
    case
        when dept = 1
        or dept = 2 then 'Sci'
        when dept = 3 then 'Art'
        else 'None'
    end
from
    teacher;