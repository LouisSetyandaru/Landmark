//
//  ContentView.swift
//  Landmarks
//
//  Created by student on 18/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
//        HikeView()
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
