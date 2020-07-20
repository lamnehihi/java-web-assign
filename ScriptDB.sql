create database BookWebsite
go
use BookWebsite
GO

--Hiiii
--Hiiiiiiiiiiiiiiii

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
RETURNS VARCHAR(5)
AS
BEGIN
	DECLARE @ID VARCHAR(5)
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
 bQuantity int not null, 
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
(tID nvarchar(10) not null, 
uID nvarchar(10) not null,
bID nvarchar(10) not null,
tQuantity int not null,
status bit not null,
tDate Date default(getDate())
constraint PK Primary Key(tID,bID),
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


insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor, bDes)
values ('B0001', 'The Hobbit', 'C001', 300000, 10, 'J.R.R. Tolkien',
'The European languages are members of the same family.
Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary.
The languages only differ in their grammar, their pronunciation and their most common words.
Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.
To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words...')

--2 Action & Adventure
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0002', 'The Three Musketeers', 'C001', 400000, 20, 'Alexandre Dumas',
'A wonderful serenity has taken possession of my entire soul,
like these sweet mornings of spring which I enjoy with my whole heart.
I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
that I neglect my talents. I should be incapable of drawing a single stroke at the present moment...')

--3 Classic
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0003', 'To Kill a Mockingbird', 'C002', 250000, 25, 'Harper Lee',
' I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
that I neglect my talents. I should be incapable of drawing a single stroke at the present moment;
and yet I feel that I never was a greater artist than now. When, while the lovely valley teems with vapour around me,
and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, 
and but a few stray gleams steal into the inner sanctuary, 
I throw myself down among the tall grass by the trickling stream...')

--4 Classic
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0004', 'Romeo and Juliet', 'C002', 550000, 10, 'William Shakespeare',
' When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the 
impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, 
I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, 
a thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, 
and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence of the 
Almighty, who formed us in his own image, and the breath of that universal love which bears and sustains us, 
as it floats around us in an eternity of bliss; and then, my friend, when darkness overspreads my eyes, and heaven and 
earth...')

--5 Commic and Graphic Novel
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0005', 'Batman: The Dark Knight Returns', 'C003', 700000, 9, 'Frank Miller',
' But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and 
I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, 
the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, 
but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. 
Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because 
occasionally circumstances occur in which toil and pain can procure him some great pleasure....')

--6 Commic and Graphic Novel
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0006', 'V for Vendetta', 'C003', 350000, 12, 'Alan Moore',
' Drops of rain could be heard hitting the pane, which made him feel quite sad. "How about if I sleep a little bit 
longer and forget all this nonsense", he thought, but that was something he was unable to do because he was used to 
sleeping on his right, and in his present state couldnt get into that position. However hard he threw himself onto 
his right, he always rolled back to where he was. He must have tried it a hundred times, shut his eyes so that he 
wouldnt have to look at the floundering legs, and only stopped when he began to feel a mild, dull pain there that 
he had never felt before...')

--7 Crime and Detective
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0007', 'Sherlock Holmes', 'C004', 1000000,30, 'Arthur Conan Doyle',
' "Oh, God", he thought, "what a strenuous career it is that I have chosen! Travelling day in and day out. 
Doing business like this takes much more effort than doing your own business at home, and on top of that there is the 
curse of travelling, worries about making train connections, bad and irregular food, contact with different people all 
the time so that you can never get to know anyone or become friendly with them. It can all go to Hell!...')

--8 Crime and Detective
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0008', 'Murder on The Orient Express', 'C004', 800000, 15, 'Agatha Christie',
' He felt a slight itch up on his belly; pushed himself slowly up on his back towards the headboard so that he could 
lift his head better; found where the itch was, and saw that it was covered with lots of little white spots which he 
didnt know what to make of; and when he tried to feel the place with one of his legs he drew it quickly back because 
as soon as he touched it he was overcome by a cold shudder. He slid back into his former position. 
"Getting up early all the time", he thought, "it makes you stupid. You have got to get enough sleep. 
Other travelling salesmen live a life of luxury...')

--9 Drama
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0009', 'Hamlet', 'C005', 635000, 22, 'William Shakespeare',
' And it is a funny sort of business to be sitting up there at your desk, talking down at your subordinates from up 
there, especially when you have to go right up close because the boss is hard of hearing. Well, there is still some 
hope; once I have got the money together to pay off my parents debt to him - another five or six years I suppose - 
that is definitely what I will do. That is when I will make the big change. First of all though, I have got to get up, 
my train leaves at five. " And he looked over at the alarm clock, ticking on the chest of drawers. "God in Heaven! " 
he thought. It was half past six and the hands were quietly moving forwards, it was even later than half past, 
more like quarter to seven. Had the alarm clock not rung?...')

--10 Drama
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0010', 'The Crucible', 'C005', 600000, 20, 'Arthur Miller',
' He could see from the bed that it had been set for four o clock as it should have been; it certainly must have rung. 
Yes, but was it possible to quietly sleep through that furniture-rattling noise? True, he had not slept peacefully, 
but probably all the more deeply because of that. What should he do now? The next train went at seven; if he were to 
catch that he would have to rush like mad and the collection of samples was still not packed, and he did not at all 
feel particularly fresh and lively. And even if he did catch the train he would not avoid his boss is anger as the 
office assistant would have been there to see the five o clock train go, he would have put in his report about 
Gregor...')

--11 Fable
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0011', 'Trí khôn của ta đây', 'C006', 90000, 13, 'Sưu tầm',
' "Từ đó, cọp sinh ra con nào trên mình cũng có những vằn đen dài"
Một con cọp từ trong rừng đi ra, thấy một anh nông dân cùng một con trâu đang cày dưới ruộng. 
Trâu cặm cụi đi từng bước, lâu lâu lại bị quất một roi vào mông. Cọp lấy làm ngạc nhiên. Đến trưa, mở cày, 
Cọp liền đi lại gần Trâu hỏi:
- Này, trông anh khỏe thế, sao anh lại để cho người đánh đập khổ sở như vậy? 
Trâu trả lời khẽ vào tai Cọp:
.... ')

--12 Fable
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0012', 'The Fox and The Grapes', 'C006', 100000, 35, 'Đen Vâu',
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
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0013', 'Rapunzel', 'C007', 50000, 18, 'Brothers Grimm',
' Drops of rain could be heard hitting the pane, which made him feel quite sad. 
"How about if I sleep a little bit longer and forget all this nonsense", he thought, but that was something he was 
unable to do because he was used to sleeping on his right, and in his present state couldnt get into that position. 
However hard he threw himself onto his right, he always rolled back to where he was. He must have tried it a hundred 
times, shut his eyes so that he wouldnt have to look at the floundering legs, and only stopped when he began to feel 
a mild, dull pain there that he had never felt before...')

--14 Fairy Tale
 insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0014', 'Beauty And The Beast', 'C007', 70000, 25, 'Gabrielle-Suzanne de Villeneuve',
' He slid back into his former position. "Getting up early all the time", he thought, "it makes you stupid. 
You have got to get enough sleep. Other travelling salesmen live a life of luxury. For instance, whenever I go back 
to the guest house during the morning to copy out the contract, these gentlemen are always still sitting there eating 
their breakfasts. I ought to just try that with my boss; I would get kicked out on the spot. But who knows, 
maybe that would be the best thing for me. If I didnt have my parents to think about I would have given in my notice a 
long time ago, I would have gone up to the boss and told him just what I think...')

--15 Fan-fiction
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0015', 'Harry Potter And The Method of Rationality', 'C008', 900000, 40, 'Eliezer Yudkowsky',
'Harry had a thin face, knobbly knees, black hair and bright-green eyes. 
He wore round glasses held together with a lot of Sellotape because of all the times Dudley had punched 
him on the nose. The only thing Harry liked about his own appearance was a very thin scar on his forehead which was 
shaped like a bolt of lightning. He had had it as long as he could remember and the first question he could ever 
remember asking his Aunt Petunia was how he had got it....')

--16 Fan-fiction
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0016', 'Fangirl', 'C008', 900000, 15, 'Rainbow Rowell',
'A collection of textile samples lay spread out on the table - 
Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an 
illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur 
boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. 
Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, 
which made him feel quite sad.....')

--17 Humor

insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0017','The Hitchhiker’s Guide to The Galaxy', 'C009', 100000, 14, 'Douglas Adams',
'"How about if I sleep a little bit longer and forget all this nonsense", he thought, but that was something he was 
unable to do because he was used to sleeping on his right, and in his present state couldnt get into that position. 
However hard he threw himself onto his right, he always rolled back to where he was. He must have tried it a hundred 
times, shut his eyes so that he wouldnt have to look at the floundering legs, and only stopped when he began to feel 
a mild, dull pain there that he had never felt before...')

--18 Humor
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0018','Three Men in a Boat', 'C009', 200000, 22, 'Jerome K. Jerome',
'A collection of textile samples lay spread out on the table - Samsa was a travelling salesman -
 and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, 
 gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that 
 covered the whole of her lower arm towards the viewer...')

--19 Horror
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0019','The Shining', 'C010', 300000, 20, 'Stephen King',
'He must have tried it a hundred times, shut his eyes so that he wouldnt have to look at the floundering legs, 
and only stopped when he began to feel a mild, dull pain there that he had never felt before...')

--20 Horror
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0020','It', 'C010', 300000, 17, 'Stephen King',
'His boss would certainly come round with the doctor from the medical insurance company, 
accuse his parents of having a lazy son, and accept the doctor s recommendation not to make any claim as the doctor 
believed that no-one was ever ill but that many were workshy...')

--21 Romance
insert into Books(bID,bName,catID,bPrice, bQuantity,bAuthor,bDes)
values ('B0021','Fifty Shades of Grey', 'C011', 2000000, 38, 'E.L James',
'He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, 
slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed 
ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him...')

--22 Romance
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0022', 'Perfect Chemistry', 'C011', 1900000, 20, 'Simone Elkeles',
'"What is happened to me? " he thought. It wasnt a dream. His room, a proper human room although a little too small, 
lay peacefully between its four familiar walls....')

--23 Science Fiction (Sci-Fi)
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0023', 'Dune', 'C012', 500000, 21, 'Frank Herbert',
'Worries about making train connections, bad and irregular food, contact with different people all the time so that 
you can never get to know anyone or become friendly with them. It can all go to Hell! " He felt a slight itch up on 
his belly; pushed himself slowly up on his back towards the headboard so that he could lift his head better; 
found where the itch was, and saw that it was covered with lots of little white spots which he didnt know what to make 
of...')

--24 Science Fiction (Sci-Fi)
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0024', 'The Hunger Games', 'C012', 600000, 30, 'Suzanne Collins',
'I go back to the guest house during the morning to copy out the contract, these gentlemen are always still sitting 
there eating their breakfasts. I ought to just try that with my boss; I would get kicked out on the spot. 
But who knows, maybe that would be the best thing for me...')

--25 Reference Books
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0025', 'Dictionary VietName_Japan', 'C013', 350000, 22, 'NIHONSEI',
'Ohayoogozaimasu, watashiha danieru desu, chuugokujin desu , betonamugogadaisuki desu ... ')

--26 Reference Books
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0026', 'The Vintage Cars 1886-1940 ', 'C013', 650000, 16, 'Rob de la Rive Box',
'Discrete mathematics is the study of mathematical structures that are fundamentally discrete rather than continuous. 
In contrast to real numbers that have the property of varying "smoothly".')

--27 Textbook
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0027', 'Discrete Mathematics 7th Edition', 'C014',5527421, 50, 'Lam Thanh',
'Discrete mathematics is the study of mathematical structures that are fundamentally discrete rather than continuous. 
In contrast to real numbers that have the property of varying "smoothly".')

--28 Textbook
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0028', 'Vietnam: A History ', 'C014', 280000, 30, 'Stanley Karnow',
'A landmark work...The most complete account to date of the Vietnam tragedy." -The Washington Post Book World... ')

--29 Short Story
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
values ('B0029', 'The Lottery', 'C015', 150000, 5, 'Shirley Jackson',
'Tell him everything I would, let him know just what I feel. He would fall right off his desk! And it is a funny sort 
of business to be sitting up there at your desk, talking down at your subordinates from up there, especially when you 
have to go right up close because the boss is hard of hearing. Well, there is still some hope; once I have got the money 
together to pay off my parents debt to him... ')

--30 Short Story
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes)
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
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('lam@gmail.com','123','Lam ML','0000000000',' Somewhere in chinaaaa ')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('dat09@gmail.com','456','Dat 1 phit','1111111111','Viet Nammmm')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('tue@gmail.com','789','Tue','2222222222', ' Viet Nammmmm ')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('phat@gmail.com','246','Phat','3333333333', 'Viet Nammmmm')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('phuc@gmail.com','135','Phuc','4444444444', 'Viet Nam, Nihon, Kankokuuuuu')





/*=======================================TRANSACTIONS VALUES==========================================*/


--1 U0001
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T001','U0001','B0001', 2, '0', getdate()),
		('T001','U0001','B0003', 1, '0', getdate())
--2
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T002','U0001','B0008', 3, '1', getdate()),('T002','U0001','B0002', 1, '1', getdate())
--3
insert into Transactions(tID, uID, bID,tQuantity, status, tDate) 
values ('T003','U0001','B0013', 1, '1', getdate()),('T003','U0001','B0003', 2, '1', getdate())

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


-----------------------------------------------------------Update 30 books cover---------------------------------------------------
UPDATE Books SET bCover = 'https://i.pinimg.com/originals/5b/db/6b/5bdb6bf7e2b394e945f8a7702d3ff067.jpg' WHERE bID = 'B0001';
UPDATE Books SET bCover = 'https://i.ebayimg.com/images/g/n~8AAOSwZ~hbIBmw/s-l640.jpg' WHERE bID = 'B0002';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/71FxgtFKcQL.jpg' WHERE bID = 'B0003';
UPDATE Books SET bCover = 'https://hamiltoncs.org/lit220/wp-content/uploads/2017/01/tumblr_nbtgglXB7k1svslr6o1_500.png' WHERE bID = 'B0004';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/917wsCEYSML.jpg' WHERE bID = 'B0005';
UPDATE Books SET bCover = 'https://classroom-pcc.flywheelsites.com/wp-content/uploads/2019/03/V-for-Vendetta_600x774.png' WHERE bID = 'B0006';
UPDATE Books SET bCover = 'https://i.pinimg.com/originals/de/86/4b/de864b2083c04b0f45f99c0336cbb11c.jpg' WHERE bID = 'B0007';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/81Ebi0i6anL.jpg' WHERE bID = 'B0008';
UPDATE Books SET bCover = 'https://i.pinimg.com/originals/da/39/46/da3946a2090014b11b8637d3758ae68c.jpg' WHERE bID = 'B0009';
UPDATE Books SET bCover = 'https://i.pinimg.com/236x/39/0b/24/390b24999b5d6eeb9bd6e855dbacc8fc--god-is-dead-high-schools.jpg' WHERE bID = 'B0010';
UPDATE Books SET bCover = 'https://salt.tikicdn.com/media/catalog/product/i/m/img119.u2487.d20160510.t101104.jpg' WHERE bID = 'B0011';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/51zCSsldlJL.jpg' WHERE bID = 'B0012';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/716rf-9RNoL.jpg' WHERE bID = 'B0013';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/71uDm-9dhfL.jpg' WHERE bID = 'B0014';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/91yiWEC6wTL.jpg' WHERE bID = 'B0015';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/61pbRERSDCL.jpg' WHERE bID = 'B0016';
UPDATE Books SET bCover = 'https://i.pinimg.com/originals/fc/34/a3/fc34a32c5a16264a2f9b128b1938d917.png' WHERE bID = 'B0017';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/71iCUnY11ML.jpg' WHERE bID = 'B0018';
UPDATE Books SET bCover = 'https://prodimage.images-bn.com/pimages/9780345806789_p0_v2_s1200x630.jpg' WHERE bID = 'B0019';
UPDATE Books SET bCover = 'https://kbimages1-a.akamaihd.net/991ee2b8-3f3b-4418-a0b0-77f70dfb6051/353/569/90/False/it-22.jpg' WHERE bID = 'B0020';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/810BkqRP+iL.jpg' WHERE bID = 'B0021';
UPDATE Books SET bCover = 'https://a.wattpad.com/cover/201993297-256-k801639.jpg' WHERE bID = 'B0022';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/81BJ3OD3J-L.jpg' WHERE bID = 'B0023';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/61JfGcL2ljL.jpg' WHERE bID = 'B0024';
UPDATE Books SET bCover = 'https://image.winudf.com/v2/image/c3BpZGVjLmRpY3Rpb25hcnluaGF0dmlldF9zY3JlZW5zaG90c18wXzc1MDY5Yzgw/screen-0.jpg?fakeurl=1&type=.jpg' WHERE bID = 'B0025';
UPDATE Books SET bName = 'Dictionary VietNam_Japan' WHERE bID = 'B0025';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/51Q8s7d3SyL._SX354_BO1,204,203,200_.jpg' WHERE bID = 'B0026';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/716hbj45eOL.jpg' WHERE bID = 'B0027';
UPDATE Books SET bCover = 'https://images-na.ssl-images-amazon.com/images/I/51l1tuPpQGL._SX330_BO1,204,203,200_.jpg' WHERE bID = 'B0028';
UPDATE Books SET bCover = 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1348757577l/6219656.jpg' WHERE bID = 'B0029';
UPDATE Books SET bCover = 'https://sciencefictionbookart.com/wp-content/uploads/2017/02/The-Illustrated-Man.png' WHERE bID = 'B0030';

-----------------------------------------------------------------------------------------------------------------------------------


select * from Categories
select * from Books
select * from Users
select * from Transactions

--NMT insert 50 books
GO

insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0031','Blockchain','C013',300000,15,'Mark Gates','Crypto currency - most typically Bitcoin, is taking attention from global finance. Ability to pay by cryptocurrency
inspires many potential for commercial, changes in paying method. This core of new technology is called Blockchain.','https://ebook.vn//uploads/books/blockchain.jpg')

insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0032','SEO master','C013',250000,15,'Nguyen Trong Tho','If you are or want to start a business on the Internet, this is a book you cant help but read. I certainly am.
 If you already own this book, I congratulate you. Please read this practical, trendy book with respectful feelings to face the challenge and immediately implement lessons
 to put the website on TOP Google.','https://ebook.vn//uploads/books/ebook.vn-seo-master-nguyen-trong-tho.png')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0033','Wanted: Alive or Dead','C011',300000,15,'Kerrelyn Sparks','Phineas McKinney thought New York City was tough, until he was attacked by Malcontents - evil vampires who
consider mortals to be snacks. Saved by the good vampires, Phin swore to devote his now undead life to stopping the Malcontents. Hes got his job cut out for him when
word comes that their enemy may be hiding in Wyoming. What does a city boy like him know about horses and campfires? Good thing hes got Brynley Jones with him, if
only she didnt hate every vampire on earth.','https://covers.openlibrary.org/b/id/8998733-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0034','Everything leads to you','C008',250000,20,'Nina LaCour','While working as a film production designer in Los Angeles, Emi finds a mysterious letter from a silver
 screen legend which leads Emi to Ava who is about to expand Emis understanding of family, acceptance, and true romance.','https://covers.openlibrary.org/b/id/7963161-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0035','The Great Dirty Dinosaur','C008',200000,20,'Martin Waddell','Hal and his little dog Billy calmly deal with a dinosaurs monstrous temper tantrum.','https://covers.openlibrary.org/b/id/8240165-L.jpg')

insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0036','Enchanted glass','C008',250000,20,'Diana Wynne Jones','After his grandfather dies, Andrew Hope inherits a house and surrounding land in an English village, but
 things become very complicated when young orphan Aidan shows up and suddenly a host of variously magical townsfolk and interlopers start intruding on their lives.','https://covers.openlibrary.org/b/id/9679573-L.jpg')

insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0037','My friend is sad','C011',270000,25,'Mo Willems','When Gerald the Elephant is sad, Piggie is determined cheer him up, but finds after many tries that it only takes the simplest thing to change Geralds mood.','https://covers.openlibrary.org/b/id/8173599-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0038','Clear and present danger','C004',300000,20,'Tom Clancy','The sudden and surprising assassination of three American officials in Colombia. Many people in many places, moving off on missions
 they all mistakenly thought they understood. The future was too fearful for contemplation, and beyond the expected finish lines were things that, once decided, were better left unseen.','https://ia800801.us.archive.org/view_archive.php?archive=/18/items/olcovers662/olcovers662-L.zip&file=6621299-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0039','Tom Clancy full force and effect','C001',300000,15,'Mark Greaney','A North Korean ICBM crashes into the Sea of Japan. A veteran CIA officer is murdered in Ho Chi Minh City, and a package of forged documents
 goes missing. The pieces are there, but assembling the puzzle will cost Jack Ryan, Jr. and his fellow Campus agents precious time. Time they dont have. The challenge facing President Jack Ryan is an old one with
 a terrifying new twist. The international stalemate with North Korea continues into its seventh decade. A young, untested dictator is determined to prove his strength by breaking the deadlock. Like his father
 before him, he hangs his plans on the countrys nuclear ambitions.','https://covers.openlibrary.org/b/id/8134960-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0040','Devil s gate','C001',350000,20,'Clive Cussler','A weapon of unspeakable power... A madman holds the world hostage... Only Kurt Austin and the NUMA team can stop him.','https://ia801608.us.archive.org/view_archive.php?archive=/28/items/olcovers697/olcovers697-L.zip&file=6975069-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0041','Shape-changer','C012',350000,20,'Bill Brittain','Two seventh-grade friends help a shape-changing policeman from the planet Rodinam as he tries to recapture an alien master criminal who can also change form.','https://ia801602.us.archive.org/view_archive.php?archive=/17/items/olcovers393/olcovers393-L.zip&file=3939741-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0042','Everything s Eventual','C012',300000,15,'Stephen King','International bestselling author Stephen King is in terrifying top form with his first collection of short stories in almost a decade. In this spine-chilling
 compilation, King takes readers down a road less traveled (for good reason) in the blockbuster e-Book "Riding the Bullet," bad table service turns bloody when you stop in for "Lunch at the Gotham Cafe," and terror becomes
 deja vu all over again when you get "That Feeling, You Can Only Say What IT IS in French"--along with eleven more stories that will keep you awake until daybreak. Enter a nightmarish mindscape of unrelenting horror and
 shocking revelations that could only come from the imagination of the greatest storyteller of our time.','https://covers.openlibrary.org/b/id/8585687-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0043','Trojan Odyssey','C012',350000,15,'Clive Cussler','Long hailed as the grand master of adventure fiction, Clive Cussler has continued to astound with the intricate plotting and astonishing set pieces of his novels.
 Now, with a surprising twist, he gives us his most audacious work yet.','https://ia802702.us.archive.org/view_archive.php?archive=/30/items/olcovers25/olcovers25-L.zip&file=259071-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0044','Duma Key','C008',200000,15,'Stephen King','A terrible construction site accident takes Edgar Freemantles right arm and scrambles his memory and his mind, leaving him with little but rage as he begins the ordeal
 of rehabilitation. A marriage that produced two lovely daughters suddenly ends, and Edgar begins to wish he hadnt survived the injuries that could have killed him. He wants out. His psychologist, Dr. Kamen, suggests a
 "geographic cure," a new life distant from the Twin Cities and the building business Edgar grew from scratch. And Kamen suggests something else.','https://covers.openlibrary.org/b/id/8457060-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0045','Atlantis Found','C012',250000,10,'Clive Cussler','Dirk Pitt knows that somehow these events are connected. His investigations lead to an ancient mystery with devastating modern consequences, and a diabolical
 enemy unlike any he has ever known. Now, he is racing to save not only his life—but the world. The trap is set. The clock is ticking. And only one man stands between the earth and Armageddon…','https://ia800700.us.archive.org/view_archive.php?archive=/31/items/olcovers702/olcovers702-L.zip&file=7024772-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0046','Breathless','C008',200000,20,'Dean Koontz','This book is great! He really pulls you in from the start, and by the time its over I was in tears. If you like Dean Koontz read it. One of his best.','https://ia800602.us.archive.org/view_archive.php?archive=/1/items/olcovers666/olcovers666-L.zip&file=6669847-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0047','Cell','C008',250000,15,'Stephen King','There are one hundred and ninety-three million cell phones in the United States alone. Who doesnt have one? Stephen Kings utterly gripping, gory, and fascinating
 novel doesnt just ask the question "Can you hear me now?" It answers it with a vengeance.','https://covers.openlibrary.org/b/id/8288254-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0048','The Kingdom','C008',250000,25,'Clive Cussler','Packed with the endless imagination and breathtaking suspense that are his hallmarks, The Kingdom once again proves that Clive Cussler is "just about the best storyteller in the business','https://covers.openlibrary.org/b/id/9155138-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0049','Relentless','C008',300000,15,'Dean Koontz','Facing an inexorable assault on far more than his life, successful family man and bestselling novelist Cullen "Cubby" Greenwich finds himself in a desperate struggle with relentless sociopath
 and reclusive critic Shearman Waxx.','https://covers.openlibrary.org/b/id/8085498-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0050','Mr.Mercedes','C010',250000,15,'Stephen King','Mr. Mercedes is a war between good and evil, from the master of suspense whose insight into the mind of this obsessed, insane killer is chilling and unforgettable.','https://covers.openlibrary.org/b/id/9155058-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0051','Golden Buddha','C013',250000,15,'Clive Cussler','Oregon Files #1','https://ia800602.us.archive.org/view_archive.php?archive=/19/items/olcovers27/olcovers27-L.zip&file=272549-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0052','Storm of the Century','C001',200000,20,'Stephen King','For the first time in Stephen Kings remarkable publishing history, the master storyteller presents an all-new, original tale written expressly for the television screen.','https://covers.openlibrary.org/b/id/8401475-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0053','The stand','C008',250000,25,'Stephen King','Dark dreams that warned of the coming of the dark man. The apostate of death, his worn-down boot heels tramping the night roads. The warlord of the charnel house and Prince of Evil.','https://covers.openlibrary.org/b/id/9255989-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0054','Rainbow Six','C012',20000,15,'Tom Clancy','This edition doesnt have a description yet.','https://ia800801.us.archive.org/view_archive.php?archive=/3/items/olcovers687/olcovers687-L.zip&file=6873545-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0055','Black wind','C008',150000,20,'Clive Cussler','Pitt has faced devastating enemies before, has even teamed up with his children to track them down. But never before has he encountered such pure evil—until now.','https://covers.openlibrary.org/b/id/8231873-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0056','Demon seed','C008',200000,15,'Dean Koontz','This edition doesnt have a description yet.','https://ia800602.us.archive.org/view_archive.php?archive=/29/items/olcovers648/olcovers648-L.zip&file=6487440-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0057','Walter the Baker','C002',150000,15,'Eric Carle','By order of the Duke, Walter the baker must invent a tasty roll through which the rising sun can shine three times.','https://ia802605.us.archive.org/view_archive.php?archive=/18/items/olcovers43/olcovers43-L.zip&file=434888-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0058','Tiger on a tree','C002',200000,16,'Anushka Ravishankar','After trapping a tiger in a tree, a group of men must decide what to do with it.','https://ia801608.us.archive.org/view_archive.php?archive=/27/items/olcovers22/olcovers22-L.zip&file=224170-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0059','Dinosaur Trouble','C002',250000,15,'Dick King-Smith','T. rex! T. rex! Run! The terrible Tyrannosaurus rex is scaring all the dinosaur families that live on the Great Plain. Nosy, the little pterodactyl,
 and his great friend Banty, the apatosaurus, agree that T. rex has got to be stopped. But how? Luckily Nosy has a plan ...','https://ia800603.us.archive.org/view_archive.php?archive=/11/items/olcovers296/olcovers296-L.zip&file=2966918-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0060','Dragons Milk','C007',250000,20,'Susan Fletcher','But little does Kaeldra know what shes getting into. Shes about to begin a journey that will entwine her fate with that of three little draclings and one would-be dragonslayer.
 A journey that will become a struggle for life.','https://ia802605.us.archive.org/view_archive.php?archive=/18/items/olcovers43/olcovers43-L.zip&file=433683-L.jpg&ext=')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0061','Rooster is off to see the world','C007',250000,10,'Eric Carle','A simple introduction to the meaning of numbers and sets as a rooster, on his way to see the world, is joined by fourteen animals along the way','https://covers.openlibrary.org/b/id/9153843-L.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0062','Catwings','C002',200000,15,'Ursula K. Le Guin','Mrs. Jane Tabby cant explain why her four precious kittens were born with wings, but shes grateful that they are able to use their flying skills to soar away from
 the dangerous city slums where they were born. However, once the kittens escape the big city, they learn that country life can be just as difficult!','https://images-na.ssl-images-amazon.com/images/I/51WTJYPJnZL._SX350_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0063','Catwings Return','C008',200000,20,'Ursula K. Le Guin','Wishing to visit their mother, the winged cats leave their new country home to return to the city, where they discover a winged kitten in a building on the verge of being demolished.','https://images-na.ssl-images-amazon.com/images/I/51nqHYbNNML._SX355_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0064','The Night Fairy','C007',250000,15,'Laura Amy Schlitz','Not every creature, however, is as willing to bend to Flory’s demands. Newbery Medal winner Laura Amy Schlitz and world-renowned illustrator and miniaturist Angela Barrett venture
 into the realm of the illustrated classic — a classic entirely and exquisitely of their making, and a magnificent adventure.','https://images-na.ssl-images-amazon.com/images/I/51EsRGBtnKL._SX352_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0065','Small Spaces','C002',200000,15,'Katherine Arden','Only Ollie and two of her classmates heed these warnings. As the trio head out into the woods--bordered by a field of scarecrows that seem to be watching them--the bus driver has just one
 final piece of advice for Ollie and her friends: "Avoid large places. Keep to small.". And with that, a deliciously creepy and hair-raising adventure begins.','https://images-na.ssl-images-amazon.com/images/I/51vvQv-5DzL._SX325_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0066','Front Desk ','C002',200000,15,'Kelly Yang','"Many readers will recognize themselves or their neighbors in these pages." -- Kirkus Reviews, starred review
Mia Tang has a lot of secrets.','https://images-na.ssl-images-amazon.com/images/I/51dN99OdBtL._SX341_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0067','The Parker Inheritance','C002',200000,20,'Varian Johnson','So with the help of Brandon, the quiet boy across the street, she begins to decipher the clues. The challenge will lead them deep into Lamberts history, full of ugly deeds,
 forgotten heroes, and one great love; and deeper into their own families, with their own unspoken secrets. Can they find the fortune and fulfill the letters promise before the answers slip into the past yet again?','https://images-na.ssl-images-amazon.com/images/I/51XluZ8tjEL._SX342_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0068','Nine, Ten: A September 11 Story','C011',150000,15,'Nora Raleigh Baskin','These four don’t know one another, but their lives are about to intersect in ways they never could have imagined. Award-winning author Nora Raleigh Baskin
 weaves together their stories into an unforgettable novel about that seemingly perfect September day—the day our world changed forever.','https://images-na.ssl-images-amazon.com/images/I/31oPP1b1YQL._SX326_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0069','Before They Were Authors: Famous Writers as Kids','C015',200000,15,'Elizabeth Haidle','Children ages ten and up will see themselves in these humanized portraits and wonder if they, too, might have it in them to write.
 A celebration of creativity, this collective graphic biography is sprinkled throughout with writing wisdom and inspiring quotes.','https://images-na.ssl-images-amazon.com/images/I/51SMXPJqTtL._SX373_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0070','A Wolf Called Wander','C002',150000,20,'Rosanne Parry','Includes black-and-white illustrations throughout and a map as well as information about the real wolf who inspired the novel.','https://images-na.ssl-images-amazon.com/images/I/51Q63gyZiNL._SX329_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0071','Stay','C015',200000,15,'Bobbie Pyron','Told in alternating perspectives, this classic and heartfelt animal tale proclaims the importance of hope, the power of story, and the true meaning of home.','https://images-na.ssl-images-amazon.com/images/I/51XiJ7uHf+L._SX334_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0072','Nightbooks','C008',250000,15,'J. A. White','This modern spin on the Scheherazade story is perfect for fans of Coraline and A Tale Dark and Grimm. With interwoven tips on writing with suspense, adding in plot twists,
 hooks, interior logic, and dealing with writer’s block, this is the ideal book for budding writers and all readers of delightfully just-dark-enough tales.','https://images-na.ssl-images-amazon.com/images/I/41NUq4hHL0L._SX334_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0073','Caterpillar Summer','C011',200000,17,'Gillian McDunn','But even the strongest glue sometimes struggles to hold. When a summer trip doesn’t go according to plan, Cat and Chicken end up spending three weeks with
 grandparents they never knew. For the first time in years, Cat has the opportunity to be a kid again, and the journey she takes shows that even the most broken or strained relationships can be healed if people take the
 time to walk in one another’s shoes.','https://images-na.ssl-images-amazon.com/images/I/5158Je0Lc4L._SX329_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0074','The Unicorn in the Barn ','C002',200000,15,'Jacqueline Ogburn','A tender tale of love, loss, and the connections we make, The Unicorn in the Barn shows us that sometimes ordinary life can take extraordinary turns.','https://images-na.ssl-images-amazon.com/images/I/41H5xRuCFgL._SX334_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0075','Truman the Dog','C003',300000,15,'Debbi Michiko Florence','"T" is for Truman, tricks, and TROUBLE! Truman the black lab might be an older rescue dog, but hes still got enough mischief beneath his collar to keep
 eight-year-old Kaita Takano and her animal-fostering family on their toes from morning till night. Chewed through and through, the playfully illustrated, Kaita-narrated chapter book promises plenty of canine fun.','https://images-na.ssl-images-amazon.com/images/I/51NJrPm58aL._SX348_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0076','Happy Fell #3','C003',270000,20,'Erica S. Perl','Exciting, easy-to-read books are the stepping stone a young reader needs to bridge the gap between being a beginner and being fluent.','https://images-na.ssl-images-amazon.com/images/I/51RcDTo4R5L._SX334_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0077','Chick and Brain: Smell My Foot! ','C009',280000,16,'Cece Bell','Meet Chick and Brain. And their friend Spot. Chick likes to follow the rules. Brain might not be as smart as he looks. And Spot just wants to eat lunch. 
In a graphic reader loaded with verbal and visual humor, Cece Bell offers a comical primer on good manners gone awry. Simple, silly, and perfectly suited for its audience, this tale of Chick and Brain’s constant misunderstandings
 and miscommunications proves once again that Cece Bell is a master at meeting kids where they are.','https://images-na.ssl-images-amazon.com/images/I/51wJC7voUkL._SX333_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0078','Stop! Bot!','C003',250000,15,'James Yang','Musicians, baseball players, zoo animals, and finally a very large monkey all play a part -- but will they rescue the Bot before its too late?!
 Children will love all the funny details and easy-to-read words in this very playful picture book!','https://images-na.ssl-images-amazon.com/images/I/51nRmAMw9xL._SX276_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0079','The Book Hog','C009',300000,20,'Greg Pizzoli','Greg Pizzoli, master of read-aloud fun and three-time Theodor Seuss Geisel Award recipient, introduces a character sure to steal kids hearts using his signature cheerful colors and lighthearted narrative style.','https://images-na.ssl-images-amazon.com/images/I/51PxLqvuS8L._SX400_BO1,204,203,200_.jpg')
insert into Books(bID,bName,catID,bPrice, bQuantity, bAuthor,bDes,bCover)
values 
('B0080','Flubby Is Not a Good Pet!','C003',250000,15,'J.E.Morris','The charming illustrations, simple text, and comic-like panels by J. E. Morris, author-illustrator of the Maud the Koala books, make this a unique format with a narrative style perfect for
 storytime and progressing readers. Exciting, easy-to-read books are the stepping stone a young reader needs to bridge the gap between being a beginner and being fluent.','https://images-na.ssl-images-amazon.com/images/I/51WB4COcpOL._SX334_BO1,204,203,200_.jpg') 
=======
select * from Users
ALTER TABLE Users
ADD uRole int not null default(0);
update Users set uRole =1 where uID='U0001'
------------------------------------

--75 books added NMT

GO
insert into Books
values
('B0081','Aesop’s Fables','C006',200000,19,'Charles Santore','Revive your childhood wonder and fascination with the most exquisitely illustrated
 edition of Aesop’s Fables to hit the market in years—featuring breathtaking original artwork by #1 New York Times bestselling illustrator Charles
  Santore!','https://images-na.ssl-images-amazon.com/images/I/51Ci0HKNGTL._SX389_BO1,204,203,200_.jpg')
insert into Books
values
('B0082','Fables: The Deluxe Edition Book One','C006',600000,15,'Bill Willingham','Disguised among the normal citizens of modern-day New York,
these magical characters created their own secret society-within an exclusive luxury apartment building on Manhattans Upper West Side-called
Fabletown. But when Snow Whites party-girl sister, Rose Red, is apparently murdered, it is up to Bigby, Fabletowns sheriff, and a reformed
and pardoned Big Bad Wolf, to determine if the culprit is Bluebeard, Roses ex-lover and notorious wife killer, or Jack, her current live-in
 boyfriend and former beanstalk-climber.','https://images-na.ssl-images-amazon.com/images/I/61OjHHECFHL._SX346_BO1,204,203,200_.jpg')
insert into Books
values
('B0083','Fables','C006',150000,25,'Arnold Lobel','A pig flying through marshmallow clouds? A camel pirouetting through the desert?
Where else could a reader find such marvelous things but in a fable? From the author-illustrator behind beloved Frog and Toad, Arnold
 Lobel, comes a collection of humorous, silly fables that will delight readers young and old.','https://images-na.ssl-images-amazon.com/images/I/51qfeSTt8QL._SX334_BO1,204,203,200_.jpg')
insert into Books
values
('B0084','The Swallows: Rhymed Fables ','C006',270000,15,'Christy Astremsky','Simple texts of this children book are complemented by colorful pictures that will help a child understand
the moral of each fable.','https://images-na.ssl-images-amazon.com/images/I/51ZFcX+0WOL._SX258_BO1,204,203,200_.jpg')
insert into Books
values
('B0085','Friedmans Fables','C006',400000,10,'Edwin H. Friedman','These tales playfully demonstrate that new ideas, new questions, and imagination, more than accepted wisdom, 
provide each of us with the keys to overcoming stubborn emotional barriers and facilitating real change both in ourselves and others. Thought-provoking discussion questions
 for each fable are included.','https://images-na.ssl-images-amazon.com/images/I/51QAUIC0w7L._SX333_BO1,204,203,200_.jpg')
insert into Books
values
('B0086','Fables Vol. 1: Legends in Exile','C006',250000,20,'Bill Willingham','When a savage creature known only as the Adversary conquered the fabled lands of legends and fairy tales,
 all of the infamous inhabitants of folklore were forced into exile. Disguised among the ""mundys,"" their name for normal citizens of modern-day New York, these magical characters
  created their own secret society that they call Fabletown.','https://m.media-amazon.com/images/I/61Z-mjxK+zL.jpg')
insert into Books
values
('B0087','The McElderry Book of Aesops Fables','C006',500000,20,'Michael Morpurgo','Michael Morpurgos lively language gives each tale a fresh feel thats perfect for reading aloud and sharing.
Emma Chichester Clarks radiant illustrations are bursting with bold colors and cheerful characters. Together they have created a modern classic brimming with fun, which children will enjoy
 reading and laughing over again and again.','https://images-na.ssl-images-amazon.com/images/I/61YCAWYMG4L._SX454_BO1,204,203,200_.jpg')
insert into Books
values
('B0088','The Power of a Praying Wife','C006',150000,25,'Stormie Omartian','You will be encouraged by Stormies own experiences, along with the Bible verses and sample prayers included in
 each chapter. Join the millions of women who have been blessed by this life-changing look at the power of a wifes prayers.','https://images-na.ssl-images-amazon.com/images/I/51wP+tsCs4L._SX322_BO1,204,203,200_.jpg')
insert into Books
values
('B0089','Aesops Favorite Fables','C006',250000,20,'Milo Winter','Accompanied by beautiful color illustrations, this beautiful collection of Aesop s Favorite Fables is sure to ignite young
 imaginations and teach them virtue, kindness, integrity, problem-solving, happiness, and what it means to be human.','https://images-na.ssl-images-amazon.com/images/I/51DmiR2s5mL._SX398_BO1,204,203,200_.jpg')
insert into Books
values
('B0090','Fables: The Deluxe Edition Book Seven','C006',11000000,15,'Bill Willingham','Preparation for war between Fabletown and the Empire begins! The Adversary calls a conference of the Imperial elite to decide
 what to do about Fabletown and Pinocchio has to face up to his divided loyalties between his friends and his family. Meanwhile, Bigby decides the time has come to confront his father, the North Wind, while the
  cubs learn more of their family and celebrate their birthday! Plus, Burning Questions by the fans answered!','https://images-na.ssl-images-amazon.com/images/I/51lqxIKd05L._SX337_BO1,204,203,200_.jpg')
insert into Books
values
('B0091','Fables, Vol. 9: Sons of Empire','C006',330000,20,'Bill Willingham','Pinocchio suffers seriously divided loyalties between his father, the evil Adversary, and his fellow Fable refugees in New York.
 Plus, Bigby Wolf reluctantly decides its finally time to square accounts with his long-estranged father, the North Wind, and makes a journey with Snow White and their kids to find him.',
 'https://images-na.ssl-images-amazon.com/images/I/61RQSun2pbL._SX337_BO1,204,203,200_.jpg')
insert into Books
values
('B0092','Fables Vol. 7: Arabian Nights (and Days)','C006',260000,15,'Bill Willingham','Fabletown and a bad case of culture shock! This seventh volume of the popular Vertigo series also includes 
"The Ballad of Rodney and June," the 2-part story of forbidden love among the Adversarys wooden soldiers, and features stellar Art by Mark Buckingham, Steve Leialoha, Jim Fern, Jimmy Palmiotti
 and Andrew Pepoy.','https://images-na.ssl-images-amazon.com/images/I/61S96-3YAcL._SX321_BO1,204,203,200_.jpg')
insert into Books
values
('B0093','Fables Vol. 5: The Mean Seasons','C006',350000,15,'Bill Willingham','Collecting issues 22 and 28-33 of the hit VERTIGO series, this trade paperback features two tales of Bigbys exploits
 during World War II as well as "The Year After," which follows the aftermath of the Adversarys attempt to conquer Fabletown — including the birth of Snow White and Bigbys children!',
 'https://images-na.ssl-images-amazon.com/images/I/61V028IS6-L._SX319_BO1,204,203,200_.jpg')
insert into Books
values
('B0094','Fables Vol. 3: Storybook Love','C006',270000,15,'Bill Willingham','A new Softcover collecting the acclaimed FABLES #11-18, including the 4-part "Storybook Love." Also included are 
the 2-part "A Sharp Operator" and the single-issue tales "Bag o Bones" and "Barleycorn Brides." Dont miss this amazing third collection, topped off with a stunning new wraparound cover by James Jean.',
'https://images-na.ssl-images-amazon.com/images/I/51Hkz00xUVL._SX320_BO1,204,203,200_.jpg')
insert into Books
values
('B0095','Fables: Legends in Exile, Vol. 1','C006',250000,20,'Bill Willingham','When a savage creature known only as the Adversary conquered the fabled lands of legends and fairy tales, all
 of the infamous inhabitants of folklore were forced into exile. Disguised among the "mundys," their name for normal citizens of modern-day New York, these magical characters created their
  own secret society that they call Fabletown','https://images-na.ssl-images-amazon.com/images/I/61gK2Y2zSOL._SX323_BO1,204,203,200_.jpg')
insert into Books
values
('B0096','Fairy Tales for Bedtime','C007',500000,20,'Rosie Dickins','A beautifully illustrated and bound collection of traditional stories, freshly retold for todays children.',
'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4095/9781409550648.jpg')
insert into Books
values
('B0097','A First Book of Fairy Tales','C007',250000,20,'Mary Hoffman','The stories in this collection show the consequences of greed, pride, and vanity, but also tell of
 the love that grows from a kind heart and a cheerful nature. And along the way, there is a wealth of magic and fun to be enjoyed.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/7566/9780756621070.jpg')
insert into Books
values
('B0098','Mixed Up Fairy Tales : Split-Page Book','C007',230000,20,'Hilary Robinson','This fantastic split page, spiral bound book allows the reader to mix and match different combinations
 of fairy tales with hilarious results. What would happen if Goldilocks had two horrid stepsisters and fell asleep for a hundred years? Would she be woken by a hungry wolf or
  Little Red Riding Hoods Granny?','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/3408/9780340875582.jpg')
insert into Books
values
('B0099','Peep Inside a Fairy Tale Little Red Riding Hood','C007',220000,15,'Anna Milbourne','Journey into the woods with Little Red Riding Hood, peeping through the trees, lifting flaps to see whats
 beneath things, and watching grannys cottage emerge with each turn of the page. Delicate cutaways and holes to peep through are layered on top of each other to create a magical filigree effect,
  drawing children in to the story.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4095/9781409599128.jpg')
insert into Books
values
('B0100','Peep Inside a Fairy Tale Cinderella','C007',200000,20,'Anna Milbourne','This classic fairytale is given a new lease of life with the exquisite illustrations and elegant flaps and peep-through holes.
 The second title in a new series which takes the format of the bestselling "Peep Inside" non-fiction series and applies it to much-loved fairy tales. Likely to become firm favourite for little ones and
  sure to have children asking "again, again, again" before bedtime.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4095/9781409599111.jpg')
insert into Books
values
('B0101','Goldilocks and the Three Bears','C007',200000,15,'Ladybird Tales','This Ladybird retelling of Goldilocks and the Three Bears is a wonderful introduction to
 classic fairy tales for toddlers and preschool children. Enjoy reading the simple text together, looking at the bright pictures and feeling the different touch-and-feels on every page.',
 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4093/9781409304470.jpg')
insert into Books
values
('B0102','The Three Little Pigs','C007',190000,25,'Ladybird Tales','This Ladybird retelling of The Three Little Pigs is a wonderful introduction to classic fairy
 tales for toddlers and preschool children. Enjoy reading the simple text together, looking at the bright pictures and feeling the different touch-and-feels on every page.',
 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4093/9781409304524.jpg')
insert into Books
values
('B0103','Usborne Book Of Fairy Tales Combined Volume','C007',300000,20,'Heather Amery','Charming picture book of six classic fairy tales (Cinderella, The Story of Rumpelstiltskin, Little Red Riding Hood,
 Sleeping Beauty, Goldilocks and the Three Bears & Three Little Pigs). Dual-level text, on each page a simple line for beginner readers and a more complex one which can be read aloud by an adult or 
 reading child','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/7460/9780746064115.jpg')
insert into Books
values
('B0104','Peep Inside a Fairy Tale Beauty & The Beast','C007',220000,15,'Anna Milbourne','Belle s inventor father stumbles upon the Beast s castle and is taken prisoner, Belle comes to the rescue and
 agrees to take her fathers place. She sees beneath the Beasts exterior and discovers the heart and soul of a human prince. Delicate cutaways and holes to peep through are layered on top of each other
  to create a magical filigree effect, drawing children in to the story.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/4749/9781474920544.jpg')
insert into Books
values
('B0105','Fairy Tales from the Brothers Grimm','C007',700000,15,'Philip Pullman','Suffused with romance and villainy, danger and wit, the Grimms fairy tales have inspired Pullmans
 unique creative vision-and his beguiling retellings will draw you back into a world that has long cast a spell on the Western imagination.',
 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/6700/9780670024971.jpg')
insert into Books
values
('B0106','The Original Folk and Fairy Tales of Grimm ','C007',800000,15,'Jacob Grimm','Zipess introduction gives important historical context, and the book includes the Grimms prefaces and notes.
 A delight to read, The Original Folk and Fairy Tales of the Brothers Grimm presents these peerless stories to a whole new generation of readers.',
 'https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/6911/9780691160597.jpg')
insert into Books
values
('B0107','Grimm s Complete Fairy Tales','C007',650000,20,'Jacob Grimm','With specially designed end papers, a genuine leather cover, and other enhancements, its the perfect gift for anyone looking to
 build a complete home library. Many of these tales begin with the familiar refrain of "once upon a time"--but they end with something unexpected and fascinating!','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/6071/9781607103134.jpg')
insert into Books
values
('B0108','The Complete Fairy Tales','C007',550000,25,'Jacob Grimm','Jacob Grimm (1785-1863) and his brother Wilhelm (1786-1859) were philologists and folklorists. The brothers rediscovered a host of
 fairy tales, telling of princes and princesses in their castles, witches in their towers and forests, of giants and dwarfs, of fabulous animals and dark deeds.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/8402/9781840221749.jpg')
insert into Books
values
('B0109','Grimms Fairy Tales','C007',20000,20,'Jacob Grimm','From the land of fantastical castles, vast lakes and deep forests, the Brothers Grimm collected a treasury of enchanting folk and fairy
 stories full of giants and dwarfs, witches and princesses, magical beasts and cunning children. From classics such as "The Frog-Prince" and "Hansel and Grettel" to the delights of "Ashputtel" or
  "Old Sultan", all hold a timeless magic which has enthralled children for centuries.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9780/1413/9780141331201.jpg')
insert into Books
values
('B0110','Grimm s Fairy Tales','C007',120000,20,'Jacob Grimm','The Brothers Grimm rediscovered a host of fairy tales, telling of princes and princesses in their castles, witches in their towers and
 forests, of giants and dwarfs, of fabulous animals and dark deeds.','https://d1w7fb2mkkr3kw.cloudfront.net/assets/images/book/lrg/9781/8532/9781853261015.jpg')
insert into Books
values
('B0111','Fangirl','C008',230000,15,'Rainbow Rowell','For Cath, the question is: Can she do this? Can she make it without Wren holding her hand? Is she ready to start living her own life? Writing her own stories?',
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1355886270l/16068905.jpg')
insert into Books
values
('B0112','Geekerella','C008',180000,20,'Ashley Poston','Now they’re nothing but autographs and awkward meet-and-greets. Playing Carmindor is all he’s ever wanted, but the Starfield fandom has written him off
as just another dumb heartthrob. As ExcelsiCon draws near, Darien feels more and more like a fake—until he meets a girl who shows him otherwise.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1476734515l/30724132.jpg')
insert into Books
values
('B0113','Eliza and Her Monsters','C008',220000,15,'Francesca Zappia','But when Eliza’s secret is accidentally shared with the world, everything she’s built—her story, her relationship with Wallace, and even
 her sanity—begins to fall apart.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1476994065l/31931941._SY475_.jpg')
insert into Books
values
('B0114','Carry On','C008',230000,15,'Rainbow Rowell','Carry On - The Rise and Fall of Simon Snow is a ghost story, a love story and a mystery. It has just as much kissing and talking as you d expect from a
 Rainbow Rowell story - but far, far more monsters.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1481729252l/32768522.jpg')
insert into Books
values
('B0115','The Only Thing Worse Than Me Is You','C008',300000,15,'Lily Anderson','Trixie Watson has two very important goals for senior year: to finally save enough to buy the set of Doctor Who figurines at
 the local comic books store, and to place third in her class and knock Ben West--and his horrendous new mustache that he spent all summer growing--down to number four.',
 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1444317771l/26114524.jpg')
insert into Books
values
('B0116','Ms. Marvel, Vol. 1: No Normal','C008',330000,15,'G. Willow Wilson','Its history in the making from acclaimed writer G. Willow Wilson (Air, Cairo) and beloved artist Adrian Alphona (RUNAWAYS)!
 Collecting MS. MARVEL (2014) #1-5 and material from ALL-NEW MARVEL NOW! POINT ONE #1.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1413031883l/20898019.jpg')
insert into Books
values
('B0117','The Geek s Guide to Unrequited Love','C008',160000,20,'Sarvenaz Tash','But now they’re sixteen, still neighbors, still best friends. And Graham and Roxy share more than ever—moving on from
 their Harry Potter obsession to a serious love of comic books.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1436552316l/24832518.jpg')
insert into Books
values
('B0118','Queens of Geek','C008',180000,15,'Jen Wilde','Charlie likes to stand out. She’s a vlogger and actress promoting her first movie at SupaCon, and this is her chance to show fans she’s over
 her public breakup with co-star Reese Ryan. When internet-famous cool-girl actress Alyssa Huntington arrives as a surprise guest, it seems Charlie’s long-time crush on her isn’t as one-sided as
  she thought.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1488881057l/28245707._SY475_.jpg')
insert into Books
values
('B0119','I Am Princess X','C008',150000,20,'Cherie Priest','Best friends, big fans, a mysterious webcomic, and a long-lost girl collide in this riveting novel, perfect for fans of both Cory Doctorow
 and Sarah Dessen; illustrated throughout with comics.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1415300641l/17408897.jpg')
insert into Books
values
('B0120','Kill the Boy Band','C008',140000,20,'Goldy Moldavsky','Just know from the start that it wasn’t supposed to go like this. All we wanted was to get near them. That’s why we got a room in the
 hotel where they were staying.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1448318289l/25184383.jpg')
insert into Books
values
('B0121','All the Feels','C008',170000,20,'Danika Stone','College freshman Liv is more than just a fangirl: The Starveil movies are her life… So, when her favorite character, Captain Matt Spartan,
 is killed off at the end of the last movie, Liv Just. Can’t. Deal.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1463478745l/29222548._SY475_.jpg')
insert into Books
values
('B0122','The Fault in Our Stars','C008',250000,20,'John Green','Despite the tumor-shrinking medical miracle that has bought her a few years, Hazel has never been anything but terminal, her final
 chapter inscribed upon diagnosis. But when a gorgeous plot twist named Augustus Waters suddenly appears at Cancer Kid Support Group, Hazel s story is about to be completely rewritten.',
 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1360206420l/11870085.jpg')
insert into Books
values
('B0123','Ship It','C008',170000,20,'Britta Lundin','CLAIRE is a sixteen-year-old fangirl obsessed with the show Demon Heart. FOREST is an actor on Demon Heart who dreams of bigger roles.
 When the two meet at a local Comic-Con panel, its a dream come true for Claire. Until the Q&A, that is, when Forest laughs off Claire s assertion that his character is gay.',
 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1505481235l/36204669.jpg')
insert into Books
values
('B0124','You re Never Weird on the Internet (Almost)','C008',220000,22,'Felicia Day','From online entertainment mogul, actress, and “queen of the geeks” Felicia Day, a funny, quirky,
 and inspiring memoir about her unusual upbringing, her rise to Internet-stardom, and embracing her individuality to find success in Hollywood.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1440565049l/23705512._SY475_.jpg')
insert into Books
values
('B0125','Grace and the Fever','C008',250000,20,'Zan Romanoff','In middle school, everyone was a Fever Dream fan. Now, a few weeks after her high school graduation,
 Grace Thomas sometimes feels like the only one who never moved on. She cant imagine what she d do without the community of online fans that share her obsession.
  Or what her IRL friends would say if they ever found out about it.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1471975763l/30171404._SY475_.jpg') 
insert into Books
values
('B0126','The Hitchhiker s Guide to the Galaxy','C009',340000,15,'Douglas Adams','Seconds before the Earth is demolished to make way for a galactic freeway, Arthur Dent is plucked off the planet
 by his friend Ford Prefect, a researcher for the revised edition of The Hitchhiker s Guide to the Galaxy who, for the last fifteen years, has been posing as an out-of-work actor.',
 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1559986152l/386162.jpg')
insert into Books
values
('B0127','Bossypants','C009',210000,15,'Tina Fey','Before Liz Lemon, before "Weekend Update," before "Sarah Palin," Tina Fey was just a young girl with a dream: a recurring stress dream that she was
 being chased through a local airport by her middle-school gym teacher. She also had a dream that one day she would be a comedian on TV.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1481509554l/9418327.jpg')
insert into Books
values
('B0128','Me Talk Pretty One Day','C009',230000,15,'David Sedaris','David Sedaris move to Paris from New York inspired these hilarious pieces, including the title essay, about his attempts to learn
 French from a sadistic teacher who declares that every day spent with you is like having a caesarean section. His family is another inspiration.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1431013639l/4137.jpg')
insert into Books
values
('B0129','Good Omens','C009',250000,20,'Terry Pratchett, Neil Gaiman','People have been predicting the end of the world almost from its very
 beginning, so it’s only natural to be sceptical when a new date is set for Judgement Day. But what if, for once, the predictions are right, and the apocalypse really is due to arrive next Saturday,
  just after tea?','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1392528568l/12067.jpg')
insert into Books
values
('B0130','Is Everyone Hanging Out Without Me? ','C009',300000,10,'Mindy Kaling','Mindy Kaling has lived many lives: the obedient child of immigrant professionals, a timid chubster
 afraid of her own bike, a Ben Affleck–impersonating Off-Broadway performer and playwright, and, finally, a comedy writer and actress prone to starting fights with her friends and coworkers with the
  sentence “Can I just say one last thing about this, and then I swear I’ll shut up about it?”','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1443264638l/10335308._SY475_.jpg')
insert into Books
values
('B0131','Yes Please','C009',250000,15,'Amy Poehler','In Amy Poehler’s highly anticipated first book, Yes Please, she offers up a big juicy stew of personal stories, funny bits on sex and love and
 friendship and parenthood and real life advice (some useful, some not so much), like when to be funny and when to be serious. Powered by Amy’s charming and hilarious, biting yet wise voice, 
 Yes Please is a book full of words to live by.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1402815435l/20910157.jpg')
insert into Books
values
('B0132','Hyperbole and a Half','C009',260000,25,'Allie Brosh','This is a book I wrote. Because I wrote it,
 I had to figure out what to put on the back cover to explain what it is. I tried to write a long, third-person summary that would imply how great the book is and also sound vaguely authoritative--like
  maybe someone who isn’t me wrote it--but I soon discovered that I’m not sneaky enough to pull it off convincingly. So I decided to just make a list of things that are in the book',
  'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1409522492l/17571564.jpg')
insert into Books
values
('B0133','Dress Your Family in Corduroy and Denim','C009',220000,15,'David Sedaris','David Sedaris plays in the snow with his sisters. He goes on vacation with his family. He gets a job selling drinks.
 He attends his brother’s wedding. He mops his sister’s floor. He gives directions to a lost traveler. He eats a hamburger. He has his blood sugar tested. It all sounds so normal, doesn’t it? In his newest
 collection of essays, David Sedaris lifts the corner of ordinary life, revealing the absurdity teeming below its surface. His world is alive with obscure desires and hidden motives — a world where forgiveness
 is automatic and an argument can be the highest form of love. Dress Your Family in Corduroy and Denim is another unforgettable collection from one of the wittiest and most original writers at work today.',
 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1352983006l/10176.jpg')
insert into Books
values
('B0134','The Restaurant at the End of the Universe','C009',260000,15,'Douglas Adams','Facing annihilation at the hands of the warlike Vogons is a curious time to have a cosmically displaced Arthur Dent and
 his curious comrades in arms as they hurtle through space powered by pure improbability - and desperately in search of a place to eat.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1521213881l/8695._SY475_.jpg')
insert into Books
values
('B0135','Lets Pretend This Never Happened','C009',250000,15,'Jenny Lawson','Jenny Lawson realized that the most mortifying moments of our lives—the ones we d like to pretend never
 happened—are in fact the ones that define us. In the #1 New York Times bestseller, Let’s Pretend This Never Happened, Lawson takes readers on a hilarious journey recalling her bizarre upbringing in rural
  Texas, her devastatingly awkward high school years, and her relationship with her long-suffering husband, Victor.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1489415716l/12868761._SY475_.jpg')
insert into Books
values
('B0136','When You Are Engulfed in Flames','C009',190000,19,'David Sedaris','Its early autumn 1964. Two straight-A students head off to school, and when only one of them returns home Chesney Yelverton is
 coaxed from retirement and assigned to what proves to be the most difficult and deadly - case of his career. From the shining notorious East Side, When You Are Engulfed in Flames confirms once again that
  David Sedaris is a master of mystery and suspense.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1547552824l/1044355._SX318_.jpg')
insert into Books
values
('B0137','Naked','C009',250000,15,'David Sedaris','Welcome to the hilarious, strange, elegiac, outrageous world of David Sedaris. In Naked, Sedaris turns the mania for memoir on its proverbial ear, 
mining the exceedingly rich terrain of his life, his family, and his unique worldview—a sensibility at once take-no-prisoners sharp and deeply charitable.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1394178867l/4138.jpg')
insert into Books
values
('B0138','Lamb','C009',280000,15,'Christopher Moore','The birth of Jesus has been well chronicled, as have his glorious teachings, acts, and divine
 sacrifice after his thirtieth birthday. But no one knows about the early life of the Son of God, the missing years—except Biff, the Messiah s best bud, who has been resurrected to tell the story in the
  divinely hilarious yet heartfelt work "reminiscent of Vonnegut and Douglas Adams"','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1331419009l/28881.jpg')
insert into Books
values
('B0139','The Color of Magic','C009',190000,25,'Terry Pratchett','Terry Pratchett s profoundly irreverent, bestselling novels have garnered him a revered position in the halls of parody next to the likes
 of Mark Twain, Kurt Vonnegut, Douglas Adams, and Carl Hiaasen.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1407111017l/34497.jpg')
insert into Books
values
('B0140','Life, the Universe and Everything','C009',250000,15,'Douglas Adams','The unhappy inhabitants of planet Krikkit are sick of looking at the night sky above their heads–so they plan to destroy it.
 The universe, that is. Now only five individuals stand between the killer robots of Krikkit and their goal of total annihilation.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1333577589l/8694.jpg')

insert into Books
values
('B0141','The Institute','C010',370000,15,'Stephen King','In the middle of the night, in a house on a quiet street in suburban Minneapolis, intruders silently murder Luke Ellis’s parents and load him into a black SUV.
 The operation takes less than two minutes. Luke will wake up at The Institute, in a room that looks just like his own, except there’s no window.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1549241208l/43798285.jpg')
insert into Books
values
('B0142','Imaginary Friend','C010',330000,15,'Stephen Chbosky','Imagine... Leaving your house in the middle of the night. Knowing your mother is doing her best, but shes just as scared as you.

Imagine... Starting a new school, making friends. Seeing how happy it makes your mother. Hearing a voice, calling out to you.

Imagine... Following the signs, into the woods. Going missing for six days. Remembering nothing about what happened.

Imagine... Something that will change everything... And having to save everyone you love.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1550723936l/43522576.jpg')
insert into Books
values
('B0143','The Girl in Red','C010',350000,15,'Christina Henry','Its not safe for anyone alone in the woods. There are predators that come out at night: critters and coyotes, snakes and wolves.
 But the woman in the red jacket has no choice. Not since the Crisis came, decimated the population, and sent those who survived fleeing into quarantine camps that serve as breeding grounds for
 death, destruction, and disease. She is just a woman trying not to get killed in a world that doesnt look anything like the one she grew up in, the one that was perfectly sane and normal and
 boring until three months ago.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545249589l/42881101.jpg')
insert into Books
values
('B0144','The Invited','C010',400000,20,'Jennifer McMahon','A chilling ghost story with a twist: the New York Times bestselling author of The Winter People returns to the woods of Vermont to 
tell the story of a husband and wife who dont simply move into a haunted house, they start building one from scratch, without knowing it, until its too late . . .','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1541824130l/40065317.jpg')
insert into Books
values
('B0145','The Lost Causes of Bleak Creek','C010',340000,20,'Rhett McLaughlin, Link Neal, Lance Rubin','Its 1992 in Bleak Creek, North Carolina, a sleepy little place with all the trappings
 of an ordinary Southern town: two Baptist churches, friendly smiles coupled with silent judgments, and a seemingly unquenchable appetite for pork products. Beneath the town’s cheerful façade,
 however, Bleak Creek teens live in constant fear of being sent to The Whitewood School, a local reformatory with a record of putting unruly teens back on the straight and narrow—a record so
 impeccable that almost everyone is willing to ignore the mysterious deaths that have occurred there over the past decade.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1556591693l/44034616.jpg')
insert into Books
values
('B0146','Full Throttle','C010',370000,20,'Joe Hill','A little door that opens to a world of fairy tale wonders becomes the blood-drenched stomping ground for a gang of hunters in “Faun".
 A grief-stricken librarian climbs behind the wheel of an antique Bookmobile to deliver fresh reads to the dead in “Late Returns.”','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553255544l/43801817.jpg')
insert into Books
values
('B0147','Bunny','C010',370000,20,'Mona Awad','Samantha Heather Mackey couldnt be more of an outsider in her small, highly selective MFA program at New Englands Warren University.
 A scholarship student who prefers the company of her dark imagination to that of most people, she is utterly repelled by the rest of her fiction writing cohort--a clique of unbearably
  twee rich girls who call each other "Bunny," and seem to move and speak as one.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1544742360l/42815544.jpg')
insert into Books
values
('B0148','Wakenhyrst','C010',290000,15,'Michelle Paver','1906: A large manor house, Wakes End, sits on the edge of a bleak Fen, just outside the town of Wakenhyrst. It is the home
 of Edmund Stearn and his family – a historian, scholar and land-owner, hes an upstanding member of the local community. But all is not well at Wakes End. Edmund dominates his family
  tyrannically, in particular daughter Maud. When Mauds mother dies in childbirth and shes left alone with her strict, disciplinarian father, Mauds isolation drives her to her fathers
   study, where she happens upon his diary.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1545910688l/40725252._SY475_.jpg')
insert into Books
values
('B0149','The Twisted Ones','C010',320000,15,'T. Kingfisher','When Mouse’s dad asks her to clean out her dead grandmother s house, she says yes. After all, how bad could it be?
Answer: pretty bad. Grandma was a hoarder, and her house is stuffed with useless rubbish. That would be horrific enough, but there’s more—Mouse stumbles across her step-grandfather’s
 journal, which at first seems to be filled with nonsensical rants…until Mouse encounters some of the terrifying things he described for herself.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1567950921l/42527596._SY475_.jpg')
insert into Books
values
('B0150','A Cosmology of Monsters','C010',340000,10,'Shaun Hamill','A tender and terrifying literary horror novel - the author s debut - that tells the story of a family
 (creators of a haunted house attraction called the Wandering Dark) and the hereditary monsters - both metaphorical and all-too-real - that haunt them.',
 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1553582284l/43506916.jpg')
insert into Books
values
('B0151','No One s Home','C010',320000,15,'D.M. Pulley','For fans of The Haunting of Hill House comes a dark tale of a mansion haunted by a legacy of tragedy and a family trapped by lies.
Margot and Myron Spielman move to a new town, looking for a fresh start and an escape from the long shadow of their past. But soon after they buy Rawlingswood, a foreclosed mansion rumored
 to be haunted, they realize they’re in for more of the same…or worse.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1552490936l/43706714.jpg')
insert into Books
values
('B0152','Growing Things and Other Stories','C010',310000,14,'Paul Tremblay','A chilling anthology featuring nineteen pieces of short fiction from the multiple award-winning author of the
 national bestseller The Cabin at the End of the World and A Head Full of Ghosts..','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1556112321l/42118050._SY475_.jpg')
insert into Books
values
('B0153','Song for the Unraveling of the World','C010',280000,15,'Brian Evenson','A newborn s absent face appears on the back of someone else s head, a filmmaker goes to gruesome lengths
 to achieve the silence he s after for his final scene, and a therapist begins, impossibly, to appear in a troubled patient s room late at night. In these stories of doubt, delusion, 
 and paranoia, no belief, no claim to objectivity, is immune to the distortions of human perception. Here, self-deception is a means of justifying our most inhuman impulses--whether 
 we know it or not.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1539260891l/41888678.jpg')
insert into Books
values
('B0154','The Toll','C010',280000,14,'Cherie Priest','State Road 177 runs along the Suwannee River, between Fargo, Georgia, and the Okefenokee Swamp. Drive that route from east to west,
 and you’ll cross six bridges. Take it from west to east, and you might find seven.','https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1537651567l/41555927.jpg')
insert into Books
values
('B0155','Violet','C010',330000,18,'Scott Thomas','In the lineage of Peter Straub s Julia, Scott Thomas’ Violet is the disturbing tale of a woman haunted by her long-abandoned imaginary friend.',
'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1566100001l/44349541.jpg')

