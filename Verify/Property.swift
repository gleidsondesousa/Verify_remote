//
//  Property.swift
//  Verify
//
//  Created by Gleidson De Sousa on 4/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Property: Identifiable, Codable {
    @DocumentID var id: String?
    var address = ""
    var notes = ""
    var purchaseDate = Date.now + (60*60*24)
    var total = ""
    var imageID = ""
    
    var dictionary: [String: Any] {
        return ["address": address, "purchaseDate": purchaseDate, "notes": notes, "imageID": imageID, "total": total]
    }
}
