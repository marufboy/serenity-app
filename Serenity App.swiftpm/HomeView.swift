//
//  HomeView.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 12/04/23.
//

import SwiftUI

struct HomeView: View {
    //Variable Slide Down
    @Binding var currentView: Int
    
    
    @State private var randomIndex = Int.random(in: 0..<10)
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center){
                    Spacer()
                    //Header and say hi buddies
                    HeaderView()
                    
                    //TODO: Accessories that can interest people that use this app
                    Button(action: {
                        withAnimation{
                            currentView = UserDefaults.standard.visitedTutorialView ? 3 : 2
                        }
                    }) {
                        Text("Next")
                            .font(.title)
                            .frame(width: geometry.size.width / 5, height: geometry.size.height / 80)
                            .padding()
                    }
                    .tint(Color("SecondaryColor"))
                    .buttonStyle(.borderedProminent)
                    Spacer()
                }.frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

//struct HomeMenuView: View{
//    @Binding var currentView: Int
//    var geometry : GeometryProxy
//
//    var body: some View{
//        HStack(alignment: .center, spacing: 20){
//            Button(action: {
//                withAnimation{
//                    currentView = 3
//                }
//            }) {
//                Text("Breathing Exercise")
//                    .font(.title)
//                    .frame(width: geometry.size.width / 5, height: geometry.size.height / 80)
//                    .padding()
//            }
//            .tint(Color("SecondaryColor"))
//            .buttonStyle(.borderedProminent)
//
//            Button(action: {
//                withAnimation{
//                    currentView = 4
//                }
//            }) {
//                Text("Self Talks")
//                    .font(.title)
//                    .frame(width: geometry.size.width / 5, height: geometry.size.height / 80)
//                    .padding()
//            }
//            .tint(Color("SecondaryColor"))
//            .buttonStyle(.borderedProminent)
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView(currentView: .constant(1))
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)"))
                .previewDisplayName("iPad mini (6th gen) (portrait)")
            
            HomeView(currentView: .constant(1))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro 9.7 (portrait)")
            
            HomeView(currentView: .constant(1))
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air 5 (portrait)")
            
            HomeView(currentView: .constant(1))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4rd generation)"))
                .previewDisplayName("iPad Pro 11 (4rd gen) (portrait)")
            
            HomeView(currentView: .constant(1))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
                .previewDisplayName("iPad Pro 12.9 (6th gen) (portrait)")
        }
    }
}


