import InsuranceData from '../../InsuranceData';
import o198Premium from '../../../json/insurance/Ordinary/O198/o198_premium.json'
import imagePrint from '../../../images/Insurance/print/O198_PRINT.jpg'

let o198 = Object.assign({}, InsuranceData);
o198.code = "O198" //รหัส
o198.productCode = "198"
o198.productLine = "ORD"
o198.insuranceName = "ไทยสมุทรออมสบาย 10/5" //ชื่อแบบ
o198.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o198.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o198.productType = ""//ประเภทสินค้า 

o198.pension = false //บำนาญ
o198.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o198.ageText = "20 - 70 ปี" //อายุรับประกัน_ข้อความ
o198.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o198.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o198.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o198.ageMostYear = 70 //อายุรับประกันมากสุด
o198.timeProtect = 10 //ระยะเวลาคุ้มครอง
o198.timePayment = 5 //ระยะเวลาชำระเบี้ย
o198.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o198.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o198.payment = [12] //ชำระเบี้ย
o198.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o198.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o198.insuranceMoneyMost = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด
o198.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o198.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o198.discount = false
o198.exceptPayment = false // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o198.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o198.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o198.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o198.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o198.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o198.refundMoney = [0,20,20,20,20,20,20,100,100,100,140] // 9 ครั้ง รวม 420% //เงินคืนระหว่างสัญญา
o198.refundMoneyText = "9 ครั้ง รวม 420%" //เงินคืนระหว่างสัญญา_ข้อความ
o198.refundMoneyLast = 140 // percent % //เงินคืนครบกำหนดสัญญา
o198.healthCheck = false //การตรวจสุขภาพ
o198.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o198.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o198.rider = false //สัญญาเพิ่มเติม
o198.tax = 100 //อัตราลดหย่อยภาษี
o198.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o198.decimalRefund = 2 //ทศนิยม_เงินคืน
o198.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o198.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o198.insuranceImageName = imagePrint
o198.insuranceImagePrint = imagePrint 
o198.insuranceDataCV = "o198_CV"
o198.insuranceDataPremium = o198Premium
o198.DataPremiumMemory = []

o198.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o198Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return (data[0].P12 * money) / 1000
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return 0
    }else{
        return 0
    }  
}   


o198.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o198Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o198.premium6 = function(prospect,insuranceObject){
    return 0
} 

o198.premium3 = function(prospect,insuranceObject){
    return 0
}

o198.premium1 = function(prospect,insuranceObject){
    return 0
}

o198.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    
    if(money >= 30000 && money <= 99000){
        return 2
    }else if(money >= 100000){
        return 3
    }else{
        return 0
    }
}


export default o198