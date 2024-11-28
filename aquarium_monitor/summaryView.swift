//
//  summaryView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 12/30/22.
//

import SwiftUI


struct summaryView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \SaltAquarium.tank_name, ascending: true)], animation: .default)
    private var aqua: FetchedResults<SaltAquarium>

    let formatter2: NumberFormatter = {
            let formatter2 = NumberFormatter()
            formatter2.numberStyle = .decimal
            formatter2.minimumFractionDigits = 2
            formatter2.maximumFractionDigits = 2
            return formatter2
     }()

    let formatter4: NumberFormatter = {
            let formatter4 = NumberFormatter()
            formatter4.numberStyle = .decimal
            formatter4.minimumFractionDigits = 4
            formatter4.maximumFractionDigits = 4
            return formatter4
     }()

    var body: some View {
        NavigationView {
            List {
                ForEach(aqua) { aquarium in
                        Section {
                                Text("Tank Name: \(aquarium.tank_name ?? "Unknown")")
                                Text("Tank Type: \(aquarium.tank_type ?? "Unknown")")
                                Text("Tank Size: \(aquarium.tank_size)")
                        } header: {
                            Text ("Tank Profile:")
                        }

                        Section {
                            Text ("Temperature: \(aquarium.temperature, specifier: "%.2f")")
                            Text ("PH: \(aquarium.ph, specifier: "%.2f")")
                            Text ("Amonia: \(aquarium.ammonia)")
                            Text ("Salinity: \(aquarium.salinity, specifier: "%.3f")")
                            Text ("Nitrate: \(aquarium.nitrate)")
                            Text ("Nitrite: \(aquarium.nitrite)")
                            Text ("Phospate: \(aquarium.phospate, specifier: "%.2f")")
                            Text ("Calcium: \(aquarium.calcium)")
                            Text ("Magnesium: \(aquarium.magnesium)")

                        } header: {
                            Text ("Tank parameters:")
                        }

                        Section {
                            Text ("Last Water Change: \(aquarium.last_water_change ?? Date(), style: .date )")
                            Text ("Last Carbon Change: \(aquarium.last_carbon_change ?? Date(), style: .date )")
                            Text ("Last Filter Sock Change: \(aquarium.filter_sock_change ?? Date(), style: .date )")
                            Text ("Last Other Media Change: \(aquarium.last_media_change ?? Date(), style: .date )")
                        } header: {
                            Text("Date(s) readings were taken")
                        }
                    }
                
            }
        }
        .navigationTitle("Tank Summary:")
        }
        
        
}
struct summaryView_Previews: PreviewProvider {
    static var previews: some View {
        summaryView()
    }
}

