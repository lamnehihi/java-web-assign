create database BookWebsite
use BookWebsite

GO
create table Categories
(catID nvarchar(10) not null primary key, 
catName nvarchar(50) not null)


create table Products
(pdID nvarchar(10) not null primary key,
 pdName nvarchar(50) not null, 
 catID nvarchar(10) not null,
 pdPrice float not null, 
 pdAuthor nvarchar(50) not null,
pdDes nvarchar(1000) not null, 
pdCover nvarchar(200), 
constraint FK_catID Foreign key(catID) references Categories(catID))


create table Users
(uID nvarchar(10) not null primary key, 
uEmail nvarchar(30) not null, 
uPass nvarchar(30) not null,
uName nvarchar(30) not null, 
uPhone nvarchar(10) not null,
uAddr nvarchar(30) not null)



create table Transactions
(tID nvarchar(10) not null primary key, 
uID nvarchar(10) not null,pdID nvarchar(10) not null, 
constraint FK_uID Foreign key(uID) references Users(uID),
constraint FK_pdID Foreign key(pdID) references Products(pdID)  )

/* ============================CATEGORIES VALUES================================ */
GO
insert into Categories(catID, catName) values ('Cat01', 'Action and Adventure')
insert into Categories(catID, catName) values ('Cat02', 'Classic')
insert into Categories(catID, catName) values ('Cat03', 'Comic and Graphic Novel')
insert into Categories(catID, catName) values ('Cat04', 'Crime and Detective')
insert into Categories(catID, catName) values ('Cat05', 'Drama')
insert into Categories(catID, catName) values ('Cat06', 'Fable') /* truyện ngụ ngôn */
insert into Categories(catID, catName) values ('Cat07', 'Fairy Tale') /* truyện cổ tích */
insert into Categories(catID, catName) values ('Cat08', 'Fan-fiction') /* hư cấu */
insert into Categories(catID, catName) values ('Cat09', 'Humor')
insert into Categories(catID, catName) values ('Cat10', 'Horror')
insert into Categories(catID, catName) values ('Cat11', 'Romance')
insert into Categories(catID, catName) values ('Cat12', 'Science Fiction (Sci-Fi)')
insert into Categories(catID, catName) values ('Cat13', 'Reference Books') /* sách tham khảo */
insert into Categories(catID, catName) values ('Cat14', 'Textbook')
insert into Categories(catID, catName) values ('Cat15', 'Short Story')

/* ==============================PRODUCTS VALUES=============================== */
GO
--1 Action & Adventure
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P01','The Hobbit', 'Cat01', 300000, 'J.R.R. Tolkien',
'The European languages are members of the same family.
Their separate existence is a myth. For science, music, sport, etc, Europe uses the same vocabulary.
The languages only differ in their grammar, their pronunciation and their most common words.
Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators.
To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words...')

--2 Action & Adventure
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P02','The Three Musketeers', 'Cat01', 400000, ' Alexandre Dumas',
'A wonderful serenity has taken possession of my entire soul,
like these sweet mornings of spring which I enjoy with my whole heart.
I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
that I neglect my talents. I should be incapable of drawing a single stroke at the present moment...')

--3 Classic
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P03','To Kill a Mockingbird ', 'Cat02', 250000, 'Harper Lee',
' I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.
I am so happy, my dear friend, so absorbed in the exquisite sense of mere tranquil existence,
that I neglect my talents. I should be incapable of drawing a single stroke at the present moment;
and yet I feel that I never was a greater artist than now. When, while the lovely valley teems with vapour around me,
and the meridian sun strikes the upper surface of the impenetrable foliage of my trees, 
and but a few stray gleams steal into the inner sanctuary, 
I throw myself down among the tall grass by the trickling stream...')

--4 Classic
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P04','Romeo and Juliet ', 'Cat02', 550000, 'William Shakespeare',
' When, while the lovely valley teems with vapour around me, and the meridian sun strikes the upper surface of the 
impenetrable foliage of my trees, and but a few stray gleams steal into the inner sanctuary, 
I throw myself down among the tall grass by the trickling stream; and, as I lie close to the earth, 
a thousand unknown plants are noticed by me: when I hear the buzz of the little world among the stalks, 
and grow familiar with the countless indescribable forms of the insects and flies, then I feel the presence of the 
Almighty, who formed us in his own image, and the breath of that universal love which bears and sustains us, 
as it floats around us in an eternity of bliss; and then, my friend, when darkness overspreads my eyes, and heaven and 
earth...')

--5 Commic and Graphic Novel
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P05',' Batman: The Dark Knight Returns ', 'Cat03', 700000, 'Frank Miller',
' But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and 
I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, 
the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, 
but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. 
Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because 
occasionally circumstances occur in which toil and pain can procure him some great pleasure....')

--6 Commic and Graphic Novel
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P06',' V for Vendetta ', 'Cat03', 350000, 'Alan Moore',
' Drops of rain could be heard hitting the pane, which made him feel quite sad. "How about if I sleep a little bit 
longer and forget all this nonsense", he thought, but that was something he was unable to do because he was used to 
sleeping on his right, and in his present state couldnt get into that position. However hard he threw himself onto 
his right, he always rolled back to where he was. He must have tried it a hundred times, shut his eyes so that he 
wouldnt have to look at the floundering legs, and only stopped when he began to feel a mild, dull pain there that 
he had never felt before...')

--7 Crime and Detective
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P07',' Sherlock Holmes ', 'Cat04', 1000000, 'Arthur Conan Doyle',
' "Oh, God", he thought, "what a strenuous career it is that I have chosen! Travelling day in and day out. 
Doing business like this takes much more effort than doing your own business at home, and on top of that there is the 
curse of travelling, worries about making train connections, bad and irregular food, contact with different people all 
the time so that you can never get to know anyone or become friendly with them. It can all go to Hell!...')

--8 Crime and Detective
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P08',' Murder on The Orient Express ', 'Cat04', 800000, ' Agatha Christie',
' He felt a slight itch up on his belly; pushed himself slowly up on his back towards the headboard so that he could 
lift his head better; found where the itch was, and saw that it was covered with lots of little white spots which he 
didnt know what to make of; and when he tried to feel the place with one of his legs he drew it quickly back because 
as soon as he touched it he was overcome by a cold shudder. He slid back into his former position. 
"Getting up early all the time", he thought, "it makes you stupid. You have got to get enough sleep. 
Other travelling salesmen live a life of luxury...')

--9 Drama
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P09',' Hamlet ', 'Cat05', 635000, ' William Shakespeare',
' And it is a funny sort of business to be sitting up there at your desk, talking down at your subordinates from up 
there, especially when you have to go right up close because the boss is hard of hearing. Well, there is still some 
hope; once I have got the money together to pay off my parents debt to him - another five or six years I suppose - 
that is definitely what I will do. That is when I will make the big change. First of all though, I have got to get up, 
my train leaves at five. " And he looked over at the alarm clock, ticking on the chest of drawers. "God in Heaven! " 
he thought. It was half past six and the hands were quietly moving forwards, it was even later than half past, 
more like quarter to seven. Had the alarm clock not rung?...')

--10 Drama
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P10',' The Crucible ', 'Cat05', 600000, ' Arthur Miller',
' He could see from the bed that it had been set for four o clock as it should have been; it certainly must have rung. 
Yes, but was it possible to quietly sleep through that furniture-rattling noise? True, he had not slept peacefully, 
but probably all the more deeply because of that. What should he do now? The next train went at seven; if he were to 
catch that he would have to rush like mad and the collection of samples was still not packed, and he did not at all 
feel particularly fresh and lively. And even if he did catch the train he would not avoid his boss is anger as the 
office assistant would have been there to see the five o clock train go, he would have put in his report about 
Gregor...')

--11 Fable
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P11',' Trí khôn của ta đây ', 'Cat06', 90000, ' Sưu tầm ',
' "Từ đó, cọp sinh ra con nào trên mình cũng có những vằn đen dài"
Một con cọp từ trong rừng đi ra, thấy một anh nông dân cùng một con trâu đang cày dưới ruộng. 
Trâu cặm cụi đi từng bước, lâu lâu lại bị quất một roi vào mông. Cọp lấy làm ngạc nhiên. Đến trưa, mở cày, 
Cọp liền đi lại gần Trâu hỏi:
- Này, trông anh khỏe thế, sao anh lại để cho người đánh đập khổ sở như vậy? 
Trâu trả lời khẽ vào tai Cọp:
.... ')

--12 Fable
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P12',' The Fox and The Grapes ', 'Cat06', 100000, ' Đen Vâu',
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
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P13',' Rapunzel ', 'Cat07', 50000, ' Brothers Grimm',
' Drops of rain could be heard hitting the pane, which made him feel quite sad. 
"How about if I sleep a little bit longer and forget all this nonsense", he thought, but that was something he was 
unable to do because he was used to sleeping on his right, and in his present state couldnt get into that position. 
However hard he threw himself onto his right, he always rolled back to where he was. He must have tried it a hundred 
times, shut his eyes so that he wouldnt have to look at the floundering legs, and only stopped when he began to feel 
a mild, dull pain there that he had never felt before...')

--14 Fairy Tale
 insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P14',' Beauty And The Beast ', 'Cat07', 70000, ' Gabrielle-Suzanne de Villeneuve',
' He slid back into his former position. "Getting up early all the time", he thought, "it makes you stupid. 
You have got to get enough sleep. Other travelling salesmen live a life of luxury. For instance, whenever I go back 
to the guest house during the morning to copy out the contract, these gentlemen are always still sitting there eating 
their breakfasts. I ought to just try that with my boss; I would get kicked out on the spot. But who knows, 
maybe that would be the best thing for me. If I didnt have my parents to think about I would have given in my notice a 
long time ago, I would have gone up to the boss and told him just what I think...')

--15 Fan-fiction
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P15',' Harry Potter And The Method of Rationality ', 'Cat08', 900000, ' Eliezer Yudkowsky',
'Harry had a thin face, knobbly knees, black hair and bright-green eyes. 
He wore round glasses held together with a lot of Sellotape because of all the times Dudley had punched 
him on the nose. The only thing Harry liked about his own appearance was a very thin scar on his forehead which was 
shaped like a bolt of lightning. He had had it as long as he could remember and the first question he could ever 
remember asking his Aunt Petunia was how he had got it....')

--16 Fan-fiction
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P16',' Fangirl  ', 'Cat08', 900000, 'Rainbow Rowell',
'A collection of textile samples lay spread out on the table - 
Samsa was a travelling salesman - and above it there hung a picture that he had recently cut out of an 
illustrated magazine and housed in a nice, gilded frame. It showed a lady fitted out with a fur hat and fur 
boa who sat upright, raising a heavy fur muff that covered the whole of her lower arm towards the viewer. 
Gregor then turned to look out the window at the dull weather. Drops of rain could be heard hitting the pane, 
which made him feel quite sad.....')

--17 Humor

insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P17',' The Hitchhiker’s Guide to The Galaxy  ', 'Cat09', 100000, 'Douglas Adams',
'"How about if I sleep a little bit longer and forget all this nonsense", he thought, but that was something he was 
unable to do because he was used to sleeping on his right, and in his present state couldnt get into that position. 
However hard he threw himself onto his right, he always rolled back to where he was. He must have tried it a hundred 
times, shut his eyes so that he wouldnt have to look at the floundering legs, and only stopped when he began to feel 
a mild, dull pain there that he had never felt before...')

--18 Humor
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P18',' Three Men in a Boat ', 'Cat09', 200000, 'Jerome K. Jerome',
'A collection of textile samples lay spread out on the table - Samsa was a travelling salesman -
 and above it there hung a picture that he had recently cut out of an illustrated magazine and housed in a nice, 
 gilded frame. It showed a lady fitted out with a fur hat and fur boa who sat upright, raising a heavy fur muff that 
 covered the whole of her lower arm towards the viewer...')

--19 Horror
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P19',' The Shining  ', 'Cat10', 300000, ' Stephen King',
'He must have tried it a hundred times, shut his eyes so that he wouldnt have to look at the floundering legs, 
and only stopped when he began to feel a mild, dull pain there that he had never felt before...')

--20 Horror
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P20',' It', 'Cat10', 300000, ' Stephen King',
'His boss would certainly come round with the doctor from the medical insurance company, 
accuse his parents of having a lazy son, and accept the doctor s recommendation not to make any claim as the doctor 
believed that no-one was ever ill but that many were workshy...')

--21 Romance
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P21','Fifty Shades of Grey', 'Cat11', 2000000, ' E.L James',
'He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, 
slightly domed and divided by arches into stiff sections. The bedding was hardly able to cover it and seemed 
ready to slide off any moment. His many legs, pitifully thin compared with the size of the rest of him...')

--22 Romance
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P22', 'Perfect Chemistry ', 'Cat11', 1900000, ' Simone Elkeles',
'"What is happened to me? " he thought. It wasnt a dream. His room, a proper human room although a little too small, 
lay peacefully between its four familiar walls....')

--23 Science Fiction (Sci-Fi)
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P23', 'Dune ', 'Cat12', 500000, ' Frank Herbert',
'Worries about making train connections, bad and irregular food, contact with different people all the time so that 
you can never get to know anyone or become friendly with them. It can all go to Hell! " He felt a slight itch up on 
his belly; pushed himself slowly up on his back towards the headboard so that he could lift his head better; 
found where the itch was, and saw that it was covered with lots of little white spots which he didnt know what to make 
of...')

--24 Science Fiction (Sci-Fi)
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P24', 'The Hunger Games', 'Cat12', 600000, ' Suzanne Collins',
'I go back to the guest house during the morning to copy out the contract, these gentlemen are always still sitting 
there eating their breakfasts. I ought to just try that with my boss; I would get kicked out on the spot. 
But who knows, maybe that would be the best thing for me...')

--25 Reference Books
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P25', 'Dictionary VietName_Japan', 'Cat13', 350000, ' NIHONSEI',
'Ohayoogozaimasu, watashiha danieru desu, chuugokujin desu , betonamugogadaisuki desu ... ')
Update Products
SET pdAuthor = 'NIHONSEI' , pdDes = 'Ohayoogozaimasu, watashiha danieru desu, chuugokujin desu , betonamugogadaisuki desu ...'
WHERE pdID = 'P25'
--26 Reference Books
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P26', 'The Complete Encyclopedia of Vintage Cars 1886-1940 ', 'Cat13', 650000, 'Rob de la Rive Box',
'A—B—C—D—E—F—G
H—I—J—K, L-M-N-O-P
Q—R—S, T—U—V
W—X, Y and Z
Now I know my ABC
Next time wont you sing with me?... ')

--27 Textbook
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P27', 'Discrete Mathematics And Its Applications Seventh Edition 7th Edition', 'Cat14',5527421, ' のほんせい',
'Discrete mathematics is the study of mathematical structures that are fundamentally discrete rather than continuous. 
In contrast to real numbers that have the property of varying "smoothly", the objects studied in discrete mathematics 
– such as integers, graphs, and statements in logic – do not vary smoothly in this way, but have distinct, 
separated values. Discrete mathematics therefore excludes topics in "continuous mathematics" such as calculus or 
Euclidean geometry. Discrete objects can often be enumerated by integers. More formally, discrete mathematics has been 
characterized as the branch of mathematics dealing with countable sets (finite sets or sets with the same cardinality 
as the natural numbers). However, there is no exact definition of the term "discrete mathematics." Indeed, discrete 
mathematics is described less by what is included than by what is excluded: continuously varying quantities and related 
notions... ')

--28 Textbook
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P28', 'Vietnam: A History ', 'Cat14', 280000, ' Stanley Karnow',
'A landmark work...The most complete account to date of the Vietnam tragedy." -The Washington Post Book World... ')

--29 Short Story
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P29', 'The Lottery', 'Cat15', 150000, ' Shirley Jackson',
'Tell him everything I would, let him know just what I feel. He would fall right off his desk! And it is a funny sort 
of business to be sitting up there at your desk, talking down at your subordinates from up there, especially when you 
have to go right up close because the boss is hard of hearing. Well, there is still some hope; once I have got the money 
together to pay off my parents debt to him... ')

--30 Short Story
insert into Products(pdID,pdName,catID,pdPrice,pdAuthor,pdDes)
values ('P30', 'The Illustrated Man', 'Cat15', 200000, 'Ray Bradbury',
'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a 
horrible vermin. He lay on his armour-like back, and if he lifted his head a little he could see his brown belly, 
slightly domed and divided by arches into stiff... ')



/*======================================USER INFO VALUES==============================================*/
insert into Users(uID, uEmail, uPass, uName, uPhone, uAddr) values ('U01','lam@gmail.com','123','Lam ML','0000000000',' Somewhere in china ')
insert into Users(uID, uEmail, uPass, uName, uPhone, uAddr) values ('U02','dat09@gmail.com','456','Dat 1 phit','1111111111','Viet Nam')
insert into Users(uID, uEmail, uPass, uName, uPhone, uAddr) values ('U03','tue@gmail.com','789','Tue','2222222222', ' Viet Nam ')
insert into Users(uID, uEmail, uPass, uName, uPhone, uAddr) values ('U04','phat@gmail.com','246','Phat','3333333333', 'Viet Nam')
insert into Users(uID, uEmail, uPass, uName, uPhone, uAddr) values ('U05','phuc@gmail.com','135','Phuc','4444444444', 'Viet Nam, Nihon, Kankoku')



select * from Categories
select * from Products
select * from Users
select * from Transactions