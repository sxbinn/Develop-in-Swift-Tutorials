# Ch1. Score Keeper App

## 📱 Preview

<p align="center">
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/e75fa167-b773-4410-9b91-a01814468254" />
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/0b867f60-5f46-4ea9-9f5d-f4a203e4bc85" />
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/a3c1e121-2ac5-48e2-88e5-82bf01fa38a4" />
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/9119f6cc-39a2-4984-84df-6d50fae27b70" />
</p>

## 📚 학습한 내용

### 1. `enum` - 열거형
- 정해진 몇 가지 상태만 존재하는 상황에 사용
- 이 프로젝트에서는 게임의 상태(`setup` / `playing` / `gameOver`)를 표현하는 데 활용

```swift
enum GameState {
    case setup
    case playing
    case gameOver
}
```

---

### 2. `Identifiable` & `UUID`
- `UUID()` 로 각 인스턴스에 고유 식별자를 자동 부여
- `Identifiable` 프로토콜을 채택하면 `ForEach` 등에서 별도 `id` 지정 없이 사용 가능

---

### 3. `Equatable` 프로토콜
- `==` 연산자를 직접 구현하면 Swift가 자동으로 `!=` 도 제공
- `lhs`(left-hand side) 와 `rhs`(right-hand side) 를 비교하는 방식으로 구현

```swift
static func == (lhs: Player, rhs: Player) -> Bool {
    lhs.name == rhs.name && lhs.score == rhs.score
}
```

---

### 4. `mutating` 함수
- `struct`는 기본적으로 내부 값을 수정할 수 없음
- `mutating` 키워드를 붙이면 **value type 내부 값을 수정** 가능하게 해줌

```swift
mutating func resetScores(to newValue: Int) { ... }
```

---

### 5. `guard` 문
- 조건이 참인지 확인하고, 참이 아니면 함수를 **조기에 종료(early exit)**
- 중첩 `if`를 줄이고 코드의 흐름을 명확하게 만들어줌

```swift
guard state == .gameOver else { return [] }
```

---

### 6. 데이터 로직 분리 (`Scoreboard`)
- `ContentView`에 데이터를 직접 두지 않고 `Scoreboard` 구조체로 분리
- 데이터를 **한 곳에서만 관리** → 유지보수가 쉬워짐

---

### 7. `@Binding` & `$` - 양방향 바인딩
- `$` 접두사를 붙이면 값을 읽는 것뿐만 아니라 **수정도 가능한 양방향 바인딩**
- 부모 뷰(`ContentView`)의 상태를 자식 뷰(`SettingsView`)에 전달할 때 사용

---

### 8. `.opacity()` 로 UI 상태 제어
- 투명도를 `0`으로 설정하면 보이지 않으면서 클릭도 되지 않음
- 게임 상태에 따라 특정 버튼/텍스트를 숨기는 데 활용

---

### 9. Swift Testing - `@Test` & `#expect`
- `@Test` 매크로로 테스트 함수 정의, `arguments`로 여러 값을 한 번에 테스트 가능
- `#expect(조건)` 으로 해당 조건이 참인지 검증

```swift
@Test("Reset player scores", arguments: [0, 10, 20])
func resetScores(to newValue: Int) async throws {
    ...
    #expect(player.score == newValue)
}
```

## 🔗 참고 링크
- [Model Data with Custom Types - Conclusion](https://developer.apple.com/tutorials/develop-in-swift/model-data-with-custom-types-conclusion)
- [Custom Types and Swift Testing - Conclusion](https://developer.apple.com/tutorials/develop-in-swift/custom-types-and-swift-testing-conclusion)