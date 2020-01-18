#author：wylkjj
#date：2020/1/2
#-*- coding:utf-8 -*-
from django import template
from django.utils.safestring import mark_safe
register = template.Library()

def diGui(son):
    html = ""
    for cv in son:
        b = '<div class="comment_msg"><span>'
        b += cv['content'] + "</span>"
        b += diGui(cv['son'])
        b += "</div>"
        html += b
    return html

@register.simple_tag
def addDivs(comment_list):
    html = '<div class="comment_list">'
    for v in comment_list:
        a = '<div class="comment_msg"><span>'
        a += v['content'] + "</span>"
        a += diGui(v['son'])
        a += "</div>"
        html += a
    return mark_safe(html)