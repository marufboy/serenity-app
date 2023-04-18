//
//  SwitchView.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 15/04/23.
//

import SwiftUI

struct SwitchView: View {
    @State private var currentView: Int = 1
    @State private var data: String? = nil
    
    var body: some View {
        ZStack {
            switch currentView {
            case 1:
                HomeView(currentView: $currentView)
            case 2:
                TutorialView(currentView: $currentView)
                    .onAppear{
                        UserDefaults.standard.visitedTutorialView = true
                    }
            case 3:
                BreathView(currentView: $currentView)
            case 4:
                SwitchStoryView(currentView: $currentView, onDataReceived: { receivedData in
                    data = receivedData
                })
            case 5:
                FlipCardVIew(currentView: $currentView, typePath: data ?? "affirmations")
//                    .onAppear{
//                        UserDefaults.standard.visitedFlipCardView = true
//                    }
            default:
                HomeView(currentView: $currentView)
            }
        }
        .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .leading)))
    }
}

extension UserDefaults {
    var visitedTutorialView: Bool {
        get { bool(forKey: "visitedTutorialView") }
        set { set(newValue, forKey: "visitedTutorialView") }
    }
    
//    var visitedFlipCardView: Bool {
//        get { bool(forKey: "visitedFlipCardView") }
//        set { set(newValue, forKey: "visitedFlipCardView") }
//    }
}

struct SwitchView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchView()
    }
}
