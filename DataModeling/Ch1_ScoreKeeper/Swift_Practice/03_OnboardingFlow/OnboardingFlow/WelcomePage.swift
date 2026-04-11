//
//  WelcomePage.swift
//  OnboardingFlow
//
//  Created by kosoobin on 3/27/26.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(
                        LinearGradient(colors: [.blue, .green], startPoint: .top, endPoint: .bottom)
                    )
                
                Image(systemName: "car.side.fill")
                    .font(.system(size: 70))
//                    .foregroundStyle(.white)
            }
            
            Text("Kendrick Lamar - Money Trees")
                .font(.title)
                .fontWeight(.semibold)
                .fontWidth(.compressed)
                .padding(.top)
//                .border(.black, width: 1.5)
            
            Text("It go Halle Berry or hallelujah\nPick your poison, tell me what you doin'\nEverybody gon' respect the shooter\nBut the one in front of the gun lives forever\n(The one in front of the gun, forever)\nAnd I been hustlin' all day\nThis-a-way, that-a-way\nThrough canals and alleyways, just to say\nMoney trees is the perfect place for shade\nAnd that's just how I feel")
                .font(.title2)
                .multilineTextAlignment(.center)
                .fontWidth(.compressed)
//                .border(.black, width: 1.5)
        }
//        .border(.orange, width: 1.5)
        .padding()
//        .border(.purple, width: 1.5)
    }
}

#Preview {
    WelcomePage()
}
