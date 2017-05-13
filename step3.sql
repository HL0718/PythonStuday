#3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
select * from peoples where school !='GDUFS' or school is null;
#3-2.查找计算机系每次考试所有学生的平均成绩（最终显示考试名，平均分）
select name,avg(grade) 
from student as T1 
inner join department on T1.dept_name = department.dept_name 
inner join exam on T1.ID = exam.student_id 
where T1.dept_name = 'computer' 
group by name;
#3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）
select name,avg(exam.grade) from student,exam where ID = student_id and sex = 'f' group by name having avg(exam.grade) >= 80;
#3-4.找出人数最少的院系以及其年度预算
select budget,count(*) from student,department where student.dept_name = department.dept_name group by student.dept_name order by count(*) asc limit 0,1;
#3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。
update department set dept_name='comp. sci.' where dept_name='computer';
#3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。
update department 
set budget = budget*(
    select count(*) 
    from student 
    where department.dept_name = dept_name
);
#3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.
insert into department (dept_name,building,budget) select "avg_budget",null,sum(budget)/count(budget) from department;
#3-8. 删除计算机系中考试成绩平均分低于70的学生.
delete name from student as T1 left join exam as T2 on T1.ID=T2.student_ID where T1.dept_name='computer' and T2.avg(grade)<70;
#3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.
update student set emotion_state='single' where student.ID in (select student_ID from exam where student.emotion_state='loving' and exam.avg(grade)<75);
#3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
insert into exam (student_id,exam_Name,grade) select ID,"Avg_Exam",sum(grade)/count(exam_Name) from exam,student where ID=student_id group by ID ;
select * from department;
select * from exam;
select * from student