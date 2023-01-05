//
//  marineView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 11/4/22.
//

import SwiftUI

struct marineView: View {
    @Environment(\.managedObjectContext) var aqua
    
    @State private var tank_type = ""
    @State private var tank_name = ""
    @State private var tank_size = 0
    @State private var date_of_readings = Date()
    @State private var temp = 0
    @State private var ph = 0.0
    @State private var amon = 0
    @State private var sal = 0.0
    @State private var trate = 0
    @State private var trite = 0
    @State private var alka = 0.0
    @State private var cal = 0
    @State private var mag = 0
    @State private var phos = 0.0
    @State private var last_water_change_date = Date()
    @State private var last_carbon_change_date = Date()
    @State private var last_media_change_date = Date()

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()

    var body: some View {
            VStack {
                TextField("Tank Type", text: $tank_type)
                TextField("Tank Name", text: $tank_name)
                TextField("Tank Size in Gallons or Liters", value: $tank_size, formatter: formatter)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

            }
        }
}

struct marineView_Previews: PreviewProvider {
    static var previews: some View {
        marineView()
    }
}
