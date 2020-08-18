import InsuranceData from '../../InsuranceData';
import oe26Premium from '../../../json/insurance/Ordinary/OE26/oe26_premium.json'
import imagePrint from '../../../images/Insurance/print/OE26_PRINT.jpg'

let oe26 = Object.assign({}, InsuranceData);
oe26.code = "OE26" //รหัส
oe26.productCode = "E26"
oe26.productLine = "ORD"
oe26.insuranceName = "โอเชี่ยนไลฟ์ คุ้มครองตลอดชีพ 95/20" //ชื่อแบบ
oe26.insuranceRate = 4.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oe26.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oe26.productType = ""//ประเภทสินค้า 

oe26.pension = false //บำนาญ
oe26.style = "Term" //แบบ (สะสมทรัพย์)
oe26.ageText = "20 - 60 ปี" //อายุรับประกัน_ข้อความ
oe26.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oe26.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oe26.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
oe26.ageMostYear = 60 //อายุรับประกันมากสุด
oe26.timeProtect = 95 //ถึงอายุ 90 //ระยะเวลาคุ้มครอง
oe26.timePayment = 20 //ระยะเวลาชำระเบี้ย
oe26.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
oe26.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oe26.payment = [12,6,3,1] //ชำระเบี้ย
oe26.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
oe26.insuranceMoneyLeast = 500000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oe26.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oe26.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oe26.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
oe26.discount = true
oe26.exceptPayment = true // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oe26.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
oe26.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oe26.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oe26.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oe26.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oe26.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
oe26.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oe26.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
oe26.healthCheck = true //การตรวจสุขภาพ
oe26.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oe26.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oe26.rider = true //สัญญาเพิ่มเติม
oe26.tax = 100 //อัตราลดหย่อยภาษี
oe26.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
oe26.decimalRefund = 0 //ทศนิยม_เงินคืน
oe26.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
oe26.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oe26.insuranceImageName = imagePrint
oe26.insuranceImagePrint = imagePrint 
oe26.insuranceDataCV = "oe26_CV"
oe26.insuranceDataPremium = oe26Premium
oe26.DataPremiumMemory = []



oe26.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oe26Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(money >= 1000000){
            return (data[0].P12_2 * money) / 1000
        }else{
            return (data[0].P12_1 * money) / 1000 
        }
    }else if(mode === 6){
        if(money >= 1000000){
            return (data[0].P6_2 * money) / 1000
        }else{
            return (data[0].P6_1 * money) / 1000 
        }
    }else if(mode === 3){
        if(money >= 1000000){
            return (data[0].P3_2 * money) / 1000
        }else{
            return (data[0].P3_1 * money) / 1000 
        }
    }else if(mode === 1){
        if(money >= 1000000){
            return (data[0].P1_2 * money) / 1000
        }else{
            return (data[0].P1_1 * money) / 1000 
        }
    }else{
        return 0 
    }
    
}

oe26.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oe26Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(money >= 1000000){
            return (data[0].P12_2 * money) / 1000
        }else{
            return (data[0].P12_1 * money) / 1000 
        }
    }else if(mode === 6){
        if(money >= 1000000){
            return (data[0].P6_2 * money) / 1000
        }else{
            return (data[0].P6_1 * money) / 1000 
        }
    }else if(mode === 3){
        if(money >= 1000000){
            return (data[0].P3_2 * money) / 1000
        }else{
            return (data[0].P3_1 * money) / 1000 
        }
    }else if(mode === 1){
        if(money >= 1000000){
            return (data[0].P1_2 * money) / 1000
        }else{
            return (data[0].P1_1 * money) / 1000 
        }
    }else{
        return 0 
    }
    
}

oe26.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe26Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 1000000){
        return (data[0].P12_2 * money) / 1000
    }else{
        return (data[0].P12_1 * money) / 1000 
    }

} 
oe26.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe26Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 1000000){
        return (data[0].P6_2 * money) / 1000
    }else{
        return (data[0].P6_1 * money) / 1000 
    }

} 
oe26.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe26Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 1000000){
        return (data[0].P3_2 * money) / 1000
    }else{
        return (data[0].P3_1 * money) / 1000 
    }

}
oe26.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe26Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 1000000){
        return (data[0].P1_2 * money) / 1000
    }else{
        return (data[0].P1_1 * money) / 1000 
    }

}

oe26.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(age >= 20 && age <= 30){
        return 30
    }else if(age >= 31 && age <= 50){
        return 25
    }else if(age >= 51 && age <= 60){
        return 10
    }else{
        return 0
    }
}



export default oe26