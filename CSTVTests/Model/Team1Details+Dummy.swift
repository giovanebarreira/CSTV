//
//  Team1Details+Dummy.swift
//  CSTVTests
//
//  Created by Giovane Barreira on 03/11/22.
//

@testable import CSTV

enum Team1DetailsDummy {
    static let details = TeamDetails(
        imageURL: "https://cdn.pandascore.co/images/team/image/127743/t49839.png",
        name: "Enterprise",
        players: [
            Player(firstName: "Erik",
                   imageURL: "https://cdn.pandascore.co/images/player/image/25110/p23436.png",
                   lastName: "Sith",
                   nickname: "The eLiVe"
                  ),
            Player(firstName: "Deyvid",
                   imageURL: "https://cdn.pandascore.co/images/player/image/28279/600px_h4rn_at_bge_stara_zagora.png",
                   lastName: "Benchev",
                   nickname: "h4rn"
                  ),
            Player(firstName: "Robert",
                   imageURL: "https://cdn.pandascore.co/images/player/image/28707/p_ydv_bd98v_fwlbl_tb_q_ro_j4.png",
                   lastName: "Kasper",
                   nickname: "manguss"
                  ),
            Player(firstName: "Raul",
                   imageURL: nil,
                   lastName: "Gligor",
                   nickname: "Blytz"
                  ),
            Player(firstName: "Tomáš",
                   imageURL: "https://cdn.pandascore.co/images/player/image/30101/esuba_system.png",
                   lastName: "Zemko",
                   nickname: "system"
                  )

        ]
    )
}
