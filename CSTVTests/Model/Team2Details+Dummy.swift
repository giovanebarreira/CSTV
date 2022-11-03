//
//  Team2Details+Dummy.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

@testable import CSTV

enum Team2DetailsDummy {
    static let details = TeamDetails(
        imageURL: "https://cdn.pandascore.co/images/team/image/129412/232px_all_stars_gaming_allmode.png",
        name: "allStars Gaming",
        players: [
            Player(firstName: "Rafael ",
                   imageURL: "https://cdn.pandascore.co/images/player/image/29415/wca1_dx3_t.png",
                   lastName: "Gligor",
                   nickname: "RENNE"
                  ),
            Player(firstName: "Alexandru",
                   imageURL: nil,
                   lastName: "Băicianu",
                   nickname: "l0rd-dll"
                  ),
            Player(firstName: "Gyorfy ",
                   imageURL: nil,
                   lastName: "Gabriel",
                   nickname: "starplajerz"
                  ),
            Player(firstName: "Alin",
                   imageURL: nil,
                   lastName: "Mocean",
                   nickname: "cox"
                  ),
            Player(firstName: "Dragos",
                   imageURL: nil,
                   lastName: "Oloeru",
                   nickname: "xAHEN"
                  )

        ]
    )
}
