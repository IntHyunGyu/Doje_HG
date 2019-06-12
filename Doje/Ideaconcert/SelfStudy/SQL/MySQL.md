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
        * **비-트랜젝션-세이프**스토리 엔진이다.
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

---

### 쿼리 성능 진단

* 쿼리 실행 계획

  * 쿼리 앞에 **EXPLAIN** 키워드를 붙이면 실행 계획을 확인 할 수 있다.

    ~~~ sql
    EXPLAIN SELECT * FROM test;
    ~~~

---

### WHERE 조건 이해

* 묵시적 형변환

  * 정의 : 조건절의 데이터 타입이 다를 때 우선순위가 높은 타입으로 형변환이 내부적으로 되는 것을 말함

  * 예제 : 문자열과 정수값을 비교하면, 우선순위가 낮은 문자열은 자동으로 정수 타입으로 형변환 처리 됨.

    ~~~ sql
    create table test(
    inti int unsigned not null auto_increment,
    intj int unsigned not null,
    str varchar(64) not null,
    d datetime not null,
    primary key(inti)
    );
    
    alter table test add key(intj), add key(str), add key(d);
    
    insert into test(intj, str, d)
    values(
    	crc32(rand()),
        crc32(rand()*12345),
        date_add(now(), interval -crc32(rand())/5 second)
    );
    
    INSERT INTO test(intj, str,d)
    SELECT
    	crc32(rand()),
        crc32(rand())*12345,
        date_add(now(), interval -crc32(rand())/5 second)
    FROM test;
    ~~~

    * 위 코드를 17번 실행하면 약 1만건의 row가 insert된다.

    * 실행 계획에서 intj를 문자열로 검색해보고, 정수형으로 검색 해보기

      * intj를 문자열로 검색

        * 결과 

          |  id  | select_type | table | type | possible_keys | key  | key_len | ref   | rows | Extra |
          | :--: | :---------: | :---: | ---- | ------------- | ---- | ------- | ----- | ---- | :---: |
          |  1   |   SIMPLE    | test  | ref  | intj          | intj | 4       | const | 1    | NULL  |

          * 정수형인 intj를 문자열로 검색 하였으나 결과가 제대로 조회되는 것은 명시적 형변환으로 인하여 문자열이 정수형으로 변환되었기 때문이다.

      * intj를 정수형으로 검색

        * 결과

          |  id  | select_type | table | type | possible_keys | key  | key_len | ref   | rows | Extra |
          | :--: | :---------: | :---: | ---- | ------------- | ---- | ------- | ----- | ---- | :---: |
          |  1   |   SIMPLE    | test  | ref  | intj          | intj | 4       | const | 1    | NULL  |

          * intj의 타입이 조건문의 타입과 일치하기 때문에 성공적으로 검색됨

    * 실행 계획에서 str을 문자열로 검색해보고, 정수형으로 검색 해보기

      * str을 정수형으로 검색

        * 결과

          |  id  | select_type | table | type | possible_keys | key  | key_len | ref  | rows |    Extra    |
          | :--: | :---------: | :---: | ---- | ------------- | ---- | ------- | ---- | ---- | :---------: |
          |  1   |   SIMPLE    | test  | ALL  | str           | NULL | NULL    | NULL | 8304 | Using where |

          * 묵시적 형변환이 발생하여 결과가 조회되기는 하나 인덱스를 사용하지 못하고 풀 테이블 스캔이 발생한다.
          * test테이블의 데이터가 크지 않기 때문에 수행 속도가 느리지 않으나, 만약 천만건 이상의 데이터 환경에서 테스트 하는 경우 엄청난 **성능 저하**가 발생한다.

      * str을 문자열로 검색

        * 결과

          |  id  | select_type | table | type | possible_keys | key  | key_len | ref   | rows |         Extra         |
          | :--: | :---------: | :---: | ---- | ------------- | ---- | ------- | ----- | ---- | :-------------------: |
          |  1   |   SIMPLE    | test  | ref  | str           | str  | 258     | const | 1    | Using index condition |

          * str의 타입이 조건문의 타입과 일치하기 때문에 성공적으로 검색됨

---

### 용어 찾아보기

* 인덱스 [:bookmark_tabs:](<https://lalwr.blogspot.com/2016/02/db-index.html>)

  * **RDBMS**에서 검색속도를 높이기 위해 사용하는 기술
  * 인덱스의 종류[:bookmark_tabs:](<https://mee2ro.tistory.com/2>)
    * 클러스터 인덱스 (Cluster Index) 
      * 지정한 열에 대해 자체가 "가나다" or "ABC"로 자동 정렬되어 있어 영어사전과 비슷하며, 한 테이블에 한 개만 생성 가능하다.
    * 비클러스터형 인덱스(NonClustered Index)
      *   일반 책과 비슷하며, 한 테이블에 여러 개 생성 가능하다. 클러스터형 인덱스 처럼 자동 정렬되지 않는다.

* 데이터품질에서 도메인 [:bookmark_tabs:](<http://blog.naver.com/PostView.nhn?blogId=new_magma&logNo=20038148095>)

  * 도메인
    * 동일한 유형을 갖는 속성들의 집합
  * 속성들의 공통 부분을 묶어 도메인을 나누기도 함.
  * 데이터 값을 규정하고 제한하기 위한 목적
    * ex) 설명20, 설명200, 설명1000
  * 도메인을 잘 정의하면 실제 물리DB구축 시에 각 컬럼에 잘못된 값이 입력되는 것을 사전에 예방하고 [ERD](<https://m.blog.naver.com/PostView.nhn?blogId=dktmrorl&logNo=220475357522&proxyReferer=https%3A%2F%2Fwww.google.com%2F>)를 보면서 도메인만 보더라도 데이터 포멧이나 유형을 예측 가능하다.

* B트리 [:bookmark_tabs:](<https://untitledtblog.tistory.com/75>)

  * Balanced Tree로 균형을 유지하는 [트리](<https://gmlwjd9405.github.io/2018/08/12/data-structure-tree.html>)

  * 대용량의 파일을 효율적으로 관리하기 위한 자료구조

  * 산업 분야에서 데이터베이스 시스템에 전박적으로 사용되는 구조다.

    ![](https://user-images.githubusercontent.com/40411714/58931581-2a3f8f80-879b-11e9-9ac5-ce9bcad734ab.png)
