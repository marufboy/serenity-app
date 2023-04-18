//
//  HeaderView.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 15/04/23.
//

import SwiftUI

struct HeaderView: View {
    @State private var randomIndex = Int.random(in: 0..<10)
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(alignment: .center){
                HStack(alignment: .top){
                    Image(systemName: "person.fill.viewfinder")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.25)
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .padding(30)
                    //Side Header
                    VStack(alignment: .leading){
                        (
                            Text("Hi, Buddies") + Text(Image(systemName: "face.smiling.inverse"))
                        )
                        .font(.system(size: geometry.size.width * 0.08))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        
                        Text(interactiveSentences[randomIndex])
                            .font(.system(size: geometry.size.width * 0.05))
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                        
                        Text("You can answer that later")
                            .font(.system(size: geometry.size.height * 0.03))
                            .fontWeight(.ultraLight)
                            .foregroundColor(.white)
                            .padding(.top, 20)
                    }
                    .frame(width: geometry.size.width / 1.8)
                    .padding(.all, 10)
                    //Header
                }
                .frame(width: geometry.size.width)
                .padding(20)
                .onAppear() {
                    self.randomIndex = Int.random(in: 0..<10)
                }
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
                .previewDisplayName("iPad Air 4 (portrait)")
            
            HeaderView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (3rd generation)"))
                .previewDisplayName("iPad Pro 11 (3rd gen) (portrait)")
            
            HeaderView()
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (5th generation)"))
                .previewDisplayName("iPad Pro 12.9 (5th gen) (portrait)")
        }
    }
}
