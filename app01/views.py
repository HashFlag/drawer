from django.shortcuts import render, HttpResponse
from app01 import models
from django.db.models import F
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
import json
import os
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
        return render(request, "index.html", {'queryset': query_sets, 'username': username})
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
        filte = models.zan.objects.get(news=id)
        newsid = models.news.objects.get(id=id)
        newsids = models.news.objects.filter(id=id)
        if not filte:
            newsids.update(favorcount=F("favorcount")+1)
            models.zan.objects.create(news=newsid, username=username, bools=True)
            pop_dict['success'] = True
            piece = models.news.objects.filter(id=id)
            pop_dict['num'] = piece[0].favorcount
        elif not filte.bools:
            newsids.update(favorcount=F("favorcount") + 1)
            models.zan.objects.filter(news=id, username=username).update(bools=True)
            pop_dict['success'] = True
            piece = models.news.objects.filter(id=id)
            pop_dict['num'] = piece[0].favorcount
        else:
            newsids.update(favorcount=F("favorcount") - 1)
            models.zan.objects.filter(news=id, username=username).update(bools=False)
            pop_dict['success'] = False
            piece = models.news.objects.filter(id=id)
            pop_dict['num'] = piece[0].favorcount
    return HttpResponse(json.dumps(pop_dict))














