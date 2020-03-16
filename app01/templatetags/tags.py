# Author：wylkjj
# Date：2020/3/14
# -*- coding:utf-8 -*-
from django import template
from django.utils.safestring import mark_safe

register = template.Library()


@register.simple_tag
def senduser(foo):
    username = foo.userSend.username
    return username


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

    return None



