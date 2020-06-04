create database BookWebsite
use BookWebsite

GO


--Auto generate ID

--Tự động tăng bID
CREATE FUNCTION AUTO_BookID()
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
	IF (SELECT COUNT(bID) FROM Books) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(bID, 3)) FROM Books
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'B000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'B00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'B0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'B' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END

--Tự động tăng userID
CREATE FUNCTION AUTO_UserID()
RETURNS VARCHAR(10)
AS
BEGIN
	DECLARE @ID VARCHAR(10)
	IF (SELECT COUNT(uID) FROM Users) = 0
		SET @ID = '0'
	ELSE
		SELECT @ID = MAX(RIGHT(uID, 3)) FROM Users
		SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN 'U000' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN 'U00' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 99 THEN 'U0' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 999 THEN 'U' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END


create table Categories
(catID nvarchar(10) not null primary key, 
catName nvarchar(50) not null)


create table Books
(bID nvarchar(10) not null primary key DEFAULT DBO.AUTO_BookID(),
 bName nvarchar(50) not null, 
 catID nvarchar(10) not null,
 bPrice float not null,
 tQuantity int not null, 
 bAuthor nvarchar(50) not null,
bDes nvarchar(1000) not null, 
bCover nvarchar(200), 
constraint FK_catID Foreign key(catID) references Categories(catID))


create table Users
(uID nvarchar(10) not null primary key DEFAULT DBO.AUTO_UserID(), 
uEmail nvarchar(30) not null, 
uPassword nvarchar(30) not null,
uName nvarchar(30) not null, 
uPhone nvarchar(10) not null,
uAddress nvarchar(30) not null)



create table Transactions
(tID nvarchar(10) not null primary key, 
uID nvarchar(10) not null,
bID nvarchar(10) not null,
tQuantity int not null,
status bit not null,
tDate Date default(getDate())
constraint FK_uID Foreign key(uID) references Users(uID),
constraint FK_bID Foreign key(bID) references Books(bID)  )

/* ============================CATEGORIES VALUES================================ */
GO
insert into Categories(catID, catName) values ('C001', 'Action and Adventure')
insert into Categories(catID, catName) values ('C002', 'Classic')
insert into Categories(catID, catName) values ('C003', 'Comic and Graphic Novel')
insert into Categories(catID, catName) values ('C004', 'Crime and Detective')
insert into Categories(catID, catName) values ('C005', 'Drama')
insert into Categories(catID, catName) values ('C006', 'Fable') /* truyện ngụ ngôn */
insert into Categories(catID, catName) values ('C007', 'Fairy Tale') /* truyện cổ tích */
insert into Categories(catID, catName) values ('C008', 'Fan-fiction') /* hư cấu */
insert into Categories(catID, catName) values ('C009', 'Humor')
insert into Categories(catID, catName) values ('C010', 'Horror')
insert into Categories(catID, catName) values ('C011', 'Romance')
insert into Categories(catID, catName) values ('C012', 'Science Fiction (Sci-Fi)')
insert into Categories(catID, catName) values ('C013', 'Reference Books') /* sách tham khảo */
insert into Categories(catID, catName) values ('C014', 'Textbook')
insert into Categories(catID, catName) values ('C015', 'Short Story')

/* ==============================PRODUCTS VALUES=============================== */
GO
--1 Action & Adventure


insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor, bDes)
values ('B0001','The Hobbit', 'C001', 300000, 10, 'J.R.R. Tolkien',
'The European languages are members of the same family.
Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary.
The languages only differ in their grammar, their pronunciation and their most common words.
Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.
To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words...')

--2 Action & Adventure
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0002','The Three Musketeers', 'C001', 400000, 20, ' Alexandre Dumas',
'A wonderful serenity has taken possession of my entire soul,
like these sweet mornings of spring which I enjoy with my whole heart.
I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
that I neglect my talents. I should be incapable of drawing a single stroke at the present moment...')

--3 Classic
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0003','To Kill a Mockingbird ', 'C002', 250000, 25, 'Harper Lee',
' I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
that I neglect my talents. I should be incapable of drawing a single stroke at the present moment;
and yet I feel that I never was a greater artist than now. When, while the lovely valley teems with vapour around me,
and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, 
and but a few stray gleams steal into the inner sanctuary, 
I throw myself down among the tall grass by the trickling stream...')

--4 Classic
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0004','Romeo and Juliet ', 'C002', 550000, 10, 'William Shakespeare',
' When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the 
impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, 
I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, 
a thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, 
and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence of the 
Almighty, who formed us in his own image, and the breath of that universal love which bears and sustains us, 
as it floats around us in an eternity of bliss; and then, my friend, when darkness overspreads my eyes, and heaven and 
earth...')

--5 Commic and Graphic Novel
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0005',' Batman: The Dark Knight Returns ', 'C003', 700000, 9, 'Frank Miller',
' But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and 
I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, 
the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, 
but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. 
Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because 
occasionally circumstances occur in which toil and pain can procure him some great pleasure....')

--6 Commic and Graphic Novel
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0006',' V for Vendetta ', 'C003', 350000, 12, 'Alan Moore',
' Drops of rain could be heard hitting the pane, which made him feel quite sad. "How about if I sleep a little bit 
longer and forget all this nonsense", he thought, but that was something he was unable to do because he was used to 
sleeping on his right, and in his present state couldnt get into that position. However hard he threw himself onto 
his right, he always rolled back to where he was. He must have tried it a hundred times, shut his eyes so that he 
wouldnt have to look at the floundering legs, and only stopped when he began to feel a mild, dull pain there that 
he had never felt before...')

--7 Crime and Detective
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0007',' Sherlock Holmes ', 'C004', 1000000,30, 'Arthur Conan Doyle',
' "Oh, God", he thought, "what a strenuous career it is that I have chosen! Travelling day in and day out. 
Doing business like this takes much more effort than doing your own business at home, and on top of that there is the 
curse of travelling, worries about making train connections, bad and irregular food, contact with different people all 
the time so that you can never get to know anyone or become friendly with them. It can all go to Hell!...')

--8 Crime and Detective
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0008',' Murder on The Orient Express ', 'C004', 800000, 15, ' Agatha Christie',
' He felt a slight itch up on his belly; pushed himself slowly up on his back towards the headboard so that he could 
lift his head better; found where the itch was, and saw that it was covered with lots of little white spots which he 
didnt know what to make of; and when he tried to feel the place with one of his legs he drew it quickly back because 
as soon as he touched it he was overcome by a cold shudder. He slid back into his former position. 
"Getting up early all the time", he thought, "it makes you stupid. You have got to get enough sleep. 
Other travelling salesmen live a life of luxury...')

--9 Drama
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0009',' Hamlet ', 'C005', 635000, 22, ' William Shakespeare',
' And it is a funny sort of business to be sitting up there at your desk, talking down at your subordinates from up 
there, especially when you have to go right up close because the boss is hard of hearing. Well, there is still some 
hope; once I have got the money together to pay off my parents debt to him - another five or six years I suppose - 
that is definitely what I will do. That is when I will make the big change. First of all though, I have got to get up, 
my train leaves at five. " And he looked over at the alarm clock, ticking on the chest of drawers. "God in Heaven! " 
he thought. It was half past six and the hands were quietly moving forwards, it was even later than half past, 
more like quarter to seven. Had the alarm clock not rung?...')

--10 Drama
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0010',' The Crucible ', 'C005', 600000, 20, ' Arthur Miller',
' He could see from the bed that it had been set for four o clock as it should have been; it certainly must have rung. 
Yes, but was it possible to quietly sleep through that furniture-rattling noise? True, he had not slept peacefully, 
but probably all the more deeply because of that. What should he do now? The next train went at seven; if he were to 
catch that he would have to rush like mad and the collection of samples was still not packed, and he did not at all 
feel particularly fresh and lively. And even if he did catch the train he would not avoid his boss is anger as the 
office assistant would have been there to see the five o clock train go, he would have put in his report about 
Gregor...')

--11 Fable
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0011',' Trí khôn của ta đây ', 'C006', 90000, 13, ' Sưu tầm ',
' "Từ đó, cọp sinh ra con nào trên mình cũng có những vằn đen dài"
Một con cọp từ trong rừng đi ra, thấy một anh nông dân cùng một con trâu đang cày dưới ruộng. 
Trâu cặm cụi đi từng bước, lâu lâu lại bị quất một roi vào mông. Cọp lấy làm ngạc nhiên. Đến trưa, mở cày, 
Cọp liền đi lại gần Trâu hỏi:
- Này, trông anh khỏe thế, sao anh lại để cho người đánh đập khổ sở như vậy? 
Trâu trả lời khẽ vào tai Cọp:
.... ')

--12 Fable
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0012',' The Fox and The Grapes ', 'C006', 100000, 35, ' Đen Vâu',
'Anh như con cáo 
 Em như một cành nho xanh
Khi em còn trẻ và đẹp
Em lại không dành cho anh
Trong lòng anh là kho xăng
Nụ cười em là mồi lửa
Em phá vỡ đi quy tắc
Rồi bỏ mặc anh ngồi sửa
Anh như biến thành người nhện
Vì trong lòng nhiều tơ vương
Nhớ em tốn nhiều ca-lo
Thế nên anh gầy trơ xương
Ở trong xóm anh rất ngoan
Chẳng ai thấy anh say mèm
Mẹ anh dặn anh đủ thứ
Nhưng quên dặn đừng say em
Như con cuốn chiếu
Anh có rất nhiều chân thật
Bài hát này ngọt
Vì đám tụi anh rất thân mật
Anh như con cáo và em vẫn cành nho xanh
Nhưng mà em trẻ và đẹp
Em lại không dành cho anh ...')

--13 Fairy Tale
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0013',' Rapunzel ', 'C007', 50000, 18, ' Brothers Grimm',
' Drops of rain could be heard hitting the pane, which made him feel quite sad. 
"How about if I sleep a little bit longer and forget all this nonsense", he thought, but that was something he was 
unable to do because he was used to sleeping on his right, and in his present state couldnt get into that position. 
However hard he threw himself onto his right, he always rolled back to where he was. He must have tried it a hundred 
times, shut his eyes so that he wouldnt have to look at the floundering legs, and only stopped when he began to feel 
a mild, dull pain there that he had never felt before...')

--14 Fairy Tale
 insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0014',' Beauty And The Beast ', 'C007', 70000, 25, ' Gabrielle-Suzanne de Villeneuve',
' He slid back into his former position. "Getting up early all the time", he thought, "it makes you stupid. 
You have got to get enough sleep. Other travelling salesmen live a life of luxury. For instance, whenever I go back 
to the guest house during the morning to copy out the contract, these gentlemen are always still sitting there eating 
their breakfasts. I ought to just try that with my boss; I would get kicked out on the spot. But who knows, 
maybe that would be the best thing for me. If I didnt have my parents to think about I would have given in my notice a 
long time ago, I would have gone up to the boss and told him just what I think...')

--15 Fan-fiction
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0015',' Harry Potter And The Method of Rationality ', 'C008', 900000, 40, ' Eliezer Yudkowsky',
'Harry had a thin face, knobbly knees, black hair and bright-green eyes. 
He wore round glasses held together with a lot of Sellotape because of all the times Dudley had punched 
him on the nose. The only thing Harry liked about his own appearance was a very thin scar on his forehead which was 
shaped like a bolt of lightning. He had had it as long as he could remember and the first question he could ever 
remember asking his Aunt Petunia was how he had got it....')

--16 Fan-fiction
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0016',' Fangirl  ', 'C008', 900000, 15, 'Rainbow Rowell',
'A collection of textile samples lay spread out on the table - 
Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an 
illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur 
boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. 
Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, 
which made him feel quite sad.....')

--17 Humor

insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0017',' The Hitchhiker’s Guide to The Galaxy  ', 'C009', 100000, 14, 'Douglas Adams',
'"How about if I sleep a little bit longer and forget all this nonsense", he thought, but that was something he was 
unable to do because he was used to sleeping on his right, and in his present state couldnt get into that position. 
However hard he threw himself onto his right, he always rolled back to where he was. He must have tried it a hundred 
times, shut his eyes so that he wouldnt have to look at the floundering legs, and only stopped when he began to feel 
a mild, dull pain there that he had never felt before...')

--18 Humor
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0018',' Three Men in a Boat ', 'C009', 200000, 22, 'Jerome K. Jerome',
'A collection of textile samples lay spread out on the table - Samsa was a travelling salesman -
 and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, 
 gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that 
 covered the whole of her lower arm towards the viewer...')

--19 Horror
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0019',' The Shining', 'C010', 300000, 20, ' Stephen King',
'He must have tried it a hundred times, shut his eyes so that he wouldnt have to look at the floundering legs, 
and only stopped when he began to feel a mild, dull pain there that he had never felt before...')

--20 Horror
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0020',' It', 'C010', 300000, 17, ' Stephen King',
'His boss would certainly come round with the doctor from the medical insurance company, 
accuse his parents of having a lazy son, and accept the doctor s recommendation not to make any claim as the doctor 
believed that no-one was ever ill but that many were workshy...')

--21 Romance
insert into Books(bID,bName,catID,bPrice, tQuantity,bAuthor,bDes)
values ('B0021','Fifty Shades of Grey', 'C011', 2000000, 38, ' E.L James',
'He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, 
slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed 
ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him...')

--22 Romance
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0022', 'Perfect Chemistry ', 'C011', 1900000, 20, ' Simone Elkeles',
'"What is happened to me? " he thought. It wasnt a dream. His room, a proper human room although a little too small, 
lay peacefully between its four familiar walls....')

--23 Science Fiction (Sci-Fi)
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0023', 'Dune ', 'C012', 500000, 21, ' Frank Herbert',
'Worries about making train connections, bad and irregular food, contact with different people all the time so that 
you can never get to know anyone or become friendly with them. It can all go to Hell! " He felt a slight itch up on 
his belly; pushed himself slowly up on his back towards the headboard so that he could lift his head better; 
found where the itch was, and saw that it was covered with lots of little white spots which he didnt know what to make 
of...')

--24 Science Fiction (Sci-Fi)
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0024', 'The Hunger Games', 'C012', 600000, 30, ' Suzanne Collins',
'I go back to the guest house during the morning to copy out the contract, these gentlemen are always still sitting 
there eating their breakfasts. I ought to just try that with my boss; I would get kicked out on the spot. 
But who knows, maybe that would be the best thing for me...')

--25 Reference Books
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0025', 'Dictionary VietName_Japan', 'C013', 350000, 22, ' NIHONSEI',
'Ohayoogozaimasu, watashiha danieru desu, chuugokujin desu , betonamugogadaisuki desu ... ')

--26 Reference Books
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0026', 'The Vintage Cars 1886-1940 ', 'C013', 650000, 16, 'Rob de la Rive Box',
'Discrete mathematics is the study of mathematical structures that are fundamentally discrete rather than continuous. 
In contrast to real numbers that have the property of varying "smoothly".')

--27 Textbook
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0027', 'Discrete Mathematics 7th Edition', 'C014',5527421, 50, 'Lam Thanh',
'Discrete mathematics is the study of mathematical structures that are fundamentally discrete rather than continuous. 
In contrast to real numbers that have the property of varying "smoothly".')

--28 Textbook
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0028', 'Vietnam: A History ', 'C014', 280000, 30, ' Stanley Karnow',
'A landmark work...The most complete account to date of the Vietnam tragedy." -The Washington Post Book World... ')

--29 Short Story
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0029', 'The Lottery', 'C015', 150000, 5, ' Shirley Jackson',
'Tell him everything I would, let him know just what I feel. He would fall right off his desk! And it is a funny sort 
of business to be sitting up there at your desk, talking down at your subordinates from up there, especially when you 
have to go right up close because the boss is hard of hearing. Well, there is still some hope; once I have got the money 
together to pay off my parents debt to him... ')

--30 Short Story
insert into Books(bID,bName,catID,bPrice, tQuantity, bAuthor,bDes)
values ('B0030', 'The Illustrated Man', 'C015', 200000, 25, 'Ray Bradbury',
'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a 
horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, 
slightly domed and divided by arches into stiff... ')



/*======================================USER INFO VALUES==============================================*/
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0001','lam@gmail.com','123','Lam ML','0000000000',' Somewhere in china ')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0002','dat09@gmail.com','456','Dat 1 phit','1111111111','Viet Nam')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0003','tue@gmail.com','789','Tue','2222222222', ' Viet Nam ')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0004','phat@gmail.com','246','Phat','3333333333', 'Viet Nam')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0005','phuc@gmail.com','135','Phuc','4444444444', 'Viet Nam, Nihon, Kankoku')





/*=======================================TRANSACTIONS VALUES==========================================*/


--1 U0001
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T001','U0001','B0001', 2, '0', getdate())
--2
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T002','U0001','B0008', 3, '1', getdate())
--3
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T003','U0001','B0013', 1, '1', getdate())

--4 U0002
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T004','U0002','B0002', 1, '1', getdate())
--5
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T005','U0002','B0009', 3, '0', getdate())
--6
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T006','U0002','B0012', 3, '1', getdate())

--7 U0003
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T007','U0003','B0030', 1, '1', getdate())
--8
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T008','U0003','B0015', 2, '1', getdate())
--9
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T009','U0003','B0022', 3, '0', getdate())

--10 U0004
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T010','U0004','B0012', 2, '0', getdate())
--11
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T011','U0004','B0019', 3, '0', getdate())
--12
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T012','U0004','B0001', 3, '1', getdate())

--13 U0005
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T013','U0001','B0014', 4, '1', getdate())

--14
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T014','U0001','B0025', 2, '1', getdate())
--15
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T015','U0001','B0002', 2, '1', getdate())







select * from Categories
select * from Books
select * from Users
select * from Transactions

