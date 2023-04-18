//
//  SwitchStoryView.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 15/04/23.
//

import SwiftUI

struct SwitchStoryView: View {
    @Binding var currentView: Int
    var onDataReceived: ((String) -> Void)?
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.purple]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    //TODO: Header for what must user choose
                    //Header Text
                    Text("Choose your path")
                        .font(.system(size: geometry.size.width * 0.05))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    CustomActionButton(title: "Magic Self Talk", subtitle: "Calmness is within your reach. Let me show you through a moment of reflection.", imageName: "wand.and.stars", widthImage: geometry.size.width * 0.8, heightImage: geometry.size.height / 2.5)
                        .onTapGesture {
                            currentView = 5
                            onDataReceived?("affirmations")
                        }
                    
                    CustomActionButton(title: "Zero To Hero Reflection",subtitle: "Zero to hero with a calm mind. Let's reflect together.", imageName: "wand.and.stars", widthImage: geometry.size.width * 0.8, heightImage: geometry.size.height / 2.5)
                        .onTapGesture {
                            currentView = 5
                            onDataReceived?("stories")
                        }
                }
            }
        }
    }
}

struct SwitchStoryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SwitchStoryView(currentView: .constant(4))
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)"))
                .previewDisplayName("iPad mini (6th gen) (portrait)")
            
            SwitchStoryView(currentView: .constant(4))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro 9.7 (portrait)")
            
            SwitchStoryView(currentView: .constant(4))
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air 5 (portrait)")
            
            SwitchStoryView(currentView: .constant(4))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4rd generation)"))
                .previewDisplayName("iPad Pro 11 (4rd gen) (portrait)")
            
            SwitchStoryView(currentView: .constant(4))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
                .previewDisplayName("iPad Pro 12.9 (6th gen) (portrait)")
        }
    }
}
