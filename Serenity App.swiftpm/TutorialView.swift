//
//  TutorialView.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 17/04/23.
//

import SwiftUI

struct TutorialView: View {
    @Binding var currentView: Int
    @State private var data: Bool? = nil
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center){
                    Text("Introduction App")
                        .font(.system(size: geometry.size.width * 0.05, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    ChatBubbleView(onDataReceived: { receivedData in
                        data = receivedData})
                    
                    if data ?? false {
                        Button(action: {
                            withAnimation {
                                currentView = 3
                            }
                        }) {
                            Text("Next")
                                .font(.title)
                                .frame(width: geometry.size.width / 5, height: geometry.size.height / 80)
                                .padding()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("SecondaryColor"))
                        .padding(.bottom, 20)
                        
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TutorialView(currentView: .constant(2))
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)"))
                .previewDisplayName("iPad mini (6th gen) (portrait)")
            
            TutorialView(currentView: .constant(2))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro 9.7 (portrait)")
            
            TutorialView(currentView: .constant(2))
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air 5 (portrait)")
            
            TutorialView(currentView: .constant(2))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4rd generation)"))
                .previewDisplayName("iPad Pro 11 (4rd gen) (portrait)")
            
            TutorialView(currentView: .constant(2))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
                .previewDisplayName("iPad Pro 12.9 (6th gen) (portrait)")
        }
    }
}
