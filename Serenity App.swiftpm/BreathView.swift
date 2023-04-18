import SwiftUI

struct BreathView: View {
    @Binding var currentView: Int
    
    @State private var progress: Double = 0
    @State private var breathingState: BreathingState = .inhale
    
    //timer
    @State var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var countBreath: Int = 0
    @State private var timeStart: Double = 0
    @State private var timeFinish: Double = 4
    @State private var colorSelected: Color = Color("PrimaryColor")
    @State private var showButton = false // added state variable
    @State private var isShowingRepeatSheet = false
    @State private var isPlayingTimer = false
    
    //variant
    let durations: [TimeInterval] = [4, 7, 8] // durations in seconds
    
    enum BreathingState {
        case inhale
        case hold
        case exhale
    }
    
    var colorBreathing: Color {
        switch breathingState {
        case .inhale:
            return Color("PrimaryColor")
        case .hold:
            return Color("SecondaryColor")
        case .exhale:
            return .cyan
        }
    }
    
    var breathingText: String {
        switch breathingState {
        case .inhale:
            return "Inhale for 4 seconds"
        case .hold:
            return "Hold for 7 seconds"
        case .exhale:
            return "Exhale for 8 seconds"
        }
    }
    
    var body: some View {
        GeometryReader{ geometry in
            LinearGradient(gradient: Gradient(colors: [Color.indigo, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("4-7-8 Breathing Exercise")
                    .font(.system(size: geometry.size.width * 0.05, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                Spacer()
                
                ZStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .shadow(radius: 10)
                            .padding(.horizontal, 50)
                            .padding(.vertical, 20)
                            .frame(width: geometry.size.width, height: geometry.size.height / 3)
                        
                        Image(systemName: "timer")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometry.size.height / 3.5)
                            .offset(x: geometry.size.height / 3.5, y:0)
                            .opacity(0.2)
                            .blendMode(.destinationOut)
                    }.compositingGroup()
                    
                    VStack {
                        Text("How to Practice")
                            .font(.system(size: geometry.size.width * 0.03, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Text("1. Exhale completely through your mouth, making a whoosh sound.\n2. Close your mouth and inhale quietly through your nose to a mental count of four.\n3. Hold your breath for a count of seven.\n4. Exhale completely through your mouth, making a whoosh sound to a count of eight.\n5. This completes one breath. Now inhale again and repeat the cycle three or four times.")
                            .font(.system(size: geometry.size.width * 0.025, design: .rounded))
                            .foregroundColor(.black)
                            .lineSpacing(12)
                            .frame(width: geometry.size.width * 0.8, alignment: .leading)
                            .padding(.leading, -10)
                    }
                    .frame(width: geometry.size.width / 1.25)
                }
                .frame(width: geometry.size.width, height: 300)
                .padding(.bottom, 60)
                Text(breathingText)
                    .font(.system(size: geometry.size.width * 0.035, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.bottom, 60)
                    .foregroundColor(colorBreathing)
                
                Spacer()
                ZStack{
                    CircularProgressView(progress: $timeStart, colorSelected: $colorSelected, timeLoop: timeFinish)
                        .frame(width: geometry.size.width / 2, height: geometry.size.height / 2.5)
                    if !isPlayingTimer{
                        Button(action: {
                            // Start the timer
                            isPlayingTimer = true
                        }) {
                            Image(systemName: "play.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 5, height: geometry.size.width / 5)
                                .foregroundColor(colorBreathing)
                        }
                    } else {
                        Text("\((timeStart < 0 ? 0 : timeStart), specifier: "%.0f") Second")
                            .font(.system(size: geometry.size.width * 0.08, design: .rounded))
                            .bold()
                            .foregroundColor(colorBreathing)
                    }
                }.frame(width: geometry.size.width, height: geometry.size.height / 5)
                Spacer()
                Spacer()
                Spacer()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onReceive(timer) { _ in
                if isPlayingTimer{
                    if timeStart < timeFinish{
                        timeStart += 1
                    }else{
                        countBreath += 1
                        if countBreath == 3{
                            timer.upstream.connect().cancel()
                            isShowingRepeatSheet = true
                            isPlayingTimer = false
                        }else{
                            timeStart = 0
                            timeFinish = durations[countBreath]
                            breathingState = countBreath == 1 ? .hold : .exhale
                            //change color
                            colorSelected = colorBreathing
                        }
                    }
                }
            }
            .overlay{
                GeometryReader{ geometry in
                    ZStack(alignment: .center){
                        Color.black.opacity(0.5)
                            .ignoresSafeArea(.all)
                        RepeatBreathingSheet(repeatBreathing: {
                            // Restart the timer
                            self.countBreath = 0
                            self.timeStart = 0
                            self.timeFinish = durations[self.countBreath]
                            self.breathingState = .inhale
                            self.colorSelected = Color("PrimaryColor")
                            self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                            self.isShowingRepeatSheet = false
                        }, cancelRepeat: {
                            self.isShowingRepeatSheet = false
                            // Set the showButton state variable to true
                            self.showButton = true
                        }).frame(width: geometry.size.width * 0.5, height: geometry.size.height * 0.5 )
                    }
                    .opacity(isShowingRepeatSheet ? 1 : 0)
                    VStack(alignment: .center){
                        Spacer()
                        Button(action: {
                            withAnimation {
                                currentView = 4
                            }
                        }) {
                            Text("Next")
                                .font(.title)
                                .frame(width: geometry.size.width / 5, height: geometry.size.height / 80)
                                .padding()
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color("SecondaryColor"))
                        .opacity(showButton ? 1 : 0) // Show the button if showButton is true
                        .animation(.easeInOut, value: showButton)
                    }
                    .frame(width: geometry.size.width)
                }
            }
            
            
        }
        
    }
}

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            isPlaying = true
        }) {
            Image(systemName: "play.circle")
                .resizable()
                .frame(width: 50, height: 50)
        }
    }
}

struct RepeatBreathingSheet: View {
    var repeatBreathing: () -> Void
    var cancelRepeat: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Do you want to repeat the breathing exercise?")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 20) {
                Button("Yes, repeat") {
                    repeatBreathing()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("No, I'm done") {
                    cancelRepeat()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct BreathView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BreathView(currentView: .constant(3))
                .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)"))
                .previewDisplayName("iPad mini (6th gen) (portrait)")
            
            BreathView(currentView: .constant(3))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
                .previewDisplayName("iPad Pro 9.7 (portrait)")
            
            BreathView(currentView: .constant(3))
                .previewDevice(PreviewDevice(rawValue: "iPad Air (5th generation)"))
                .previewDisplayName("iPad Air 5 (portrait)")
            
            BreathView(currentView: .constant(3))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (4rd generation)"))
                .previewDisplayName("iPad Pro 11 (4rd gen) (portrait)")
            
            BreathView(currentView: .constant(3))
                .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
                .previewDisplayName("iPad Pro 12.9 (6th gen) (portrait)")
        }
    }
}
