//
//  PlaceModel.swift
//  path
//
//  Created by Giovana Malaia on 18/02/25.
//

import Foundation

struct Place {
    let name: String
    let address: String
}

struct PlaceData {
    static let placeList: [Place] = [
        Place(name: "Arcos da Lapa", address: "Lapa, RJ"),
        Place(name: "Arpoador", address: "Ipanema, RJ"),
        Place(name: "Cristo Redentor", address: "Parque Nacional da Tijuca, RJ"),
        Place(name: "Escadaria Selarón", address: "R. Manuel Carneiro - Santa Teresa"),
        Place(name: "Feira de São Cristóvão", address: "Campo de São Cristóvão"),
        Place(name: "Ilha de Paquetá", address: "Ilha de Paquetá, RJ"),
        Place(name: "Jardim Botânico", address: "R. Jardim Botânico, 1008"),
        Place(name: "Maracanã", address: "Av. Pres. Castelo Branco, Portão 3"),
        Place(name: "Mirante Dona Marta", address: "Estr. Mirante Dona Marta"),
        Place(name: "Morro Dois Irmãos", address: "Av. Niemeyer - Vidigal"),
        Place(name: "Museu de Arte do Rio (MAR)", address: "Praça Mauá, 5 - Centro"),
        Place(name: "Museu do Amanhã", address: "Praça Mauá, 1 - Centro"),
        Place(name: "Museu Histórico Nacional", address: "Praça Marechal Âncora"),
        Place(name: "Pão de Açúcar", address: "Av. Pasteur, 520 - Urca"),
        Place(name: "Parque Lage", address: "R. Jardim Botânico, 414"),
        Place(name: "Pedra da Gávea", address: "Estr. Sorimã - Barra da Tijuca"),
        Place(name: "Praia de Copacabana", address: "Av. Atlântica - Copacabana"),
        Place(name: "Praia de Ipanema", address: "Av. Vieira Souto - Ipanema"),
        Place(name: "Praia do Leblon", address: "Av. Delfim Moreira - Leblon"),
        Place(name: "Sambódromo", address: "R. Marquês de Sapucaí - Centro"),
        Place(name: "Theatro Municipal", address: "Praça Floriano - Centro")
    ]
}
