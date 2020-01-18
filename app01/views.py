from django.shortcuts import render,HttpResponse
from django import forms
import json
# Create your views here.

#主页
def index(request):
    if request.method == "GET":
        return render(request, "index.html")
    elif request.method == "POST":
        return render(request,"index.html")
def userp(request):
    # print(type(request))
    from django.core.handlers.wsgi import WSGIRequest
    print(request.environ)
    print(request.environ.get('HTTP_USER_AGENT'))
    return render(request,"userp.html")
def comment(request):
    if request.method == "GET":
        return render(request,"comment.html")
    elif request.method == "POST":
        id = request.POST.get('comment_id')
        comment_list = [
            {'id': 1, 'content': 'Python', 'user': '阿松大', 'parent_id': None},
            {'id': 2, 'content': 'Java', 'user': '阿松大', 'parent_id': None},
            {'id': 3, 'content': 'PHP', 'user': '阿松大', 'parent_id': None},
            {'id': 4, 'content': '你hh', 'user': '按文', 'parent_id': 1},
            {'id': 5, 'content': '阿萨德', 'user': '豆腐干', 'parent_id': 1},
            {'id': 6, 'content': '风格和', 'user': '豆腐干', 'parent_id': 4},
            {'id': 7, 'content': '繁华的', 'user': '微软', 'parent_id': 2},
            {'id': 8, 'content': '刀锋', 'user': '微软', 'parent_id': 3},
            {'id': 9, 'content': '我想静静', 'user': '阿松大', 'parent_id': 8},
            {'id': 10, 'content': '我想静静', 'user': '全文', 'parent_id': None},
            {'id': 11, 'content': '我是符符', 'user': 'xiaopang', 'parent_id': 6},
        ]
        ret = []
        comment_dict = {}
        for line in comment_list:
            line.update({'son': []})  # 给数据加键值
            comment_dict[line['id']] = line  # 添加到字典中
        for r in comment_list:
            comment_line = r
            comment_line_parent_id = comment_line['parent_id']
            if not comment_line_parent_id:
                ret.append(r)
            else:
                comment_dict[comment_line_parent_id]['son'].append(r)
        #return HttpResponse(json.dumps(ret))
        return render(request, 'comments.html', {'comment_tree': ret})












