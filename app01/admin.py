from django.contrib import admin
from app01 import models
# Register your models here.


class UserInfoAdmin(admin.ModelAdmin):
    list_display = ('nid', 'username', 'email', 'pwd', 'path', 'ctime')
    search_fields = ('nid', 'username')
    list_per_page = 10


class CommentAdmin(admin.ModelAdmin):
    list_display = ('id', 'news', 'user', 'content', 'device', 'ctime', 'parentcomment')
    search_fields = ('id', 'news', 'user', 'device')
    list_per_page = 10


class NewsAdmin(admin.ModelAdmin):
    list_display = ('id', 'title',
                    'url', 'ctime',
                    'userSend', 'path',
                    'nt', 'favorcount',
                    'commentcount', )
    list_filter = ('nt', )
    list_editable = ('nt', )
    search_fields = ('id', 'userSend')
    list_per_page = 5


admin.site.register(models.userInfo, UserInfoAdmin)
admin.site.register(models.comment, CommentAdmin)
admin.site.register(models.news, NewsAdmin)







