# Ch3. Friends Favorite Movies App
 
## 📱 Preview

<p align="center">
 <img width="300" alt="Image" src="https://github.com/user-attachments/assets/98918c64-d566-4073-a620-fc2bcd0d37fb" />
 <img width="300" alt="Image" src="https://github.com/user-attachments/assets/08dc4b27-5898-4cc5-9aba-e12ae4e901ce" />
 <img width="300" alt="Image" src="https://github.com/user-attachments/assets/d4536289-80cf-4700-9c45-851ed7c24e7a" />
 <img width="300" alt="Image" src="https://github.com/user-attachments/assets/303e75a6-973e-4966-8bc4-ec7f2439851f" />
 <img width="300" alt="Image" src="https://github.com/user-attachments/assets/f5e75ea5-c4a0-4077-bff6-a5ef2abab179" />
 <img width="300" alt="Image" src="https://github.com/user-attachments/assets/213b2c3f-ac8d-4123-87af-440d84d84b57" />
</p>
 
## 📚 학습한 내용
 
### 1. SwiftData - CRUD
- `@Model` 매크로로 데이터 모델 클래스 정의
- `ModelContainer` / `ModelContext` 로 데이터 저장소 설정
- `context.insert()` / `context.delete()` 로 데이터 생성 및 삭제
- `@Query` 로 데이터를 자동으로 가져오고 정렬
- `isStoredInMemoryOnly: true` 옵션으로 프리뷰용 임시 데이터 구성
 
### 2. Modal Interface
- 사용자가 진행을 계속하기 전에 반드시 **완료하거나 취소**해야 하는, 짧고 명확하게 정의된 작업에 집중할 수 있도록 하는 UI 패턴
- `.sheet(item:)` 으로 새 항목 추가 시 모달 시트 표시
- `.interactiveDismissDisabled()` 로 아래로 드래그해서 실수로 닫히는 것 방지
 
### 3. ToolbarItem - `.confirmationAction` / `.cancellationAction`
- 버튼의 **역할(role)** 을 의미론적으로 지정하면, SwiftUI가 해당 플랫폼에 적합한 위치를 자동으로 결정
- 직접 위치를 지정하는 대신 역할을 정의하여 플랫폼 가이드라인에 맞는 UI 자동 구성
 
### 4. `@Bindable`
- SwiftData `@Model` 객체의 하위 속성을 `TextField` 등에 직접 바인딩할 수 있게 해주는 프로퍼티 래퍼
 
### 5. `SampleData` 싱글톤 패턴
- `static let shared` 로 앱 전체에서 하나의 인스턴스만 사용
- 프리뷰 전용 샘플 데이터를 캡슐화하여 복잡한 초기화 로직을 외부에서 숨김
 
## 🔗 참고 링크
- [Navigate Sample Data - Conclusion](https://developer.apple.com/tutorials/develop-in-swift/navigate-sample-data-conclusion)
- [Create, Update, and Delete Data - Conclusion](https://developer.apple.com/tutorials/develop-in-swift/create-update-and-delete-data-conclusion)
