//
//  KingfisherHeader.swift
//  CSTV
//
//  Created by Giovane Barreira on 02/11/22.
//

import Foundation
import Kingfisher

class TokenPlugin: ImageDownloadRequestModifier {
    let token:String

    init(token:String) {
        self.token = token
    }

    func modified(for request: URLRequest) -> URLRequest? {
        var request = request
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
}
