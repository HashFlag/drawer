# author：wylkjj
# date：2019/12/14
# -*- coding:utf-8 -*-
from app01.check_code import create_validate_code
from django.shortcuts import render, HttpResponse, redirect
from django import forms
from app01 import models
from email.mime.text import MIMEText
from email.utils import formataddr
import datetime
import smtplib
import random
import json
import io


# 邮箱发送功能
def email(email_list, content, subject="YY新热榜-用户注册"):
    msg = MIMEText(content, 'plain', 'utf-8')
    # 发件人和发件邮箱
    msg['From'] = formataddr(["YY新热榜", 'wylshkjj@163.com'])
    # 邮件主题
    msg['Subject'] = subject
    # SMTP服务
    server = smtplib.SMTP("smtp.163.com", 25)
    # SMTP登录网易邮箱账号
    server.login("wylshkjj@163.com", "Love0628")
    # 发送的邮箱
    server.sendmail('wylshkjj@163.com', email_list, msg.as_string())
    server.quit()


# form验证码信息验证模板
class emailRegister(forms.Form):
    email = forms.EmailField(error_messages={"invalid": "格式错误"})


# form 注册信息验证模板
class userRegister(forms.Form):
    username = forms.CharField(max_length=32, error_messages={"required": "用户名不能为空"})
    email = forms.EmailField(error_messages={"required": "用户ID不能为空", "invalid": "格式错误"})
    usercode = forms.CharField(error_messages={"required": "验证码不能为空", "invalid": "格式错误"})
    pwd = forms.CharField(min_length=4, max_length=24, error_messages={
        "min_length": "密码长度不能小于4", "max_length": "密码长度不能大于24", "required": "密码不能为空"})


# 登录验证模板
class userLogin(forms.Form):
    username = forms.CharField(error_messages={'required': '请输入用户名'})
    pwd = forms.CharField(error_messages={'required': '请输入密码'})
    checkCodes = forms.CharField(error_messages={'required': '请输入验证码'})


# 注册登录信息存储字典
class errorMessages:
    def __init__(self):
        self.status = False
        self.emailError = None
        self.registerError = {}


# 随机验证码
def authCode():
    code = ''
    for i in range(6):
        current = random.randrange(0,6)
        if current != i:
            temp = chr(random.randint(65,90))
        else:
            temp = random.randint(0,9)
        code += str(temp)
    return code


# 生成验证码图片
def checkCode(req):
    stream = io.BytesIO()
    # 创建随机字符串 code
    # 创建一张图片格式的字符串，将随机字符串写到图片上
    img, code = create_validate_code()
    img.save(stream, "PNG")
    # 将字符串形式的验证码放在Session中
    req.session["checkCode"] = code
    return HttpResponse(stream.getvalue())


# 邮箱验证
def useremail(reg):
    obj = emailRegister(reg.POST)
    ret = errorMessages()
    if obj.is_valid():  # 注：is_valid()要获取到所有元素的正确信息才会得到True，只有一个是不可以的
        # 判断邮箱是否注册
        emails=obj.clean()['email']
        if models.userInfo.objects.filter(email=emails).count():
            ret.emailError = "此邮箱已被注册"
            return HttpResponse(json.dumps(ret.__dict__))
        # 生成随机验证码（写入数据库）
        code = authCode()
        emailtime = datetime.datetime.now()
        # 判断数据库中是否存在此邮箱的发送验证信息
        from django.db.models import F
        if models.userSend.objects.filter(email=emails).count():
            # 有邮箱时更新数据然后计时计数
            litime = emailtime - datetime.timedelta(hours=1)
            # __gt 表示范围  大于 >
            time = models.userSend.objects.filter(email=emails, ctime__gt=litime, time__gt=9).count()
            if time:
                ret.emailError = "超过最大次(1小时10次)"
            else:
                times = models.userSend.objects.filter(email=emails, ctime__lt=litime).count()
                if times:
                    models.userSend.objects.filter(email=emails).update(time=0)
                # 记忆数据的最后一次发送时间，满足10次后一个小时后再发
                models.userSend.objects.filter(email=emails).update(code=code, ctime=emailtime, time=F("time")+1)
                ret.status = True
                # 发送验证码邮件
                codeMes = "请妥善保管验证码，勿发给其他人，因用户自身造成的损失，YY热搜将概不负责:" + code
                email([emails, ], codeMes)
        else:
            # 没有邮箱时就create添加数据
            models.userSend.objects.create(code=code, email=emails, ctime=emailtime, time=1)
            ret.status = True
            # 发送验证码邮件
            codeMes = "请妥善保管验证码，勿发给其他人，因用户自身造成的损失，YY热搜将概不负责:" + code
            email([emails, ], codeMes)
    else:
        ret.emailError = obj.errors['email'][0]
    return HttpResponse(json.dumps(ret.__dict__))


# 用户注册
def register(request):
    obj = userRegister(request.POST)
    ret = errorMessages()
    if obj.is_valid():
        form = obj.clean()
        receive_time = datetime.datetime.now()
        true_time = receive_time - datetime.timedelta(minutes=1)
        num_code_mes = models.userSend.objects.filter(email=form['email'],
                                                      code=form['usercode'],
                                                      ctime__gt=true_time).count()
        if not num_code_mes:
            ret.registerError['usercode'] = [{"message": "验证码错误或验证超时"}]
            return HttpResponse(json.dumps(ret.__dict__))
        num_email = models.userInfo.objects.filter(email=form['email']).count()
        if num_email:
            ret.registerError['email'] = [{"message": "邮箱已被注册"}]
            return HttpResponse(json.dumps(ret.__dict__))
        num_name = models.userInfo.objects.filter(username=form['username']).count()
        if num_name:
            ret.registerError['username'] = [{"message": "用户名已被注册"}]
            return HttpResponse(json.dumps(ret.__dict__))

        form['ctime'] = receive_time
        form.pop('usercode')
        userinfo = models.userInfo.objects.create(**form)
        # models.userInfo.objects.create(username=form['userID'],email=form['email'],pwd=form['userPwd'],ctime=receive_time)
        # userinfo = models.userInfo.objects.filter(email=form['email'])
        ret.status = True
        userinfo_dict = {"nid": userinfo.nid, "username": userinfo.username,
                         "email": userinfo.email, "pwd": userinfo.pwd}
        models.userSend.objects.filter(email=form['email']).delete()
        request.session['is_login'] = True
        request.session['userinfo_dict'] = userinfo_dict
    else:
        register_mes = obj.errors.as_json()  # 内部进行了json序列化
        ret.registerError = json.loads(register_mes)  # 解json序列化
    return HttpResponse(json.dumps(ret.__dict__))


# 用户登录
from django.db.models import Q


def login(request):
    log = userLogin(request.POST)
    ret = errorMessages()
    if log.is_valid():
        code = request.session['checkCode']
        form = log.clean()
        if code.lower() != form['checkCodes'].lower():
            ret.registerError["checkCodes"] = [{"message": "验证码错误"}]
            return HttpResponse(json.dumps(ret.__dict__))
        else:
            coun = models.userInfo.objects.filter(Q(Q(username=form['username']) & Q(pwd=form['pwd'])) |
                                                  Q(Q(email=form['username']) & Q(pwd=form['pwd']))).count()
            if not coun:
                ret.registerError["pwd"] = [{"message": "用户名(邮箱)或密码错误"}]
                return HttpResponse(json.dumps(ret.__dict__))
            else:
                request.session["username"] = form['username']
                ret.status = True
    else:
        loginMsg = log.errors.as_json()
        ret.registerError = json.loads(loginMsg)
    return HttpResponse(json.dumps(ret.__dict__))


# 注销
def logout(req):
    req.session.clear()
    return redirect("/index/")



