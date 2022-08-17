class ContentRepository {
  List<Map<String, String>> data = [
    {
      "image": "assets/images/java_jeongseok.jpeg",
      "title": "자바의 정석",
      "location": "논현동",
      "price": "300",
      "status": "가능"
    },
    {
      "image": "assets/images/google_engineer.jpeg",
      "title": "구글 엔지니어는 이렇게 일한다",
      "location": "삼성동",
      "price": "600",
      "status": "가능"
    },
    {
      "image": "assets/images/doit_java.jpeg",
      "title": "Do it! Java",
      "location": "역삼동",
      "price": "300",
      "status": "불가능"
    },
    {
      "image": "assets/images/doit_flutter.jpeg",
      "title": "Do it! Flutter",
      "location": "대치동",
      "price": "600",
      "status": "가능"
    },
    {
      "image": "assets/images/springboot.jpeg",
      "title": "스프링부트와 AWS로 혼자 구현하는 웹 서비스",
      "location": "대치동",
      "price": "500",
      "status": "불가능"
    },
    {
      "image": "assets/images/effective_java.jpeg",
      "title": "이펙티브 자바 3/E",
      "location": "논현동",
      "price": "1200",
      "status": "가능"
    },
    {
      "image": "assets/images/doit_java.jpeg",
      "title": "Do it! Java",
      "location": "역삼동",
      "price": "300",
      "status": "불가능"
    },
    {
      "image": "assets/images/java_jeongseok.jpeg",
      "title": "자바의 정석",
      "location": "역삼동",
      "price": "300",
      "status": "가능"
    },
    {
      "image": "assets/images/google_engineer.jpeg",
      "title": "구글 엔지니어는 이렇게 일한다",
      "location": "역삼동",
      "price": "600",
      "status": "가능"
    },
    {
      "image": "assets/images/jpa.jpeg",
      "title": "자바 ORM 표준 JPA 프로그래밍",
      "location": "역삼동",
      "price": "500",
      "status": "불가능"
    },
    {
      "image": "assets/images/springboot.jpeg",
      "title": "스프링부트와 AWS로 혼자 구현하는 웹 서비스",
      "location": "삼성동",
      "price": "500",
      "status": "불가능"
    },
    {
      "image": "assets/images/doit_java.jpeg",
      "title": "Do it! Java",
      "location": "삼성동",
      "price": "300",
      "status": "가능"
    },
  ];

  //async로 처리해주면 await 부분 기다렸다가 처리 됨
  List<Map<String, String>> getContents() {
    return data;
  }
}
