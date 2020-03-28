# Author：wylkjj
# Date：2020/3/14
# -*- coding:utf-8 -*-
from django import template
from django.utils.safestring import mark_safe
import json
register = template.Library()


@register.simple_tag
def page_list(queryset):
    page_btns = ""
    add_dot_ele = False
    for page_num in queryset.paginator.page_range:
        if page_num < 3 or page_num > queryset.paginator.num_pages-2 or\
                abs(queryset.number - page_num) <= 1:
            ele_class = ""
            if queryset.number == page_num:
                add_dot_ele = False
                ele_class = 'style="color:red;"'
            page_btns += '''<div class="page_number"><a href="?p=%s" %s>%s</a></div>''' %\
                         (page_num, ele_class, page_num)
        else:
            if add_dot_ele == False:
                page_btns += '''<div class="page_number">...</div>'''
                add_dot_ele = True
    return mark_safe(page_btns)


@register.simple_tag
def comshow(ret):
    ret = json.loads(ret)
    html = diGui(ret)
    return mark_safe(html)


def diGui(son):
    html = ""
    replay = '<div class="textarea-container">' \
             '<textarea cols="50" name="msg" id="replay-com" rows="2" ' \
             'placeholder="请自觉遵守互联网相关的政策法规，严禁发布色情、暴力、反动的言论。" ' \
             'class="ipt-txt"></textarea>' \
             '<button type="submit" ' \
             'class="replay-submit" ' \
             'id="replay-submit" ' \
             'style="margin-top:5px;margin-left:5px;">回复评论</button></div>'
    for cv in son:
        args = '<div class="msg_comment">' \
              '<div class="user-face">' \
              '<img class="user-head" cols="80" rows="4" src="/static/img/tx07.jpg">' \
              '</div>' \
              '<div class="textarea-container">'
        args += '<p>' + cv['user'] + '</p>'
        args += '<p>内容：' + cv['content'] + '</p>'
        args += '<p>来自' + \
                cv['device'] + \
                '客户端 &nbsp;&nbsp;&nbsp;' + \
                cv['ctime'] + \
                '<p style="display:none;">' + str(cv['id']) + '</p>' + replay

        args += diGui(cv['son'])
        args += "</div><hr></div>"
        html += args
    return html








