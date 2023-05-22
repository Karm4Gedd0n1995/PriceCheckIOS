//
//  ApiViewModel.swift
//  PriceCheck2.0
//
//  Created by Frederic Hammer on 21.05.23.
//

import Foundation

@MainActor
class ApiViewModel : ObservableObject{
    
    private var Base_Url = "https://public.syntax-institut.de/apps/batch4/Frederic/rewe.json"
    
    @Published private (set)var apiprospect = [ProspectAPIModel]()
    
    func loadProspect() async {
        
        guard let url = URL(string: Base_Url) else {
            print("invalid url")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode([ProspectAPIModel].self, from: data) {
                apiprospect = decodedResponse
            }
        } catch {
            print("invalid data")
        }
        
    }
    
}
