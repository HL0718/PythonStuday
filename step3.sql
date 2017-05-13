#3-1.把peoples表中school不是GDUFS的人全部找出来？（包括school为NULL的人）写出MySQL语句。
select * from peoples where not (school=GDUFS) or school is NULL;
#3-2.查找计算机系每次考试所有学生的平均成绩（最终显示考试名，平均分）
select T2.name
from(
      select ID from student 
)as T2
left join(
      select student_ID,exam_name,avg(grade) from exam
)as T1
 on T2.ID=T1.student_ID     
where T2.dept_name='computer';
#3-3.查找女学霸（考试平均分达到80分或80分以上的女生的姓名, 分数）
select T2.name
from(
     select ID,name from student
     )as T2
left join (
     select student_ID from exam
     )as T1
on T2.ID=T1.student_ID
where T2.sex='f'and  T1.avg(grade) >=80;
#3-4.找出人数最少的院系以及其年度预算
select budget from department as T1 where exists (select cout(sex) from student where student.dept_name=T1.dept_name and min(cout(sex)));
#3-5.计算机系改名了，改成计算机科学系（comp. sci.），写出mysql语句。
update department set dept_name='comp. sci.' where dept_name='computer';
#3-6.修改每个系的年度预算，给该系的每个学生发2000元奖金。（修改每个系的年度预算为 原预算+该系人数*2000）。
update department set budget=budget +cout(sex)*2000 where department.dept_name in (select cout(sex)from student where student.dept_name=department.dept_name);
#3-7.向department表中插入一条数据, dept_name属性的值为avg_budget, building为空, 年度预算为所有院系的年度预算平均值.
insert into department values('avg_budget',NULL,avg(budget));
#3-8. 删除计算机系中考试成绩平均分低于70的学生.
delete name from student as T1 left join exam as T2 on T1.ID=T2.student_ID where T1.dept_name='computer' and T2.avg(grade)<70;
#3-9.找出所有正在谈恋爱,但是学习成绩不佳(考试平均分低于75)的学生,强制将其情感状态改为单身.
update student set emotion_state='single' where student.ID in (select student_ID from exam where student.emotion_state='loving' and exam.avg(grade)<75);
#3-10(选做). 对每个学生, 往exam表格中插入名为Avg_Exam的考试, 考试分数为之前学生参加过考试的平均分.
alter exam add 'Avg_Exam' 'int' and update exam set Avg_Exam='avg(grade)';