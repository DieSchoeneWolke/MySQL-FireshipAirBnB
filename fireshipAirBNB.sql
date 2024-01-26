-- hello world comment
-- DROP means delete

create table Users(
	id int primary key auto_increment,
	email varchar(255) not null unique,
	bio text,
	country varchar(2)
);

INSERT INTO Users (email, bio, country)
values (
	"hel@wor.com",
    "the bio",
    "DE"
    );

INSERT INTO Users (email, bio, country)
values 
("test@example.com", "bio again", "AT");

INSERT INTO Users (email, bio, country)
values 
	("test2@example.com", "bio again2", "FR"),
	("test3@example.com", "bio again3", "UK"),
	("test4@example.com", "bio again4", "CH");

select * from Users;

select id, country, email from Users
	where country = "AT"
	and email like "test%"
	order by id desc
	limit 2;

create index email_index on Users(email);

create table Rooms(
	id int auto_increment,
	street varchar(255),
	owner_id int not null,
	primary key (id),
	foreign key (owner_id) references Users(id)
);

insert into Rooms (owner_id, street)
values
	(1, "san diego sailboat"),
    (1, "san francisco rowboat"),
    (1, "san marino tugboat"),
    (1, "santa domingo fishboat");
    
select
	Users.id AS user_id,
    Rooms.id AS room_id,
    email,
    street
from Users
left join Rooms
on Rooms.owner_id = Users.id;

create table bookings (
	id int auto_increment,
    guest_id int not null,
    room_id int not null,
    check_in datetime,
    primary key (id),
    foreign key (guest_id) references Users(id),
    foreign key (room_id) references Rooms(id)
);

select
	guest_id,
    street,
    check_in
from Bookings
inner join Rooms on Rooms.owner_id = guest_id
where room_id = 2;
