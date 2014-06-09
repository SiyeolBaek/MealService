MealService
===========

MealService Class in AS3.0

How to use
===========

“`
import siyeol.Service.MealService;

var meal : MealService = new MealService;

meal.setService( "SchoolCode" , SchoolKind , AreaCode );

meal.addEventListener(Event.COMPLETE,onComplete);

function onComplete(e:Event):void{
	
	trace(meal.getMeal(5)); //Get MealData of 5
	trace(meal.getMealData()); //Get all of datas
	trace( meal.getDetailMeal( 5 , 1 ) ); //Get date 5 lunch
}
"`

* 급식분류 *

0 - 조식
1 - 중식
2 - 석식

* 학교코드 *

학교코드는 각 지역별 나이스 학생서비스 - 학교정보 에서 얻으실수 있습니다.

* 학교분류 *

1 : 유치원
2 : 초등학교
3 : 중학교
4 : 고등학교

* 지역코드 *

0 : 서울
1 : 경기도
2 : 인천
3 : 강원도
4 : 충청북도
5 : 충청남도
6 : 세종시
7 : 대전
8 : 경상북도
9 : 대구
10 : 울산
11 : 전라북도
12 : 전라남도
13 : 경상남도
14 : 광주
15 : 부산
16 : 제주도
