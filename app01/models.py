from django.db import models
# Create your models here.


class userInfo(models.Model):
    nid = models.AutoField(primary_key=True)
    username = models.CharField(max_length=32, unique=True)
    email = models.CharField(max_length=32, unique=True)  # 唯一索引
    pwd = models.CharField(max_length=64)
    path = models.CharField(max_length=128, null=True)
    ctime = models.DateTimeField()


# 注：DateTimeField是表示该字段为：日期和时间，而DateField只表示日期
class userSend(models.Model):
    nid = models.AutoField(primary_key=True)
    code = models.CharField(max_length=6)
    email = models.CharField(max_length=32, db_index=True)  # 普通索引
    time = models.IntegerField(default=0)  # 初始值为0
    ctime = models.DateTimeField()  # 时间


# 新闻
class news(models.Model):
    title = models.CharField(max_length=64)
    message = models.TextField(null=True)
    url = models.CharField(max_length=128, null=True)
    ctime = models.DateTimeField(auto_now_add=True)  # auto_now_add=True表示可以手动修改时间
    userSend = models.ForeignKey(to="userInfo", to_field='nid',
                                 related_name='su', on_delete=models.CASCADE)
    path = models.CharField(max_length=128, null=True)
    # 第一种写法
    # nt = models.ForeignKey(to="newType",to_field="id",related_name="tn",on_delete=models.CASCADE)
    # 第二种写法
    newstype = [
        (1, "42区"), (2, "段子"), (3, "图片"), (4, "挨踢1024"), (5, "你问我答")
    ]
    nt = models.IntegerField(choices=newstype)
    favorcount = models.IntegerField(default=0)
    # 浪费硬盘（如果数据量庞大，为了让数据库操作时节省时间可以这样做，违反数据库的设计范式）
    commentcount = models.IntegerField(default=0)  # 浪费硬盘
# 新闻类型（第一种写法：把新闻类型放入数据库中，但是由于新闻类型是固定的，所以数据没有必要再放到数据库中，
# 可以直接把类型数据存到内存里面去，可以节省数据库操作，这是数据库优化的一种方式，所以出现了第二种写法）
# class newType(models.Model):
#     caption = models.CharField(max_length=16)
# 点赞
# class favor(models.Model):#正常情况下要遵循数据库的范式设计，用此方法设计数据库多表关联
#     user = models.ForeignKey(to="userInfo",to_field="nid",on_delete=models.CASCADE)
#     news = models.ForeignKey(to="news",to_field="id",on_delete=models.CASCADE)


# 评价
class comment(models.Model):
    news = models.ForeignKey(to="news", to_field="id", on_delete=models.CASCADE)
    user = models.CharField(max_length=32, null=True)
    content = models.TextField(null=False)
    device = models.CharField(max_length=32, null=True)  # 设备名
    ctime = models.DateTimeField(auto_now_add=True)
    parentcomment = models.ForeignKey(to="self", null=True, related_name="pc", on_delete=models.CASCADE)
    # self相当于comment，对自己进行关联，建立反向查找related_name
# to=表名，与此表关联(可以不写to)，to_field=字段名，与字段关联
# related_name反向查找时使用的替代名字
# obj = models.news.objects.get(id=1)
# obj.news_set 等同于-->obj.din （related_name）
# related_query_name也是反向查询时使用的替代名字


# 点赞
class zan(models.Model):
    news = models.ForeignKey(to="news", to_field="id", on_delete=models.CASCADE)
    username = models.CharField(max_length=32, null=True)
    bools = models.BooleanField(default=False, null=True)










