//
//  MomentsView.swift
//  GratefulMoments
//
//  Created by kosoobin on 4/20/26.
//

import SwiftUI
import SwiftData

struct MomentsView: View {
    @State private var showCreateMoment = false
    @Query(sort: \Moment.timestamp)
    private var moments: [Moment]
    
    static let offsetAmount: CGFloat = 70.0
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 0, pinnedViews: .sectionHeaders) {
                    Section {
                        pathItems
                            .frame(maxWidth: .infinity)
                    } header: {
                        streakHeader
                    }
                }
            }
            .overlay {
                if moments.isEmpty {
                    ContentUnavailableView {
                        Label("아직 게시된 내용이 없습니다!", systemImage: "exclamationmark.circle.fill")
                    } description: {
                        Text("감사의 마음을 담아 이 공간에 글이나 사진을 남겨보세요.")
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateMoment = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .sheet(isPresented: $showCreateMoment) {
                        MomentEntryView()
                    }
                }
            }
            .defaultScrollAnchor(.bottom, for: .initialOffset)
            .defaultScrollAnchor(.bottom, for: .sizeChanges)
            .defaultScrollAnchor(.top, for: .alignment)
            .navigationTitle("Grateful Moments")
        }
        .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
    }
    
    private var pathItems: some View {
        ForEach(moments.enumerated(), id: \.0) { index, moment in
            NavigationLink {
                MomentDetailView(moment: moment)
            } label: {
                // 가장 최근 항목이 눈에 띄도록
                if moment == moments.last {
                    MomentHexagonView(moment: moment, layout: .large)
                } else {
                    MomentHexagonView(moment: moment)
                        .offset(x: sin(Double(index) * .pi / 2) * Self.offsetAmount)
                }
            }
            .scrollTransition { content, phase in
                content
                    .opacity(phase.isIdentity ? 1 : 0)
                    .scaleEffect(phase.isIdentity ? 1: 0.8)
            }
        }
    }
    
    @ViewBuilder private var streakHeader: some View {
        let streak = StreakCalculator().calculateStreak(for: moments)
        if streak > 0 {
            HStack {
                Text(verbatim: "\(streak)")
                Text(Image(systemName: "flame.fill"))
                    .foregroundStyle(.ember)
                Spacer()
            }
            .font(.subheadline)
            .padding()
        }
    }
}

#Preview {
    MomentsView()
        .sampleDataContainer()
}

#Preview("No moments") {
    MomentsView()
        .modelContainer(for: [Moment.self])
        .environment(DataContainer())
}
