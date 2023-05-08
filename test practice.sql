

create table Actor(
	act_id int primary key identity(1,1),
	act_fname varchar(250),
	act_lname varchar(250),
	act_gender varchar(250)
)

create table genre(
	gen_id int primary key identity(1,1),
	gen_title varchar(250)
)
 
create table director(
	dir_id int primary key identity(1,1),
	dir_fname varchar(250),
	dir_lname varchar(250)
)




create table movie(
	mov_id int primary key identity(1,1),
	mov_title varchar(250),
	mov_year int,
	mov_time int,
	mov_lang varchar(250),
	mov_date_rel date,
	mov_release_country varchar(250) -- this is the name of the country(s) where the movie was released
)


create table movie_genres(
	mov_id int foreign key references movie(mov_id), -- primary key
	gen_id int foreign key references genre(gen_id),-- foreign key to genre
	constraint PK_movie_genres primary key (mov_id)
)


create table movie_director(
	mov_id int foreign key references movie(mov_id),-- foreign key to movie
	dir_id int foreign key references director(dir_id), -- foreign key to director
	constraint PK_movie_director primary key (mov_id,dir_id)
)

alter table movie_director
drop constraint PK_movie_director

alter table movie_director
add constraint PK_movie_director primary key (mov_id)


create table reviewer(
	rev_id int primary key identity(1,1), -- primary key
	rev_name varchar(250)-- this is the name of the reviewer
)



create table rating(
	mov_id int foreign key references movie(mov_id), --this is the ID of the movie, which is referencing the mov_id column of the table movie
	rev_id int foreign key references reviewer(rev_id),-- this is the ID of the reviewer, which is referencing the rev_id column of the table reviewer
	rev_stars int,-- this is indicates how many stars a reviewer rated for a review of a movie
	num_of_rating int,  -- this indicates how many ratings a movie achieved till date
	CONSTRAINT PK_rating PRIMARY KEY (mov_id,rev_id)
)



create table movie_cast(
	act_id int, -- this is ID of actor, which is referencing the act_id column of actor table
	mov_id int, -- this is the ID of the movie, which is referencing the mov_id column of the table movie
	role varchar(250),-- this is the name of a character in the movie, an actor acted for that character
	CONSTRAINT PK_movie_cast primary key(act_id,mov_id)
)

-- procedure for creating and updating Actor 

alter procedure SP_addActor
(
	@act_id int = null,
	@act_fname varchar(250),
	@act_lname varchar(250),
	@act_gender varchar(250)
)
as
begin
	if(@act_id is null)
		begin
			insert into Actor
			values (@act_fname,@act_lname,@act_gender)
		end
	else
		begin
			update Actor
			set act_fname = @act_fname,
				act_lname = @act_lname,
				act_gender = @act_gender
			where act_id = @act_id
		end
end

exec SP_addActor null, Ram, Charan, Male
exec SP_addActor null, Juniar, NTR, Male
exec SP_addActor null, Allu, Arjun, Male
exec SP_addActor null, Varun, Dhavan, Male
exec SP_addActor null, Ranvir, Sinh, Male
exec SP_addActor null, SusantSinh, Rajput, Male
exec SP_addActor null, Ranbir, Kapoor, Male


select * from Actor

-- procedure for creating and updating Genre 

create procedure SP_addGenre
(
	@gen_id int,
	@gen_title varchar(250)
)
as
begin
	if(@gen_id is null)
		begin
			insert into genre
			values (@gen_title)
		end
	else
		begin
			update genre
			set gen_title=@gen_title
			where gen_id = @gen_id
		end
end

exec SP_addGenre null, 'Action'
exec SP_addGenre null, 'Horrer'
exec SP_addGenre null, 'drama'
exec SP_addGenre null, 'Thriller'
exec SP_addGenre null, 'Science fiction'
exec SP_addGenre null, 'Romance'
exec SP_addGenre null, 'Crime films'


select * from genre


-- procedure for creating and updating  

alter procedure SP_addDirector
(
	@dir_id  int,
	@dir_fname varchar(250),
	@dir_lname varchar(250)
)
as
begin
	if(@dir_id is null)
		begin
			insert into director
			values (@dir_fname,@dir_lname)
		end
	else
		begin
			update director
			set dir_fname=@dir_fname,
				dir_lname=@dir_lname
			where dir_id = @dir_id
		end
end

exec SP_addDirector null, 'Mahesh','Parmar'
exec SP_addDirector null, 'Ramesh','suthar'
exec SP_addDirector null, 'Naresh','mannn'
exec SP_addDirector null, 'Rupesh','chitrod'
exec SP_addDirector null, 'Umesh','rajput'
exec SP_addDirector null, 'Paresh','limbani'
exec SP_addDirector null, 'Dhiresh','vakani'


select * from director


-- procedure for creating and updating  movie:

create procedure SP_addMovie
(
	@mov_id   int,
	@mov_title  varchar(250),
	@mov_year  varchar(250),
	@mov_time int,
	@mov_lang varchar(250),
	@mov_date_rel date,
	@mov_release_country varchar(250)
)
as
begin
	if(@mov_id is null)
		begin
			insert into movie
			values (@mov_title,@mov_year,@mov_time,@mov_lang,@mov_date_rel,@mov_release_country)
		end
	else
		begin
			update movie
			set mov_title=@mov_title,
				mov_year=@mov_year,
				mov_time=@mov_time,
				mov_lang=@mov_lang,
				mov_date_rel=@mov_date_rel,
				mov_release_country=@mov_release_country
			where mov_id = @mov_id
		end
end

exec SP_addMovie null, 'War',3,123,'Hindi','2016-05-08','India'
exec SP_addMovie null, 'Hera Pheri',2,132,'Hindi','2012-05-08','India'
exec SP_addMovie null, 'Dhamal',4,129,'Hindi','2013-05-08','Burma'
exec SP_addMovie null, 'De Dana Dan',2,156,'Hindi','2015-05-08','England'
exec SP_addMovie null, 'Dr Strange',1,167,'English','2017-05-08','Usa'
exec SP_addMovie null, 'Uri',3,165,'Hindi','2019-05-08','India'
exec SP_addMovie null, 'Judva',2,154,'Kannad','2020-05-08','Chaina'


select * from movie

-- procedure for creating and updating  Movie_Genres:

alter procedure SP_addMovie_Genres
(
	@mov_id  int,
	@gen_id  int,
	@add int=null
)
as
begin
	if(@add is null)
		begin
			insert into movie_genres
			values (@mov_id,@gen_id)
		end
	else
		begin
			update movie_genres
			set mov_id=@mov_id,
				gen_id=@gen_id
			where mov_id = @mov_id
		end
end

exec SP_addMovie_Genres 1,2
exec SP_addMovie_Genres 2,1
exec SP_addMovie_Genres 3,4
exec SP_addMovie_Genres 4,5
exec SP_addMovie_Genres 5,7
exec SP_addMovie_Genres 6,2
exec SP_addMovie_Genres 7,3,7
exec SP_addMovie_Genres 7,4,7


select * from movie
select * from genre
select * from movie_genres


-- procedure for creating and updating  movie_director:

alter procedure SP_addMovie_Director
(
	@mov_id int,
	@dir_id int,
	@add int = null
)
as
begin
	if(@add is null)
		begin
			insert into movie_director
			values (@mov_id,@dir_id)
		end
	else
		begin
			update movie_director
			set mov_id=@mov_id,
				dir_id=@dir_id
			where mov_id = @mov_id
		end
end

exec SP_addMovie_Director 1,2
exec SP_addMovie_Director 2,1
exec SP_addMovie_Director 3,4
exec SP_addMovie_Director 4,5
exec SP_addMovie_Director 5,7
exec SP_addMovie_Director 6,2
exec SP_addMovie_Director 7,3
exec SP_addMovie_Director 7,4,7


select * from movie
select * from director
select * from movie_director



-- procedure for creating and updating  movie_director:

create procedure SP_addReviewer
(
	@rev_id int=null,
	@rev_name varchar(250)
)
as
begin
	if(@rev_id is null)
		begin
			insert into reviewer
			values (@rev_name)
		end
	else
		begin
			update reviewer
			set rev_name=@rev_name
			where rev_id = @rev_id
		end
end

exec SP_addReviewer null,'Sanjay'
exec SP_addReviewer null,'Ateet'
exec SP_addReviewer null,'Chirag'
exec SP_addReviewer null,'Vikrant'
exec SP_addReviewer null,'Vishal'
exec SP_addReviewer null,'Ram'
exec SP_addReviewer null,'Darshan'
exec SP_addReviewer null,'Vivek'


select * from reviewer


-- procedure for creating and updating Rating:


alter procedure SP_addRating
(
	@mov_id int,
	@rev_id int,
	@rev_stars int,
	@action int=null
)
as
begin
	if(@action is null)
		begin
			insert into rating
			values (@mov_id, @rev_id, @rev_stars, (select count(*)+1 from rating where mov_id = @mov_id))
		end
	else
		begin
			update rating
			set mov_id = @mov_id,
				rev_id = @rev_id,
				rev_stars = @rev_stars
			where mov_id = @mov_id and rev_id = @rev_id
		end
end

exec SP_addRating 1,3,4
exec SP_addRating 2,2,5
exec SP_addRating 3,2,6
exec SP_addRating 4,3,4
exec SP_addRating 4,3,5
exec SP_addRating 5,1,4
exec SP_addRating 4,3,5
exec SP_addRating 7,6,3
exec SP_addRating 7,7,8


select * from rating



-- procedure for creating and updating movie_cast::


create procedure SP_addMovie_Cast
(
	@mov_id int,
	@act_id  int,
	@role varchar(256),
	@action int	= null
)
as
begin
	if(@action is null)
		begin
			insert into movie_cast
			values (@mov_id, @act_id, @role)
		end
	else
		begin
			update movie_cast
			set mov_id = @mov_id,
				act_id = @act_id,
				role = @role
			where mov_id = @mov_id and act_id = @act_id
		end
end

exec SP_addMovie_Cast 2,3,'Gabbar'
exec SP_addMovie_Cast 2,4,'Raju'
exec SP_addMovie_Cast 3,2,'Banna'
exec SP_addMovie_Cast 4,1,'Khiladi'
exec SP_addMovie_Cast 5,4,'JIusuoa'
exec SP_addMovie_Cast 6,5,'Maninnd'
exec SP_addMovie_Cast 1,6,'Dhola'
exec SP_addMovie_Cast 7,7,'Bajirao'


	select * from movie_cast


--(1) From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year


	select mov_title as MovieTitle,mov_year as Movie_Release_Year 
	from movie

--(2) From the following table, write a SQL query to find when the movie specific released. Return movie release year

	select mov_title as MovieTitle,year(mov_date_rel) as [Movie Release Year] 
	from movie 
	where mov_id=1
	
--(3) From the following table, write a SQL query to find the movie that was released in 1999. Return movie title.

	select mov_title as MovieTitle,year(mov_date_rel) as [Movie Release Year] 
	from movie 
	where year(mov_date_rel)='2016'

--(4) From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.

	select mov_title as MovieTitle,year(mov_date_rel) as [Movie Release Year] 
	from movie 
	where year(mov_date_rel)<'2016'

--(5) From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.

	select M.mov_title,rv.rev_name from rating RT
	inner join movie M on RT.mov_id=M.mov_id
	inner join reviewer RV on RT.rev_id=RV.rev_id

--(6) From the following table, write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name.

	select reviewer.rev_name from rating
	inner join reviewer on rating.rev_id=reviewer.rev_id
	where rating.rev_stars >= 7

--(7) From the following tables, write a SQL query to find the movies without any rating. Return movie title.

	select movie.mov_title from movie
	where mov_id not in(select mov_id from rating)

--(8) From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.

	select * from movie where mov_id in(1,2,3)

--(9) From the following table, write a SQL query to find the movie titles that contain the specific word. 
	  --Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year. 
		select mov_id as 'mov_id', mov_title as 'movie title' , year(mov_date_rel) as 'movie release year' 
		from movie 
		where mov_title like '%a%'
		order by year(mov_date_rel) asc

--(10) From the following table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID

		select * from Actor where act_fname='Akshay' and act_lname='Kumar'


--(11) get directors who have directed movies with avrage rating higher then 5

		select director.dir_fname from movie_director
		inner join director on movie_director.dir_id=director.dir_id
		where movie_director.mov_id in(
			select mov_id from rating
			group by mov_id
			having avg(rev_stars)>5
		)
	

--(12) get all actors who have worked for movies that were directed by specific director



		select Actor.act_fname from movie_director
		inner join director on movie_director.dir_id=director.dir_id
		inner join movie on movie.mov_id=movie_director.mov_id
		inner join movie_cast on movie.mov_id=movie_cast.mov_id
		inner join Actor on Actor.act_id=movie_cast.act_id
		where director.dir_id=1

		

--(13) create a stored proc to get list of movies which is 3 years old and having rating greater than 5


		create proc getMovies3YearOld
		as
		begin
			select DISTINCT movie.mov_title,movie.mov_date_rel from rating
			inner join movie on movie.mov_id=rating.mov_id
			where DATEDIFF(year, movie.mov_date_rel, GETDATE())>3
			group by movie.mov_title,movie.mov_date_rel
			having avg(rev_stars)>5
		end


		exec getMovies3YearOld
		
--(14) create a stored proc to get list of all directors who have directed more then 2 movies


		create proc getDirMov2()
		as
		begin
		 select count(*) from movie_director
		 inner join director on director.dir_id = movie_director.dir_id
		 group by movie_director.mov_id
		 having count(*) > 2
		end

--(15) create a stored proc to get list of all directors which have directed a movie which have rating greater than 3.
--(16) create a function to get worst director according to movie rating
--(17) create a function to get worst actor according to movie rating
--(18) create a parameterized stored procedure which accept genre and give movie accordingly 
--(19) get list of movies that start with 'a' and end with letter 'e' and movie released before 2015
--(20) get a movie with highest movie cast
--(21) create a function to get reviewer that has rated highest number of movies
--(22) From the following tables, write a query in SQL to generate a report, which contain the fields movie title, name of the female actor, year of the movie, role, movie genres, the director, date of release, and rating of that movie.
--(23) From the following tables, write a SQL query to find the years when most of the ‘Mystery Movies’ produced. Count the number of generic title and compute their average rating. Group the result set on movie release year, generic title. Return movie year, generic title, number of generic title and average rating.
--(24)  From the following tables, write a SQL query to find the highest-rated ‘Mystery Movies’. Return the title, year, and rating
--(25) create a function which accepts genre and suggests best movie according to ratings 
--(26) create a function which accepts genre and suggests best director according to ratings. 
--(27) create a function that accepts a genre and give random movie according to genre