//
//  FlipCardVIew.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 15/04/23.
//

import SwiftUI

struct FlipCardVIew: View {
    //TODO: Make flip card to view when button click and shake
    @Binding var currentView: Int
    var typePath: String
    
    //MARK: Variables
    @State private var backDegree = 0.0
    @State private var frontDegree = -90.0
    @State private var isFlipped = false
    @State private var isShaking = false
    @State private var finished = false
    @State private var quote: String = "You must motivate yourself."
    
    private let width: CGFloat = 800
    private let height: CGFloat = 850
    private let durationAndDelay: CGFloat = 0.3
    private let shakeDuration: Double = 2
    
    //MARK: Flip Card Function
    private func flipCard () {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
            
        }
    }
    
    //MARK: Shake A card
    private func shake() {
        withAnimation(Animation.linear.repeatCount(Int(shakeDuration / 0.2))) {
            isShaking.toggle()
        }
    }
    
    //MARK: View Body
    var body: some View {
        GeometryReader{geometry in
            VStack {
                Text("Tap the Magic Card")
                    .font(.system(size: geometry.size.width * 0.05, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                ZStack {
                    CardFront(width: geometry.size.width * 0.8, height: geometry.size.height * 0.7, quote: quote, degree: $frontDegree)
                    CardBack(width: geometry.size.width * 0.8, height: geometry.size.height * 0.7,typePath: typePath, degree: $backDegree)
                }
                .rotation3DEffect(Angle(degrees: isShaking ? 5 : 0), axis: (x: 0, y: 1, z: 0))
                .onTapGesture {
                    shake()
                    DispatchQueue.main.asyncAfter(deadline: .now() + shakeDuration) {
                        withAnimation(.linear(duration: 0.2)) {
                            isShaking = false
                        }
                        flipCard()
                        finished = true
                    }
                }
                .onAppear {
                    quote = getRandomStringByTypePath(from: typePath) ?? "You must motivate yourself."
                }
                Spacer()
                Spacer()
                if finished { // show the "Finish" button when finished is true
                    Button(action: {
                        withAnimation {
                            currentView = 1
                        }
                    }) {
                        Text("Next")
                            .font(.title)
                            .frame(width: geometry.size.width / 5, height: geometry.size.height / 80)
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color("SecondaryColor"))
                    // Show the button if showButton is true
                    .animation(.easeInOut, value: finished)
                }
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.indigo)
        }
    }
}

struct CardBack : View {
    let width : CGFloat
    let height : CGFloat
    var typePath: String
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
            RoundedRectangle(cornerRadius: 20)
                .fill(.black.opacity(0.7))
                .padding()
                .frame(width: width, height: height)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black.opacity(0.7), lineWidth: 3)
                .padding()
                .frame(width: width, height: height)
            
            Image(systemName: typePath == "affirmations" ? "seal.fill" : "snowflake")
                .resizable()
                .frame(width: width / 8, height: height / 8)
                .foregroundColor(.blue.opacity(0.7))
            
            Image(systemName: typePath == "affirmations" ? "seal" : "snowflake")
                .resizable()
                .frame(width: width / 7, height: height / 7)
                .foregroundColor(.white)
            
            Image(systemName: typePath == "affirmations" ? "seal" : "snowflake.circle.fill")
                .resizable()
                .frame(width: width / 4, height: height / 4)
                .foregroundColor(.blue.opacity(0.7))
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}

struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    var quote: String
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: width, height: height)
                    .shadow(color: .gray, radius: 2, x: 0, y: 0)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: (height * 2)/5)
                    .offset(x: width / 2.5, y: height / 3)
                    .opacity(0.2)
                    .blendMode(.destinationOut)
                
                Image(systemName: "cloud.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: (height * 1)/5)
                    .offset(x: width / 2.5, y: height / 3)
                    .opacity(0.2)
                    .blendMode(.destinationOut)
            }.compositingGroup()
            
            
            VStack {
                Spacer()
                Text("\"\(quote)\"")
                    .font(.system(size: width * 0.06, design: .rounded))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(12)
                    .foregroundColor(Color("PrimaryColor"))
                    .padding(20)
                    .cornerRadius(20)
                Spacer()
            }
            .frame(width: width / 1.2, height: height, alignment: .center)
            .padding(50)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct FlipCardVIew_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FlipCardVIew(currentView: .constant(5), typePath: "affirmations")
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)"))
                .previewDisplayName("iPad mini (6th gen) (portrait)")
            
            FlipCardVIew(currentView: .constant(5), typePath: "stories")
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro 9.7 (portrait)")
            
            FlipCardVIew(currentView: .constant(5), typePath: "stories")
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air 5 (portrait)")
            
            FlipCardVIew(currentView: .constant(5), typePath: "stories")
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4rd generation)"))
                .previewDisplayName("iPad Pro 11 (4rd gen) (portrait)")
            
            FlipCardVIew(currentView: .constant(5), typePath: "stories")
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
                .previewDisplayName("iPad Pro 12.9 (6th gen) (portrait)")
        }
    }
}
