//
//  CustomToggleStyles.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/6/1.
//

import SwiftUI


//struct CheckmarkToggleStyle: ToggleStyle {
//    
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            configuration.label
//            Spacer()
//            Rectangle()
//                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
//                .frame(width: 51, height: 31, alignment: .center)
//                .overlay(
//                    Circle()
//                        .foregroundColor(.white)
//                        .padding(.all, 3)
//                        .overlay(
//                            Image(systemName: configuration.isOn ? "checkmark" : "xmark")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .font(Font.title.weight(.black))
//                                .frame(width: 8, height: 8, alignment: .center)
//                                .foregroundColor(configuration.isOn ? .green : .gray)
//                        )
//                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
//                        .animation(Animation.linear(duration: 0.2))
//                        
//                ).cornerRadius(20)
//                .onTapGesture { configuration.isOn.toggle() }
//        }
//    }
//}
//
//struct PowerToggleStyle: ToggleStyle {
//    
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            configuration.label
//            Spacer()
//            Rectangle()
//                .foregroundColor(configuration.isOn ? .green : Color.groupTableViewColor)
//                .frame(width: 51, height: 31, alignment: .center)
//                .overlay(
//                    Circle()
//                        .foregroundColor(.white)
//                        .padding(.all, 3)
//                        .overlay(
//                            GeometryReader { geo in
//                                Path { p in
//                                    if !configuration.isOn {
//                                        p.addRoundedRect(in: CGRect(x: 20, y: 10, width: 10.5, height: 10.5), cornerSize: CGSize(width: 7.5, height: 7.5), style: .circular, transform: .identity)
//                                        
//                                    } else {
//                                        p.move(to: CGPoint(x: 51/2, y: 10))
//                                        p.addLine(to: CGPoint(x: 51/2, y: 31-10))
//                                    }
//                                }.stroke(configuration.isOn ? Color.green : Color.gray, lineWidth: 2)
//                            }
//                        )
//                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
//                        .animation(Animation.linear(duration: 0.2))
//
//                ).cornerRadius(20)
//                .onTapGesture { configuration.isOn.toggle() }
//        }
//    }
//}
//struct EarphoneToggleStyle: ToggleStyle {
//    
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            configuration.label
//            Spacer()
//            Rectangle()
//                .foregroundColor(configuration.isOn ? Color(red: 72/255, green: 235/255, blue: 140/255, opacity: 1.0) : Color(red: 255/255, green: 71/255, blue: 82/255, opacity: 1.0))
//                .frame(width: 51, height: 31, alignment: .center)
//                .overlay(
//                    Circle()
//                        .foregroundColor(.white)
//                        .padding(.all, 3)
//                        .overlay(
//                            GeometryReader { geo in
//                                Path { p in
//                                    if !configuration.isOn {
//                                        p.addRoundedRect(in: CGRect(x: 20, y: 10, width: 10.5, height: 10.5), cornerSize: CGSize(width: 7.5, height: 7.5), style: .circular, transform: .identity)
//                                        
//                                    } else {
//                                        p.move(to: CGPoint(x: 51/2, y: 10))
//                                        p.addLine(to: CGPoint(x: 51/2, y: 31-10))
//                                    }
//                                }.stroke(configuration.isOn ? Color.green : Color.gray, lineWidth: 2)
//                                .animation(.spring(response: 0.55, dampingFraction: 0.4))
//                            }
//                        )
//                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
//                ).cornerRadius(20)
//                .onTapGesture { configuration.isOn.toggle() }
//        }
//    }
//}
//struct ImageToggleStyle: ToggleStyle {
//    
//    var onImageName: String
//    var offImageName: String
//    @State private var scale: CGFloat = 1
//
//    func makeBody(configuration: Configuration) -> some View {
//        HStack {
//            configuration.label
//            Spacer()
//            Image(configuration.isOn ? onImageName : offImageName)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 51, height: 31, alignment: .center)
//                .overlay(
//                    Circle()
//                        .foregroundColor(.white)
//                        .padding(.all, 3)
//                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
//                        .animation(.spring(response: 0.5, dampingFraction: 0.5))
//                ).cornerRadius(20)
//                .onTapGesture { configuration.isOn.toggle() }
//        }
//    }
//}
