# MySQL

![](https://user-images.githubusercontent.com/40411714/58609781-d38e0d80-82e3-11e9-8eaa-976c85012eea.png)

* [**MySQL**](https://www.mysql.com)이란?
  * Oracle 다음으로 세계에서 제일 많이 쓰이는오픈 소스의 [관계형 데이터베이스 관리 시스템](https://ko.wikipedia.org/wiki/관계형_데이터베이스_관리_시스템)(RDBMS)이다

우리는 많은 프로젝트를 진행 하면서 데이터베이스를 사용 하고있다. 이번에 배우게 되는 능력단위인 **데이터베이스 성능확보**를 배우면서 기본적으로 알아야 하는것이 바로 **데이터베이스의 구조**를 알아야 하는데 이 글에서는 대표적인 [오픈소스]([https://ko.wikipedia.org/wiki/%EC%98%A4%ED%94%88_%EC%86%8C%EC%8A%A4](https://ko.wikipedia.org/wiki/오픈_소스)) 데이터베이스인 **MySQL**에 구조에 대해 알아보자.

---

### MySQL의 구조

![](https://user-images.githubusercontent.com/40411714/58611006-9415f000-82e8-11e9-951b-75210da5c2e0.jpg)

**MySQL** 서버는 크게 **서버 엔진**과 **스토리지 엔진** 으로 구분해서 볼 수 있다.

* **서버엔진**

  * DB가 SQL을 이해할 수 있도록 쿼리를 파싱하고 메모리, 물리적 저장장치와 통신하는 기능을 수행한다.
  * SQL Interface
    * SQL함수에 대한 지원을 제공하는 영역이다.
  * Parser/Optimizer
    * SQL의 권한을 확인하고, SQL문을 데이터베이스 내부 언어로 변환하고  수행 경로를 분석하는 등 SQL문을 실행하기 위한 준비 작업을 하는 영역을 말한다. 
  * Caches & Buffers
    * 빈번하게 사용되는 인덱스나 데이터를 빠르게 접근하게 하기 위해 메모리에 저장하는 영역을 말한다.

* **스토리지 엔진**

  * 서버 엔진이 필요한 데이터를 물리적 장치에서 가지고 오는 역활을 수행 한다.

  * 스토리지 엔진의 **종류**

    ![](https://user-images.githubusercontent.com/40411714/58612716-7ba8d400-82ee-11e9-8c40-23091619a674.PNG)

    * 대표적으로 MyISAM과 InnoDB가 사용된다.

      ![](https://user-images.githubusercontent.com/40411714/58614172-9ed58280-82f2-11e9-8815-455b59edfc81.PNG)

      * MyISAM
        * **비-트랜젝션-세이프 **스토리 엔진이다.
        * InnoDB에 비하여 별다른 기능이 없어 단순하고 전체적인 속도가 빠르다. **읽기 작업**( SELECT) 속도가 빨라 데이터 검색이 많은 테이블에 적합하다.
        * **Table-level-Lock**을 사용하기 때문에 쓰기 작업(INSERT, UPDATE) 속도가 느리다.
      * InnoDB
        * **트랜잭션**을 지원하므로 **트랜젝션-세이프** 스토리 엔진이다.
        * MyISAM과는 달리 COMMIT, ROLLBACK, 외래키 등 다양한 기능을 지원한다.
        * **Row-level-locking**을 사용하기 때문에 **변경 작업**(INSERT, UPDATE, DELETE)에 대한 속도가 빠르다.

---

### BNL(Block Nested Loop) 방식

* **BNL**방식이란 프로세스 내에 별도의 버퍼에 Driving 테이블의 레코드를 저장한 후에 Inner 테이블을 스캔하면서 조인 버퍼를 탐색하는 방식입니다.
* 조인할 튜플들을 페이징하여 메모리에 올린다. 
* 블럭단위로 처리하기 때문에 scan비용이 블럭 크기만큼 줄어듬

