from django.shortcuts import render, HttpResponse
from app01 import models
from django.db.models import F
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.core.handlers.wsgi import WSGIRequest
import re
import json
import os
import datetime
# Create your views here.


# 主页
def index(request):
    if request.method == "GET":
        username = request.session.get("username")
        new_obj = models.news.objects.all()
        paginator = Paginator(new_obj, 4)
        page = request.GET.get("p")
        try:
            query_sets = paginator.page(page)
        except PageNotAnInteger:
            # 如果页不是整数，则传递第一页。
            query_sets = paginator.page(1)
        except EmptyPage:
            # 如果页面超出范围（例如9999），则提交结果的最后一页。
            query_sets = paginator.page(paginator.num_pages)
        if username:
            face_img = models.userInfo.objects.get(username=username)
            return render(request, "index.html", {'queryset': query_sets,
                                                  'username': username,
                                                  'img_path': face_img})
        else:
            return render(request, "index.html", {'queryset': query_sets,
                                                  'username': username})
    elif request.method == "POST":
        username = request.session.get("username")
        pop_dict = {"status": True, "error": None, "data": None, "success": None}
        title = request.POST.get("title")
        message = request.POST.get("textmsg")
        url = request.POST.get("url", None)
        userSend = models.userInfo.objects.get(username=username)
        nt = request.POST.get("selectmsg")
        path = ""
        file_obj = request.FILES.get("userfile")
        if file_obj:
            path = os.path.join('static', 'upload', file_obj.name)
            with open(path, 'wb+') as f:
                for chunk in file_obj.chunks():
                    f.write(chunk)
        if message:
            models.news.objects.create(title=title,
                                       message=message,
                                       url=url,
                                       userSend=userSend,
                                       nt=nt, path=path)
            pop_dict['success'] = True
        else:
            pop_dict['error'] = "请填写内容"
        return HttpResponse(json.dumps(pop_dict))


# 点赞
def zan(request):
    pop_dict = {'success': None}
    if request.method == "POST":
        id = request.POST.get('id')
        username = request.POST.get("username")
        print("username", username)
        filte = models.zan.objects.filter(news_id=id, username=username)
        newsids = models.news.objects.filter(id=id)
        if not filte:
            newsids.update(favorcount=F("favorcount")+1)
            models.zan.objects.create(news_id=id, username=username, bools=True)
        elif not filte[0].bools:
            newsids.update(favorcount=F("favorcount") + 1)
            models.zan.objects.filter(news=id).update(bools=True)
        else:
            newsids.update(favorcount=F("favorcount") - 1)
            models.zan.objects.filter(news=id).update(bools=False)
        piece = models.news.objects.filter(id=id)
        pop_dict['num'] = piece[0].favorcount
    return HttpResponse(json.dumps(pop_dict))


# 用户信息修改（设置）
def usersit(request):
    pop_dict = {'success': None}
    if request.method == "POST":
        rev_name = request.POST.get("rev_name")
        rev_email = request.POST.get("rev_email")
        rev_pwd = request.POST.get("rev_pwd")
        imgfile = request.FILES.get("imgfile")
        usern = request.POST.get("username")
        if imgfile:
            path = os.path.join('static', 'upload', imgfile.name)
            with open(path, "wb+") as f:
                for chunk in imgfile.chunks():
                    f.write(chunk)
            models.userInfo.objects.filter(username=usern).update(username=rev_name,
                                                                  email=rev_email,
                                                                  pwd=rev_pwd,
                                                                  path=path)
        else:
            models.userInfo.objects.filter(username=usern).update(username=rev_name,
                                                                  email=rev_email,
                                                                  pwd=rev_pwd)
        pop_dict['success'] = True
        return HttpResponse(json.dumps(pop_dict))


# 评论操作
def comment(request, cid):
    if request.method == "GET":
        username = request.session.get('username')
        new_obj = models.news.objects.get(id=cid)
        if username:
            face_img = models.userInfo.objects.get(username=username)
        # print('cid:', cid)
        ret = []
        comment_dict = {}
        comment_list = models.comment.objects.filter(news=cid).values()
        for line in comment_list:
            line.update({'son': []})
            comment_dict[line['id']] = line
        for pic in comment_list:
            comment_line_parentcomment = pic["parentcomment_id"]
            if not comment_line_parentcomment:
                ret.append(pic)
            else:
                comment_dict[comment_line_parentcomment]['son'].append(pic)
        # print("comment_dict:", comment_dict)
        return render(request, "comment.html", {'new_obj': new_obj,
                                                'username': username,
                                                'img_path': face_img,
                                                'ret': json.dumps(ret, cls=DateEncoder)})
    elif request.method == "POST":
        pop_dict = {'success': None}
        # print(request.environ)
        devicename = request.environ.get('HTTP_USER_AGENT')
        ret = re.search('(?<=\\()(.+?)(?=\\))', devicename)
        devcname = str(ret.group())
        rets = re.split(r';', devcname)[0]
        id = request.POST.get('id')
        username = request.POST.get('username')
        comment = request.POST.get('comment')
        bols = request.POST.get('bols')
        if bols == 'false':
            models.comment.objects.create(news_id=id,
                                          user=username,
                                          content=comment,
                                          device=rets)
            models.news.objects.filter(id=id).update(commentcount=F("commentcount") + 1)
        else:
            models.comment.objects.create(news_id=id,
                                          user=username,
                                          content=comment,
                                          device=rets,
                                          parentcomment_id=id)
        piece = models.news.objects.filter(id=id)
        pop_dict['num'] = piece[0].commentcount
        pop_dict['success'] = True
        return HttpResponse(json.dumps(pop_dict))


class DateEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime.datetime):
            return obj.strftime('%Y-%m-%d %H:%M:%S')

        elif isinstance(obj, datetime.date):
            return obj.strftime("%Y-%m-%d")

        else:
            return json.JSONEncoder.default(self, obj)


# 点赞历史
def history(request):
    if request.method == "GET":
        username = request.GET.get('username')
        queryset = models.zan.objects.filter(username=username, bools=True)
        print(queryset[0].news.userSend.username)
        if username:
            face_img = models.userInfo.objects.get(username=username)
        return render(request, "history.html", {'username': username,
                                                'img_path': face_img,
                                                'queryset': queryset})


# 动态管理
def management(request):
    if request.method == "GET":
        username = request.GET.get('username')
        user_id = models.userInfo.objects.get(username=username).nid
        queryset = models.news.objects.filter(userSend_id=user_id)
        if username:
            face_img = models.userInfo.objects.get(username=username)
        return render(request, "management.html", {'username': username,
                                                   'img_path': face_img,
                                                   'queryset': queryset})
    elif request.method == "POST":
        pop_dict = {'success': None}
        id = request.POST.get('id')
        models.news.objects.filter(id=id).delete()
        pop_dict['success'] = True
    return HttpResponse(json.dumps(pop_dict))





