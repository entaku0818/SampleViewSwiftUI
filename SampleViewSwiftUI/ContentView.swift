//
//  ContentView.swift
//  SampleViewSwiftUI
//
//  Created by 遠藤拓弥 on 2020/01/06.
//  Copyright © 2020 遠藤拓弥. All rights reserved.
//

import SwiftUI

struct ContentView: View {

    @State private var showSheet = false
    @State private var showActionSheet = false
    @State private var showAlert = false
    @State private var showPopOver = false

    var body: some View {
        VStack{
            Button(action: {
                self.showSheet.toggle()
            }, label: {
                Text("AddSheet")
            }).sheet(isPresented: self.$showSheet, content: {
                Text("This is Sheet.")
            }).padding()

            Button(action: {
                self.showActionSheet.toggle()
            }, label: {
                Text("AddActionSheet")
            }).actionSheet(isPresented: self.$showActionSheet, content: {
                ActionSheet(title: Text("Action"),
                    message: Text("Description"),
                    buttons: [
                        .default(Text("OK"), action: {

                        }),
                        .destructive(Text("Delete"), action: {

                        })
                    ]
                )
                }).padding()
            Button(action: {
                self.showAlert.toggle()
            }, label: {
                Text("AddAlert")
            }).alert(isPresented: self.$showAlert, content: {
                Alert(title: Text("Error"), message: Text("Error Reason"), dismissButton: .default(Text("OK")))
            }).padding()
            Button(action: {
                self.showPopOver.toggle()
            }, label: {
                Text("AddPopOver")
            }).popover(isPresented: self.$showPopOver, attachmentAnchor: .rect(.bounds), arrowEdge: .leading, content: {
                Text("This is PopOver.")
            }).padding()

            Spacer()
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
