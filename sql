1、查询没学过“谌燕”老师课的同学，显示（学号、姓名）

SELECT STUDENT_NO,STUDENT_NAME
FROM hand_student where STUDENT_NO=
(SELECT STUDENT_NO FROM
hand_course a JOIN hand_student_core b
ON a.COURSE_NO = b.COURSE_NO AND a.TEACHER_NO not in('t002'));

//或者
SELECT STUDENT_NO,STUDENT_NAME
FROM hand_student where STUDENT_NO=
(SELECT STUDENT_NO FROM
hand_course a JOIN hand_student_core b
ON a.COURSE_NO = b.COURSE_NO AND a.TEACHER_NO =
(select TEACHER_NO from hand_teacher
where TEACHER_NAME not in("谌燕")
group by TEACHER_NO)
);


2、查询没有学全所有课的同学，显示（学号、姓名）
SELECT STUDENT_NO,STUDENT_NAME
FROM 

                  
3、查询“c001”课程比“c002”课程成绩高的所有学生，显示（学号、姓名）

SELECT STUDENT_NO ,STUDENT_NAME
FROM hand_student where STUDENT_NO=
(select a.STUDENT_NO as STUDENT_NO
FROM hand_student_core a,hand_student_core b
where a.CORE > b.CORE and a.COURSE_NO = 'c001' and b.COURSE_NO = 'c002');
                  
4、按各科平均成绩和及格率的百分数，按及格率高到低顺序，显示（课程号、平均分、及格率）
SELECT COURSE_NO ,AVG(CORE) as avg,
FROM hand_student_core
group by COURSE_NO;
 
5、1992年之后出生的学生名单找出年龄最大和最小的同学，显示（学号、姓名、年龄）

SELECT STUDENT_NO ,STUDENT_NAME,STUDENT_AGE
from hand_student
where STUDENT_AGE = (select max(STUDENT_AGE) from hand_student where
(STUDENT_AGE)<2019-1992);

SELECT STUDENT_NO ,STUDENT_NAME,STUDENT_AGE
from hand_student
where STUDENT_AGE = (select min(STUDENT_AGE) from hand_student where
(STUDENT_AGE)<2019-1992);

6、统计列出矩阵类型各分数段人数，横轴为分数段[100-85]、[85-70]、[70-60]、[<60]，纵轴为课程号、课程名称

 
7、查询各科成绩前三名的记录:(不考虑成绩并列情况)，显示（学号、课程号、分数）

 
8、查询选修“谌燕”老师所授课程的学生中每科成绩最高的学生，显示（学号、姓名、课程名称、成绩）
SELECT COURSE_NO,max(CORE),
from hand_student_core
where COURSE_NO = (select COURSE_NO
from hand_teacher as t,hand_course as c
where t.TEACHER_NO = c.TEACHER_NO and t.TEACHER_NAME="谌燕"
group by COURSE_NO);
                    
9、查询两门及以上不及格课程的同学及平均成绩，显示（学号、姓名、平均成绩（保留两位小数））

 
10、查询姓氏数量最多的学生名单，显示（学号、姓名、人数）
select STUDENT_NO ,STUDENT_NAME
FROM hand_student
group by STUDENT_NAME
HAVING (select  STUDENT_NAME from hand_student where STUDENT_NAME LIKE "%")
;
   
11、查询课程名称为“J2SE”的学生成绩信息，90以上为“优秀”、80-90为“良好”、60-80为“及格”、60分以下为“不及格”，显示（学号、姓名、课程名称、成绩、等级）

   
12、查询教师“胡明星”的所有主管及姓名:（无主管的教师也需要显示），显示（教师编号、教师名称、主管编号、主管名称）


13、查询分数高于课程“J2SE”的所有学生课程信息，显示（学号，姓名，课程名称、分数）
select COURSE_NO,CORE
from hand_student_core a
where
CORE >any(select CORE
from hand_course a join hand_student_core b
on a.COURSE_NO = b.COURSE_NO and a.COURSE_NAME = "J2SE");


   
14、分别根据教师、课程、教师和课程三个条件统计选课的学生数量：(使用rollup),显示（教师名称、课程名称、选课数量）

 
15、查询所有课程成绩前三名的按照升序排在最开头，其余数据排序保持默认（7分）,显示（学号、成绩）
SELECT STUDENT_NO ,CORE
from 
