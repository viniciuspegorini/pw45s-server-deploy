create table category (
                          id bigint generated by default as identity,
                          name varchar(50) not null,
                          primary key (id)
);

create table product (
                         id bigint generated by default as identity,
                         description varchar(1024) not null,
                         name varchar(100) not null,
                         image_name varchar(100),
                         content_type varchar(100),
                         price decimal not null,
                         category_id bigint,
                         primary key (id)
);
create table tb_user (
                         id bigint generated by default as identity,
                         display_name varchar(255),
                         password varchar(255),
                         username varchar(255),
                         provider varchar(255),
                         primary key (id)
);
create table tb_authority (
                              id bigint generated by default as identity,
                              authority varchar(255),
                              primary key (id)
);
create table tb_user_authorities (
                                     user_id bigint,
                                     authority_id bigint,
                                     primary key (user_id, authority_id)
);
alter table product add constraint FK_Category_Product
    foreign key (category_id) references category;

alter table tb_user_authorities add constraint FK_User_Authority
    foreign key (user_id) references tb_user;
alter table tb_user_authorities add constraint FK_Authority_User
    foreign key (authority_id) references tb_authority;
