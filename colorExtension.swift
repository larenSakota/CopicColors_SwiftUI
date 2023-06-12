//
//  colorExtension.swift
//  neumorphism2
//
//  Created by Laren Sakota on 3/27/21.
//

import Foundation
import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}

extension Color {
    // Create rgb value from hex
        init(hex string: String) {
            var string: String = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            if string.hasPrefix("#") {
                _ = string.removeFirst()
            }

            // Double the last value if incomplete hex
            if !string.count.isMultiple(of: 2), let last = string.last {
                string.append(last)
            }

            // Fix invalid values
            if string.count > 8 {
                string = String(string.prefix(8))
            }

            // Scanner creation
            let scanner = Scanner(string: string)

            var color: UInt64 = 0
            scanner.scanHexInt64(&color)

            if string.count == 2 {
                let mask = 0xFF

                let g = Int(color) & mask

                let gray = Double(g) / 255.0

                self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: 1)

            } else if string.count == 4 {
                let mask = 0x00FF

                let g = Int(color >> 8) & mask
                let a = Int(color) & mask

                let gray = Double(g) / 255.0
                let alpha = Double(a) / 255.0

                self.init(.sRGB, red: gray, green: gray, blue: gray, opacity: alpha)

            } else if string.count == 6 {
                let mask = 0x0000FF
                let r = Int(color >> 16) & mask
                let g = Int(color >> 8) & mask
                let b = Int(color) & mask

                let red = Double(r) / 255.0
                let green = Double(g) / 255.0
                let blue = Double(b) / 255.0

                self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)

            } else if string.count == 8 {
                let mask = 0x000000FF
                let r = Int(color >> 24) & mask
                let g = Int(color >> 16) & mask
                let b = Int(color >> 8) & mask
                let a = Int(color) & mask

                let red = Double(r) / 255.0
                let green = Double(g) / 255.0
                let blue = Double(b) / 255.0
                let alpha = Double(a) / 255.0

                self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)

            } else {
                self.init(.sRGB, red: 1, green: 1, blue: 1, opacity: 1)
            }
        }
    
    
    
    // Other colors
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    // Copic color values from hex
    // Copic Black
    static let m0_ColorlessBlender = Color(hex: "FFFFFF")
    static let m100_Black = Color(hex: "2F2521")
    static let m110_SpecialBlack = Color(hex: "231815")
    
    // Copic Blue
    static let b00_FrostBlue = Color(hex: "EBF6FB")
    static let b000_PalePorcelainBlue = Color(hex: "EBF7F7")
    static let b0000_PaleCelestine = Color(hex: "F5FBFE")
    static let b01_MintBlue = Color(hex: "E0F1F4")
    static let b02_RobinsEggBlue = Color(hex: "C0E4F2")
    static let b04_TahitianBlue = Color(hex: "80CDE7")
    static let b05_ProcessBlue = Color(hex: "4EC1E6")
    static let b06_PeacockBlue = Color(hex: "00A7E3")
    static let b12_LightBlue = Color(hex: "7FCDEC")
    static let b16_LapisLazuli = Color(hex: "0086C9")
    static let b21_BabyBlue = Color(hex: "E6F2FB")
    static let b23_PhthaloBlue = Color(hex: "A1C8EB")
    static let b24_Sky = Color(hex: "99D2F2")
    static let b26_CobaltBlue = Color(hex: "70B4E4")
    static let b28_RoyalBlue = Color(hex: "0D64B0")
    static let b29_Ultramarine = Color(hex: "006DBB")
    static let b32_PaleBlue = Color(hex: "EAF4F9")
    static let b34_ManganeseBlue = Color(hex: "8FC6EC")
    static let b37_AntwerpBlue = Color(hex: "0068A2")
    static let b39_PrussianBlue = Color(hex: "255CA7")
    static let b41_PowderBlue = Color(hex: "EAF4FC")
    static let b45_SmokyBlue = Color(hex: "82C2EB")
    static let b52_SoftGreenishBlue = Color(hex: "BED6E3")
    static let b60_PaleBlueGray = Color(hex: "E3E7F5")
    static let b63_LightHydrangea = Color(hex: "B4C2E3")
    static let b66_Clematis = Color(hex: "6C88C4")
    static let b69_StratosphericBlue = Color(hex: "035AA9")
    static let b79_Iris = Color(hex: "313994")
    static let b91_PaleGrayishBlue = Color(hex: "DFE8EF")
    static let b93_LightCrockeryBlue = Color(hex: "A2C8E0")
    static let b95_LightGrayishCobalt = Color(hex: "7BA9CA")
    static let b97_NightBlue = Color(hex: "3D7599")
    static let b99_Agate = Color(hex: "004977")
    
    // Copic Blue Green
    static let bg000_PaleAqua = Color(hex: "EDF6F2")
    static let bg0000_SnowGreen = Color(hex: "F3F9F6")
    static let bg01_AquaBlue = Color(hex: "D3EBFA")
    static let bg02_NewBlue = Color(hex: "D2EBEE")
    static let bg05_HolidayBlue = Color(hex: "91D2E6")
    static let bg07_PetroleumBlue = Color(hex: "11B3D1")
    static let bg09_BlueGreen = Color(hex: "00ACCB")
    static let bg10_CoolShadow = Color(hex: "E6F4F3")
    static let bg11_MoonWhite = Color(hex: "D9EEF4")
    static let bg13_MintGreen = Color(hex: "CFEAED")
    static let bg15_Aqua = Color(hex: "AEDBD5")
    static let bg18_TealBlue = Color(hex: "42B9AC")
    static let bg23_CoralSea = Color(hex: "C9E6E0")
    static let bg32_AquaMint = Color(hex: "C7E5DA")
    static let bg34_HorizonGreen = Color(hex: "B0DCDA")
    static let bg45_NileBlue = Color(hex: "BCE2E4")
    static let bg49_DuckBlue = Color(hex: "00AEB6")
    static let bg53_IceMint = Color(hex: "B8D5D7")
    static let bg57_Jasper = Color(hex: "6BBEBE")
    static let bg70_OceanMist = Color(hex: "E4EFF1")
    static let bg72_IceOcean = Color(hex: "7BBABE")
    static let bg75_AbyssGreen = Color(hex: "538F8D")
    static let bg78_Bronze = Color(hex: "3D6D64")
    static let bg90_GraySky = Color(hex: "EFF3ED")
    static let bg93_GreenGray = Color(hex: "C9CEC3")
    static let bg96_Bush = Color(hex: "90AD99")
    static let bg99_FlagstoneBlue = Color(hex: "7CA58F")
    
    // Copic Blue Violet
    static let bv00_MauveShadow = Color(hex: "E8E3F1")
    static let bv000_IridescentMauve = Color(hex: "EDE6F2")
    static let bv0000_PaleThistle = Color(hex: "F0ECF6")
    static let bv01_Viola = Color(hex: "D0D1E9")
    static let bv02_Prune = Color(hex: "B7BFE0")
    static let bv04_BlueBerry = Color(hex: "869ACE")
    static let bv08_BlueViolet = Color(hex: "A67EB7")
    static let bv11_SoftViolet = Color(hex: "DDD9EC")
    static let bv13_HydrangeaBlue = Color(hex: "8D93C8")
    static let bv17_DeepReddishBlue = Color(hex: "7184BC")
    static let bv20_DullLavender = Color(hex: "DAE2F3")
    static let bv23_GrayishLavender = Color(hex: "C0CBE3")
    static let bv25_GrayishViolet = Color(hex: "8585AA")
    static let bv29_Slate = Color(hex: "2A3F52")
    static let bv31_PaleLavender = Color(hex: "E5E8F5")
    static let bv34_Bluebell = Color(hex: "AFB5C8")
    
    // Copic Cool Gray
    static let c0_CoolGray = Color(hex: "EDF2F5")
    static let c00_CoolGray = Color(hex: "F0F4F7")
    static let c1_CoolGray = Color(hex: "E6EBEE")
    static let c2_CoolGray = Color(hex: "D9E1E5")
    static let c3_CoolGray = Color(hex: "CED6DB")
    static let c4_CoolGray = Color(hex: "B7C1C8")
    static let c5_CoolGray = Color(hex: "A3ADB4")
    static let c6_CoolGray = Color(hex: "8B979E")
    static let c7_CoolGray = Color(hex: "6D767C")
    static let c8_CoolGray = Color(hex: "585F64")
    static let c9_CoolGray = Color(hex: "3E4449")
    static let c10_CoolGray = Color(hex: "222327")
    
    // Copic Earth
    static let e00_SkinWhite = Color(hex: "FEF7EF")
    static let e000_PaleFruitPink = Color(hex: "FFF8F2")
    static let e0000_FloralWhite = Color(hex: "FFFCF7")
    static let e01_PinkFlamingo = Color(hex: "FEF3E9")
    static let e02_FruitPink = Color(hex: "FEF1E6")
    static let e04_NaturalLipstick = Color(hex: "EAC8CE")
    static let e07_LightMahogany = Color(hex: "D3896B")
    static let e08_Brown = Color(hex: "CE684D")
    static let e09_BurntSienna = Color(hex: "DA6744")
    static let e11_BarleyBeige = Color(hex: "FEEFDE")
    static let e13_LightSuntan = Color(hex: "EDCFB8")
    static let e15_DarkSuntan = Color(hex: "F8C28C")
    static let e17_ReddishBrass = Color(hex: "BA5C4B")
    static let e18_Copper = Color(hex: "8B4E43")
    static let e19_Redwood = Color(hex: "C44D2B")
    static let e21_BabySkinPink = Color(hex: "FDE8D0")
    static let e23_Hazelnut = Color(hex: "EED1B6")
    static let e25_CaribeCocoa = Color(hex: "DBB089")
    static let e27_Africano = Color(hex: "A27B5F")
    static let e29_BurntUmber = Color(hex: "843F2D")
    static let e30_Bisque = Color(hex: "FBF6EA")
    static let e31_BrickBeige = Color(hex: "F7ECD7")
    static let e33_Sand = Color(hex: "F5DBB8")
    static let e34_Orientale = Color(hex: "F3D5AD")
    static let e35_Chamois = Color(hex: "ECD0AD")
    static let e37_Sepia = Color(hex: "D39D57")
    static let e39_Leather = Color(hex: "C9732F")
    static let e40_BrickWhite = Color(hex: "F8F1E6")
    static let e41_PearlWhite = Color(hex: "FEF4E8")
    static let e42_SandWhite = Color(hex: "F7F1E2")
    static let e43_DullIvory = Color(hex: "F0E6C9")
    static let e44_Clay = Color(hex: "D2C7B3")
    static let e47_DarkBrown = Color(hex: "917860")
    static let e49_DarkBark = Color(hex: "6C5037")
    static let e50_EggShell = Color(hex: "F6F0F3")
    static let e51_MilkyWhite = Color(hex: "FEF0DD")
    static let e53_RawSilk = Color(hex: "F8EDCB")
    static let e55_LightCamel = Color(hex: "F5E6C1")
    static let e57_LightWalnut = Color(hex: "BC925B")
    static let e59_Walnut = Color(hex: "A4866A")
    static let e70_AshRose = Color(hex: "F4EFEC")
    static let e71_Champagne = Color(hex: "E9E0DA")
    static let e74_CocoaBrown = Color(hex: "AE9183")
    static let e77_Maroon = Color(hex: "886449")
    static let e79_Cashew = Color(hex: "4B2C1F")
    static let e81_Ivory = Color(hex: "F2EBC6")
    static let e84_Khaki = Color(hex: "B7A880")
    static let e87_Fig = Color(hex: "78664B")
    static let e89_Pecan = Color(hex: "614B34")
    static let e93_TeaRose = Color(hex: "FBD9BF")
    static let e95_FleshPink = Color(hex: "F9C37B")
    static let e97_DeepOrange = Color(hex: "ECA153")
    static let e99_BakedClay = Color(hex: "B65C22")
    
    // Copic Fluorescent
    static let fb2_FluorescentDullBlue = Color(hex: "0089CE")
    static let fbg2_FluorescentDullBlueGreen = Color(hex: "71C9E8")
    static let frv1_FluorescentPink = Color(hex: "F3A9C9")
    static let fv2_FluorescentDullViolet = Color(hex: "8471B2")
    static let fy1_FluorescentYellowOrange = Color(hex: "FFF796")
    static let fyg1_FluorescentYellow = Color(hex: "D7E3A2")
    static let fyg2_FluorescentDullYellowGreen = Color(hex: "A3CB23")
    static let fyr1_FluorescentOrange = Color(hex: "FBD39C")
    
    // Copic Green
    static let g00_JadeGreen = Color(hex: "EBF6F7")
    static let g000_PaleGreen = Color(hex: "EFF7F0")
    static let g0000_CrystalOpal = Color(hex: "F6FAF6")
    static let g02_SpectrumGreen = Color(hex: "D8EBD8")
    static let g03_MeadowGreen = Color(hex: "BEDC98")
    static let g05_EmeraldGreen = Color(hex: "6BBC6E")
    static let g07_NileGreen = Color(hex: "7FC26B")
    static let g09_VeroneseGreen = Color(hex: "7DC058")
    static let g12_SeaGreen = Color(hex: "DBEBC8")
    static let g14_AppleGreen = Color(hex: "9FCF88")
    static let g16_Malachite = Color(hex: "62BD92")
    static let g17_ForestGreen = Color(hex: "00AA74")
    static let g19_BrightParrotGreen = Color(hex: "2CB280")
    static let g20_WaxWhite = Color(hex: "F2F7E0")
    static let g21_LimeGreen = Color(hex: "CFE7D1")
    static let g24_Willow = Color(hex: "CBE3B5")
    static let g28_OceanGreen = Color(hex: "00925C")
    static let g29_PineTreeGreen = Color(hex: "207F5C")
    static let g40_DimGreen = Color(hex: "ECF4E3")
    static let g43_Pistachio = Color(hex: "DEEAA8")
    static let g46_Mistletoe = Color(hex: "5FA271")
    static let g82_SpringDimGreen = Color(hex: "D9E3C2")
    static let g85_Verdigris = Color(hex: "ACCCB0")
    static let g94_GrayishOlive = Color(hex: "A0AD83")
    static let g99_Olive = Color(hex: "6B8631")
    
    // Copic Neutral Gray
    static let n0_NeutralGray = Color(hex: "F2F2F3")
    static let n1_NeutralGray = Color(hex: "EBEBEC")
    static let n2_NeutralGray = Color(hex: "E4E4E5")
    static let n3_NeutralGray = Color(hex: "DCDDDD")
    static let n4_NeutralGray = Color(hex: "C9CACA")
    static let n5_NeutralGray = Color(hex: "B5B5B6")
    static let n6_NeutralGray = Color(hex: "9FA0A0")
    static let n7_NeutralGray = Color(hex: "7D7D7D")
    static let n8_NeutralGray = Color(hex: "666464")
    static let n9_NeutralGray = Color(hex: "4C4948")
    static let n10_NeutralGray = Color(hex: "2F2725")
    
    // Copic Red
    static let r00_PinkishWhite = Color(hex: "FEF5F0")
    static let r000_CherryWhite = Color(hex: "FEF7F2")
    static let r0000_PinkBeryl = Color(hex: "FEF7F2")
    static let r01_PinkishVanilla = Color(hex: "FCE8E1")
    static let r02_Flesh = Color(hex: "FBDACD")
    static let r05_SalmonRed = Color(hex: "F19478")
    static let r08_Vermilion = Color(hex: "EB6148")
    static let r11_PaleCherryPink = Color(hex: "FCE8DC")
    static let r12_LightTeaRose = Color(hex: "FBDAC8")
    static let r14_LightRouge = Color(hex: "F2A093")
    static let r17_LipstickOrange = Color(hex: "EF8463")
    static let r20_Blush = Color(hex: "FBDFD8")
    static let r21_Sardonyx = Color(hex: "F8C8BD")
    static let r22_LightPrawn = Color(hex: "F7BEB7")
    static let r24_Prawn = Color(hex: "EC7274")
    static let r27_CadmiumRed = Color(hex: "E94957")
    static let r29_LipstickRed = Color(hex: "E6003E")
    static let r30_PaleYellowishPink = Color(hex: "FDEAE6")
    static let r32_Peach = Color(hex: "F8C8C0")
    static let r35_Coral = Color(hex: "EC6D7F")
    static let r37_Carmine = Color(hex: "E56B70")
    static let r39_Garnet = Color(hex: "CD4479")
    static let r43_Bougainvillea = Color(hex: "EA848C")
    static let r46_StrongRed = Color(hex: "DD4660")
    static let r56_Currant = Color(hex: "D8829B")
    static let r59_Cardinal = Color(hex: "BE5072")
    static let r81_RosePink = Color(hex: "F4D2DE")
    static let r83_RoseMist = Color(hex: "EFA1BC")
    static let r85_RoseRed = Color(hex: "D66793")
    static let r89_DarkRed = Color(hex: "862740")
    
    // Copic Red Violet
    static let rv00_WaterLily = Color(hex: "F4E1EE")
    static let rv000_PalePurple = Color(hex: "F7E9F2")
    static let rv0000_EveningPrimrose = Color(hex: "F6EFF6")
    static let rv02_SugaredAlmondPink = Color(hex: "FADCE9")
    static let rv04_ShockPink = Color(hex: "F3A9C3")
    static let rv06_Cerise = Color(hex: "EE86AE")
    static let rv09_Fuchsia = Color(hex: "DF6DA6")
    static let rv10_PalePink = Color(hex: "FDF0F6")
    static let rv11_Pink = Color(hex: "FBDEE3")
    static let rv13_TenderPink = Color(hex: "F8D1DE")
    static let rv14_BegoniaPink = Color(hex: "F097B8")
    static let rv17_DeepMagenta = Color(hex: "DD7DAF")
    static let rv19_RedViolet = Color(hex: "D464A1")
    static let rv21_LightPink = Color(hex: "FDEEEE")
    static let rv23_PurePink = Color(hex: "F7C2CE")
    static let rv25_DogRoseFlower = Color(hex: "F097BE")
    static let rv29_Crimson = Color(hex: "E73D78")
    static let rv32_ShadowPink = Color(hex: "FADBD6")
    static let rv34_DarkPink = Color(hex: "F5B6B3")
    static let rv42_SalmonPink = Color(hex: "F7C2BB")
    static let rv52_CottonCandy = Color(hex: "F8D1E2")
    static let rv55_Hollyhock = Color(hex: "EBAECD")
    static let rv63_Begonia = Color(hex: "D5A4B0")
    static let rv66_Raspberry = Color(hex: "BD6982")
    static let rv69_Peony = Color(hex: "92556D")
    static let rv91_GrayishCherry = Color(hex: "EDDDE9")
    static let rv93_SmokeyPurple = Color(hex: "EABED1")
    static let rv95_BabyBlossoms = Color(hex: "BF8AA7")
    static let rv99_ArgylePurple = Color(hex: "60485A")
    
    // Copic Toner Gray
    static let t0_TonerGray = Color(hex: "F2F2F3")
    static let t1_TonerGray = Color(hex: "F1F1F0")
    static let t2_TonerGray = Color(hex: "E9EAE8")
    static let t3_TonerGray = Color(hex: "DDDCD8")
    static let t4_TonerGray = Color(hex: "C9C9C6")
    static let t5_TonerGray = Color(hex: "B5B4B0")
    static let t6_TonerGray = Color(hex: "9F9F9B")
    static let t7_TonerGray = Color(hex: "7D7C78")
    static let t8_TonerGray = Color(hex: "666460")
    static let t9_TonerGray = Color(hex: "4C4845")
    static let t10_TonerGray = Color(hex: "2F2722")
    
    // Copic Violet
    static let v000_PaleHeath = Color(hex: "EFEBF5")
    static let v0000_RoseQuartz = Color(hex: "F4F2F8")
    static let v01_Heath = Color(hex: "E9C9DF")
    static let v04_Lilac = Color(hex: "E8B2D0")
    static let v05_Marigold = Color(hex: "E6ADCD")
    static let v06_Lavender = Color(hex: "D49BC4")
    static let v09_Violet = Color(hex: "894A99")
    static let v12_PaleLilac = Color(hex: "F1DDEC")
    static let v15_Mallow = Color(hex: "DAAED0")
    static let v17_Amethyst = Color(hex: "AA96C6")
    static let v20_Wisteria = Color(hex: "E6E3F0")
    static let v22_AshLavender = Color(hex: "C1BBD7")
    static let v25_PaleBlackberry = Color(hex: "897FAF")
    static let v28_Eggplant = Color(hex: "776D94")
    static let v91_PaleGrape = Color(hex: "ECCDD8")
    static let v93_EarlyGrape = Color(hex: "E9C9E0")
    static let v95_LightGrape = Color(hex: "BC7CA6")
    static let v99_Aubergine = Color(hex: "463A4E")
    
    // Copic Warm Gray
    static let w0_WarmGray = Color(hex: "F8F7F1")
    static let w00_WarmGray = Color(hex: "F8F7F2")
    static let w1_WarmGray = Color(hex: "EFEFE9")
    static let w2_WarmGray = Color(hex: "EFEFEB")
    static let w3_WarmGray = Color(hex: "DDDCD6")
    static let w4_WarmGray = Color(hex: "C9C9C2")
    static let w5_WarmGray = Color(hex: "B5B5AF")
    static let w6_WarmGray = Color(hex: "9F9F99")
    static let w7_WarmGray = Color(hex: "7D7C77")
    static let w8_WarmGray = Color(hex: "66645F")
    static let w9_WarmGray = Color(hex: "4C4944")
    static let w10_WarmGray = Color(hex: "2F2721")
    
    // Copic Yellow
    static let y00_BariumYellow = Color(hex: "FFFDE5")
    static let y000_PaleLemon = Color(hex: "FFFEEE")
    static let y0000_YellowFluorite = Color(hex: "FFFEF7")
    static let y02_CanaryYellow = Color(hex: "FBF496")
    static let y04_Acacia = Color(hex: "F1E844")
    static let y06_Yellow = Color(hex: "FFF462")
    static let y08_AcidYellow = Color(hex: "FFF100")
    static let y11_PaleYellow = Color(hex: "FFFCD1")
    static let y13_LemonYellow = Color(hex: "FEF8B0")
    static let y15_CadmiumYellow = Color(hex: "FFEB63")
    static let y17_GoldenYellow = Color(hex: "FFE746")
    static let y18_LightningYellow = Color(hex: "FFEF47")
    static let y19_NapoliYellow = Color(hex: "FFEB27")
    static let y21_ButtercupYellow = Color(hex: "FFF2C6")
    static let y23_YellowishBeige = Color(hex: "FDEABA")
    static let y26_Mustard = Color(hex: "F5E35F")
    static let y28_LionetGold = Color(hex: "CEAF60")
    static let y32_Cashmere = Color(hex: "FAE5C7")
    static let y35_Maize = Color(hex: "FEDD73")
    static let y38_Honey = Color(hex: "FDD86C")
    
    // Copic Yellow Green
    static let yg00_MimosaYellow = Color(hex: "EBEB9E")
    static let yg0000_LilyWhite = Color(hex: "F6F9E4")
    static let yg01_GreenBice = Color(hex: "EDF2C5")
    static let yg03_YellowGreen = Color(hex: "E6EDAB")
    static let yg05_Salad = Color(hex: "DEE88E")
    static let yg06_YellowishGreen = Color(hex: "CDE18D")
    static let yg07_AcidGreen = Color(hex: "AACE36")
    static let yg09_LettuceGreen = Color(hex: "83C257")
    static let yg11_Mignonette = Color(hex: "EAF2D3")
    static let yg13_Chartreuse = Color(hex: "DAE79D")
    static let yg17_GrassGreen = Color(hex: "71BB48")
    static let yg21_Anise = Color(hex: "FBF8C2")
    static let yg23_NewLeaf = Color(hex: "ECED8D")
    static let yg25_CeladonGreen = Color(hex: "D6E272")
    static let yg41_PaleCobaltGreen = Color(hex: "DFEED8")
    static let yg45_CobaltGreen = Color(hex: "BFDFB8")
    static let yg61_PaleMoss = Color(hex: "DEECDB")
    static let yg63_PeaGreen = Color(hex: "ADD1A4")
    static let yg67_Moss = Color(hex: "8AC287")
    static let yg91_Putty = Color(hex: "E1DEB3")
    static let yg93_GrayishYellow = Color(hex: "D9D99D")
    static let yg95_PaleOlive = Color(hex: "D6D057")
    static let yg97_SpanishOlive = Color(hex: "A09900")
    static let yg99_MarineGreen = Color(hex: "596F00")
    
    // Copic Yellow Red
    static let yr00_PowderPink = Color(hex: "FBDDC4")
    static let yr000_Silk = Color(hex: "FEF0E1")
    static let yr0000_PaleChiffon = Color(hex: "FFF6EB")
    static let yr01_PeachPuff = Color(hex: "FCE1C8")
    static let yr02_LightOrange = Color(hex: "FCE3CD")
    static let yr04_ChromeOrange = Color(hex: "FBCA5E")
    static let yr07_CadmiumOrange = Color(hex: "ED6D2B")
    static let yr09_ChineseOrange = Color(hex: "EA5006")
    static let yr12_Loquat = Color(hex: "FEE7A9")
    static let yr14_Caramel = Color(hex: "FCCF3E")
    static let yr15_PumpkinYellow = Color(hex: "F5A340")
    static let yr16_Apricot = Color(hex: "FABE00")
    static let yr18_Sanguine = Color(hex: "EC682C")
    static let yr20_YellowishShade = Color(hex: "FDE8C6")
    static let yr21_Cream = Color(hex: "F7E4B6")
    static let yr23_YellowOchre = Color(hex: "F0D98F")
    static let yr24_PaleSepia = Color(hex: "F4D95B")
    static let yr27_TuscanOrange = Color(hex: "D56227")
    static let yr30_MacadamiaNut = Color(hex: "FFF6E2")
    static let yr31_LightReddishYellow = Color(hex: "FEE4AB")
    static let yr61_YellowishSkinPink = Color(hex: "FCE1CA")
    static let yr65_Atoll = Color(hex: "F7B455")
    static let yr68_Orange = Color(hex: "ED6C00")
    static let yr82_MellowPeach = Color(hex: "FACD8D")
    

}

