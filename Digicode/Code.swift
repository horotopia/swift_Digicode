//
//  Code.swift
//  Digicode
//
//  Created by Les Prodiges on 30/03/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Code: Codable, Hashable {
    @DocumentID var id: String?
    let name: String
    let location: GeoPoint
}
