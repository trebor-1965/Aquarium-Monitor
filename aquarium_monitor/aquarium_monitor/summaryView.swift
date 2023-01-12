//
//  summaryView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 12/30/22.
//

import SwiftUI


struct summaryView: View {
    @FetchRequest(sortDescriptors: []) var saltaquariums: FetchedResults<SaltAquarium>

    var body: some View {
        HStack {
            List(saltaquariums) { aquarium in
                Section (header: Text("Tank Profile")) {
                    HStack { Text(aquarium.tank_type ?? "Unknown") }
                    HStack { Text(aquarium.tank_name ?? "Unknown") }
                    HStack { Text("\(aquarium.tank_size)") }
                }
                Section (header: Text("Tank parameters")) {
                    HStack { Text ("\(aquarium.temperature)") }
                    HStack { Text ("\(aquarium.ph)") }
                    HStack { Text ("\(aquarium.ammonia)") }
                    HStack { Text ("\(aquarium.salinity)") }
                    HStack { Text ("\(aquarium.nitrate)") }
                    HStack { Text ("\(aquarium.nitrite)") }
                    HStack { Text ("\(aquarium.ammonia)") }
                    HStack { Text ("\(aquarium.phospate)") }
                    HStack { Text ("\(aquarium.calcium)") }
                    HStack { Text ("\(aquarium.magnesium)") }
                }
                Section (header: Text("Date(s) readings were taken")) {
                    HStack { Text ("\(aquarium.last_water_change ?? Date(), style: .date )") }
                    HStack { Text ("\(aquarium.last_carbon_change ?? Date(), style: .date )") }
                    HStack { Text ("\(aquarium.filter_sock_change ?? Date(), style: .date )") }
                    HStack { Text ("\(aquarium.last_media_change ?? Date(), style: .date )") }
                }
            }
            .font(.caption)

        }
        
        
    }
}
