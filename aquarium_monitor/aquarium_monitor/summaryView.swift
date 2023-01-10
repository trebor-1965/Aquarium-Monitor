//
//  summaryView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 12/30/22.
//

import SwiftUI

struct summaryView: View {
    //@FetchRequest(sortDescriptors: []) var saltaquariums: FetchedResults<SaltAquarium>
    @FetchRequest(sortDescriptors: [SortDescriptor(\.tank_name)]) var saltaquariums: FetchedResults<SaltAquarium>

    let salt: SaltAquarium
    @State private var tank_type = ""
    @State private var tank_name = ""
    @State private var tank_size = 0
    @State private var temp = 0.0
    @State private var ph = 0.0
    @State private var amon = 0
    @State private var sal = 0.0
    @State private var trate = 0
    @State private var trite = 0
    @State private var alka = 0.0
    @State private var cal = 0
    @State private var mag = 0
    @State private var phos = 0.0
    @State private var date_of_readings = Date()
    @State private var last_water_change_date = Date()
    @State private var last_carbon_change_date = Date()
    @State private var last_media_change_date = Date()
    @State private var last_filter_sock_change_date = Date()

//    @FetchRequest(sortDescriptors: []) var freshaquariums: FetchedResults<FreshAquarium>

    
    var body: some View {
        let tank_name = salt.tank_name
        HStack {Text("Tank Name:")
                .foregroundColor(.accentColor)
            Text(tank_name ?? "Unknown tank name")}
//        HStack {Text("Tank Name")
//                .foregroundColor(.accentColor)
//            TextField("Tank Name", text: $saltaquariums.tank_name)}
//        HStack {Text ("Tank Size in Gallons or Liters")
//                .foregroundColor(.accentColor)
//            TextField("Tank Size in Gallons or Liters", value: saltaquariums.tank_size, format: .number)}

//        List(saltaquariums) { aqua in
//            Text(aqua.tank_name, aqua.tank_type, Text(aqua.tank_size) ?? "Unknown")
        }
        
//        Text(String($saltaquariums.tank_name.count))
//    }
}

//struct summaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        summaryView()
//    }
//}
