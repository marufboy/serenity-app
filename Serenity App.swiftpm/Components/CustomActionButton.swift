//
//  CustomActionButton.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 12/04/23.
//

import SwiftUI

struct CustomActionButton: View {
    var title: String
    var subtitle: String
    var imageName: String
    var widthImage: Double
    var heightImage: Double
    
    var body: some View{
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
            ZStack{
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: widthImage, height: heightImage)
                    .cornerRadius(20)
                
                
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: (heightImage * 3)/4)
                    .offset(x: widthImage / 2.5, y:0)
                    .opacity(0.2)
                    .blendMode(.destinationOut)
            }.compositingGroup()
            
            VStack(alignment: .leading){
                Text(title)
                    .font(.system(size: widthImage / 12, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(width: widthImage / 1.2, height: heightImage / 3, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40)
                    .padding(.top, 20)
                    .padding(.bottom, 80)
                Spacer()
                Text(subtitle)
                    .font(.system(size: widthImage / 18, design: .rounded))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(width: widthImage / 1.2, height: heightImage / 4, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 40)
                    .padding(.bottom, 50)
            }
            .frame(height: heightImage)
        }
        .padding(.all)
    }
}

struct CustomActionButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomActionButton(title: "Magic Self talk", subtitle: "Calmness is within your reach. Let me show you through a moment of reflection." ,imageName: "moon.haze.fill", widthImage: 800, heightImage: 800)
    }
}
