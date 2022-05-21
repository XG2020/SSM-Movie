# SSM-Movie

仿猫眼电影购票系统毕业设计项目

**基于Spring + SpringMVC + Mybatis + Layui + echarts**

**注意事项：**
 - tomcat 需要设置端口：8081 可在Api.js中修改相关配置  
 - 在tomcat配置文件添加 URIEncoding="utf-8" 以支持中文链接，否则演员图片和剧照无法正常显示

-------------

**5.21更新日志**

**已实现功能**
- 前台
  - 普通用户注册、登录、注销
  - 用户信息修改：邮箱、密码、头像
  - 影片分类：按类型分类（国家、时间暂未实现）
  - 影片的信息浏览：影片的名称、导演、演员、简介及上映时间等
  - 影片排行推荐：可根据影片 票房 或 评分 进行推荐，推荐好评度高或售票量高电影
  - 观影的房间、座位的选择：用户选择观影的影院、房间、座位，用户不能选择已出售的座位
  - 用户的评价：用户登录后可对影片写一些评价
  - 订单信息查询：历史订单信息，包括金额、对应电影票、场次、座位等
- 后台
  - 对影片的信息进行管理：影片的名称、导演、演员、简介及上映时间等，对影片进行新增、删除、编辑等
  - 对影评信息进行管理：对评语进行审核、删除等。
  - 对所有电影院中影片价格进行修改
  - 对电影放映场次进行管理：增加，修改，下架场次
  - 对影院进行管理：增加修改影院
  - 对用户信息进行查询、修改等管理功能。
  - 对电影票订单信息进行查询和管理
  - 票房统计：票房数据可视化
------------

**待实现功能**
- 影片搜索
- 影片评分
- 影片分类
- 待上映影片列表
- 等等......

------------

**登录/注册界面**

![image](https://user-images.githubusercontent.com/65523473/169646373-c4893b53-7ab9-4b07-9a3b-fdc9419ca680.png)


![image](https://user-images.githubusercontent.com/65523473/169646404-31af3734-adbc-40b2-9306-3e795a206343.png)

------------

**首页**

热映影片/票房排行

![image](https://user-images.githubusercontent.com/65523473/169645980-01bef80a-3d7c-4e22-8ee5-636b7a026d29.png)


待上映影片/ 评分排行

![image](https://user-images.githubusercontent.com/65523473/169646192-78b6295b-5bde-4607-afba-ffd071ca85a0.png)


**电影列表页**

![image](https://user-images.githubusercontent.com/65523473/169646271-00e9a877-963c-444a-9bfc-96218639e8c0.png)


**电影详情页**

![image](https://user-images.githubusercontent.com/65523473/169646286-cfb24158-9d8d-45a4-9445-2a7a4d17614f.png)


**电影购票页**

![image](https://user-images.githubusercontent.com/65523473/169646309-cf240dc2-a23e-4639-9b62-f5823026fa47.png)


**影院详情页**

![image](https://user-images.githubusercontent.com/65523473/169646348-ee69c034-5804-434c-a971-0fcdb9c805cd.png)


**选座页**

![image](https://user-images.githubusercontent.com/65523473/169646453-bcd9b739-2ee9-401e-a080-49f85df14619.png)


**订单提交**

![image](https://user-images.githubusercontent.com/65523473/169646472-81834383-8e94-4c5b-a629-ba35344b1575.png)

------------

**后台管理**

![image](https://user-images.githubusercontent.com/65523473/169646490-9587aa1b-31d2-4236-9283-2e3e20adfbf1.png)

![image](https://user-images.githubusercontent.com/65523473/169646501-48639484-4dbc-43c9-95b9-72f5e0884378.png)

![image](https://user-images.githubusercontent.com/65523473/169646550-cb857ebf-9af7-44af-b318-a8601c56ba9a.png)

![image](https://user-images.githubusercontent.com/65523473/169646514-7971f4ef-6faa-4f31-80e2-a1ab65888646.png)

![image](https://user-images.githubusercontent.com/65523473/169646528-3cfa5e1a-3b63-43b7-9a4f-9a78b37f1518.png)


