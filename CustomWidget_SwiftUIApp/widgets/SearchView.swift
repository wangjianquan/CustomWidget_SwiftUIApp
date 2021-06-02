//
//  SearchView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/6/2.
//

import SwiftUI

struct SearchView: View {
    @State private var fullScreen = false
    private let heartRates: [Int] = [33,24,78,0,12,0,0]

    var body: some View {
        HStack {
            ForEach(self.heartRates, id: \.self) { hr in
                Text(String(hr))
//                    .padding(4)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color.purple)
                    .cornerRadius(4)
            }
        }
//        VStack {
//            VStack(alignment: .leading) {
//                HStack {
//                    Spacer()
//                    Text("Hello World!")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                    Spacer()
//                }
//            }
//            .frame(height: 300)
//            .background(Color.blue)
//            .mask(CustomShape(radius: 25))
//            .shadow(color: .gray, radius: 5, x: 0, y: 5)
//            .edgesIgnoringSafeArea(.top)
//
//            ExampleOfProgress()
//
//            Spacer()
//        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
struct CustomShape: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)
        let brs = CGPoint(x: rect.maxX, y: rect.maxY - radius)
        let brc = CGPoint(x: rect.maxX - radius, y: rect.maxY - radius)
        let bls = CGPoint(x: rect.minX + radius, y: rect.maxY)
        let blc = CGPoint(x: rect.minX + radius, y: rect.maxY - radius)
        
        path.move(to: tl)
        path.addLine(to: tr)
        path.addLine(to: brs)
        path.addRelativeArc(center: brc, radius: radius,
          startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addLine(to: bls)
        path.addRelativeArc(center: blc, radius: radius,
          startAngle: Angle.degrees(90), delta: Angle.degrees(90))
        
        return path
    }
}
struct SegmentedProgressView: View {
  var value: Int
  var maximum: Int = 7
  var height: CGFloat = 10
  var spacing: CGFloat = 2
  var selectedColor: Color = .accentColor
  var unselectedColor: Color = Color.secondary.opacity(0.3)

  var body: some View {
    HStack(spacing: spacing) {
      ForEach(0 ..< maximum) { index in
        Rectangle()
          .foregroundColor(index < self.value ? self.selectedColor : self.unselectedColor)
      }
    }
    .frame(maxHeight: height)
    .clipShape(Capsule())
  }
}
struct ExampleOfProgress: View {
  @State var value = 0
  var maximum = 10

  var body: some View {
    VStack(alignment: .leading) {
      Text("SegmentedProgressView example")
        .font(.headline)
      Text("Current value is \(value) out of \(maximum)")
        .font(.body)
      SegmentedProgressView(value: value, maximum: maximum)
        .animation(.default)
        .padding(.vertical)
      Button(action: {
        self.value = (self.value + 1) % (self.maximum + 1)
      }) {
        Text("Increment value")
      }
    }
    .padding()
  }
}
