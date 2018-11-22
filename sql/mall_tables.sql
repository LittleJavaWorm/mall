/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/11/9 星期五 上午 0:09:49                     */
/*==============================================================*/


alter table t_goods 
   drop foreign key FK_T_GOODS_REFERENCE_T_GOODS_;

alter table t_goods_orders 
   drop foreign key FK_T_GOODS__REFERENCE_T_GOODS;

alter table t_goods_orders 
   drop foreign key FK_T_GOODS__REFERENCE_T_ORDER;

alter table t_headPortrait 
   drop foreign key FK_T_HEADPO_REFERENCE_T_USER;

alter table t_shippingAddress 
   drop foreign key FK_T_SHIPPI_REFERENCE_T_USER;

drop table if exists t_areas;

drop table if exists t_cart;


alter table t_goods 
   drop foreign key FK_T_GOODS_REFERENCE_T_GOODS_;

drop table if exists t_goods;

drop table if exists t_goods_category;


alter table t_goods_orders 
   drop foreign key FK_T_GOODS__REFERENCE_T_GOODS;

alter table t_goods_orders 
   drop foreign key FK_T_GOODS__REFERENCE_T_ORDER;

drop table if exists t_goods_orders;


alter table t_headPortrait 
   drop foreign key FK_T_HEADPO_REFERENCE_T_USER;

drop table if exists t_headPortrait;

drop table if exists t_order;


alter table t_shippingAddress 
   drop foreign key FK_T_SHIPPI_REFERENCE_T_USER;

drop table if exists t_shippingAddress;

drop table if exists t_user;

/*==============================================================*/
/* Table: t_areas                                               */
/*==============================================================*/
create table t_areas
(
   areaId               varchar(32) not null  comment '区域ID',
   parentId             varchar(32)  comment '父ID',
   areaName             varchar(20) not null  comment '区域名称',
   areaType             tinyint(4) not null  comment '',
   isDisplay            tinyint(4) not null  comment '',
   status               tinyint(4)  comment '',
   areaSort             char(10) not null  comment '',
   primary key (areaId)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_areas comment '区域表';

/*==============================================================*/
/* Table: t_cart                                                */
/*==============================================================*/
create table t_cart
(
   id                   varchar(32) not null  comment '',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_cart comment '购物车表';

/*==============================================================*/
/* Table: t_goods                                               */
/*==============================================================*/
create table t_goods
(
   id                   varchar(32) not null  comment '',
   name                 varchar(20) not null  comment '',
   mallPrice            int(11)  comment '',
   marketPrice          int(11)  comment '',
   imagePath            varchar(128)  comment '',
   description          varchar(255)  comment '',
   firstAddTime         datetime not null  comment '',
   isHot                boolean  comment '',
   isSoldOut            boolean  comment '',
   categoryId           varchar(32)  comment '',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_goods comment '商品表';

/*==============================================================*/
/* Table: t_goods_category                                      */
/*==============================================================*/
create table t_goods_category
(
   id                   varchar(32) not null  comment '',
   name                 varchar(20) not null  comment '',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_goods_category comment '商品分类表';

/*==============================================================*/
/* Table: t_goods_orders                                        */
/*==============================================================*/
create table t_goods_orders
(
   id                   varchar(32) not null  comment '',
   goodId               varchar(32) not null  comment '',
   orderId              varchar(32) not null  comment '',
   goodNumber           int(11)  comment '',
   subtotalPrice        int(11)  comment '',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

/*==============================================================*/
/* Table: t_headPortrait                                        */
/*==============================================================*/
create table t_headPortrait
(
   id                   varchar(32) not null  comment '',
   path                 varchar(128) not null  comment '',
   name                 varchar(32)  comment '',
   userId               varchar(32) not null  comment '',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_headPortrait comment '头像表';

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   varchar(32) not null  comment '',
   price                int(11) not null  comment '',
   status               tinyint(4) not null  comment '',
   orderTime            datetime not null  comment '',
   userId               varchar(32) not null  comment '',
   shippingAddressId    varchar(32) not null  comment '',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_order comment '订单表';

/*==============================================================*/
/* Table: t_shippingAddress                                     */
/*==============================================================*/
create table t_shippingAddress
(
   id                   varchar(32) not null  comment '地址ID',
   userId               varchar(32) not null  comment '用户ID',
   isDefault            boolean not null  comment '是否为默认地址',
   cellPhoneNumber      varchar(20)  comment '收货人手机号码',
   telePhone            varchar(20)  comment '收货人电话',
   consignee            varchar(32) not null  comment '收货人',
   postcode             varchar(6)  comment '邮编',
   provinceId           int(11) not null  comment '地址所属省',
   cityId               int(11) not null  comment '地址所属市',
   countyId             int(11) not null  comment '地址所属区县',
   communityId          int(11) not null  comment '社区',
   address              varchar(255) not null  comment '详细地址',
   isDeleted            boolean not null  comment '地址是否被删除',
   createTime           datetime not null  comment '创建时间',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_shippingAddress comment '用户可以有多个收货地址';

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   varchar(32) not null  comment '用户ID',
   name                 varchar(20)  comment '用户名',
   gender               tinyint(4) not null  comment '性别',
   password             varchar(64) not null  comment '密码',
   nickName             varchar(32) not null  comment '昵称',
   email                varchar(32) not null  comment '邮箱',
   address              varchar(255)  comment '地址',
   cellPhoneNumber      varchar(20)  comment '手机号码',
   birthday             datetime  comment '生日',
   activationCode       varchar(64)  comment '激活码',
   isActivated          tinyint(4) not null  comment '是否激活',
   regTime              datetime  comment '注册时间',
   lastLoginTime        datetime  comment '最后一次登录时间',
   headPortraitId       varchar(32)  comment '当前头像ID',
   memberLevel          tinyint(4) not null  comment '会员等级',
   primary key (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

alter table t_user comment '用户表';

alter table t_goods add constraint FK_T_GOODS_REFERENCE_T_GOODS_ foreign key (categoryId)
      references t_goods_category (id) on delete restrict on update restrict;

alter table t_goods_orders add constraint FK_T_GOODS__REFERENCE_T_GOODS foreign key (goodId)
      references t_goods (id) on delete restrict on update restrict;

alter table t_goods_orders add constraint FK_T_GOODS__REFERENCE_T_ORDER foreign key (orderId)
      references t_order (id) on delete restrict on update restrict;

alter table t_headPortrait add constraint FK_T_HEADPO_REFERENCE_T_USER foreign key (userId)
      references t_user (id) on delete restrict on update restrict;

alter table t_shippingAddress add constraint FK_T_SHIPPI_REFERENCE_T_USER foreign key (userId)
      references t_user (id) on delete restrict on update restrict;

