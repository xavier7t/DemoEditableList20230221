//
//  ContentView.swift
//  DemoEditableList20230221
//
//  Created by Xavier on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    @State var array: [String] = [
        "🟥",
        "🟧",
        "🟨",
        "🟩",
        "🟦",
        "🟪"
    ]
    var body: some View {
        NavigationStack {
            List {
                ForEach(array, id: \.self) { item in
                    Text(item)
                }
                .onDelete { index in
                    array.remove(atOffsets: index)
                }
                .onMove { from, to in
                    array.move(fromOffsets: from, toOffset: to)
                }
            }
            .navigationTitle("Editable List")
            .toolbar {
                EditButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
