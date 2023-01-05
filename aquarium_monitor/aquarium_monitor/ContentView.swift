//
//  ContentView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 10/25/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var aqua
    @FetchRequest(sortDescriptors: []) var saltaquariums: FetchedResults<SaltAquarium>
    @FetchRequest(sortDescriptors: []) var freshaquariums: FetchedResults<FreshAquarium>
    
    var body: some View {
        NavigationView {
            VStack (spacing: 10) {
                NavigationLink(destination: reefView()) {
                    Text("Reef Tank")
//                    let aqua = SaltAquarium(context: aqua)
                }
                NavigationLink(destination: marineView()) {
                    Text("Marine - Fish Only")
//                    let aqua = SaltAquarium(context: aqua)
                }
                NavigationLink(destination: freshCommunityView()) {
                    Text("Fresh Water Community")
//                    let aqua = FreshAquarium(context: aqua)
                }
                NavigationLink(destination: freshDiscusView()) {
                    Text("Fresh Water Discus")
//                    let aqua = FreshAquarium(context: aqua)
                }
                NavigationLink(destination: freshCiclidView()) {
                    Text("Fresh Water African Ciclid")
//                    let aqua = FreshAquarium(context: aqua)
                }
                NavigationLink(destination: freshPondView()) {
                    Text("Fresh Water Pond")
//                    let aqua = FreshAquarium(context: aqua)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
