# Calendar Schedular

## 라이브러리
```yaml
dependencies:
  flutter:
    sdk: flutter

  cupertino_icons: ^1.0.2
  table_calendar: ^3.0.9 # 캘린더
  provider: ^6.0.5 # 상태관리
  intl: ^0.18.0 # 다국어화
  get_it: ^7.2.0 # 의존성 주입 플러그인
  drift: ^2.4.2
  path: ^1.8.2
  path_provider: ^2.0.11
  sqlite3_flutter_libs: ^0.5.12

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0
  build_runner: ^2.3.3
  drift_dev: ^2.4.1 # drift 코드 생성 플러그인
  change_app_package_name: ^1.1.0
```

## 기능
1. 캘린더에서 날짜를 선택하여 등록한 일정들을 볼 수 있습니다.
2. 우측 하단의 버튼을 클릭하여 일정을 등록할 수 있고 등록 날짜의 기준은 캘린더에서 선택한 날짜 기준입니다.
3. 등록한 일정은 체크박스로 체크가 가능합니다.
4. 일정들이 많아지면 스크롤이 가능합니다.
5. 다른 날짜에 등록된 일정이 있으면 날짜 바로 밑에 회색의 dot이 생기고 해당 날짜의 일정들을 다 완료했다고 체크를 했으면 보라색 dot으로 나타냅니다.

## 영상링크
https://youtube.com/shorts/mNMwt5Jx4Ys

## 구현 화면
### 메인 페이지
<img src="https://user-images.githubusercontent.com/74044232/212830892-bae6b313-823f-45a2-8e6f-73f9b20e48d3.jpeg" width="200" height="400"/>

### 일정 등록
<img src="https://user-images.githubusercontent.com/74044232/212830888-789c3784-34c5-49a6-b150-8a1eff182365.jpeg" width="200" height="400"/>

### 일정 등록된 화면
<img src="https://user-images.githubusercontent.com/74044232/212830886-773755d7-15fc-4b8a-a34b-10d1dca0f7a6.jpeg" width="200" height="400"/>
<img src="https://user-images.githubusercontent.com/74044232/212830881-0aab6b2f-3a66-43a1-bba6-5e5f77a982a7.jpeg" width="200" height="400"/>

## 노션 링크
https://www.notion.so/c1c2c732de6f4f1dad91c84704522c9fhttps://www.notion.so/c1c2c732de6f4f1dad91c84704522c9f