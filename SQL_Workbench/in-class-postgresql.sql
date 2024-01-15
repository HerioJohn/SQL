Create table book (
	id serial primary key,
	author_id integer,
	book_name VARCHHAR(50) not null,
	constraint fk_author_id foreign key (author_id) references author (id);
);

create table author (
	id serial primary key, -- auto-incrementing integer
	author_name VARCHAR(50) not null,
	nat_code VARCHAR(2),
	constraint fk_author_nat_code foreign key(nat_code) references nationality(nat_code)
);

create table nationality (
	id serial primary key, -- auto-incrementing integer
	nat_code VARCHAR(2) unqiue not null,
	nat_desc VARCHAR(50) not null,
);

create table user (
	id serial primary key -- auto-incrementing integer
	user_name VARCHAR(50) not null
);