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
    print "select * from student"
    cur.execute("select * from student")
#
#将文件department.txt中的数据输入表department中

    def prc_line(line):
        _result = line.decode("utf-8").strip().split(" ")
        _result[0] = int(_result[0])
        _result[2] = int(_result[2])
        return _result


    with open("/home/zheng/Download/MySQL上课文件/作业/university/department.txt", "r") as f:
        datas = [prc_line(line) for line in f.readlines()]

    for d in datas:
                cur.execute("insert into department(dept_name,building,budget) values(%d,'%s',%d)" % (d[0],d[1],d[2]))

                conn.commit()
    #将文件exam.txt中的数据输入到表exam中
    def prc_line(line):
        _result = line.decode("utf-8").strip().split(" ")
        _result[0] = int(_result[0])
        _result[2] = int(_result[2])
        return _result


    with open("/home/zheng/Download/MySQL上课文件/作业/university/exam.txt","r") as f:
        datas = [prc_line(line) for line in f.readlines()]

    for d in datas:
               cur.execute("insert into exam(student_ID,exam_name,grade) values(%d,'%s',%d)" % (d[0],d[1],d[2]))

               conn.commit()

    #将文件student.txt中的数据输入表student中
               def prc_line(line):
                   _result = line.decode("utf-8").strip().split(" ")
                   _result[0] = int(_result[0])
                   _result[3] = int(_result[3])
                   return _result


               with open("/home/zheng/Download/MySQL上课文件/作业/university/student.txt","r") as f:
                   datas = [prc_line(line) for line in f.readlines()]

               for d in datas:
                   cur.execute("insert into peoples(name,sex,age,emotion_state,salary) values('%s','%s',%d,'%s',%d)"%(d[0],d[1],d[2],d[3],d[4]))
                   conn.commit()
