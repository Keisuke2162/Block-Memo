// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let icons8Bird100 = ImageAsset(name: "icons8-bird-100")
    internal static let icons8BorderCollie100 = ImageAsset(name: "icons8-border-collie-100")
    internal static let icons8Bream100 = ImageAsset(name: "icons8-bream-100")
    internal static let icons8Camel100 = ImageAsset(name: "icons8-camel-100")
    internal static let icons8Chicken100 = ImageAsset(name: "icons8-chicken-100")
    internal static let icons8Dolphin100 = ImageAsset(name: "icons8-dolphin-100")
    internal static let icons8Dove100 = ImageAsset(name: "icons8-dove-100")
    internal static let icons8Duck100 = ImageAsset(name: "icons8-duck-100")
    internal static let icons8Elephant100 = ImageAsset(name: "icons8-elephant-100")
    internal static let icons8FlyingDuck100 = ImageAsset(name: "icons8-flying-duck-100")
    internal static let icons8FullBodyCrow100 = ImageAsset(name: "icons8-full-body-crow-100")
    internal static let icons8GiraffeFullBody100 = ImageAsset(name: "icons8-giraffe-full-body-100")
    internal static let icons8Gorilla100 = ImageAsset(name: "icons8-gorilla-100")
    internal static let icons8Hedgehog100 = ImageAsset(name: "icons8-hedgehog-100")
    internal static let icons8Horse100 = ImageAsset(name: "icons8-horse-100")
    internal static let icons8Kangaroo100 = ImageAsset(name: "icons8-kangaroo-100")
    internal static let icons8Koala100 = ImageAsset(name: "icons8-koala-100")
    internal static let icons8Manatee100 = ImageAsset(name: "icons8-manatee-100")
    internal static let icons8Octopus100 = ImageAsset(name: "icons8-octopus-100")
    internal static let icons8Orca100 = ImageAsset(name: "icons8-orca-100")
    internal static let icons8Owl100 = ImageAsset(name: "icons8-owl-100")
    internal static let icons8Penguin100 = ImageAsset(name: "icons8-penguin-100")
    internal static let icons8PetCommandsStay100 = ImageAsset(name: "icons8-pet-commands-stay-100")
    internal static let icons8Pig100 = ImageAsset(name: "icons8-pig-100")
    internal static let icons8Seal100 = ImageAsset(name: "icons8-seal-100")
    internal static let icons8Squirrel100 = ImageAsset(name: "icons8-squirrel-100")
    internal static let icons8Stingray100 = ImageAsset(name: "icons8-stingray-100")
    internal static let icons8Whale100 = ImageAsset(name: "icons8-whale-100")
    internal static let icons8Woodpecker100 = ImageAsset(name: "icons8-woodpecker-100")
    internal static let icons8Chainsaw100 = ImageAsset(name: "icons8-chainsaw-100")
    internal static let icons8Drill100 = ImageAsset(name: "icons8-drill-100")
    internal static let icons8GardenShears100 = ImageAsset(name: "icons8-garden-shears-100")
    internal static let icons8Hammer100 = ImageAsset(name: "icons8-hammer-100")
    internal static let icons8PaintBucket100 = ImageAsset(name: "icons8-paint-bucket-100")
    internal static let icons8Screwdriver100 = ImageAsset(name: "icons8-screwdriver-100")
    internal static let icons8Sickle100 = ImageAsset(name: "icons8-sickle-100")
    internal static let icons8Spade100 = ImageAsset(name: "icons8-spade-100")
    internal static let icons8Wheelbarrow100 = ImageAsset(name: "icons8-wheelbarrow-100")
    internal static let icons8YardWork100 = ImageAsset(name: "icons8-yard-work-100")
    internal static let icons8Address100 = ImageAsset(name: "icons8-address-100")
    internal static let icons8AroundTheGlobe100 = ImageAsset(name: "icons8-around-the-globe-100")
    internal static let icons8Asia100 = ImageAsset(name: "icons8-asia-100")
    internal static let icons8CompassSouth100 = ImageAsset(name: "icons8-compass-south-100")
    internal static let icons8GlobeEarth100 = ImageAsset(name: "icons8-globe-earth-100")
    internal static let icons8GpsSignal100 = ImageAsset(name: "icons8-gps-signal-100")
    internal static let icons8Location100 = ImageAsset(name: "icons8-location-100")
    internal static let icons8MapMarker100 = ImageAsset(name: "icons8-map-marker-100")
    internal static let icons8Marker100 = ImageAsset(name: "icons8-marker-100")
    internal static let icons8MarkerStorm100 = ImageAsset(name: "icons8-marker-storm-100")
    internal static let icons8MarkerSun100 = ImageAsset(name: "icons8-marker-sun-100")
    internal static let icons8Signpost100 = ImageAsset(name: "icons8-signpost-100")
    internal static let icons8WorldMap100 = ImageAsset(name: "icons8-world-map-100")
    internal static let icons8BassDrum100 = ImageAsset(name: "icons8-bass-drum-100")
    internal static let icons8Bugle100 = ImageAsset(name: "icons8-bugle-100")
    internal static let icons8CircledPlay100 = ImageAsset(name: "icons8-circled-play-100")
    internal static let icons8Cornet100 = ImageAsset(name: "icons8-cornet-100")
    internal static let icons8Dj100 = ImageAsset(name: "icons8-dj-100")
    internal static let icons8DrumSet100 = ImageAsset(name: "icons8-drum-set-100")
    internal static let icons8FrenchHorn100 = ImageAsset(name: "icons8-french-horn-100")
    internal static let icons8Guitar100 = ImageAsset(name: "icons8-guitar-100")
    internal static let icons8InternationalMusic100 = ImageAsset(name: "icons8-international-music-100")
    internal static let icons8Lullaby100 = ImageAsset(name: "icons8-lullaby-100")
    internal static let icons8MetalMusic100 = ImageAsset(name: "icons8-metal-music-100")
    internal static let icons8Micro100 = ImageAsset(name: "icons8-micro-100")
    internal static let icons8Microphone100 = ImageAsset(name: "icons8-microphone-100")
    internal static let icons8Musical100 = ImageAsset(name: "icons8-musical-100")
    internal static let icons8MusicalNotes100 = ImageAsset(name: "icons8-musical-notes-100")
    internal static let icons8Oud100 = ImageAsset(name: "icons8-oud-100")
    internal static let icons8PowwowDrum100 = ImageAsset(name: "icons8-powwow-drum-100")
    internal static let icons8Punk100 = ImageAsset(name: "icons8-punk-100")
    internal static let icons8RNB100 = ImageAsset(name: "icons8-r'n'b-100")
    internal static let icons8RockMusic100 = ImageAsset(name: "icons8-rock-music-100")
    internal static let icons8Saxophone100 = ImageAsset(name: "icons8-saxophone-100")
    internal static let icons8TexMex100 = ImageAsset(name: "icons8-tex-mex-100")
    internal static let icons8Tuba100 = ImageAsset(name: "icons8-tuba-100")
    internal static let ok100 = ImageAsset(name: "OK_100")
    internal static let delete100 = ImageAsset(name: "delete_100")
    internal static let fill100 = ImageAsset(name: "fill_100")
    internal static let font = ImageAsset(name: "font")
    internal static let font90 = ImageAsset(name: "font_90")
    internal static let gear = ImageAsset(name: "gear")
    internal static let home = ImageAsset(name: "home")
    internal static let image100 = ImageAsset(name: "image_100")
    internal static let kodi = ImageAsset(name: "kodi")
    internal static let none100 = ImageAsset(name: "none_100")
    internal static let palette100 = ImageAsset(name: "palette_100")
    internal static let plus100 = ImageAsset(name: "plus_100")
    internal static let size100 = ImageAsset(name: "size_100")
    internal static let icons8ArchersArrow100 = ImageAsset(name: "icons8-archers-arrow-100")
    internal static let icons8Badminton100 = ImageAsset(name: "icons8-badminton-100")
    internal static let icons8Baseball100 = ImageAsset(name: "icons8-baseball-100")
    internal static let icons8Basketball100 = ImageAsset(name: "icons8-basketball-100")
    internal static let icons8Beach100 = ImageAsset(name: "icons8-beach-100")
    internal static let icons8BowlingPins100 = ImageAsset(name: "icons8-bowling-pins-100")
    internal static let icons8Forest100 = ImageAsset(name: "icons8-forest-100")
    internal static let icons8HorsebackRiding100 = ImageAsset(name: "icons8-horseback-riding-100")
    internal static let icons8IslandOnWater100 = ImageAsset(name: "icons8-island-on-water-100")
    internal static let icons8OlympicTorch100 = ImageAsset(name: "icons8-olympic-torch-100")
    internal static let icons8PingPong100 = ImageAsset(name: "icons8-ping-pong-100")
    internal static let icons8Rugby100 = ImageAsset(name: "icons8-rugby-100")
    internal static let icons8TennisBall100 = ImageAsset(name: "icons8-tennis-ball-100")
    internal static let icons8TennisRacquet100 = ImageAsset(name: "icons8-tennis-racquet-100")
    internal static let icons8TrottingHorse100 = ImageAsset(name: "icons8-trotting-horse-100")
    internal static let icons8AngelWithSword100 = ImageAsset(name: "icons8-angel-with-sword-100")
    internal static let icons8Ankh100 = ImageAsset(name: "icons8-ankh-100")
    internal static let icons8Anubis100 = ImageAsset(name: "icons8-anubis-100")
    internal static let icons8BalanceSymbol100 = ImageAsset(name: "icons8-balance-symbol-100")
    internal static let icons8Basilica100 = ImageAsset(name: "icons8-basilica-100")
    internal static let icons8BerlinTvTower100 = ImageAsset(name: "icons8-berlin-tv-tower-100")
    internal static let icons8Bull100 = ImageAsset(name: "icons8-bull-100")
    internal static let icons8Cross100 = ImageAsset(name: "icons8-cross-100")
    internal static let icons8DaVinci100 = ImageAsset(name: "icons8-da-vinci-100")
    internal static let icons8Dali100 = ImageAsset(name: "icons8-dali-100")
    internal static let icons8DoubleDeckerBus100 = ImageAsset(name: "icons8-double-decker-bus-100")
    internal static let icons8Easel100 = ImageAsset(name: "icons8-easel-100")
    internal static let icons8EdvardMunch100 = ImageAsset(name: "icons8-edvard-munch-100")
    internal static let icons8GermanHat100 = ImageAsset(name: "icons8-german-hat-100")
    internal static let icons8GoldenFever100 = ImageAsset(name: "icons8-golden-fever-100")
    internal static let icons8GreekHelmet100 = ImageAsset(name: "icons8-greek-helmet-100")
    internal static let icons8Katana100 = ImageAsset(name: "icons8-katana-100")
    internal static let icons8KawaiiBread100 = ImageAsset(name: "icons8-kawaii-bread-100")
    internal static let icons8KawaiiBroccoli100 = ImageAsset(name: "icons8-kawaii-broccoli-100")
    internal static let icons8KawaiiCoffee100 = ImageAsset(name: "icons8-kawaii-coffee-100")
    internal static let icons8KawaiiCroissant100 = ImageAsset(name: "icons8-kawaii-croissant-100")
    internal static let icons8KawaiiCupcake100 = ImageAsset(name: "icons8-kawaii-cupcake-100")
    internal static let icons8KawaiiDinosaur100 = ImageAsset(name: "icons8-kawaii-dinosaur-100")
    internal static let icons8KawaiiEgg100 = ImageAsset(name: "icons8-kawaii-egg-100")
    internal static let icons8KawaiiFrenchFries100 = ImageAsset(name: "icons8-kawaii-french-fries-100")
    internal static let icons8KawaiiIceCream100 = ImageAsset(name: "icons8-kawaii-ice-cream-100")
    internal static let icons8KawaiiMilk100 = ImageAsset(name: "icons8-kawaii-milk-100")
    internal static let icons8KawaiiNoodle100 = ImageAsset(name: "icons8-kawaii-noodle-100")
    internal static let icons8KawaiiSoda100 = ImageAsset(name: "icons8-kawaii-soda-100")
    internal static let icons8Kimono100 = ImageAsset(name: "icons8-kimono-100")
    internal static let icons8LionHead100 = ImageAsset(name: "icons8-lion-head-100")
    internal static let icons8LouvrePyramid100 = ImageAsset(name: "icons8-louvre-pyramid-100")
    internal static let icons8MoonStar100 = ImageAsset(name: "icons8-moon-star-100")
    internal static let icons8Origami100 = ImageAsset(name: "icons8-origami-100")
    internal static let icons8Pagoda100 = ImageAsset(name: "icons8-pagoda-100")
    internal static let icons8PeacePigeon100 = ImageAsset(name: "icons8-peace-pigeon-100")
    internal static let icons8PentagramDevil100 = ImageAsset(name: "icons8-pentagram-devil-100")
    internal static let icons8Pyramids100 = ImageAsset(name: "icons8-pyramids-100")
    internal static let icons8RedFort100 = ImageAsset(name: "icons8-red-fort-100")
    internal static let icons8Rodeo100 = ImageAsset(name: "icons8-rodeo-100")
    internal static let icons8SagradaFamilia100 = ImageAsset(name: "icons8-sagrada-familia-100")
    internal static let icons8SalmonSushi100 = ImageAsset(name: "icons8-salmon-sushi-100")
    internal static let icons8Sikh100 = ImageAsset(name: "icons8-sikh-100")
    internal static let icons8TajMahal100 = ImageAsset(name: "icons8-taj-mahal-100")
    internal static let icons8ThirdEyeSymbol100 = ImageAsset(name: "icons8-third-eye-symbol-100")
    internal static let icons8ThorHammer100 = ImageAsset(name: "icons8-thor-hammer-100")
    internal static let icons8Tiananmen100 = ImageAsset(name: "icons8-tiananmen-100")
    internal static let icons8Tomahawk100 = ImageAsset(name: "icons8-tomahawk-100")
    internal static let icons8TowerOfPisa100 = ImageAsset(name: "icons8-tower-of-pisa-100")
    internal static let icons8TribalSymbols100 = ImageAsset(name: "icons8-tribal-symbols-100")
    internal static let icons8TriumphalArch100 = ImageAsset(name: "icons8-triumphal-arch-100")
    internal static let icons8TrojanHorse100 = ImageAsset(name: "icons8-trojan-horse-100")
    internal static let icons8VikingHelmet100 = ImageAsset(name: "icons8-viking-helmet-100")
    internal static let icons8VikingShip100 = ImageAsset(name: "icons8-viking-ship-100")
    internal static let icons8YinYang100 = ImageAsset(name: "icons8-yin-yang-100")
    internal static let icons8Beer100 = ImageAsset(name: "icons8-beer-100")
    internal static let icons8BottleCap100 = ImageAsset(name: "icons8-bottle-cap-100")
    internal static let icons8Cafe100 = ImageAsset(name: "icons8-cafe-100")
    internal static let icons8ChampagneBottle100 = ImageAsset(name: "icons8-champagne-bottle-100")
    internal static let icons8Cocktail100 = ImageAsset(name: "icons8-cocktail-100")
    internal static let icons8CoconutCocktail100 = ImageAsset(name: "icons8-coconut-cocktail-100")
    internal static let icons8CoffeePot100 = ImageAsset(name: "icons8-coffee-pot-100")
    internal static let icons8CoffeeToGo100 = ImageAsset(name: "icons8-coffee-to-go-100")
    internal static let icons8Cola100 = ImageAsset(name: "icons8-cola-100")
    internal static let icons8CupWithStraw100 = ImageAsset(name: "icons8-cup-with-straw-100")
    internal static let icons8Soda100 = ImageAsset(name: "icons8-soda-100")
    internal static let icons8SportBottle100 = ImageAsset(name: "icons8-sport-bottle-100")
    internal static let icons8Tea100 = ImageAsset(name: "icons8-tea-100")
    internal static let icons8Vodka100 = ImageAsset(name: "icons8-vodka-100")
    internal static let icons8WineBottle100 = ImageAsset(name: "icons8-wine-bottle-100")
    internal static let icons8WineGlass100 = ImageAsset(name: "icons8-wine-glass-100")
    internal static let icons8WoodenBeerKeg100 = ImageAsset(name: "icons8-wooden-beer-keg-100")
    internal static let icons8Banana100 = ImageAsset(name: "icons8-banana-100")
    internal static let icons8Carrot100 = ImageAsset(name: "icons8-carrot-100")
    internal static let icons8Cherry100 = ImageAsset(name: "icons8-cherry-100")
    internal static let icons8EggStand100 = ImageAsset(name: "icons8-egg-stand-100")
    internal static let icons8FishAndVegetables100 = ImageAsset(name: "icons8-fish-and-vegetables-100")
    internal static let icons8HealthyEating100 = ImageAsset(name: "icons8-healthy-eating-100")
    internal static let icons8Lime100 = ImageAsset(name: "icons8-lime-100")
    internal static let icons8Noodles100 = ImageAsset(name: "icons8-noodles-100")
    internal static let icons8Orange100 = ImageAsset(name: "icons8-orange-100")
    internal static let icons8Pear100 = ImageAsset(name: "icons8-pear-100")
    internal static let icons8SalamiPizza100 = ImageAsset(name: "icons8-salami-pizza-100")
    internal static let icons8SpamCan100 = ImageAsset(name: "icons8-spam-can-100")
    internal static let icons8SteakVeryHot100 = ImageAsset(name: "icons8-steak-very-hot-100")
    internal static let icons8Thanksgiving100 = ImageAsset(name: "icons8-thanksgiving-100")
    internal static let icons8Tomato100 = ImageAsset(name: "icons8-tomato-100")
    internal static let icons8Watermelon100 = ImageAsset(name: "icons8-watermelon-100")
    internal static let icons8AceOfHearts100 = ImageAsset(name: "icons8-ace-of-hearts-100")
    internal static let icons8AceOfSpades100 = ImageAsset(name: "icons8-ace-of-spades-100")
    internal static let icons8Archer100 = ImageAsset(name: "icons8-archer-100")
    internal static let icons8Clubs100 = ImageAsset(name: "icons8-clubs-100")
    internal static let icons8Defense100 = ImageAsset(name: "icons8-defense-100")
    internal static let icons8Diamonds100 = ImageAsset(name: "icons8-diamonds-100")
    internal static let icons8Dice100 = ImageAsset(name: "icons8-dice-100")
    internal static let icons8Explosive100 = ImageAsset(name: "icons8-explosive-100")
    internal static let icons8HeartOutline100 = ImageAsset(name: "icons8-heart-outline-100")
    internal static let icons8Joker100 = ImageAsset(name: "icons8-joker-100")
    internal static let icons8KingOfDiamonds100 = ImageAsset(name: "icons8-king-of-diamonds-100")
    internal static let icons8Knight100 = ImageAsset(name: "icons8-knight-100")
    internal static let icons8Mana100 = ImageAsset(name: "icons8-mana-100")
    internal static let icons8MinecraftSword100 = ImageAsset(name: "icons8-minecraft-sword-100")
    internal static let icons8Pacman100 = ImageAsset(name: "icons8-pacman-100")
    internal static let icons8Queen100 = ImageAsset(name: "icons8-queen-100")
    internal static let icons8QueenOfDiamonds100 = ImageAsset(name: "icons8-queen-of-diamonds-100")
    internal static let icons8Rook100 = ImageAsset(name: "icons8-rook-100")
    internal static let icons8Shield100 = ImageAsset(name: "icons8-shield-100")
    internal static let icons8SlotMachine100 = ImageAsset(name: "icons8-slot-machine-100")
    internal static let icons8Spades100 = ImageAsset(name: "icons8-spades-100")
    internal static let icons8SubmachineGun100 = ImageAsset(name: "icons8-submachine-gun-100")
    internal static let icons8Tetris100 = ImageAsset(name: "icons8-tetris-100")
    internal static let icons8Agreement100 = ImageAsset(name: "icons8-agreement-100")
    internal static let icons8Airport100 = ImageAsset(name: "icons8-airport-100")
    internal static let icons8Answers100 = ImageAsset(name: "icons8-answers-100")
    internal static let icons8Aquarius100 = ImageAsset(name: "icons8-aquarius-100")
    internal static let icons8Aries100 = ImageAsset(name: "icons8-aries-100")
    internal static let icons8Attack100 = ImageAsset(name: "icons8-attack-100")
    internal static let icons8BadIdea100 = ImageAsset(name: "icons8-bad-idea-100")
    internal static let icons8Bonds100 = ImageAsset(name: "icons8-bonds-100")
    internal static let icons8Bookmark100 = ImageAsset(name: "icons8-bookmark-100")
    internal static let icons8Cancer100 = ImageAsset(name: "icons8-cancer-100")
    internal static let icons8Capricorn100 = ImageAsset(name: "icons8-capricorn-100")
    internal static let icons8Cinema100 = ImageAsset(name: "icons8-cinema-100")
    internal static let icons8City100 = ImageAsset(name: "icons8-city-100")
    internal static let icons8Clock100 = ImageAsset(name: "icons8-clock-100")
    internal static let icons8Comet100 = ImageAsset(name: "icons8-comet-100")
    internal static let icons8Confetti100 = ImageAsset(name: "icons8-confetti-100")
    internal static let icons8Document100 = ImageAsset(name: "icons8-document-100")
    internal static let icons8DoughnutChart100 = ImageAsset(name: "icons8-doughnut-chart-100")
    internal static let icons8Edit100 = ImageAsset(name: "icons8-edit-100")
    internal static let icons8FacebookOld100 = ImageAsset(name: "icons8-facebook-old-100")
    internal static let icons8FerrisWheel100 = ImageAsset(name: "icons8-ferris-wheel-100")
    internal static let icons8Galaxy100 = ImageAsset(name: "icons8-galaxy-100")
    internal static let icons8Gemini100 = ImageAsset(name: "icons8-gemini-100")
    internal static let icons8IdeaBank100 = ImageAsset(name: "icons8-idea-bank-100")
    internal static let icons8Inspection100 = ImageAsset(name: "icons8-inspection-100")
    internal static let icons8Instagram100 = ImageAsset(name: "icons8-instagram-100")
    internal static let icons8Internet100 = ImageAsset(name: "icons8-internet-100")
    internal static let icons8Kicking100 = ImageAsset(name: "icons8-kicking-100")
    internal static let icons8Leo100 = ImageAsset(name: "icons8-leo-100")
    internal static let icons8Libra100 = ImageAsset(name: "icons8-libra-100")
    internal static let icons8Lock100 = ImageAsset(name: "icons8-lock-100")
    internal static let icons8Meal100 = ImageAsset(name: "icons8-meal-100")
    internal static let icons8Music100 = ImageAsset(name: "icons8-music-100")
    internal static let icons8News100 = ImageAsset(name: "icons8-news-100")
    internal static let icons8OpenedFolder100 = ImageAsset(name: "icons8-opened-folder-100")
    internal static let icons8Pisces100 = ImageAsset(name: "icons8-pisces-100")
    internal static let icons8Planet100 = ImageAsset(name: "icons8-planet-100")
    internal static let icons8Punching100 = ImageAsset(name: "icons8-punching-100")
    internal static let icons8Questionnaire100 = ImageAsset(name: "icons8-questionnaire-100")
    internal static let icons8Reserve100 = ImageAsset(name: "icons8-reserve-100")
    internal static let icons8Restaurant100 = ImageAsset(name: "icons8-restaurant-100")
    internal static let icons8RollerCoaster100 = ImageAsset(name: "icons8-roller-coaster-100")
    internal static let icons8Sagittarius100 = ImageAsset(name: "icons8-sagittarius-100")
    internal static let icons8Scorpio100 = ImageAsset(name: "icons8-scorpio-100")
    internal static let icons8Search100 = ImageAsset(name: "icons8-search-100")
    internal static let icons8ShootingStars100 = ImageAsset(name: "icons8-shooting-stars-100")
    internal static let icons8SpeechBubble100 = ImageAsset(name: "icons8-speech-bubble-100")
    internal static let icons8Support100 = ImageAsset(name: "icons8-support-100")
    internal static let icons8Taurus100 = ImageAsset(name: "icons8-taurus-100")
    internal static let icons8TermsAndConditions100 = ImageAsset(name: "icons8-terms-and-conditions-100")
    internal static let icons8TireSwing100 = ImageAsset(name: "icons8-tire-swing-100")
    internal static let icons8ToDo100 = ImageAsset(name: "icons8-to-do-100")
    internal static let icons8Twitter100 = ImageAsset(name: "icons8-twitter-100")
    internal static let icons8Virgo100 = ImageAsset(name: "icons8-virgo-100")
    internal static let icons8Cancel100 = ImageAsset(name: "icons8-cancel-100")
  }
  internal enum Colors {
    internal static let white = ColorAsset(name: "White")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
