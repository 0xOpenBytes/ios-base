//
//  Navigation.swift
//  base
//
//  Created by Leif on 12/16/22.
//

public enum Navigation {
    static var path: CartographyPath = CartographyPath.load()

    static var isPreview = false
}

extension Navigation: StaticUsable { }
