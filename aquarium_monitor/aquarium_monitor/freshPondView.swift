//
//  freshPondView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 11/4/22.
//

import SwiftUI

struct freshPondView: View {
    @Environment(\.managedObjectContext) var aqua
    
    @State private var tank_type = ""
    @State private var tank_name = ""
    @State private var tank_size = 0
    @State private var date_of_readings = Date()
    @State private var tempertaure = 0
    @State private var ph = 0
    @State private var amonia = 0
    @State private var nitrate = 0
    @State private var nitrite = 0
    @State private var alkalinity = 0
    @State private var phospate = 0
    @State private var last_water_change_date = Date()
    @State private var last_carbon_change_date = Date()
    @State private var last_media_change_date = Date()

    var body: some View {
        Text("Fresh Water Pond")
    }
}

struct freshPondView_Previews: PreviewProvider {
    static var previews: some View {
        freshPondView()
    }
}
