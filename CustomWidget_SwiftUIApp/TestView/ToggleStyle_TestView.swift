//
//  ToggleStyle_TestView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/6/1.
//

import SwiftUI

struct ToggleStyle_TestView: View {
    @State var active1 = false
    @State var active2 = false
    @State var active3 = false
    @State var active4 = false
    @State var active5 = false
    @State var active6 = false
    @State var active7 = false

    private let onGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)

    
    var body: some View {
        VStack(content: {
            Toggle(isOn: $active1, label: {
                Text("CheckmarkToggleStyle")
            })
            .toggleStyle(CheckmarkToggleStyle())
            
            Toggle(isOn: $active2, label: {
                Text("PowerToggleStyle")
            }).toggleStyle(PowerToggleStyle())
            
            
            Toggle(isOn: $active3, label: {
                Text("EarphoneToggleStyle")
            }).toggleStyle(EarphoneToggleStyle())
            
            
            
            Toggle(isOn: $active4, label: {
                Text("ImageToggleStyle")
            }).toggleStyle(ImageToggleStyle(onImageName: "h1", offImageName: "h2"))
            
            Toggle(isOn: $active5, label: {
                Text("TextToggleStyle")
            }).toggleStyle(TextToggleStyle())
            Toggle(isOn: $active6, label: {
                Text("TextToggleStyle 1")
            }).toggleStyle(TextToggleStyle1())
            
            
            Toggle(isOn: $active6, label: {
                Text("TextToggleStyle 1")
            }).toggleStyle(TextToggleStyle1(onName: "开", offName: "关"))
            
            
            Toggle(isOn: $active7, label: {
                Text("渐变样式")
            }).toggleStyle(BGLinearGradientStyle())
            
            Toggle(isOn: $active7, label: {
                Text("自定义背景线性渐变样式")
            }).toggleStyle(BGLinearGradientStyle(bgGradient: LinearGradient(gradient: Gradient(colors: [.gray,.red,.green,.blue,.orange,.yellow,.pink,.purple,.primary]), startPoint: .leading, endPoint: .trailing)))
            

            Circle()
                .trim(from: 0, to: 1)
                .stroke(Color.red, lineWidth: 5)
                .frame(width: 40, height: 40)
                .rotationEffect(.degrees(-90))
            
           
            
        }).padding()
    }
}

struct ToggleStyle_TestView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStyle_TestView()
    }
}


struct BGLinearGradientStyle: ToggleStyle {

     var bgGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    
    var btnGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .fill(bgGradient)
                .frame(width: 61, height: 31)
                .overlay(
                            Circle()
                                
//                                .trim(from: 0, to: configuration.isOn ? 0 : 1)
                                .stroke(Color.white, lineWidth: 5)
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(-90))
//                                .foregroundColor(.pink)
                                .padding(.all, 3)
//                                .fill(onGradient)
//                                .overlay(
//                                   Text(configuration.isOn ? "ON" : "OFF")
////                                    Text("ON      OFF")
////                                        .lineLimit(1)
//
//                                       .font(.system(size: 10))
//                                       .fontWeight(.bold)
////                                       .frame(width: 60, height: 30)
//                                    .foregroundColor(configuration.isOn ? .green : .gray)
//
//                                )
                            .offset(x: configuration.isOn ? 11 : -11, y: 0)
                                .animation(.spring(response: 0.4, dampingFraction: 0.35))
//                    )

                )
//                .background(onGradient)
//                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
//        .background(onGradient)

    }
}
struct ONGradientStyle: ToggleStyle {

     var bgGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .fill(bgGradient)
                .frame(width: 61, height: 31)
                .overlay(
                            Circle()
                                
//                                .trim(from: 0, to: configuration.isOn ? 0 : 1)
                                .stroke(Color.white, lineWidth: 5)
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(-90))
//                                .foregroundColor(.pink)
                                .padding(.all, 3)
//                                .fill(onGradient)
//                                .overlay(
//                                   Text(configuration.isOn ? "ON" : "OFF")
////                                    Text("ON      OFF")
////                                        .lineLimit(1)
//
//                                       .font(.system(size: 10))
//                                       .fontWeight(.bold)
////                                       .frame(width: 60, height: 30)
//                                    .foregroundColor(configuration.isOn ? .green : .gray)
//
//                                )
                            .offset(x: configuration.isOn ? 11 : -11, y: 0)
                                .animation(.spring(response: 0.4, dampingFraction: 0.35))
//                    )

                )
//                .background(onGradient)
//                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
        
        

    }
}

struct TextToggleStyle1: ToggleStyle {

    var onName: String = "ON"
    var offName: String = "OFF"
    
    private let onGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    private let onColor = Color(.sRGBLinear, red: 247/255, green: 195/255, blue: 192/255)
    private let offColor = Color(.sRGBLinear, red: 246/255, green: 188/255, blue: 187/255)

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            configuration.label
            Spacer()
            Capsule()
                .fill(onGradient)
                .frame(width: 60, height: 30)
                .overlay(
                    ZStack {
                        HStack(content: {
                            Text(onName)
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(configuration.isOn ? onColor : .clear)
                            Text(offName)
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(configuration.isOn ?  .clear : offColor)
                        })
                        .overlay(
                            Circle()
                                .foregroundColor(.white)
                                .frame(height:25)
                                .offset(x: configuration.isOn ? 15 : -15, y: 0)
                                .animation(.easeOut(duration: 0.2))

                        )
                    }
                    .frame(width: 60, height: 30)
                    .background(
                        Capsule()
                            .foregroundColor(.white.opacity(configuration.isOn ? 0.0 : 0.25))
                            .padding(.all, 2)
                        )
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
        

    }
}
struct TextToggleStyle: ToggleStyle {

    private let onGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    private let onColor = Color(.sRGBLinear, red: 247/255, green: 195/255, blue: 192/255)
    private let offColor = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
//                .fill(onGradient)
                .frame(width: 51, height: 31)
                .overlay(
//                    Capsule()
//                        .foregroundColor(.white.opacity(configuration.isOn ? 0.0 : 0.5))
//                        .padding(.all, 2)
//                        .overlay(
                            Circle()
//                                .trim(from: 0, to: configuration.isOn ? 0 : 1)
//                                .stroke(Color.white, lineWidth: 5)
//                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(-90))
                                .foregroundColor(.white)
                                .padding(.all, 3)
                                .overlay(
                                   Text(configuration.isOn ? "ON" : "OFF")
//                                    Text("ON      OFF")
//                                        .lineLimit(1)

                                       .font(.system(size: 10))
                                       .fontWeight(.bold)
//                                       .frame(width: 60, height: 30)
                                    .foregroundColor(configuration.isOn ? .green : .gray)

                                )
                            .offset(x: configuration.isOn ? 11 : -11, y: 0)
                            .animation(Animation.linear(duration: 0.2))
//                    )

                )
//                .background(onGradient)
//                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
//        .background(onGradient)

    }
}

struct CheckmarkToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Image(systemName: configuration.isOn ? "checkmark" : "xmark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(Font.title.weight(.black))
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundColor(configuration.isOn ? .green : .gray)
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.2))

                )
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

struct PowerToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            GeometryReader { geo in
                                Path { p in
                                    if !configuration.isOn {
                                        p.addRoundedRect(in: CGRect(x: 20, y: 10, width: 10.5, height: 10.5), cornerSize: CGSize(width: 7.5, height: 7.5), style: .circular, transform: .identity)

                                    } else {
                                        p.move(to: CGPoint(x: 51/2, y: 10))
                                        p.addLine(to: CGPoint(x: 51/2, y: 31-10))
                                    }
                                }.stroke(configuration.isOn ? Color.green : Color.gray, lineWidth: 2)
                            }
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.2))

                ).cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
struct EarphoneToggleStyle: ToggleStyle {

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? Color(red: 72/255, green: 235/255, blue: 140/255, opacity: 1.0) : Color(red: 255/255, green: 71/255, blue: 82/255, opacity: 1.0))
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            GeometryReader { geo in
                                Path { p in
                                    if !configuration.isOn {
                                        p.addRoundedRect(in: CGRect(x: 20, y: 10, width: 10.5, height: 10.5), cornerSize: CGSize(width: 7.5, height: 7.5), style: .circular, transform: .identity)

                                    } else {
                                        p.move(to: CGPoint(x: 51/2, y: 10))
                                        p.addLine(to: CGPoint(x: 51/2, y: 31-10))
                                    }
                                }.stroke(configuration.isOn ? Color.green : Color.gray, lineWidth: 2)
                                .animation(.spring(response: 0.55, dampingFraction: 0.4))
                            }
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                ).cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
struct ImageToggleStyle: ToggleStyle {

    var onImageName: String
    var offImageName: String
    @State private var scale: CGFloat = 1

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? onImageName : offImageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(.spring(response: 0.5, dampingFraction: 0.5))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
