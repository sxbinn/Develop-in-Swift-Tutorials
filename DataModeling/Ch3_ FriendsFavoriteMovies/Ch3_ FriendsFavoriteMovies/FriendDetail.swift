//
//  FriendDetail.swift
//  Ch3_ FriendsFavoriteMovies
//
//  Created by kosoobin on 4/12/26.
//

import SwiftUI
import SwiftData

struct FriendDetail: View {
    // @Bindable : 하위 속성 바인딩을 텍스트필드처럼
    @Bindable var friend: Friend
    let isNew: Bool
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Movie.title) private var movies: [Movie]
    
    init(friend: Friend, isNew: Bool = false) {
        self.friend = friend
        self.isNew = isNew
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $friend.name)
                .autocorrectionDisabled()
            
            Picker("Favorite Movie", selection: $friend.favoriteMovie) {
                Text("None")
                    .tag(nil as Movie?)
                    // nil은 타입이 없기 때문에
                    // 이 nil은 Movie? 타입이라고 명시해야됨
                
                ForEach(movies) { movie in
                    Text(movie.title)
                        .tag(movie)
                }
            }
        }
        .navigationTitle(isNew ? "New Friend" : "Friend")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            if isNew {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        // 친구를 생성하기 위해 이 뷰를 시트 형태로 표시할 때,
                        // ContentView는 이미 컨텍스트에 친구를 하나 삽입해 놓은 상태
                        // 취소를 하려면 이를 제거 -> 이를 처리하기 가장 쉬운 곳은 취소 동작을 처리하는 디테일 뷰 내부
                        context.delete(friend)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend)
            .modelContainer(SampleData.shared.modelContainer)
    }
}

#Preview("New Friend") {
    NavigationStack {
        FriendDetail(friend: SampleData.shared.friend, isNew: true)
            .modelContainer(SampleData.shared.modelContainer)
    }
}
