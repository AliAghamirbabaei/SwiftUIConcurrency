//
//  Network.swift
//  SwiftUIConcurrency
//
//  Created by Ali Aghamirbabaei on 3/4/22.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/fnkspikgw1vj?access_token=49ga-cH0U8EPTRselEIBL-qwQ4YOcLIZ4eyxtRrRdpg")!)
}
