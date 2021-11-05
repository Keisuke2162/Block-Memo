//
//  IconData.swift
//  QuadStepApp
//
//  Created by 植田圭祐 on 2021/11/05.
//  Copyright © 2021 Keisuke Ueda. All rights reserved.
//

import Foundation

class IconData {
    
    static let shared = IconData()
    
    func getIconData() -> [[String]] {
        let iconDataList = [iconPopular, iconBusiness, iconCinema, iconCity, iconAnimal, iconCulture, iconDIY, iconDrink, iconFood, iconGaming, iconMaps, iconMusic, iconSports]
        
        return iconDataList
    }
    
    let iconPopular: [String] = [
        "icons8-bookmark-100",
        "icons8-edit-100",
        "icons8-search-100",
        "icons8-document-100",
        "icons8-opened-folder-100",
        "icons8-support-100",
        "icons8-facebook-old-100",
        "icons8-instagram-100",
        "icons8-twitter-100",
        "icons8-clock-100",
        "icons8-lock-100",
        "icons8-news-100",
        "icons8-speech-bubble-100",
        "icons8-music-100",
        "icons8-cancer-100"
    ]
    
    //let iconAstrogy: [String] = ["icons8-leo-100", "icons8-libra-100", "icons8-aquarius-100", "icons8-aries-100", "icons8-pisces-100", "icons8-scorpio-100", "icons8-virgo-100", "icons8-capricorn-100", "icons8-sagittarius-100", "icons8-taurus-100", "icons8-gemini-100"]
    
    let iconBusiness: [String] = [
        "icons8-agreement-100",
        "icons8-answers-100",
        "icons8-bonds-100",
        "icons8-bad-idea-100",
        "icons8-idea-bank-100",
        "icons8-internet-100",
        "icons8-inspection-100",
        "icons8-questionnaire-100",
        "icons8-to-do-100",
        "icons8-doughnut-chart-100",
        "icons8-terms-and-conditions-100"
    ]
    
    let iconCinema: [String] = [
        "icons8-kicking-100",
        "icons8-attack-100",
        "icons8-comet-100",
        "icons8-galaxy-100",
        "icons8-planet-100",
        "icons8-shooting-stars-100",
        "icons8-punching-100"
    ]
    
    let iconCity: [String] = [
        "icons8-airport-100",
        "icons8-ferris-wheel-100",
        "icons8-city-100",
        "icons8-cafe-100",
        "icons8-meal-100",
        "icons8-confetti-100",
        "icons8-roller-coaster-100",
        "icons8-tire-swing-100",
        "icons8-reserve-100",
        "icons8-cinema-100",
        "icons8-restaurant-100"
    ]
    
    let iconAnimal: [String] = [
        "icons8-bird-100",
        "icons8-border-collie-100",
        "icons8-bream-100",
        "icons8-camel-100",
        "icons8-chicken-100",
        "icons8-dolphin-100",
        "icons8-dove-100",
        "icons8-duck-100",
        "icons8-elephant-100",
        "icons8-flying-duck-100",
        "icons8-full-body-crow-100",
        "icons8-giraffe-full-body-100",
        "icons8-gorilla-100",
        "icons8-hedgehog-100",
        "icons8-horse-100",
        "icons8-kangaroo-100",
        "icons8-koala-100",
        "icons8-manatee-100",
        "icons8-octopus-100",
        "icons8-orca-100",
        "icons8-owl-100",
        "icons8-penguin-100",
        "icons8-pet-commands-stay-100",
        "icons8-pig-100",
        "icons8-seal-100",
        "icons8-squirrel-100",
        "icons8-stingray-100",
        "icons8-whale-100",
        "icons8-woodpecker-100"
    ]
    
    let iconCulture: [String] = [
        "icons8-angel-with-sword-100",
        "icons8-ankh-100",
        "icons8-anubis-100",
        "icons8-balance-symbol-100",
        "icons8-basilica-100",
        "icons8-berlin-tv-tower-100",
        "icons8-bull-100",
        "icons8-cross-100",
        "icons8-da-vinci-100",
        "icons8-dali-100",
        "icons8-double-decker-bus-100",
        "icons8-easel-100",
        "icons8-edvard-munch-100",
        "icons8-german-hat-100",
        "icons8-golden-fever-100",
        "icons8-greek-helmet-100",
        "icons8-katana-100",
        "icons8-kawaii-bread-100",
        "icons8-kawaii-broccoli-100",
        "icons8-kawaii-coffee-100",
        "icons8-kawaii-croissant-100",
        "icons8-kawaii-cupcake-100",
        "icons8-kawaii-dinosaur-100",
        "icons8-kawaii-egg-100",
        "icons8-kawaii-french-fries-100",
        "icons8-kawaii-ice-cream-100",
        "icons8-kawaii-milk-100",
        "icons8-kawaii-noodle-100",
        "icons8-kawaii-soda-100",
        "icons8-kimono-100",
        "icons8-lion-head-100",
        "icons8-louvre-pyramid-100",
        "icons8-moon-star-100",
        "icons8-origami-100",
        "icons8-pagoda-100",
        "icons8-peace-pigeon-100",
        "icons8-pentagram-devil-100",
        "icons8-pyramids-100",
        "icons8-red-fort-100",
        "icons8-rodeo-100",
        "icons8-sagrada-familia-100",
        "icons8-salmon-sushi-100",
        "icons8-sikh-100",
        "icons8-taj-mahal-100",
        "icons8-third-eye-symbol-100",
        "icons8-thor-hammer-100",
        "icons8-tiananmen-100",
        "icons8-tomahawk-100",
        "icons8-tower-of-pisa-100",
        "icons8-tribal-symbols-100",
        "icons8-triumphal-arch-100",
        "icons8-trojan-horse-100",
        "icons8-viking-helmet-100",
        "icons8-viking-ship-100",
        "icons8-yin-yang-100"
    ]
    
    let iconDIY: [String] = [
        "icons8-chainsaw-100",
        "icons8-drill-100",
        "icons8-garden-shears-100",
        "icons8-hammer-100",
        "icons8-paint-bucket-100",
        "icons8-screwdriver-100",
        "icons8-sickle-100",
        "icons8-spade-100",
        "icons8-wheelbarrow-100",
        "icons8-yard-work-100"
    ]
    
    let iconDrink: [String] = [
        "icons8-beer-100",
        "icons8-bottle-cap-100",
        "icons8-cafe-100",
        "icons8-champagne-bottle-100",
        "icons8-cocktail-100",
        "icons8-coconut-cocktail-100",
        "icons8-coffee-pot-100",
        "icons8-coffee-to-go-100",
        "icons8-cola-100",
        "icons8-cup-with-straw-100",
        "icons8-soda-100",
        "icons8-sport-bottle-100",
        "icons8-tea-100",
        "icons8-vodka-100",
        "icons8-wine-bottle-100",
        "icons8-wine-glass-100",
        "icons8-wooden-beer-keg-100"
    ]
    
    let iconFood: [String] = [
        "icons8-banana-100",
        "icons8-carrot-100",
        "icons8-cherry-100",
        "icons8-egg-stand-100",
        "icons8-fish-and-vegetables-100",
        "icons8-healthy-eating-100",
        "icons8-lime-100",
        "icons8-noodles-100",
        "icons8-orange-100",
        "icons8-pear-100",
        "icons8-salami-pizza-100",
        "icons8-spam-can-100",
        "icons8-steak-very-hot-100",
        "icons8-thanksgiving-100",
        "icons8-tomato-100",
        "icons8-watermelon-100"
    ]
    
    let iconGaming: [String] = [
        "icons8-ace-of-hearts-100",
        "icons8-ace-of-spades-100",
        "icons8-archer-100",
        "icons8-clubs-100",
        "icons8-defense-100",
        "icons8-diamonds-100",
        "icons8-dice-100",
        "icons8-explosive-100",
        "icons8-heart-outline-100",
        "icons8-joker-100",
        "icons8-king-of-diamonds-100",
        "icons8-knight-100",
        "icons8-mana-100",
        "icons8-minecraft-sword-100",
        "icons8-pacman-100",
        "icons8-queen-100",
        "icons8-queen-of-diamonds-100",
        "icons8-rook-100",
        "icons8-shield-100",
        "icons8-slot-machine-100",
        "icons8-spades-100",
        "icons8-submachine-gun-100",
        "icons8-tetris-100"
    ]
    
    let iconMaps: [String] = [
        "icons8-address-100",
        "icons8-around-the-globe-100",
        "icons8-asia-100",
        "icons8-compass-south-100",
        "icons8-globe-earth-100",
        "icons8-gps-signal-100",
        "icons8-location-100",
        "icons8-map-marker-100",
        "icons8-marker-100",
        "icons8-marker-storm-100",
        "icons8-marker-sun-100",
        "icons8-signpost-100",
        "icons8-world-map-100"
    ]
    
    let iconMusic: [String] = [
        "icons8-bass-drum-100",
        "icons8-bugle-100",
        "icons8-circled-play-100",
        "icons8-cornet-100",
        "icons8-dj-100",
        "icons8-drum-set-100",
        "icons8-french-horn-100",
        "icons8-guitar-100",
        "icons8-international-music-100",
        "icons8-lullaby-100",
        "icons8-metal-music-100",
        "icons8-micro-100",
        "icons8-microphone-100",
        "icons8-musical-100",
        "icons8-musical-notes-100",
        "icons8-oud-100",
        "icons8-powwow-drum-100",
        "icons8-punk-100",
        "icons8-r'n'b-100",
        "icons8-rock-music-100",
        "icons8-saxophone-100",
        "icons8-tex-mex-100",
        "icons8-tuba-100"
    ]
    
    let iconSports: [String] = [
        "icons8-archers-arrow-100",
        "icons8-badminton-100",
        "icons8-baseball-100",
        "icons8-basketball-100",
        "icons8-beach-100",
        "icons8-bowling-pins-100",
        "icons8-forest-100",
        "icons8-horseback-riding-100",
        "icons8-island-on-water-100",
        "icons8-olympic-torch-100",
        "icons8-ping-pong-100",
        "icons8-rugby-100",
        "icons8-tennis-ball-100",
        "icons8-tennis-racquet-100",
        "icons8-trotting-horse-100"
    ]
}
