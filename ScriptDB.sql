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
insert into Categories(catID, catName) values ('C016', 'Self Growth Books')

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

--Sach Dat them
insert into Books(bName,catID,bPrice, bQuantity, bAuthor,bDes)
--31// https://m.media-amazon.com/images/I/51dOw2SF9YL.jpg
values 
('The Maze Runner', 'C012', 180000, 20, 'James Dashner',
'When Thomas wakes up in the lift, the only thing he can remember is his name. He’s surrounded by strangers—boys whose memories
are also gone.Nice to meet ya, shank. Welcome to the Glade. Outside the towering stone walls that surround the Glade is a 
limitless, ever-changing maze. It’s the only way out—and no one’s ever made it through alive. Everything is going to change.
Then a girl arrives. The first girl ever. And the message she delivers is terrifying. Remember. Survive. Run. '),
--32// https://images-na.ssl-images-amazon.com/images/I/81s5gr8znaL.jpg
('The Alchemist', 'C003', 130000, 30, 'Paulo Coelho',
'A young shepherd boy who resides in Andalusia, a mountainous region in the south of Spain. Santiago, who had given up a path
 of priesthood in order to enjoy the nomadic life of a shepherd, has recently been having recurring dreams. The dream first occurred
 to him while he and his sheep took respite in an abandoned church in the countryside. Sleeping under the sycamore growing through the
 church s ruined roof, the boy s dream sees him visited by a little girl who guides him toward the Egyptian pyramids. The little girl 
 tells him that if he goes to the pyramids, he will find a hidden treasure there. Having the dream twice, Santiago figures that it must 
 be of some importance. While en route to trade sheep s wool with a merchant he stops in the town of Tarifa, hoping to speak with a woman
 who is said to be able to interpret dreams. Upon finding her, Santiago is discomforted to learn she is a Gypsy woman; having never met 
 one before, he is somewhat unsettled by the unfamiliar furnishings of her room, as well as the unsavory stories he heard about Gypsies 
 growing up. But upon glimpsing the Sacred Heart of Jesus in her home, he is put at ease. '),
 --33// https://salt.tikicdn.com/cache/w390/ts/product/3d/48/33/94b39d773b28290e9f4ed1daa53449eb.jpg
 ('Pay Back Time', 'C016', 299000, 25, 'Phil Town',
'Phil Town’s first book, the #1 New York Times bestseller Rule #1, was a guide to stock trading for people who believe they lack the 
 knowledge to trade.  But because many people aren’t ready to go from mutual funds directly into trading without understanding investing—for 
 the long term – he created Payback Time.'),
 --34// https://images-na.ssl-images-amazon.com/images/I/81qODNqTJ5L.jpg
 ('Never eat alone', 'C016', 112000, 40, 'Keith Ferrazzi',
 'Success is rarely a solo accomplishment. The author of Never Eat Alone shows you how to eliminate artificial boundaries between personal and 
 professional relationships. Building on a foundation of intimacy and generosity, you can strengthen all your relationships and build a community 
 that can help you reach your most ambitious goals. In this live presentation, Keith Ferrazzi, one of the world s "most connected individuals", talks about:
 How to have real relationships in your professional life
 How to "warm" a cold call
 Finding time to build relationships
 Opening yourself to others generosity'),
 --35// https://salt.tikicdn.com/cache/w1200/media/catalog/product/t/u/tuoi-tho-du-doi_3.jpg
 ('Tuổi thơ dữ dội', 'C003', 299000, 25, 'Phùng Quán',
'Nhắc đến Phùng Quán, người ta sẽ nhớ ngay tới một cây bút lạ kỳ trong nền văn học Việt Nam với một tác phẩm thiếu nhi vô cùng chân thực và xúc động về một 
 thế hệ trẻ anh hùng:
 Tuổi thơ dữ dội - cuốn truyện xoay quanh cuộc sống chiến đấu và hy sinh của những thiếu niên 13, 14 tuổi trong hàng ngũ Đội thiếu niên trinh sát của trung 
 đoàn Trần Cao Vân. Những Lượm, Mừng, Quỳnh sơn ca, Hòa đen, Bồng da rắn, Vịnh sưa, Tư dát... mỗi người một hoàn cảnh song đều chung quyết tâm, nhiệt huyết 
 và lòng yêu nước, đã tham gia chiến đấu hết mình và hy sinh khi tuổi đời còn rất trẻ.'),
 --36// https://salt.tikicdn.com/ts/product/61/87/8a/082a07cec3232115e2b22636fd71593c.jpg
 ('Trên đường băng', 'C015', 46.400, 42, 'Tony buổi sáng',
'"Khi còn trẻ, hãy ra ngoài nhiều hơn ở nhà. Hãy nhào vô xin người khác “bóc hết, lột sạch” khả năng của mình. Chỉ sợ bất tài nộp hồ sơ “xin việc”, mà chả ai 
thèm cho, chả ai thèm bóc lột. Khi đã được bóc và lột hết, dù sau này đi đâu, làm gì, bạn đều cực kỳ thành công. Vì năng lực được trui rèn trong quá trình làm 
cho người khác. Sự chăm chỉ, tính kỷ luật, quen tay quen chân, quen ngáp, quen lười… cũng từ công việc mà ra. Mọi ông chủ vĩ đại đều từng là những người làm 
công ở vị trí thấp nhất. Họ đều rẽ trái trong khi mọi người rẽ phải. Họ có những quyết định không theo đám đông, không cam chịu sống một cuộc đời tầm thường, 
nhạt nhòa… rồi chết.'),
 --37// https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1429108714l/25364706.jpg
 ('Cà phê cùng Tony', 'C015', 44.100, 34, 'Tony buổi sáng',
'Có đôi khi vào những tháng năm bắt đầu vào đời, giữa vô vàn ngả rẽ và lời khuyên, khi rất nhiều dự định mà thiếu đôi phần định hướng, thì CẢM HỨNG là điều 
 quan trọng để bạn trẻ bắt đầu bước chân đầu tiên trên con đường theo đuổi giấc mơ của mình. Cà Phê Cùng Tony là tập hợp những bài viết của tác giả Tony Buổi 
 Sáng. Đúng như tên gọi, mỗi bài nhẹ nhàng như một tách cà phê, mà bạn trẻ có thể nhận ra một chút gì của chính mình hay bạn bè mình trong đó: Từ chuyện lớn 
 như định vị bản thân giữa bạn bè quốc tế, cho đến chuyện nhỏ như nên chú ý những phép tắc xã giao thông thường.'),
 --38// https://thichblog.net/wp-content/uploads/2018/12/thinking-fast-and-slow-01.u4939.d20170915.t105730.179978.jpg
 ('Tư duy nhanh và chậm', 'C003', 155.350, 60, 'Daniel Kahneman',
'Chúng ta thường tự cho rằng con người là sinh vật có lý trí mạnh mẽ, khi quyết định hay đánh giá vấn đề luôn kĩ lưỡng và lý tính. Nhưng sự thật là, dù bạn 
có cẩn trọng tới mức nào, thì trong cuộc sống hàng ngày hay trong vấn đề liên quan đến kinh tế, bạn vẫn có những quyết định dựa trên cảm tính chủ quan của mình. 
“Tư duy nhanh và chậm”, cuốn sách nổi tiếng tổng hợp tất cả nghiên cứu được tiến hành qua nhiều thập kỷ của nhà tâm lý học từng đạt giải Nobel Kinh tế Daniel Kahneman 
sẽ cho bạn thấy những sư hợp lý và phi lý trong tư duy của chính bạn. Cuốn sách được đánh giá là “kiệt tác” trong việc thay đổi hành vi của con người, Tư duy nhanh và 
chậm đã dành được vô số giải thưởng danh giá, lọt vào Top 11 cuốn sách kinh doanh hấp dẫn nhất năm 2011. Alpha Books đã mua bản quyền và sẽ xuất bản cuốn sách trong Quý 
1 năm nay. Tư duy nhanh và chậm dù là cuốn sách có tính hàn lâm cao nhưng vô cùng bổ ích với tất cả mọi người và đặc biệt rất dễ hiểu và vui nhộn.'),
--39// https://cf.shopee.vn/file/4dafe6b727ed98b72e27b70dea574b31
 ('Người giàu có nhất thành Babylon', 'C015', 68000, 55, 'George S. Clason',
'Trước mắt bạn, tương lai đang trải rộng con đường dẫn tới những miền đất xa xôi đầy hứa hẹn. Trên con đường đó, bạn háo hức, mong muốn thực hiện nhiều ước mơ, dự định, 
khát khao… của riêng mình.
Để những nguyện vọng của mình được thực hiện, ít nhất bạn phải thành công về mặt tiền bạc. Quyển sách này sẽ giúp bạn biết cách vận dụng những nguyên lý quan trọng để 
phát triển tài chính. Hãy để cuốn sách dẫn dắt bạn đi từ một hoàn cảnh khó khăn, tiêu biểu là một cái túi lép xẹp, đến một cuộc sống đầy đủ và hạnh phúc, tiêu biểu là 
một túi tiền căng phồng, sung túc.'),
--40// https://www.nxbtre.com.vn/Images/Book/nxbtre_full_31372020_023745.jpg
('Đời thay đổi khi chúng ta thay đổi', 'C015', 55000, 58, 'Andrew Matthews',
'Quyển sách này nói về việc tại sao có những người dường như lúc nào cũng ở đúng nơi và đúng lúc - và làm thế nào bạn cũng được như họ; tại sao hoá đơn tính tiền luôn 
luôn tới ngay tức khắc; tại sao đèn giao thông cứ ở màu đỏ hoài cả nửa ngày trong khi bạn đang trễ một cuộc hẹn làm ă Sách cũng bàn về việc nhận thức được các quy luật 
tự nhiên để chúng ta có thể điều chỉnh bản tính chúng ta tốt hơn.'),
--41// https://static.8cache.com/cover/o/eJzLyTDW181ONTKN9_M3sLCM1A8zyA7IiiwwzjHz1HeEAn_DSP30VGePzKzkKmPDSMdC9yQ_k4xs54gUo4iKEI8Si0ATb0dn53z9ciNDU90MYyMjAHD7Gb4=/chuyen-con-meo-day-hai-au-bay.jpg
('Chuyện con mèo dạy hải âu bay', 'C003', 49000, 58, 'Luis Sepulveda',
'Lời hứa của một con mèo cũng là trách nhiệm của toàn bộ mèo trên bến cảng, bởi vậy bè bạn của Zorba bao gồm ngài mèo Đại Tá đầy uy tín, mèo Secretario nhanh nhảu, 
mèo Einstein uyên bác, mèo Bốn Biển đầy kinh nghiệm đã chung sức giúp nó hoàn thành trách nhiệm. Tuy nhiên, việc chăm sóc, dạy dỗ một con hải âu đâu phải chuyện đùa, 
sẽ có hàng trăm rắc rối nảy sinh và cần có những kế hoạch đầy linh hoạt được bàn bạc kỹ càng…'),
--42// https://salt.tikicdn.com/ts/product/bd/08/51/da06acd3cfa862aa4fa8db5deba6fb4b.jpg
('Thông minh cảm xúc thế kỉ 21', 'C016', 98000, 70, 'Travis Bradberry & Jean Greaves',
'Lời hứa của một con mèo cũng là trách nhiệm của toàn bộ mèo trên bến cảng, bởi vậy bè bạn của Zorba bao gồm ngài mèo Đại Tá đầy uy tín, mèo Secretario nhanh nhảu, 
mèo Einstein uyên bác, mèo Bốn Biển đầy kinh nghiệm đã chung sức giúp nó hoàn thành trách nhiệm. Tuy nhiên, việc chăm sóc, dạy dỗ một con hải âu đâu phải chuyện đùa, 
sẽ có hàng trăm rắc rối nảy sinh và cần có những kế hoạch đầy linh hoạt được bàn bạc kỹ càng…'),
--43// https://bookmart.vn/wp-content/uploads/sach-dac-nhan-tam.jpg
('Đắc nhân tâm', 'C003', 76000, 58, 'Dale Carnegie',
'Là quyển sách đầu tiên có ảnh hưởng làm thay đổi cuộc đời của hàng triệu người trên thế giới, Đắc Nhân Tâm là cuốn sách đem lại những giá trị tuyệt vời cho người đọc, 
bao gồm những lời khuyên cực kì bổ ích về cách ứng xử trong cuộc sống hàng ngày. Sức lan toả của quyển sách vô cùng rộng lớn – với nhiều tầng lớp, đối tượng.'),
--44// https://salt.tikicdn.com/cache/550x550/ts/product/2b/b1/b7/60031f112d30ed96bde76d40b5b263dc.jpg
('Mắt biếc', 'C003', 110000, 70, 'Nguyễn Nhật Ánh',
'“Tôi gửi tình yêu cho mùa hè, nhưng mùa hè không giữ nổi. Mùa hè chỉ biết ra hoa, phượng đỏ sân trường và tiếng ve nỉ non trong lá. Mùa hè ngây ngô, giống như tôi vậy. 
Nó chẳng làm được những điều tôi ký thác. Nó để Hà Lan đốt tôi, đốt rụi. Trái tim tôi cháy thành tro, rơi vãi trên đường về.”'),
--45// https://cdn0.fahasa.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/o/co_gai_den_tu_hom_qua_1_2018_11_16_11_03_46.JPG
('Cô gái đến từ hôm qua', 'C003', 80000, 72, 'Nguyễn Nhật Ánh',
'Nếu ngày xưa còn bé, Thư luôn tự hào mình là cậu con trai thông minh có quyền bắt nạt và sai khiến các cô bé cùng lứa tuổi thì giờ đây khi lớn lên, anh luôn khổ sở khi 
thấy mình ngu ngơ và bị con gái “xỏ mũi”. Và điều nghịch lý ấy xem ra càng “trớ trêu’ hơn, khi như một định mệnh, Thư nhận ra Việt An, cô bạn học thông minh thường làm 
mình bối rối bấy lâu nay chính là Tiểu Li, con bé hàng xóm ngốc nghếch từng hứng chịu những trò nghịch ngợm của mình hồi xưa.'),
--46// https://cdn0.fahasa.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/i/m/image_180164_1_43_1_57_1_4_1_2_1_210_1_29_1_98_1_25_1_21_1_5_1_3_1_18_1_18_1_45_1_26_1_32_1_14_1_1234.jpg
('Cho tôi xin một vé đi tuổi thơ', 'C003', 80000, 72, 'Nguyễn Nhật Ánh',
'Truyện Cho tôi xin một vé đi tuổi thơ là sáng tác mới nhất của nhà văn Nguyễn Nhật Ánh. Nhà văn mời người đọc lên chuyến tàu quay ngược trở lại thăm tuổi thơ và tình 
bạn dễ thương của 4 bạn nhỏ. Những trò chơi dễ thương thời bé, tính cách thật thà, thẳng thắn một cách thông minh và dại dột, những ước mơ tự do trong lòng… khiến cuốn 
sách có thể làm các bậc phụ huynh lo lắng rồi thở phào. Không chỉ thích hợp với người đọc trẻ, cuốn sách còn có thể hấp dẫn và thực sự có ích cho người lớn trong quan 
hệ với con mình.'),
--47// https://www.nxbtre.com.vn/Images/Book/nxbtre_full_04152018_031555.jpg
('Tôi thấy hoa vàng trên cỏ xanh', 'C003', 125000, 32, 'Nguyễn Nhật Ánh',
'Ta bắt gặp trong Tôi Thấy Hoa Vàng Trên Cỏ Xanh một thế giới đấy bất ngờ và thi vị non trẻ với những suy ngẫm giản dị thôi nhưng gần gũi đến lạ. Câu chuyện của Tôi 
Thấy Hoa Vàng Trên Cỏ Xanh có chút này chút kia, để ai soi vào cũng thấy mình trong đó, kiểu như lá thư tình đầu đời của cu Thiều chẳng hạ ngây ngô và khờ khạo.'),
--48// https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1546100331l/32068852.jpg
('Ngày xưa có một chuyện tình', 'C003', 65000, 45, 'Nguyễn Nhật Ánh',
'Ngày xưa có một chuyện tình có phải là một câu chuyện cảm động khi người ta yêu nhau, nỗi khát khao một hạnh phúc êm đềm ấm áp đến thế; hay đơn giản chỉ là chuyện 
ba người - anh, em, và người ấy…?'),
--49// https://salt.tikicdn.com/ts/product/bd/1a/40/888d58e13c2b3e60327ad6bd577f8a3b.jpg
('Còn chút gì để nhớ', 'C003', 125000, 24, 'Nguyễn Nhật Ánh',
'Đó là những kỷ niệm thời đi học của Chương, lúc mới bước chân vào Sài Gòn và làm quen với cuộc sống đô thị. Là những mối quan hệ bạn bè tưởng chừng hời hợt thoảng 
qua nhưng gắn bó suốt cuộc đời. Cuộc sống đầy biến động đã xô dạt mỗi người mỗi nơi, nhưng trải qua hàng mấy chục năm, những kỷ niệm ấy vẫn luôn níu kéo Chương về 
với một thời để nhớ.'),
--50// https://salt.tikicdn.com/cache/w390/media/catalog/product/h/o/hoa-hong-xu-khac.jpg
('Hoa hồng xứ khác', 'C003', 80000, 64, 'Nguyễn Nhật Ánh',
'Trong truyện, Ngữ, Khoa và Hòa lé đều say mê cô bạn cùng lớp Gia Khanh. Cái cô gái bị ba người cùng theo đó sẽ phải làm sao. Ba anh chàng làm gì để “chiến thắng”. 
Điều lý thú là gần như tác giả tái hiện lại thời học trò của mình với ngôn ngữ thời bây giờ nên các bạn đọc trẻ sẽ tìm thấy hình bóng của chính mình trong đó.'),
--51// https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1454949850i/28961874._UY886_SS886_.jpg
('Con chó nhỏ mang giỏ hoa hồng', 'C003', 95000, 80, 'Nguyễn Nhật Ánh',
'Tại sao lại là con chó mang giỏ hoa hồng? Nó mang cho bạn nó, hay cho những ai biết yêu thương nó? Câu chuyện về 5 chú chó đầy thú vị và cũng không kém cảm xúc 
lãng mạn- tác phẩm mới nhất của nhà văn bestseller Nguyễn Nhật Ánh sẽ khiến bạn thay đổi nhiều trong cách nhìn về loài thú cưng số 1 thế giới này.'),
--52// https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1437835556l/25977277.jpg
('Ngôi trường mọi khi', 'C003', 72000, 34, 'Nguyễn Nhật Ánh',
'Những câu chuyện về nhóm bạn học sinh năm đầu cấp 3 với bao kỷ niệm vui buồn hờn giận, bao nhiêu trò tinh nghịch của tuổi mới lớn. Với những Hạt tiêu, 
Tóc ngắn, Hột mít, Bảnh trai, Răng chuột, Mặt mụn… đã tạo nên không khí của một lớp học thật dễ thương với bao nhiêu tình cảm yêu thương, cảm động và gần gũi. 
Đây là sách mới nhất của tác giả viết về tuổi áo trắng mộng mơ và tinh nghịch.'),
--53// https://salt.tikicdn.com/ts/product/ec/7a/e5/9d1087de4f55919f6ec8bbc48496ec6b.jpg
('Phòng trọ ba người', 'C003', 72000, 40, 'Nguyễn Nhật Ánh',
'Hẳn bạn đọc ở lứa tuổi học trò đã từng quen thuộc với tác giả Nguyễn Nhật Anh với những truyện ngắn và truyện dài đậm chất học trò như: Trại hoa vàng, Chú 
bé rắc rối, Phòng trọ ba người, Bồ câu không đưa thư, Những chàng trai xấu tính, Cô gái đến từ hôm qua, Trước vòng chung kết, Hạ đỏ, Hoa hồng xứ khác, Buổi 
chiều Windows, Ut Quyên và tôi... Với lối viết dung dị và cách chọn đề tài gần gũi với lứa tuổi học trò, như quan hệ thầy trò, trường lớp, bạn bè, gia đình... 
nên những truyện của ông chiếm được cảm tình của rất nhiều bạn đọc nhỏ tuổi. Họ hào hứng và nóng lóng đón đọc các trang viết của ông. Chúng tôi sẽ lần lượt giới 
thiệu với bạn đọc các tác phẩm của ông.'),
--54// https://www.nxbtre.com.vn/Images/Book/nxbtre_thumb_09342017_103452.jpg
('Lá nằm trong lá', 'C003', 80000, 52, 'Nguyễn Nhật Ánh',
'Chuyện của bút nhóm học trò, truyện nằm trong truyện, những cơn giận dỗi ghen tuông bạn gái bạn trai với nhau, nhiều nhất vẫn là chuyện nhà trường có các cô 
giáo hơn trò vài tuổi coi trò như bạn, có thầy hiệu trưởng tâm lý và yêu thương học trò coi trò như con…Trở lại với đề tài học trò, hóm hỉnh và gần gũi như chính 
các em, Nguyễn Nhật Ánh chắc chắn sẽ được các bạn trẻ vui mừng đón nhận. Cứ lật đằng cuối sách, đọc bài thơ tình trong veo là có thể thấy điều đó “…Khi mùa xuân 
đến / Tình anh lại đầy / Lá nằm trong lá / Tay nằm trong tay”.'),
--55// https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1336126336l/13633451.jpg
('Kính vạn hoa', 'C003', 69000, 40, 'Nguyễn Nhật Ánh',
'Đọc Kính Vạn Hoa, tôi cảm ơn Nguyễn Nhật Ánh đã dày công phản ánh những sinh hoạt muôn mặt của lứa tuổi học trò. Từ cách học với các thủ thuật “phổ thơ” để ghi 
nhớ thuộc lòng các công thức Toán, Lý, Hóa, Anh văn… đến lối làm thơ, kể vè, dựng hoạt cảnh để học tập các môn Văn, Sử. Từ trò chơi bóng đá, thi giải câu đố… ở 
sân trường đến những chuyến đi nghỉ hè khám phá các vùng xa. Từ việc tìm hiểu (và yêu mến) những người thân trong gia đình, thầy cô giáo đến việc làm quen với 
những bà con lao động đủ các nghề nghiệp: bán hàng rong, hốt rác, diễn thế thân (cascadeur), đạo diễn điện ảnh, nghệ sĩ ngôi sao, cầu thủ siêu hạng…'),
--56// https://product.hstatic.net/1000092447/product/hieuungchimmoi_tap_1_done.jpg
('Hiệu ứng chim mồi', 'C015', 75000, 46, 'Quốc Khánh',
'Quyển sách được cấu trúc thành các phần nhỏ với lý thuyết và ứng dụng đan xen. Mỗi hiện tượng hay kỹ thuật bán hàng đều được giải thích bằng lý thuyết, và mỗi 
lý thuyết đều có các ứng dụng minh họa, nhằm giúp các bạn độc giả có thể có kiến thức vững chắc và linh hoạt. Để thể hiện sự tôn trọng với các tác giả đi trước, 
mọi thông tin và số liệu lấy từ các nghiên cứu của các nhà khoa học khác đều được trích dẫn cụ thể, chính xác và ghi nguồn đầy đủ ở phần Tài liệu tham khảo.'),
--57// https://cdn0.fahasa.com/media/flashmagazine/images/page_images/dieu_vi_dai_doi_thuong_doi_bia_moi/2020_05_27_09_29_20_1.JPG
('Điều vĩ đại đời thường', 'C015', 80000, 30, 'Robin Sharma',
'Điều Vĩ Đại Đời Thường (Tái Bản) là quyển sách có nội dung về hành trình trở nên vĩ đại khởi đầu từ những điều thật giản dị và gần gũi, cũng giống như hành trình 
vạn dặm khởi đầu từ một bước chân giản đơn. 101 câu chuyện và ý tưởng của tác giả trong quyển sách này chính là 101 bài học minh chứng cho triết lý đơn sơ ấy.
Không có cuộc sống nào là hoàn hảo, tất cả chúng ta phải đối mặt với nhiều thử thách, từ đơn giản đến nghiêm trọng… Nhưng chúng ta đều có quyền lựa chọn vượt 
lên mọi nghịch cảnh để vươn tới vị trí cao nhất và tốt nhất của cuộc sống.'),
--58// https://www.sachhanoi.vn/wp-content/uploads/2018/09/quangganhlodi.jpg
('Quẳng gánh lo đi và vui sống', 'C015', 76000, 50, 'Dale Carnegie',
'Bất kỳ ai đang sống đều sẽ có những lo lắng thường trực về học hành, công việc, những hoá đơn, chuyện nhà cửa,... Cuộc sống không dễ dàng giải thoát bạn khỏi căng 
thẳng, ngược lại, nếu quá lo lắng, bạn có thể mắc bệnh trầm cảm. Quẳng Gánh Lo Đi Và Vui Sống khuyên bạn hãy khóa chặt dĩ vãng và tương lai lại để sống trong cái 
phòng kín mít của ngày hôm nay. Mọi vấn đề đều có thể được giải quyết, chỉ cần bạn bình tĩnh và xác định đúng hành động cần làm vào đúng thời điểm.'),
--59// https://product.hstatic.net/1000217031/product/image_176107_516f488bcaca4cc8bda1b349d445a8a0.jpg
('Lối sống tối giản của người Nhật', 'C015', 95000, 50, 'Sasaki Fumio',
'Chẳng có ai từ khi sinh ra đã có tài sản, đồ đạc gì trong tay. Vậy nên bất cứ ai khi mới chào đời đều là những người sống tối giản. Cứ mỗi lần bạn sở hữu trong tay 
những đồ dùng hơn mức cần thiết là một lần bạn lấy mất tự do của chính mình. Giá trị bản thân chúng ta không đo bằng những đồ dùng mà chúng ta sở hữu. Những đồ dùng 
này chỉ cho chúng ta một chút cảm giác hạnh phúc nhất thời mà thôi. Mang theo những đồ dùng hơn mức cần thiết sẽ lấy hết thời gian, năng lượng của bạn. Khi nhận ra được 
điều đó, tức là bạn đã bắt đầu trở thành một người sống tối giản.'),
--60// https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1527947135i/40360069._UY2197_SS2197_.jpg
('Nghĩ đơn giản, sống đơn thuần', 'C015', 62000, 50, 'Sasaki Fumio',
'Từ xưa đến nay, chúng ta vẫn được định hướng để tin rằng chẳng có điều gì đáng giá mà không cần đấu tranh. Bản thân tôi cũng đã dành hàng thập kỷ để nghiên cứu về 
nhận định phổ biến này. Tôi chưa bao giờ để cuộc sống trở nên dễ dàng. Tuy nhiên, giờ đây, thay vì cứ cố gắng làm mọi việc đúng theo ý mình, tôi đã tìm ra chiến lược 
để mọi thứ diễn ra theo cách của nó. Kết quả, tôi thấy mình khoẻ mạnh hơn, hạnh phúc và giàu có hơn tôi tưởng tượng. Nếu cuộc sống của bạn căng thẳng, buồn chán hoặc 
mãi quẩn quanh, đó là dấu hiệu bạn đang thiếu đi điều gì đó cốt yếu, và bạn đang tự cho phép mình ngừng phát triển. “Nghĩ đơn giản, sống đơn thuần” sẽ mang tới cho bạn 
bộ khung cơ bản để bạn nhìn nhận lại chính mình và tìm ra những mảnh ghép còn thiếu.')
/*======================================USER INFO VALUES==============================================*/
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0001','lam@gmail.com','123','Lam ML','0000000000',' Somewhere in china ')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0002','dat09@gmail.com','456','Dat 1 phit','1111111111','Viet Nam')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0003','tue@gmail.com','789','Tue','2222222222', ' Viet Nam ')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0004','phat@gmail.com','246','Phat','3333333333', 'Viet Nam')
insert into Users(uID, uEmail, uPassword, uName, uPhone, uAddress) values ('U0005','phuc@gmail.com','135','Phuc','4444444444', 'Viet Nam, Nihon, Kankoku')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('lam@gmail.com','123','Lam ML','0000000000',' Somewhere in chinaaaa ')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('dat09@gmail.com','456','Dat 1 phit','1111111111','Viet Nammmm')
insert into Users(uEmail, uPassword, uName, uPhone, uAddress) values ('tue@gmail.com','789','Tue','2222222222', ' Viet Nammmmm ')






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
