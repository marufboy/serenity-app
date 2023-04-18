//
//  SwiftUIView.swift
//  
//
//  Created by Muhammad Afif Maruf on 15/04/23.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress : Double
    @Binding var colorSelected : Color
    let timeLoop : Double
    
    var body: some View{
        ZStack{
            Circle()
                .stroke(
                    Color.white.opacity(0.5),
                    lineWidth: 24
                )
            Circle()
                .trim(from: 0, to: (progress / 10.0) * (10 / timeLoop))
                .stroke(
                    colorSelected,
                    style: StrokeStyle(
                        lineWidth: 24,
                        lineCap: .round
                    )
                )
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: (progress / 10.0) * (10 / timeLoop))
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        let progress = Binding.constant(0.0)
        let colorSelected = Binding.constant(Color.black)
        CircularProgressView(progress: progress, colorSelected: colorSelected, timeLoop: 4.0)
    }
}
