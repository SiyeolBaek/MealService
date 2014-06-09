MealService
===========

MealService Class in AS3.0

How to use
===========

```
import siyeol.Service.MealService;

var meal : MealService = new MealService;

meal.setService( "SchoolCode" , SchoolKind , AreaCode );

meal.addEventListener(Event.COMPLETE,onComplete);

function onComplete(e:Event):void{
	
	trace(meal.getMeal(5)); //Get MealData of 5
	trace(meal.getMealData()); //Get all of datas
	trace( meal.getDetailMeal( 5 , 1 ) ); //Get date 5 lunch
}
```

Params
===========

###급식분류

0 : 조식<br>
1 : 중식<br>
2 : 석식

###학교코드

학교코드는 각 지역별 나이스 학생서비스 - 학교정보 에서 얻으실수 있습니다.

###학교분류

1 : 유치원<br>
2 : 초등학교<br>
3 : 중학교<br>
4 : 고등학교

###지역코드

0 : 서울<br>
1 : 경기도<br>
2 : 인천<br>
3 : 강원도<br>
4 : 충청북도<br>
5 : 충청남도<br>
6 : 세종시<br>
7 : 대전<br>
8 : 경상북도<br>
9 : 대구<br>
10 : 울산<br>
11 : 전라북도<br>
12 : 전라남도<br>
13 : 경상남도<br>
14 : 광주<br>
15 : 부산<br>
16 : 제주도

Contact
============
Web : http://siyeol.com<br>
Blog : http://blog.naver.com/sy0773<br>
SNS : http://facebook.com/siyeol07<br>
Mail : qortlduf505@gmail.com
