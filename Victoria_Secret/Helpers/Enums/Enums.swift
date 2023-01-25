//
//  Enums.swift
//  Victoria_Secret
//
//  Created by Admin on 24/01/23.
//

import Foundation
enum ValidCharaters: String{
    case userName = "^[a-zA-z]{1,}+[a-zA-z0-9!@#$%&*]{0,15}"
    case email =  "^[a-zA-Z0-9!@#$%&*._]{0,100}"
    case password = "^[a-zA-Z0-9!@#._$%&*]{0,30}"
}

enum ValidityExression : String {
    case email =  "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,50}"
    case password = "^(?=.*[A-Z])(?=.*\\d)[A-Za-z0-9 !\"#$%&'()*+,-./:;<=>?@\\[\\\\\\]^_`{|}~]{8,20}$"
}

enum EndPoint : String {
    case products   = "https://run.mocky.io/v3/bc09a745-4346-4025-9611-9da76366dbbc"
    case profile    = "https://run.mocky.io/v3/aaf97364-eedc-46a5-8f9e-56eb4b3cedd2"
}
