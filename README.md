[应用的在线地址 Heroku](https://shujian.herokuapp.com/login)



## 得到应用: 

```
$ git clone https://github.com/GetsuKami/blog_demo.git
```
修改database.yml,适合自己的：

```
$ vim config/database.yml
```

## 执行bundle: 

```
$ bundle install --without production
```

## 创建数据库、执行迁移：

```
$ rails db:create
$ rails db:migrate
```

## 运行测试:

```
$ rails test
```

## 启动服务:

```
$ rails server
```