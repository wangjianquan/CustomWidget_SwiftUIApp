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
    @State var active8 = false
    @State var active9 = false

    private let onGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)

    
    var body: some View {
        VStack{
            List {
                Section (header:Text("dsec") ){
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
                    }).toggleStyle(
                        ImageToggleStyle(bgONImgName: "day", bgOFFImgName: "night")
                    )
                    Toggle(isOn: $active4, label: {
                        Text("ImageToggleStyle")
                    }).toggleStyle(
                        ImageToggleStyle(onImgName:"Earth_night", offImgName:"Earth_day")
                        //ImageToggleStyle()
                    )
                }
                
                Section(header: Text("线性渐变")) {
                    Toggle(isOn: $active7, label: {
                        Text("背景线性渐变-normal")
                    }).toggleStyle(LinearGradientToggleStyle())

                    Toggle(isOn: $active7, label: {
                        Text("背景线性渐变-自定义")
                    }).toggleStyle(LinearGradientToggleStyle(btnGradient: LinearGradient(gradient: Gradient(colors: [.green,.blue]), startPoint: .leading, endPoint: .trailing)))


                    Toggle(isOn: $active7, label: {
                        Text("按钮线性渐变")
                    }).toggleStyle(ONGradientStyle(onGradient: LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)))

                    Toggle(isOn: $active7, label: {
                        Text("按钮线性渐变 + 文字")
                    }).toggleStyle(ONGradientStyle(onGradient: LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing), onName: "开",offName: "关"))
                }
                Section (header:Text("文字样式") ){
                    Toggle(isOn: $active5, label: {
                        Text("顶部按钮文字")
                    }).toggleStyle(TopTextStyle())
                    
                    Toggle(isOn: $active5, label: {
                        Text("顶部按钮文字")
                    }).toggleStyle(TopTextStyle(onName: "开", offName: "关"))
                    
                    Toggle(isOn: $active6, label: {
                        Text("TextToggleStyle 1")
                    }).toggleStyle(BgGradient_BottomTextStyle())
                    
                    
                    Toggle(isOn: $active6, label: {
                        Text("TextToggleStyle 1")
                    }).toggleStyle(BgGradient_BottomTextStyle(onName: "开", offName: "关",onColor: .white,offColor:.green))
                    
                    Toggle(isOn: $active6, label: {
                        Text("TextToggleStyle 1")
                    }).toggleStyle(OFFTextToggleStyle(onName: "MUSIC OFF", offName: "MUSIC ON"))
                    
                    
                    
                }
                Section (header:Text("按钮样式") ){
                    
                    Toggle(isOn: $active8, label: {
                        Text("按钮变形 ")
                    }).toggleStyle(ONDeformStyle())
                    
                    Toggle(isOn: $active8, label: {
                        Text("进度条样式 ")
                    }).toggleStyle(ProgressToggleStyle())
                    
                    
                    Toggle(isOn: $active9, label: {
                        Text("按钮缩放 ")
                    }).toggleStyle(ScaleToggleStyle())
                    
                    Toggle(isOn: $active9, label: {
                        Text("按钮缩放 2")
                    }).toggleStyle(StrokeToggleStyle())
                    
                }

            }

        }
       
    }
}

struct ToggleStyle_TestView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleStyle_TestView()
    }
}


struct ProgressToggleStyle: ToggleStyle {


    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : .groupTableViewColor)
                .frame(width: 51, height: 31)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Circle()
                                .stroke(Color.groupTableViewColor, lineWidth: 1)
                                .padding(.all, 5)
                                .overlay(
                                    Circle()
                                        .trim(from: 0, to: configuration.isOn ? 1 : 0)
                                        .stroke(LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
                                        .rotationEffect(.degrees(-90))
                                        .padding(.all, 6)
                                )

                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(.easeInOut)
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
struct ScaleToggleStyle: ToggleStyle {
    var colors: [Color] = [.yellow,.pink,.red]

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : .groupTableViewColor)
                .frame(width: 51, height: 31)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Circle()
                                .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                                .scaleEffect(configuration.isOn ? 1 : 0)
                                //.animation(.spring(dampingFraction: 0.45))
                                .padding(.all, 6)
                        )
                        .offset(x: configuration.isOn ? 10 : -10, y: 0)
                        .animation(.spring())
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
struct StrokeToggleStyle: ToggleStyle {
    var colors: [Color] = [.yellow,.pink,.red]

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : .groupTableViewColor)
                .frame(width: 51, height: 31)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Circle()
                                .trim(from: 0, to: 1)
                                .stroke(configuration.isOn ? Color.red : Color.white, lineWidth: configuration.isOn ? 7 : 0)
                                .padding(.all, 6)
                        )
                        .offset(x: configuration.isOn ? 10 : -10, y: 0)
                        .animation(.spring())
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

struct LinearGradientToggleStyle: ToggleStyle {

     var bgGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    
    var btnGradient = LinearGradient(gradient: Gradient(colors: [.white,.white]), startPoint: .leading, endPoint: .trailing)
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .fill(bgGradient)
                .frame(width: 61, height: 31)
                .overlay(
                    Circle()
                        .fill(btnGradient)
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.35))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
struct ONGradientStyle: ToggleStyle {

     var onGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    var onName: String = ""
    var offName: String = ""
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
                .frame(width: 50, height: 30)
                .overlay(
                    Circle()
                        .fill(onGradient)
                        .padding(.all,4)
                        .overlay(
                            Text(configuration.isOn ? onName : offName)
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(configuration.isOn ? .green : .white)
                        )

                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(.spring(response: 0.4, dampingFraction: 0.5))

                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

struct ONDeformStyle: ToggleStyle {

     var colors: [Color] = [.white,.white]
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : Color.red)
                .frame(width: 50, height: 30)
                .overlay(
                    Capsule()
                        .fill(LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom))
                        .frame(width: configuration.isOn ? CGFloat(5) : CGFloat(22), height: 22)
                        .offset(x: configuration.isOn ? 10 : -10, y: 0)
                        .animation(.spring(response: 0.55, dampingFraction: 0.6))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
struct TopTextStyle: ToggleStyle {

    var onName: String = "ON"
    var offName: String = "OFF"
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Capsule()
                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
                .frame(width: 51, height: 31)
                .overlay(
                    Circle()
                        .foregroundColor(.white)
                        .padding(.all, 3)
                        .overlay(
                            Text(configuration.isOn ? onName : offName)
                                .font(.system(size: 10))
                                .fontWeight(.bold)
                                .foregroundColor(configuration.isOn ? .green : .gray)
                        )
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.2))
                )
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

struct BgGradient_BottomTextStyle: ToggleStyle {

    var onName: String = "ON"
    var offName: String = "OFF"
    
    var bgGradient = LinearGradient(gradient: Gradient(colors: [.red,.purple]), startPoint: .leading, endPoint: .trailing)
    var onColor = Color(.sRGBLinear, red: 247/255, green: 195/255, blue: 192/255)
    var offColor = Color(.sRGBLinear, red: 246/255, green: 188/255, blue: 187/255)

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            
            configuration.label
            Spacer()
            Capsule()
                .fill(bgGradient)
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
                            .foregroundColor(.white.opacity(configuration.isOn ? 0.0 : 0.2))
                            .padding(.all, 2)
                        )
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
        

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
    
    var bgONImgName: String = ""
    var bgOFFImgName: String = ""
    var onImgName: String = ""
    var offImgName: String = ""

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(configuration.isOn ? bgONImgName : bgOFFImgName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 51, height: 31, alignment: .center)
                .background(configuration.isOn ? Color.green : Color.groupTableViewColor)
                .overlay(
                    Image(configuration.isOn ? onImgName : offImgName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24, alignment: .center)
                        .rotationEffect(.init(degrees: configuration.isOn ? 360 : 0))
                        .background(Color.white)
                        .cornerRadius(15)
                        .offset(x: configuration.isOn ? 9 : -9, y: 0)
                        .animation(Animation.linear(duration: 0.3))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}

struct OFFTextToggleStyle: ToggleStyle {
    
    var onName: String = "ON"
    var offName: String = "OFF"
    var onImgName: String = ""
    var offImgName: String = ""

    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Text(onName)
                .font(.system(size: 12, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(Color(red: 111/255, green: 111/255, blue: 111/255))
            
            Capsule()
                .foregroundColor(configuration.isOn ? Color(red: 113/255, green: 224/255, blue: 236/255) : Color.groupTableViewColor)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Image("cm2_default_cover_fm")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25, alignment: .center)
                        .background(Color.white)
                        .overlay(
                            Image("music")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 15, height: 15, alignment: .center)
//                                .rotationEffect(.zero, anchor: .center)
//                                .rotationEffect(.init(degrees: configuration.isOn ? 3600 : 0))
//                                .rotationEffect(.zero, anchor: .center)
//                                .rotationEffect(.init(degrees:36000))
                            .rotationEffect(Angle.degrees(configuration.isOn  ? 360 : 0))
//                                .animation(Animation.easeIn.repeatForever(autoreverses: true))
                        )
//                        .rotationEffect(.init(degrees: configuration.isOn ? 3600 : 0))

                        .cornerRadius(15)
                        .offset(x: configuration.isOn ? 9 : -9, y: 0)
                        .animation(Animation.linear(duration: 0.3))
                )
                .cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
            Text(offName)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(configuration.isOn ? Color(red: 141/255, green: 213/255, blue: 222/255) : Color(red: 177/255, green: 177/255, blue: 177/255))
        }
    }
}
