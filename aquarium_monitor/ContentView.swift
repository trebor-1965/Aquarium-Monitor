//
//  ContentView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 10/25/22.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.green, Color.blue],
    startPoint: .top, endPoint: .bottom)

struct ContentView: View {
    @Environment(\.managedObjectContext) var aqua
   
    var body: some View {
        NavigationView {
            ZStack {
                backgroundGradient
                VStack (spacing: 10) {
                    NavigationLink(destination: reefView()) {
                        Text("Reef Tank")
                    }
                    NavigationLink(destination: marineView()) {
                        Text("Marine - Fish Only")
                    }
                    NavigationLink(destination: freshCommunityView()) {
                        Text("Fresh Water Community")
                    }
                    NavigationLink(destination: freshDiscusView()) {
                        Text("Fresh Water Discus")
                    }
                    NavigationLink(destination: freshCiclidView()) {
                        Text("Fresh Water African Ciclid")
                    }
                    NavigationLink(destination: freshPondView()) {
                        Text("Fresh Water Pond")
                    }
                    NavigationLink(destination: summaryView()) {
                        Text("Summary")
                    }
                }
                .navigationTitle("Select your aquarium type")
                .navigationBarTitleDisplayMode(.inline)

            }
        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
