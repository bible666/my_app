import InsuranceData from '../../InsuranceData';
import o130Premium from '../../../json/insurance/Ordinary/O130/o130_premium.json'
import imagePrint from '../../../images/Insurance/print/O130_PRINT.jpg'

let o130 = Object.assign({}, InsuranceData);
o130.code = "O130" //รหัส
o130.productCode = "130"
o130.productLine = "ORD"
o130.insuranceName = "ไทยสมุทร เซฟดั่งใจ 12/6" //ชื่อแบบ
o130.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o130.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o130.productType = ""//ประเภทสินค้า 

o130.pension = false //บำนาญ
o130.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o130.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o130.ageLeastYear = 0 //อายุรับประกันน้อยสุด
o130.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o130.ageLeastDay = 1  //อายุรับประกันน้อยสุดวัน
o130.ageMostYear = 65 //อายุรับประกันมากสุด
o130.timeProtect = 12 //ระยะเวลาคุ้มครอง
o130.timePayment = 12//ระยะเวลาชำระเบี้ย
o130.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o130.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o130.payment = [12,6,3,1] //ชำระเบี้ย
o130.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o130.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o130.insuranceMoneyMost = 0 //จำนวนเงินเอาประกันภัยสูงสุด
o130.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o130.discountText = "มีส่วนลด(ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
o130.discount = true
o130.exceptPayment = false //การยกเว้นชำระเบี้ยประกันภัย
o130.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o130.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o130.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o130.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o130.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o130.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,690] //เงินคืนระหว่างสัญญา
o130.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
o130.refundMoneyLast = 690 // percent % //เงินคืนครบกำหนดสัญญา
o130.healthCheck = false //การตรวจสุขภาพ
o130.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o130.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o130.rider = false //สัญญาเพิ่มเติม
o130.tax = 100 //อัตราลดหย่อยภาษี
o130.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o130.decimalRefund = 0 //ทศนิยม_เงินคืน
o130.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o130.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o130.insuranceImageName = imagePrint
o130.insuranceImagePrint = imagePrint 
o130.insuranceDataCV = "o130_CV"
o130.insuranceDataPremium = o130Premium
o130.DataPremiumMemory = []

o130.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o130Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(money >= 50000){
            return (data[0].P12_2 * money) / 1000
        }else{
            return (data[0].P12_1 * money) / 1000 
        }
    }else if(mode === 6){
        if(money >= 50000){
            return (data[0].P6_2 * money) / 1000
        }else{
            return (data[0].P6_1 * money) / 1000 
        }
    }else if(mode === 3){
        if(money >= 50000){
            return (data[0].P3_2 * money) / 1000
        }else{
            return (data[0].P3_1 * money) / 1000 
        }
    }else if(mode === 1){
        if(money >= 50000){
            return (data[0].P1_2 * money) / 1000
        }else{
            return (data[0].P1_1 * money) / 1000 
        }
    }else{
        return 0 
    }
    
}

o130.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o130Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(money >= 50000){
            return (data[0].P12_2 * money) / 1000
        }else{
            return (data[0].P12_1 * money) / 1000 
        }
    }else if(mode === 6){
        if(money >= 50000){
            return (data[0].P6_2 * money) / 1000
        }else{
            return (data[0].P6_1 * money) / 1000 
        }
    }else if(mode === 3){
        if(money >= 50000){
            return (data[0].P3_2 * money) / 1000
        }else{
            return (data[0].P3_1 * money) / 1000 
        }
    }else if(mode === 1){
        if(money >= 50000){
            return (data[0].P1_2 * money) / 1000
        }else{
            return (data[0].P1_1 * money) / 1000 
        }
    }else{
        return 0 
    }
    
}

o130.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o130Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 50000){
        return (data[0].P12_2 * money) / 1000
    }else{
        return (data[0].P12_1 * money) / 1000 
    }

} 
o130.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o130Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 50000){
        return (data[0].P6_2 * money) / 1000
    }else{
        return (data[0].P6_1 * money) / 1000 
    }

} 
o130.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o130Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 50000){
        return (data[0].P3_2 * money) / 1000
    }else{
        return (data[0].P3_1 * money) / 1000 
    }

}
o130.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o130Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 50000){
        return (data[0].P1_2 * money) / 1000
    }else{
        return (data[0].P1_1 * money) / 1000 
    }

}


o130.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(age >= 0 && age <= 50){
        return 5
    }else if(age >= 51 && age <= 65){
        return 3
    }else{
        return 0
    }
    
}

export default o130