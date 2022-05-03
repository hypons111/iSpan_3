﻿use productDB

CREATE TABLE producttype (
	producttypeid INT IDENTITY(1, 1) PRIMARY KEY Not Null, 
	producttypename VARCHAR(20) UNIQUE Not Null, 
)
INSERT INTO producttype VALUES
('蔬菜類'),
('根莖瓜果類'),
('水果類'),
('生鮮肉類'),
('雜糧乾貨'), 
('甜點飲料')

CREATE TABLE product (
	systemid INT Not Null IDENTITY(1, 1) PRIMARY KEY , 
	productid VARCHAR(12) Not Null, 
	producttype VARCHAR(20) Not Null, 
	productname NVARCHAR(100) Not Null, 
	productstock INT Not Null, 
	productcost NUMERIC(6, 1) Not Null, 
	productprice NUMERIC(6, 1) Not Null, 
	productimage VARCHAR(100) Not Null, 
	productdescription NVARCHAR(500) Not Null,
	productstate BIT Not Null
)

INSERT INTO product VALUES
('220419183501',	'蔬菜類', 		'高麗菜',		100,	80,		90,		'220419183501.jpg',	'高麗菜營養相當豐富，含有大量維生素C、纖維素、碳水化合物和各種礦物質。除此以外結球甘藍還含有維生素U，維生素U是抗潰瘍因子，並具有分解亞硝酸胺的作用。結球甘藍裡的吲哚（indole）能改變雌激素的代謝，降低乳癌風險，其所含有的異硫氰酸鹽，可降低致癌物的毒性，有效預防肺癌和食道癌。結球甘藍中含有的蘿蔔硫素，則是功能強大的抗氧化物，可以增強體內酵素的解毒能力，也是維生素C和植物纖維的良好來源。',				1),
('220419183502',	'蔬菜類', 		'空心菜',		100,	90,		100,	'220419183502.jpg',	'以嫩莖、綠葉來炒食或煮湯，作為夏秋高溫季節的主要菜餚之一。普通家庭或餐館炒蕹菜，常常以蒜頭或鹽和醬油進行調味，偶爾加入牛肉。當中常見菜色包括盛行於粵港澳地區的椒絲腐乳通菜以及流行於星馬兩地的「馬來風光」（即辣炒通心菜）。',			1),
('220419183503',	'蔬菜類', 		'青江菜',		100,	20,		28,		'220419183503.jpg',	'莖葉均使用，求新鮮。嫩莖食用常浸入香料中。在各系菜餚中多維持原鮮艷嫩綠色彩。相對其他以炒食爲主的青菜，上海青以蒸、煮方式烹調頗爲常見，尤其以火鍋和白灼兩種形式受到歡迎，還可以加蠔油、豆瓣醬、生抽是常見的輔料，亦常單獨作爲主料。',					1),
('220419183504',	'蔬菜類', 		'小白菜',		100,	25,		35,		'220419183504.jpg',	'葉色淡綠，葉面寬，菜梗細長，口感軟嫩，適合清炒、煮湯。建議大火快炒即可盛盤，避免營養成分流失。',			1),
('220419183505',	'蔬菜類',		'芹菜',			100,	30,		40,		'220419183505.jpg',	'蘊含著很強壯的營養素，例如：維生素A、B群、C、D、E和K；礦物質鈣、鉀、鐵、鎂；以及核黃素、葉酸等，營養價值高。',						1),

('220419183506',	'根莖瓜果類',	'青椒',			100,	30,		40,		'220419183506.jpg',	'辣味極淡或根本不辣，味微甜，有些特別培育的品種甚至能有水果等級的甜度。甜椒和辣椒一樣，含有豐富的維生素C，此外還含有微量營養素以及維生素K，可以防治壞血病，對牙齦出血、貧血等疾病都有輔助的治療作用。',						1),
('220419183527',	'根莖瓜果類',	'黃椒',			100,	30,		40,		'220419183527.jpg',	'辣味極淡或根本不辣，味微甜，有些特別培育的品種甚至能有水果等級的甜度。甜椒和辣椒一樣，含有豐富的維生素C，此外還含有微量營養素以及維生素K，可以防治壞血病，對牙齦出血、貧血等疾病都有輔助的治療作用。',						1),
('220419183528',	'根莖瓜果類',	'紅椒',			100,	30,		40,		'220419183528.jpg',	'辣味極淡或根本不辣，味微甜，有些特別培育的品種甚至能有水果等級的甜度。甜椒和辣椒一樣，含有豐富的維生素C，此外還含有微量營養素以及維生素K，可以防治壞血病，對牙齦出血、貧血等疾病都有輔助的治療作用。',						1),


('220419183507',	'根莖瓜果類',	'番茄', 		100,	40,		50,		'220419183507.jpg',	'紅色蕃茄既含蕃茄紅素又含胡蘿蔔素；而橙色的蕃茄蕃茄紅素含量偏少，胡蘿蔔素含量更高，口感偏甜，更適宜作為水果食用。',						1),
('220419183508',	'根莖瓜果類',	'小黃瓜',		100,	18,		20,		'220419183508.jpg',	'可生吃也可榨汁，入饌常作涼菜。如拍黃瓜、熗黃瓜皮、酸辣黃瓜、醃黃瓜等。黃瓜也可和炸醬麵同食，或者作湯或熱菜。另外黃瓜可切絲作菜碼和用作拼盤、菜餚的雕刻和裝飾材料。熱菜多用於炒、熘等菜的配料，也作釀菜，或用於氽湯。吃入口中脆酥嫩爽。又常用作酸漬、醬浸、醃製菜品原料。',							1),
('220419183509',	'根莖瓜果類',	'甜豆筴',		100,	25,		25,		'220419183509.jpg',	'鹽水煮熟，現剝現吃。這種吃法在中國、日本很常見，之後傳入夏威夷及美國，而將水煮花生與毛豆拼盤而成的下酒菜。',				1),
('220419183510',	'根莖瓜果類',	'玉米',			100,	70,		79,		'220419183510.jpg',	'玉米的營養素眾多，富含維生素A、維生素C、維生素E、葉黃素、玉米黃素、α-胡蘿蔔素及鐵、鈣、鎂、鉀，等營養素及礦物質。而玉米的營養密度更是白飯的6倍，可以考慮用此替代白飯。',					1),
('220419183511',	'水果類',		'蘋果',			100,	50,		60,		'220419183511.jpg',	'紐西蘭的環境優良，太陽日曬充足，脆度高且多汁，富士蘋果是從日本引進栽培種植，酸甜平衡，脆度高，肉質細緻，清脆多汁。',		1),
('220419183512',	'水果類',		'香蕉',			80,		70,		80,		'220419183512.jpg',	'香蕉幾乎含有所有的維生素和礦物質，因此從中可以很容易地攝取各種營養素。香蕉膳食纖維含量豐富，而且一根淨重約100克的香蕉的熱量大約相當是一餐白飯的一半。',				1),
('220419183513',	'水果類',		'奇異果',		80,		49,		59,		'220419183513.jpg',	'奇異果中的維他命C能提升免疫力，降低出現感冒或類似疾病，受傷時加速傷口愈合，尤其對高危的65歲以上長者及小童特別有效。',					1),
('220419183514',	'水果類',		'葡萄柚',		80,		45,		55,		'220419183514.jpg',	'吃葡萄柚方式很多，可以和萵苣、酪梨等蔬果搭配做成沙拉，也可以把葡萄柚和冰塊一起打成冰沙。',				1),
('220419183515',	'水果類',		'芭樂',			80,		45,		55,		'220419183515.jpg',	'芭樂又稱為番石榴，因為在台灣一年四季都會結果，且方便購買又富含了許多營養，因此也有國民水果的美稱。芭樂和芭樂籽都具有高膳食纖維，每100公克的芭樂中，約含有1.4克的粗纖維、3克的膳食纖維。芭樂籽更含有胡蘿蔔素、糖苷、黃酮類和酚類化合物等營養，有助於促進腸胃蠕動、增加腸道好菌。芭樂所含的營養素。',							1),

('220419183516',	'生鮮肉類',		'臉頰肉',		80,		250,	280,	'220419183516.jpg',	'相信堅持的價值，尋找台灣真食物 老品種的台灣黑豬，擁有桃園豬的細緻Q彈肉質，梅山豬柔嫩多汁的脂肪優勢。堅持使用品種選育搭配全素飼料配方，飼養過程絕對不使用瘦肉精及抗生素。',					1),
('220419183517',	'生鮮肉類',		'梅花肉',		80,		150,	180,	'220419183517.jpg',	'人道飼養給予豬隻通風環境及足夠的運動空間，定期幫黑豬沖澡，造就正黑豬獨特的風味與口感。',							1),
('220419183518',	'生鮮肉類',		'大里肌肉排',	80,		100,	150,	'220419183518.jpg',	'相信堅持的價值，尋找台灣真食物 老品種的台灣黑豬，擁有桃園豬的細緻Q彈肉質，梅山豬柔嫩多汁的脂肪優勢。堅持使用品種選育搭配全素飼料配方，飼養過程絕對不使用瘦肉精及抗生素，人道飼養給予豬隻通風環境及足夠的運動空間，定期幫黑豬沖澡，造就正黑豬獨特的風味與口感。',						1),
('220419183519',	'生鮮肉類',		'雞柳',			80,		120,	165,	'220419183519.jpg',	'古早放山雞品種，接近400年先民渡台品種，適應台灣風土，抗病性特佳。 ．成長週齡達14-15週，換肉率不如肉雞，但肉質扎實鮮甜，無腥味。 ．低密度放養，運動量十足。 ．餵食穀物、天然果實、小蟲，營養均衡。 ．單一牧場來源，安全有保障！',							1),
('220419183520',	'生鮮肉類',		'沙朗牛排',		80,		1500,	1780,	'220419183520.jpg',	'精選來自澳洲和牛肉（M7 等級），以日本的飼養技術培育。 澳洲和牛兼具油花密布的日本和牛與安格斯牛的豐富牛肉風味。一般穀物飼養牛的飼養天數大約3 個月至5 個月，但GREEN & SAFE 精選澳洲和牛，在天然的放養環境飼養約18 個月，生長期前15 個月餵食母乳及草，15 個月後餵食穀物，均勻的高能量，讓澳洲和牛的肉質呈現櫻桃紅色，肉質鮮嫩多汁，白色脂肪紋均勻分佈，一入口即可享受豐富的美味口感。 適 合：煎、烤',				1),
('220419183521',	'生鮮肉類',		'和牛火鍋肉片',	80,		750,	799,	'220419183521.jpg',	'M9等級，越高級數的牛肉，油花也就越綿密。 牛小排(short rib meat)取自牛隻的前胸肋骨部位，以帶骨或去骨的形式呈現，具有大理石紋脂肪，肉質鮮美，是最廣為人知的部位， 無論油花分布和肉質都是最為上等的部位。 適 合：燙、炒',							1),
('220419183522',	'生鮮肉類',		'草飼沙朗牛排',	80,		200,	280,	'220419183522.jpg',	'純淨天然草原放養，運動量十足，油花適中，肉香味濃郁，肉質甜美。 適 合：煎、烤',						1),
('220419183523',	'生鮮肉類',		'牛肋眼牛排',	80,		500,	590,	'220419183523.jpg',	'肋眼為牛的肋肌部，油花的大理石紋較多且分佈均勻，是老饕的最愛；尤其Prime等級的肉質鮮嫩，柔嫩多汁，風味香醇濃郁。肋眼牛排適合在料理時將油脂燒透，迸發出的牛油香氣隨著柔嫩多汁的牛肉一同入口，實屬一大享受。適 合：煎、烤',						1),

('220419183524',	'雜糧乾貨',		'寬麵',			200,	50,		85,		'220419183524.jpg',	'老師傅數十年經驗完美比例調和安心小麥粉、鹽與水，低溫烘乾，歷經12道繁複的滾輪壓實方法，將麵筋充分延展，香Q有勁、口感扎實，充滿小麥的原始香氣，配上GREEN & SAFE各式醬料，輕鬆品嚐古早味。',		1),
('220419183525',	'雜糧乾貨',		'細麵',			200,	50,		85,		'220419183525.jpg',	'老師傅數十年經驗完美比例調和安心小麥粉、鹽與水，低溫烘乾，歷經12道繁複的滾輪壓實方法，將麵筋充分延展‧香Q有勁、口感扎實，充滿小麥的原始香氣，配上GREEN & SAFE各式醬料，輕鬆品嚐古早味。',	1),
('220419183526',	'雜糧乾貨',		'麵線',			200,	50,		85,		'220419183526.jpg',	'老師傅數十年經驗完美比例調和安心小麥粉、鹽與水‧低溫烘乾，歷經16道繁複的滾輪壓實方法，將麵筋充分延展‧香Q有勁、口感扎實，充滿小麥的原始香氣，配上GREEN & SAFE各式醬料，輕鬆品嚐古早味。',						1)



use productDB
select * from product ORDER BY productid
select * from ProductType ORDER BY producttypeid


use productDB
drop table product 
drop table ProductType 
