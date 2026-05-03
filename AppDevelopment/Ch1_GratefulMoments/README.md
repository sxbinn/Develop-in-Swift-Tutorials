# GratefulMoments App

## 📱 Preview

<p align="center"> 
<img width="300" alt="Image" src="https://github.com/user-attachments/assets/5850fae4-7094-41eb-9bc1-384795afbdc8" />
<img width="300" alt="Image" src="https://github.com/user-attachments/assets/27cfa55c-3e01-4534-803f-09941b656268" />
<img width="300" alt="Image" src="https://github.com/user-attachments/assets/8e2f8424-c3c8-4024-8cff-4cc211df295f" />
<img width="300" alt="Image" src="https://github.com/user-attachments/assets/36c411e2-c89b-4830-8356-d9a1acf48305" />
<img width="300" alt="Image" src="https://github.com/user-attachments/assets/df4b6137-ed7b-414b-b8ba-a69424796528" />
<img width="300" alt="Image" src="https://github.com/user-attachments/assets/744c3b5c-3c07-4f38-9081-1a4996489a56" />
</p>

---

## Ch1. Views and Data Storage

### 📚 학습한 내용

**앱 아키텍처 구조**
- **Models**: 데이터 그 자체 (데이터 타입 정의)
- **Logic**: 데이터 모델을 가공하고 다루는 코드
- **Custom Views**: 복잡하거나 특정한 UI를 담당하는 독립적인 뷰
- **TabView 구성**: `Moments`와 `Achievements` 두 개의 메인 탭 생성

**Asset 설정**
- Asset Catalog에 이미지 및 커스텀 색상 추가

**PhotosUI - `PhotosPickerItem`**
- `loadTransferable` : 사진 라이브러리의 이미지를 요청된 데이터 형식으로 앱으로 전송

**`DataContainer` - 의존성 주입 패턴**
- **창고 관리자**: SwiftData의 복잡한 설정을 한 곳에서 처리
- **스위치 기능**: "진짜 데이터"를 쓸지, 개발용 "가짜 데이터"를 쓸지 선택 가능
- **메모리 전용**: 가짜 데이터 모드일 때는 파일을 만들지 않고 메모리에서만 동작 → 깔끔하고 빠름
- **편의성**: `sampleDataContainer()` 메서드로 프리뷰 환경을 손쉽게 구축
- `ModelConfiguration` : 데이터베이스의 옵션 설정창. 메모리에만 임시로 쓸건지, 파일로 영구 저장할건지를 결정하는 것이 핵심

**제네릭 뷰 - `<Content: View>`**
- "어떤 뷰든 다 수용하겠다"는 의미로 구조체 선언에 범용 `Content` 타입을 포함
- `@ViewBuilder` 를 사용하여 외부에서 넘겨줄 뷰를 저장할 프로퍼티를 정의

```swift
struct Hexagon<Content: View>: View {
    @ViewBuilder var content: () -> Content
}
```

**`.mask`**
- 불규칙한 모양을 사용하거나 표시 영역을 초과하는 콘텐츠를 표시할 때 유용

**레이아웃 관련**
- 뷰의 크기가 유동적이고 불규칙한 모양 영역 내에 위치하기 때문에, 고정 padding 값보다 **백분율로 패딩을 계산**해야 함
- `.fixedSize` : 지정된 크기에 맞춰 뷰를 이상적인 크기로 고정. `horizontal` / `vertical` 각각 bool 값으로 고정 여부 설정
- `switch self` : 모든 케이스를 열거하면 `default` 없이도 컴파일 가능

**기타 유용한 수식어**
- `.textSelection(.enabled)` : 텍스트를 길게 누르면 복사 가능
- `.resizable` + `.scaledToFit` : 함께 작동하여 이미지의 종횡비를 유지하면서 적절한 크기로 표시
- `confirmationDialog` : 데이터를 실수로 삭제하지 않도록 항상 확인 요청 → 실수로 인한 데이터 손실 방지

## Ch2. User Experience Features

### 📚 학습한 내용

**`Codable` & `CaseIterable`**
- `Codable` : 나중에 모델을 저장할 수 있도록
- `CaseIterable` : 나머지 코드에서 모든 케이스에 접근할 수 있도록

**`BadgeManager` - 배지 관리**
- 사용자가 앱을 실행할 때 SwiftData에서 모든 배지를 사용할 수 있도록, SwiftData가 처음 연결될 때 모든 배지 데이터를 미리 저장해야 함
- `ModelContainer`랑 같이 묶어서 `DataContainer`에서 관리 → **의존성 주입**

**`throws` - 에러를 던지는 함수**
- `throws` 키워드를 붙이면 함수가 에러를 던질 수 있음
- 호출하는 쪽에서 `try` + `do-catch`로 처리

**`FetchDescriptor`**
- 데이터를 어떻게 가져올지 정의하는 구조체
- 가져올 데이터 유형 정의, 결과 필터링, 정렬, 결과 수 제한 등이 가능

```swift
var fetchDescriptor = FetchDescriptor<Badge>()
fetchDescriptor.fetchLimit = 1  // 딱 1개만 가져옴 → 데이터 존재 여부만 확인할 때
```

**`#Predicate` 필터링**
- `@Query`에 `#Predicate`를 적용하여 잠금/잠금 해제 배지를 분리해서 조회

```swift
@Query(filter: #Predicate<Badge> { $0.timestamp != nil })
private var unlockedBadges: [Badge]

@Query(filter: #Predicate<Badge> { $0.timestamp == nil })
private var lockedBadges: [Badge]
```

**`DateComponents`**
- 날짜를 부품 단위로 나눠서 다루는 구조체

```swift
DateComponents(year: 2026, month: 4, day: 21, hour: 15, minute: 30)
```

**`map` & `compactMap`**
- `map` : 배열의 모든 요소에 함수를 적용하여 변환된 결과를 담은 새로운 배열 생성
- `compactMap` : `map` 결과에서 `nil`을 제거하여 옵셔널이 없는 배열 반환

## Ch3. App Refinement

### 📚 학습한 내용

**Dynamic Type 대응**
- Dynamic Type을 고려하여 디자인할 때 확인해야 할 사항:
  - 모든 UI 요소가 제대로 표시되는가?
  - 큰 크기에서 중요한 텍스트가 잘리는가?
  - 긴 텍스트로 인해 레이아웃에 대한 가정이 무너지는가?
- `.minimumScaleFactor` : 텍스트가 공간을 넘칠 때 글자 크기를 자동으로 줄여서 잘림을 방지
- `.dynamicTypeSize(…DynamicTypeSize.xxxLarge)` : Dynamic Type으로 레이아웃이 깨질 때 허용 범위를 제한

**레이아웃 세부 조정**
- 동적 레이아웃은 단순히 가능한 한 많은 콘텐츠를 표시하는 것이 아니라 **공간을 효율적으로 사용**해야 함
- `minHeight` : 최소 크기만 보장
- `fixedSize` : 뷰가 불필요하게 커지는 것을 막고, 콘텐츠 크기에 맞게 유지
- `.scrollBounceBehavior` : 콘텐츠가 넘칠 때만 스크롤되도록 설정
- `.defaultScrollAnchor(.center, for: .alignment)` : ScrollView에서 콘텐츠를 중앙에 배치

**Localization & Internationalization**
- `^[\(numberOfDays) \nDays](inflect: true)` : 문법에 맞게 단어를 자동으로 변형 (단수/복수 처리)
- `Locale` : 날짜와 시간을 국제 형식에 맞게 표시

```swift
@Environment(\.locale) private var locale
.environment(\.locale, Locale(identifier: "es_GB"))
```

**프리뷰 팁**
- `.preferredColorScheme(.dark)` : 프리뷰를 다크 모드로 확인

**Unit Test**
- 구조체를 생성해서 매개변수를 추가해 여러 입력을 한 번에 테스트 가능