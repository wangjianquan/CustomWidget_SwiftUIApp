//
//  SearchHistoryView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/1/26.
//

import SwiftUI

struct SearchHistoryView: View {
//    @Binding var text: String? = nil
    
    var body: some View {
        NavigationView(content: {
           Search()
            .navigationTitle("search")
        })
    }
}

struct SearchHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        SearchHistoryView()
    }
}

struct Search: View {
    @State var text = ""
    @State var chips: [[ChipData]] = []
    
    var body: some View {
        VStack(spacing:35, content: {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(chips.indices, id: \.self) { index  in
                        
                        HStack{
                            
                            ForEach(chips[index].indices, id: \.self) { chipIndex in
                                Text(chips[index][chipIndex].chipText)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(Color.black, lineWidth: 1))
                                    .lineLimit(1)
                                    .overlay(GeometryReader(content: { geometry -> Color in
                                        let maxX = geometry.frame(in: .global).maxX
                                        if maxX > getScreenWidth() - 70 && !chips[index][chipIndex].isExceeded{
                                            DispatchQueue.main.async {
                                                chips[index][chipIndex].isExceeded = true
                                                let lastItem = chips[index][chipIndex]
                                                chips.append([lastItem])
                                                chips[index].remove(at: chipIndex)
                                            }
                                        }
                                        return Color.clear
                                    }), alignment: .trailing)
                                    .clipShape(Capsule())
                                    .onTapGesture {
                                        chips[index].remove(at: chipIndex)
                                        if chips[index].isEmpty {
                                            chips.remove(at: index)
                                        }
                                    }
                            }
                        }
                    }
                }
                .padding()
            }
            .frame(width: getScreenWidth() - 30, height: UIScreen.main.bounds.height / 3)
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4),lineWidth: 1.5))
            
            
            
            TextEditor(text: $text)
                .padding()
                .frame(height: 150)
                .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.4),lineWidth: 1.5))
            
            Button(action: {
                if chips.isEmpty {
                    chips.append([])
                }
                withAnimation {
                    chips[chips.count - 1].append(ChipData(chipText: text))
                    text = ""
                }
            }, label: {
                Text("add tag")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical,10)
                    .frame(maxWidth:.infinity)
                    .background(Color.purple)
                    .cornerRadius(5)
            })
            .disabled(text == "")
            .opacity(text == "" ? 0.45 : 1)
        })
        .padding()
    }
}

struct ChipData: Identifiable {
    var id = UUID().uuidString
    var chipText: String
    var isExceeded = false
}
