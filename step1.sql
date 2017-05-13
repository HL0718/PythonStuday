#创建‘department’表，其中dept_name 是表的主码
ALTER TABLE `university`.`department` 
CHANGE COLUMN `building` `building` VARCHAR(45) NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`dept_name`);
#创建‘exam’表，其中表的主码是‘student_ID’和'exam_name',外码是‘student_ID’
ALTER TABLE `university`.`exam` 
DROP FOREIGN KEY `fk_exam_1`;
ALTER TABLE `university`.`exam` 
ADD CONSTRAINT `fk_exam_1`
  FOREIGN KEY (`student_ID`)
  REFERENCES `university`.`student` (`ID`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
#创建‘student’表,其中主码是‘ID’,外码是‘dept_name’
  ALTER TABLE `university`.`student` 
DROP FOREIGN KEY `fk_student_1`;
ALTER TABLE `university`.`student` 
ADD CONSTRAINT `fk_student_1`
  FOREIGN KEY (`dept_name`)
  REFERENCES `university`.`department` (`dept_name`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
