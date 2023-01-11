//
//  summaryView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 12/30/22.
//

import SwiftUI


struct summaryView: View {
    @FetchRequest(sortDescriptors: []) var saltaquariums: FetchedResults<SaltAquarium>

    @State private var tank_size = 0
    @State private var tank_type = ""

    var body: some View {
        HStack {
            List(saltaquariums) { aquarium in
                HStack { Text(aquarium.tank_type ?? "Unknown") }
                HStack { Text(aquarium.tank_name ?? "Unknown") }
//                Text(aquarium.tank_name ?? "Unknown")
                let tank_size = Int16(aquarium.tank_size)
 //               TextField(Int16(tank_size), text: <#Binding<String>#>)
                TextField("Tank Size in Gallons or Liters", value: $tank_size, format: .number)
            }
            .font(.caption)

        }
        
        
    }
}
