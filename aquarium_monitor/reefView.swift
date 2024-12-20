//
//  reefView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 10/25/22.
//

import SwiftUI

struct reefView: View {
    @Environment(\.managedObjectContext) var aqua
    @Environment(\.dismiss) var dismiss

    @State private var tank_type = ""
    @State private var tank_name = ""
    @State private var tank_size = 0
    @State private var date_of_readings = Date()
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
    @State private var last_water_change_date = Date()
    @State private var last_carbon_change_date = Date()
    @State private var last_media_change_date = Date()
    @State private var last_filter_sock_change_date = Date()

    let formatter1: NumberFormatter = {
            let formatter1 = NumberFormatter()
            formatter1.numberStyle = .decimal
            formatter1.maximumFractionDigits = 1
            return formatter1
     }()

    let formatter2: NumberFormatter = {
            let formatter2 = NumberFormatter()
            formatter2.numberStyle = .decimal
            formatter2.maximumFractionDigits = 2
            return formatter2
     }()

    let formatter3: NumberFormatter = {
            let formatter3 = NumberFormatter()
            formatter3.numberStyle = .decimal
            formatter3.maximumFractionDigits = 3
            return formatter3
     }()

    var body: some View {
        NavigationView {
                Form {
                    Section(header: Text("Tank Profile").font(.title2)) {
                        VStack (alignment: .leading) {
                            HStack {Text("Tank Type:")
                                    .foregroundColor(.accentColor)
                                TextField("Tank Type", text: $tank_type)}
                            HStack {Text("Tank Name")
                                    .foregroundColor(.accentColor)
                                TextField("Tank Name", text: $tank_name)}
                            HStack {Text ("Tank Size in Gallons or Liters")
                                    .foregroundColor(.accentColor)
                                TextField("Tank Size in Gallons or Liters", value: $tank_size, format: .number)}
                        }
                        .font (.caption)
                    }
                    Section(header: Text("Tank parameters").font(.title2)) {
                        VStack (alignment: .leading) {
                            Group {
                                HStack {Text ("Temprature:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $temp, formatter: formatter1)}
                                HStack {Text ("PH:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $ph, formatter: formatter1)}
                                HStack {Text ("Salinity:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $sal, formatter: formatter3)}
                            }
                            Group {
                                HStack {Text ("Amonia:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $amon, format: .number)}
                                HStack {Text ("Nitrate:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $trate, format: .number)}
                                HStack {Text ("Nitrite:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $trite, format: .number)}
                                HStack {Text ("Alkalinity:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $alka, format: .number)}
                            }
                            Group {
                                HStack {Text ("Calcium:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $cal, format: .number)}
                                HStack {Text ("Magnesium:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $mag, format: .number)}
                                HStack {Text ("Phosphate:")
                                        .foregroundColor(.accentColor)
                                    TextField("", value: $phos, format: .number)}
                            }
                        }
                        .font (.caption)
                    }
                    Section (header: Text("Date readings were taken").font(.title2)) {
                        VStack {
                            Group {
                                DatePicker("Last Water Change date:", selection: $last_water_change_date, in: ...Date(), displayedComponents: .date)
                                DatePicker("Carbon Change date:", selection: $last_carbon_change_date, in: ...Date(), displayedComponents: .date)
                                DatePicker("Last Filter Sock Change date:", selection: $last_filter_sock_change_date, in: ...Date(), displayedComponents: .date)
                                DatePicker("Other Media Change date:", selection: $last_media_change_date, in: ...Date(), displayedComponents: .date)
                            }
                        }
                    }
                    .font (.caption)
                    Section {
                        Button("Save") {
                            if (tank_name.isEmpty) {
                                dismiss()
                            } else {
                                print("In the save button section")
                                let newAqua = SaltAquarium(context: aqua)
                                newAqua.tank_id = UUID()
                                newAqua.tank_name = tank_name
                                newAqua.tank_type = tank_type
                                newAqua.tank_size = Int16(tank_size)
                                newAqua.temperature = Float(temp)
                                newAqua.ph = Float(ph)
                                newAqua.salinity = Float(sal)
                                newAqua.ammonia = Int16(amon)
                                newAqua.nitrate = Int16(trate)
                                newAqua.nitrite = Int16(trite)
                                newAqua.alkalinity = alka
                                newAqua.calcium = Int16(cal)
                                newAqua.magnesium = Int16(mag)
                                newAqua.phospate = Float(phos)
                                newAqua.date_of_readings = Date()
                                newAqua.last_water_change = last_water_change_date
                                newAqua.last_carbon_change = last_carbon_change_date
                                newAqua.last_media_change = last_media_change_date
                                newAqua.filter_sock_change = last_filter_sock_change_date
                            }
                        }
                    }
//                    .font (.caption)
                    Section {
                        Button("Cancel") {
                            dismiss()
                        }

                    }
                }
                .navigationTitle("Reef View")
        }
    }
}

struct reefView_Previews: PreviewProvider {
    static var previews: some View {
        reefView()
    }
}
