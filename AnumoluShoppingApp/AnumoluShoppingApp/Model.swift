//
//  Model.swift
//  AnumoluShoppingApp
//
//  Created by Sai Greeshma Anumolu on 10/25/23.
//

import Foundation

struct UtilityConstants{
    
    static let username: String = "admin"
    static let password: String = "password"
    
    static let seasonTypes: [String: Int64] = ["winter": 4, "autumn": 1, "automn": 0, "summer": 3, "spring": 2]
    static let priceTypes: [String: Int64] = ["low": 2, "average": 0, "high": 1, "medium": 3, "very-high": 4]
    static let materialTypes: [String: Int64] = ["lycra": 7, "other": 14, "chiffonfabric": 2, "acrylic": 8, "viscos": 21, "shiffon": 17, "model": 12, "sill": 19, "silk": 18, "rayon": 16, "cashmere": 1, "wool": 22, "lace": 5, "knitting": 4, "spandex": 20, "linen": 6, "modal": 11, "nylon": 13, "microfiber": 8, "milksilk": 9, "polyster": 15, "cotton": 3, "mix": 10]
    
    static let items: [Item] = [
        Item(name: "Belted dress", description: "A casually stylish multicolor A-line dress with a vibrant colorblock pattern, featuring a belted waist, charming button front, elegant round neckline, trendy Short puff sleeves, flattering high waistline, nowy flared hem, and a versatile midi length.", price: 12.30, priceTag: "average", image: "belted", season: "winter", rating: 4.5, material: "polyster"),
        
        Item(name: "Jacket", description: "A jacket is a versatile outerwear garment designed to provide warmth and protection from the elements. It comes in various styles, materials, and designs, making it a fashionable and functional wardrobe essential. From lightweight windbreakers to cozy winter coats, jackets cater to a wide range of preferences and climates.", price: 15.60, priceTag: "very-high", image: "jacket", season: "spring", rating: 4.0, material: "nylon"),
        
        Item(name: "Jeans", description: "Jeans are a popular and versatile type of pants made from denim fabric, known for their durability and comfort. They were originally designed as sturdy workwear but have evolved into a fashion staple, available in various styles, cuts, and washes. Jeans have a timeless appeal and can be dressed up or down, making them a wardrobe essential for people of all ages and lifestyles.", price: 9.80, priceTag: "high", image: "jeans", season: "automn", rating: 4.8, material: "viscos"),
        
        Item(name: "Jumpsuit", description: "A jumpsuit is a one-piece garment that combines a top and pants in a single outfit, providing a convenient and stylish clothing option. It is popular for its versatility, making it suitable for casual, formal, or even work settings depending on the design and material. Jumpsuits come in various styles, from sleeveless and short to long-sleeved and full-length, catering to different preferences and occasions.", price: 14.55, priceTag: "average", image: "jumpsuit", season: "summer", rating: 3.0, material: "linen"),
        
        Item(name: "Lehenga", description: "A lehenga is a traditional Indian outfit consisting of a flared skirt, a blouse or choli, and a long scarf or dupatta. It is often embellished with intricate embroidery, sequins, and other decorative elements, making it a popular choice for weddings and special occasions. Lehengas come in a wide variety of colors and styles, offering a stunning and elegant look for women.", price: 20.30, priceTag: "average", image: "lehenga", season: "autumn", rating: 3.5, material: "rayon"),
        
        Item(name: "Maxi dress", description: "A maxi dress is a stylish and versatile clothing item that typically extends to the ankles or floor, offering a full-length look. These dresses are known for their comfortable and flowing design, making them perfect for both casual and formal occasions. Maxi dresses come in a wide range of styles, patterns, and fabrics, making them a popular choice for women of all ages.", price: 12.80, priceTag: "very-high", image: "maxidress", season: "summer", rating: 3.6, material: "chiffonfabric"),
        
        Item(name: "Saree", description: "A saree is a traditional Indian garment known for its elegance and versatility. It consists of a long piece of fabric, often around six to nine yards in length, which is draped gracefully around the body. Sarees come in a wide array of colors, patterns, and fabrics, making them a symbol of India's rich cultural diversity and timeless fashion.", price: 25.70, priceTag: "very-high", image: "saree", season: "automn", rating: 4.5, material: "shiffon"),
        
        Item(name: "Shirt", description: "A shirt is a versatile clothing item that comes in various styles, colors, and fabrics, making it a wardrobe essential for both men and women. It typically has buttons down the front, a collar, and short or long sleeves. Whether worn casually with jeans or dressed up with slacks, a well-fitted shirt can instantly enhance one's style.", price: 11.00, priceTag: "high", image: "shirt", season: "summer", rating: 4.5, material: "cotton"),
        ]
        }
        struct Item{
                        let name: String
                        let description: String
                        let price: Double
                        let priceTag: String
                        let image: String
                        let season: String
                        let rating: Double
                        let material: String
                }
