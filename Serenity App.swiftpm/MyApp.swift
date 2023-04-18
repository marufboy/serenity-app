import SwiftUI
import AVFoundation

@main
struct MyApp: App {
    let player = try? AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "Calm-space-ambient-track", withExtension: "mp3")!)
    var body: some Scene {
        WindowGroup {
            SwitchView()
//                .onAppear{
//                    player?.numberOfLoops = -1
//                    player?.prepareToPlay()
//                    player?.play()
//                }
//                .onDisappear{
//                    player?.pause()
//                }
        }
    }
}
