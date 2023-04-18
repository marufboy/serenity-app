//
//  ChatBubbleView.swift
//  Serenity App
//
//  Created by Muhammad Afif Maruf on 17/04/23.
//

import SwiftUI

struct ChatBubbleComp<Content>: View where Content: View {
    let direction: ChatBubbleShape.Direction
    let content: () -> Content
    init(direction: ChatBubbleShape.Direction, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.direction = direction
    }
    
    var body: some View {
        HStack {
            if direction == .right {
                Spacer()
            }
            content().clipShape(ChatBubbleShape(direction: direction))
            if direction == .left {
                Spacer()
            }
        }.padding([(direction == .left) ? .leading : .trailing, .top, .bottom], 20)
            .padding((direction == .right) ? .leading : .trailing, 50)
    }
}

struct ChatBubbleShape: Shape {
    enum Direction {
        case left
        case right
    }
    
    let direction: Direction
    
    func path(in rect: CGRect) -> Path {
        return (direction == .left) ? getLeftBubblePath(in: rect) : getRightBubblePath(in: rect)
    }
    
    private func getLeftBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x: width - 20, y: height))
            p.addCurve(to: CGPoint(x: width, y: height - 20),
                       control1: CGPoint(x: width - 8, y: height),
                       control2: CGPoint(x: width, y: height - 8))
            p.addLine(to: CGPoint(x: width, y: 20))
            p.addCurve(to: CGPoint(x: width - 20, y: 0),
                       control1: CGPoint(x: width, y: 8),
                       control2: CGPoint(x: width - 8, y: 0))
            p.addLine(to: CGPoint(x: 21, y: 0))
            p.addCurve(to: CGPoint(x: 4, y: 20),
                       control1: CGPoint(x: 12, y: 0),
                       control2: CGPoint(x: 4, y: 8))
            p.addLine(to: CGPoint(x: 4, y: height - 11))
            p.addCurve(to: CGPoint(x: 0, y: height),
                       control1: CGPoint(x: 4, y: height - 1),
                       control2: CGPoint(x: 0, y: height))
            p.addLine(to: CGPoint(x: -0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: 11.0, y: height - 4.0),
                       control1: CGPoint(x: 4.0, y: height + 0.5),
                       control2: CGPoint(x: 8, y: height - 1))
            p.addCurve(to: CGPoint(x: 25, y: height),
                       control1: CGPoint(x: 16, y: height),
                       control2: CGPoint(x: 20, y: height))
            
        }
        return path
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}


struct ChatBubbleView: View {
    @State private var items = [String]()
    var onDataReceived: ((Bool) -> Void)?
    
    var body: some View {
        GeometryReader { geometry in
            ScrollViewReader { sr in
                ScrollView(showsIndicators: false) {
                    LazyVStack (alignment: .center){
                        ForEach(items.indices, id: \.self) { index in
                            // content
                            ChatBubbleComp(direction: index % 2 == 0 ? .left : .right) {
                                Text("\(items[index])")
                                    .padding(.all, 20)
                                    .foregroundColor(index % 2 == 0 ? Color.white : Color.black)
                                    .font(.system(size: geometry.size.width * 0.025, design: .rounded))
                                    .background(index % 2 == 0 ? Color.blue : Color.white)
                                // ... it is appeared, so we can use transition
                            }.id(index)
                                .transition(index == items.indices.last ? .opacity : .identity)
                                .onAppear {
                                    // on last appeared schedule add next ...
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                                        if index == items.indices.last && items.count < chatMessage.count {
                                            let nextGreeting = chatMessage[index + 1]
                                            items.append(nextGreeting)
                                        }else{
                                            onDataReceived?(true)
                                        }
                                        DispatchQueue.main.async {
                                            // ... and animate scrolling to it after add
                                            withAnimation {
                                                sr.scrollTo(index, anchor: .bottom)
                                            }
                                        }
                                    }
                                }
                        }
                    }
                    .frame(width: geometry.size.width / 1.5, alignment: .center)
                    // animates transitions
                    .animation(.easeIn(duration: 0.7), value: items.count)
                }
                .onAppear {
                    items.append(chatMessage[0])
                }
            }.frame(width: geometry.size.width)
        }
    }
}

struct ChatBubbleView_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubbleView()
    }
}

