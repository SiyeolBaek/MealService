package siyeol.Service  {
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.events.EventDispatcher;
	
	public class MealService extends EventDispatcher {
		
		public var MealData : String = "";
		public var Meal : String = "";
		public var schulCode : String = "";
		public var areaName : String = "";
		public var schulCrseScCode : Number , schulKndCode : Number;
		public var whenArr : Array = new Array( "[조식]","[중식]","[석식]" );
		
		public function setService( recivedschulCode : String , schulKnd : Number , areaCode : Number ) {
			
			schulCode = recivedschulCode;
			
			switch( schulKnd ) {
				
				case 1:
				schulCrseScCode = 1;
				schulKndCode = 01;
				break;
				
				case 2:
				schulCrseScCode = 2;
				schulKndCode = 02;
				break;
				
				case 3:
				schulCrseScCode = 3;
				schulKndCode = 03;
				break;
				
				case 4:
				schulCrseScCode = 4;
				schulKndCode = 04;
				break;
				
			}
			
			switch( areaCode ) {
				
				case 0:
				areaName = "http://hes.sen.go.kr/sts_sci_md00_001.do"; //서울
				break;
				
				case 1:
				areaName = "http://hes.goe.go.kr/sts_sci_md00_001.do"; //경기도
				break;
				
				case 2:
				areaName = "http://hes.ice.go.kr/sts_sci_md00_001.do"; //인천
				break;
				
				case 3:
				areaName = "http://hes.kwe.go.kr/sts_sci_md00_001.do"; //강원도
				break;
				
				case 4:
				areaName = "http://hes.cbe.go.kr/sts_sci_md00_001.do"; //충청북도
				break;
				
				case 5:
				areaName = "http://hes.cne.go.kr/sts_sci_md00_001.do"; //충청남도
				break;
				
				case 6:
				areaName = "http://hes.sje.go.kr/sts_sci_md00_001.do"; //세종시
				break;
				
				case 7:
				areaName = "http://hes.dje.go.kr/sts_sci_md00_001.do"; //대전
				break;
				
				case 8:
				areaName = "http://hes.gbe.kr/sts_sci_md00_001.do"; //경상북도
				break;
				
				case 9:
				areaName = "http://hes.dge.go.kr/sts_sci_md00_001.do"; //대구
				break;
				
				case 10:
				areaName = "http://hes.use.go.kr/sts_sci_md00_001.do"; //울산
				break;
				
				case 11:
				areaName = "http://hes.jbe.go.kr/sts_sci_md00_001.do"; //전라북도
				break;
				
				case 12:
				areaName = "http://hes.jne.go.kr/sts_sci_md00_001.do"; //전라남도
				break;
				
				case 13:
				areaName = "http://hes.gne.go.kr/sts_sci_md00_001.do"; //경상남도
				break;
				
				case 14:
				areaName = "http://hes.gen.go.kr/sts_sci_md00_001.do"; //광주
				break;
				
				case 15:
				areaName = "http://hes.pen.go.kr/sts_sci_md00_001.do"; //부산
				break;
				
				case 16:
				areaName = "http://hes.jje.go.kr/sts_sci_md00_001.do"; //제주도
				break;
				
			}
			
			parsingMealData( schulCode , schulCrseScCode , schulKndCode );
			
		}
		
		public function getMeal( date : Number ) {
			
			Meal = MealData;
			Meal = Meal.split( "<!-- 월간식단표 -->" )[1];
			Meal = Meal.split( "<!-- 월간식단표조회 컨텐츠 끝 -->" )[0];
			Meal = Meal.split( "<td>" + date )[1];
			Meal = Meal.split( "</td>" )[0];
			
			if(Meal.length == 0){
				return null;
			}
			
			return Meal;
			
		}
		
		public function getMealData() {
			
			Meal = MealData;
			Meal = Meal.split( "<!-- 월간식단표 -->" )[1];
			Meal = Meal.split( "<!-- 월간식단표조회 컨텐츠 끝 -->" )[0];
			
			return Meal;
			
		}
		
		public function getDetailMeal( date : Number , when : Number ) {
			
			Meal = MealData;
			Meal = Meal.split( "<!-- 월간식단표 -->" )[1];
			Meal = Meal.split( "<!-- 월간식단표조회 컨텐츠 끝 -->" )[0];
			Meal = Meal.split( "<td>" + date )[1];
			Meal = Meal.split( "</td>" )[0];
			
			if(Meal.length == 0){
				return null;
			}
			
			if(Meal.indexOf( whenArr[when] ) == -1){
				
				return null;
				
			}
			
			Meal = Meal.split( whenArr[when] + "<br />" )[1];
			Meal = Meal.split( "<br />" + whenArr[when + 1] )[0];
			Meal = Meal.split( "<br />" ).join( "/" );
			
			return Meal;
			
		}
		
		private function parsingMealData( schulCode : String , schulCrseScCode : Number , schulKndCode : Number ) {
			
			var urlLoader:URLLoader = new URLLoader;

			var urlRequest:URLRequest = new URLRequest;

			urlRequest = new URLRequest( areaName );

			urlRequest.method = "post";

			var urlVariables:URLVariables = new URLVariables;

			urlVariables.schulCode = schulCode;
			urlVariables.schulCrseScCode = schulCrseScCode;
			urlVariables.schulKndScCode = schulKndCode;


			urlRequest.data = urlVariables;

			urlLoader.load( urlRequest );
			urlLoader.addEventListener( Event.COMPLETE,onCompleteListener );
			
		}
		
		private function onCompleteListener( e : Event ) {
			
			MealData = e.currentTarget.data;
			update();
			
		}
		
		private function update( ) {
			
			dispatchEvent( new Event( Event.COMPLETE ) );
			
		}

	}
	
}
