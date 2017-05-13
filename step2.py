# coding: utf-8
import MySQLdb
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
if __name__ == '__main__':
    #连接数据库
    conn = MySQLdb.connect(
        host='localhost',
        port=3306,
        user='root',
        passwd='HL1210714;',
        charset="utf8",
        db='university',
    )
    #获取数据库执行游标
    cur=conn.cursor()
    print "select * from department"
    cur.execute("select * from department")

#将文件department.txt中的数据输入表department中

    with open ("/home/zheng/Download/MySQL上课文件/作业/university/department.txt") as f:
        while True:
            line=f.readline()
            if line:
                line=line.strip('\n')
                line = line.split(",")
                print line
                dept_name=line[0]
                building=line[1]
                budget=line[2]
                cur.execute("insert into department(dept_name,building,budget) values(%d,'%s',%d)" % (dept_name, building, budget))
            else:
                break
                f.close()
                cur.close()
                conn.commit()
    #将文件exam.txt中的数据输入到表exam中
    with open("/home/zheng/Download/MySQL上课文件/作业/university/exam.txt") as f:
       while True:
           line=f.readline()
           if line:
               line = line.strip('\n')
               line = line.split(",")
               print line
               student_ID=line[0]
               exam_name=line[1]
               grade=line[2]
               cur.execute("insert into exam(student_ID,exam_name,grade) values(%d,'%s',%d)" % (student_ID, exam_name,grade))
           else:
               break
               f.close()
               cur.close()
               conn.comit()
    #将文件student.txt中的数据输入表student中
    with open("/home/zheng/Download/MySQL上课文件/作业/university/student.txt") as f:
        while True:
            line=f.readline()
            if line:
                line=line.strip('\n')
                line=line.spilt(",")
                print line
                ID=line[0]
                name=line[1]
                sex=line[2]
                age=line[3]
                emotion_state=line[4]
                dept_name=line[5]
                cur.execute("insert into student(ID,name,sex,age,emotion_state,dept_name) values(%d,'%s','%s',%d,'%s','%s')" % (ID, name, sex,age,emotion_state,dept_name))
            else:
                break
                f.close()
                cur.close()
                conn.comit()
                conn.close()
