//
//  BannerTest.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/1/22.
//

import SwiftUI
import MapKit

struct SizeCategoryPreview<Content: View>: View {
    let content: Content
    var body: some View{
        ForEach(ContentSizeCategory.allCases, id: \.self) { size in
            content.environment(\.sizeCategory, size)
        }
    }
    
}
struct BannerTest: View {
    
   
    var body: some View {
        VStack(content: {
            //BannerView(dataSource: dataSource)
            //Text("Hello World!")
            Group {
                Text("Hello")
                Text("World")
                Text("!!!")
            }
            .background(Color.yellow)
            .padding()

            Group {
                Text("Hello").modifier( SubheadlineModifier())
                Text("World").modifier(BorderedCaption())
                Text("!!!").modifier(modifier)
                Text("extension").borderedCaption()

            }
            .padding()
        })
    }
    var modifier: some ViewModifier {
        #if DEBUG
        return SubheadlineModifier()
        #else
        return EmptyModifier()
        #endif
    }
}
//Xcode监视Swift文件，并且一旦Swift文件包含符合PreviewProvider协议的结构，它就会显示预览画布。
struct BannerTest_Previews: PreviewProvider {
    //PreviewProvider协议的唯一要求是静态预览计算属性
    static var previews: some View {
        BannerTest()
//            .preferredColorScheme(.dark)
//        BannerTest()
//            .preferredColorScheme(.light)
//        BannerTest()
//            .environment(\.sizeCategory, .extraLarge)
//        SizeCategoryPreview(content: BannerTest())
//            .previewLayout(.fixed(width: 300, height: 100))
//        UIKitPreview(view: MKMapView())
//        SleepDetailsView()
    }
}

//MARK
/*
创建一个通用结构，该结构允许我们在Xcode预览中预览任何UIKit视图。我们需要创建一个UIKit视图，将其包装到UIKitPreview结构中，并在ContentView_Previews属性中返回它。
 */
struct UIKitPreview: UIViewRepresentable {
    typealias UIViewType = UIView
    
    let view: UIViewType

    func makeUIView(context: Context) -> UIViewType {
        view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
}

struct SleepDetailsView : View {
    private var chartSection: some View {
        Text("1").foregroundColor(.blue)
    }

    private var sleepSection: some View {
        Text("2").foregroundColor(.red)
    }

    private var phasesSection: some View {
        Text("3").foregroundColor(.pink)
    }

    private var heartRateSection: some View {
        Text("4").foregroundColor(.purple)
    }

    var body: some View {
        List {
            chartSection
            sleepSection
            phasesSection
            heartRateSection
        }
    }
}

/*ViewModifier
 ViewModifiers是SwiftUI中视图组合的第三种形式。我们用于修改视图的所有这些东西（例如前景色，填充，字体等）都是ViewModifiers。当发现自己重复相同的代码来更改视图时，只需为此引入一个ViewModifier，然后在整个代码库中重复使用它即可。这是一个将几个修饰符提取到单个自定义ViewModifier中的小示例。
 */
struct SubheadlineModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.secondary)
            .font(.subheadline)
            .background(Color.gray.opacity(0.2))
            .clipShape(Capsule())
    }
}

struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(size: 10))
            .padding(4)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}
