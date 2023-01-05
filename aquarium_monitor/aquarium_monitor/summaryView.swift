//
//  summaryView.swift
//  aquarium_monitor
//
//  Created by Robert N. Brown III on 12/30/22.
//

import SwiftUI

struct summaryView: View {
    
    @FetchRequest(sortDescriptors: []) var saltaquariums: FetchedResults<SaltAquarium>
//    @FetchRequest(sortDescriptors: [SortDescriptor(\.tank_name)]) var saltaquariums: FetchedResults<SaltAquarium>
//    @FetchRequest(sortDescriptors: []) var freshaquariums: FetchedResults<FreshAquarium>

    
    var body: some View {
        List(saltaquariums) { aqua in
            Text(aqua.tank_name ?? "Unknown")
        }
        
//        Text(String($saltaquariums.tank_name.count))
    }
}

struct summaryView_Previews: PreviewProvider {
    static var previews: some View {
        summaryView()
    }
}
