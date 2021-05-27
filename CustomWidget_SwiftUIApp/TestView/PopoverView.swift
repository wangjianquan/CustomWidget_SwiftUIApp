//
//  PopoverView.swift
//  CustomWidget_SwiftUIApp
//
//  Created by MacBook Pro on 2021/5/27.
//

import SwiftUI

struct PopoverView1: View {
    var body: some View {
     Text("Popover Content")
        .padding()
    }
}
    
//struct PopoverView: View {
//    @State private var isShowingPopover = false
//    var body: some View {
//        Button("Show Popover", action: {
//            self.isShowingPopover = true
//        })
//        .popover(isPresented: $isShowingPopover) {
//            PopoverView1()
//        }
//
//    }
//}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
//        PopoverView()
        ShowPartDetail()
    }
}


struct PopoverView: View {
    @State var popover: PopoverModel?
    var body: some View {
        VStack(spacing: 150) {
            Button("First Popover", action: {
                popover = PopoverModel(body: "Custom message #1.")
            })
            .popover(item: $popover) { detail in
                Text("\(detail.body)")
            }
            Button("Second Popover", action: {
                popover = PopoverModel(body: "Custom message #2.")
            })
        }
    }

    struct PopoverModel: Identifiable {
        var id: String { body }
        let body: String

    }
}

struct ShowPartDetail: View {
    @State var sheetDetail: InventoryItem?
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget")
        }
        .sheet(item: $sheetDetail,
               onDismiss: didDismiss) { detail in
            
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }
///
    func didDismiss() {
        // Handle the dismissing action.
    }
}
///
struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}
