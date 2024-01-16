//
//  ContentView.swift
//  SunAnimation
//
//  Created by Javid on 1/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var pathProgress = 0.0
    let startX: CGFloat = 0
    let startY: CGFloat = 150
    @State var sunX = 0
    @State var sunY = 0
    let path = Path { path in
        let startX: CGFloat = -CGFloat.pi / 2
        let endX: CGFloat = 3 * CGFloat.pi / 2
        let step: CGFloat = 0.1

        for angle in stride(from: startX, through: endX, by: step) {
            let x = angle
            let y = sin(x)

            if angle == startX {
                path.move(to: CGPoint(x: x.scaleX(in: UIScreen.main.bounds.size.width),
                                      y: y.scaleY(in: 150)))

            } else {

                path.addLine(to: CGPoint(x: x.scaleX(in: UIScreen.main.bounds.size.width),
                                         y: y.scaleY(in: 150)))
            }
        }
    }
    var body: some View {
        ZStack {
            Color.black.opacity(0.88)
            path
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                .foregroundColor(.white)
                .padding(80)

            path
                .trim(from: 0.0, to: pathProgress)
                .stroke(Color.purple, lineWidth: 4)
                .padding(80)

            Image(systemName: "sun.max.fill")
                .foregroundColor(.yellow)
                .font(.largeTitle)
                .position(CGPoint(x: startX, y: startY))
                .offset(x: CGFloat(sunX), y: CGFloat(sunY))
                .padding(80)
                .onTapGesture {
                    withAnimation(.linear(duration: 1.85).delay(0.05)) {
                        pathProgress = 0.7
                    }
                    calculateSunPossition()
                }

        }
        .ignoresSafeArea()


    }

    func calculateSunPossition() {

        let startX: CGFloat = -CGFloat.pi / 2
        let endX: CGFloat = 0.9 * CGFloat.pi
        let step: CGFloat = 0.105

        stride(from: startX, through: endX, by: step).enumerated().forEach { offset ,angle in
            guard startX != angle else { return }
            let x = angle
            let y = sin(x)
            withAnimation(.linear(duration: 0.1).delay(0.041 * Double(offset))) {
                self.sunX = Int(x.scaleX(in: UIScreen.main.bounds.size.width) + 5)
                self.sunY = Int(y.scaleY(in: 150) - 150)
            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
