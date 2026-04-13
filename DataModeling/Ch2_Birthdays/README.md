# Ch2. Birthdays App

## 📱 Preview

<p align="center">
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/4c2f9d76-5cc7-41e3-b01c-32a3cc80ea7a" />
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/974b9932-f23c-40ef-9de5-41c037cc334f" />
    <img width="300" alt="Image" src="https://github.com/user-attachments/assets/694556bb-706b-4a43-bb35-1794d318c995" />
</p>

## 📚 학습한 내용

### 1. SwiftData 도입 - `import SwiftData`
- `@Model` 매크로를 붙이면 고유한 식별자를 자동으로 부여받아 인스턴스를 자동으로 식별
- 별도로 `id` 프로퍼티를 정의하지 않아도 됨

### 2. `struct` vs `class`
- `struct`는 멤버와이즈 이니셜라이저를 자동으로 생성해줌
- `class`는 직접 `init()` 초기화 메서드를 작성해야 함
- SwiftData의 `@Model`은 `class` 기반이므로 직접 `init`을 정의해줘야 함

### 3. `.modelContainer` - 데이터 저장소 연결
- 데이터(모델)와 저장된 위치 사이의 **트랜지스터 역할**
- 데이터 저장소와 UI 사이를 연결해주는 **중간 관리자**
- 앱 진입점(`@main`)에 `.modelContainer(for:)` 를 붙여 앱 전체에 데이터 저장소를 제공

### 4. `@Environment` - `ModelContext`
- View가 데이터를 **저장·수정·삭제**할 수 있게 해주는 통로
- `@Environment(\.modelContext) private var context` 로 뷰 안에서 컨텍스트에 접근
- `context.insert()` 로 새 데이터를 저장소에 추가

## 🔗 참고 링크
- [Models and Persistence - Conclusion](https://developer.apple.com/tutorials/develop-in-swift/models-and-persistence-conclusion)