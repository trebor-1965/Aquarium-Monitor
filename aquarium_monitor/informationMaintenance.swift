//
//  informationMaintenance.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 1/31/23.
//

import SwiftUI

struct informationMaintenance: View {
   
    //Edit record
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

    var body: some View {
        Form {
            HStack {
                TextField("Tank Name", text: $tank_name)
                TextField("Tank Type", text: $tank_type)
                TextField("Tank Size", value: $tank_size, formatter: NumberFormatter())
                TextField("Tempature", value: $temp, formatter: NumberFormatter())
                Group {
                    TextField("PH", value: $ph, formatter: NumberFormatter())
                    TextField("Amonia", value: $amon, formatter: NumberFormatter())
                    TextField("Salinity", value: $sal, formatter: NumberFormatter())
                    TextField("Nitrate", value: $trate, formatter: NumberFormatter())
                    TextField("Nitrite", value: $trite, formatter: NumberFormatter())
                    TextField("Alkalinity", value: $alka, formatter: NumberFormatter())
                    TextField("Calcium", value: $cal, formatter: NumberFormatter())
                    TextField("Magnesium", value: $mag, formatter: NumberFormatter())
                    TextField("Phospate", value: $phos, formatter: NumberFormatter())
                }
                Group {
                    TextField("Date of Readings", value: $date_of_readings, formatter: DateFormatter())
                    TextField("Last Water Change", value: $last_water_change_date, formatter: DateFormatter())
                    TextField("Last Carbon Change", value: $last_carbon_change_date, formatter: DateFormatter())
                    TextField("Last Media Change", value: $last_media_change_date, formatter: DateFormatter())
                    TextField("Last filter sock change", value: $last_filter_sock_change_date, formatter: DateFormatter())
                }
            }
                Button("Save") {
                    // Save the changes to the data model
                    let updatedRecord = Record(tank_name: self.tank_name, tank_type: self.tank_type, tank_size: Int(self.tank_size), date_of_readings: self.date_of_readings,
                                               temp: Double(self.temp),
                                               ph: Double(self.ph),
                                               amon: Int(self.amon),
                                               sal: Double(self.sal),
                                               trate: Int(self.trate),
                                               trite: Int(self.trite),
                                               alka: Double(self.alka),
                                               cal: Int(self.cal),
                                               mag: Int(self.mag),
                                               phos: Double(self.phos),
                                               last_water_change_date: self.last_water_change_date,
                                               last_carbon_change_date: self.last_carbon_change_date,
                                               last_media_change_date: self.last_media_change_date,
                                               last_filter_sock_change_date: self.last_filter_sock_change_date )
                    
                    DataModel.update(record: updatedRecord)
                }
            }
        }
    

        init(record: Record) {
            self._tank_name = State(initialValue: record.tank_name)
            self._tank_type = State(initialValue: record.tank_type)
            self._tank_size = State(initialValue: record.tank_size)
            self._date_of_readings = State(initialValue: record.date_of_readings)
            self._temp = State(initialValue: record.temp)
            self._ph = State(initialValue: record.ph)
            self._amon = State(initialValue: record.amon)
            self._sal = State(initialValue: record.sal)
            self._trate = State(initialValue: record.trate)
            self._trite = State(initialValue: record.trite)
            self._alka = State(initialValue: record.alka)
            self._cal = State(initialValue: record.cal)
            self._mag = State(initialValue: record.mag)
            self._phos = State(initialValue: record.phos)
            self._last_water_change_date = State(initialValue: record.last_water_change_date)
            self._last_carbon_change_date = State(initialValue: record.last_carbon_change_date)
            self._last_media_change_date = State(initialValue: record.last_media_change_date)
            self._last_filter_sock_change_date = State(initialValue: record.last_filter_sock_change_date)
        }
    }

    struct Record {
        var tank_name: String
        var tank_type: String
        var tank_size: Int = 0
        var date_of_readings: Date
        var temp: Double = 0.0
        var ph: Double = 0.0
        var amon: Int = 0
        var sal: Double = 0.0
        var trate: Int = 0
        var trite: Int = 0
        var alka: Double = 0.0
        var cal: Int = 0
        var mag: Int = 0
        var phos: Double = 0.0
        var last_water_change_date: Date
        var last_carbon_change_date: Date
        var last_media_change_date: Date
        var last_filter_sock_change_date: Date
    }

    class DataModel {
        static var records = [Record]()

        static func update(record: Record) {
            if let index = records.firstIndex(where: { $0.tank_name == record.tank_name }) {
                records[index] = record
            }
        }
    }
//End edit record
    

//struct informationMaintenance_Previews: PreviewProvider {
//    static var previews: some View {
//        informationMaintenance(record: Record(tank_name: <#T##String#>, tank_type: <#T##String#>, tank_size: <#T##Int#>, date_of_readings: <#T##Date#>, temp: Double, ph: Double, amon: Int))
//    }
//}
