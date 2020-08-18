import InsuranceData from '../../InsuranceData';
import oe25Premium from '../../../json/insurance/Ordinary/OE25/oe25_premium.json'
import imagePrint from '../../../images/Insurance/print/OE25_PRINT.jpg'

let oe25 = Object.assign({}, InsuranceData);
oe25.code = "OE25" //รหัส
oe25.productCode = "E25"
oe25.productLine = "ORD"
oe25.insuranceName = "โอเชี่ยนไลฟ์ ชั่วระยะเวลา 15 ปี" //ชื่อแบบ
oe25.insuranceRate = 2 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oe25.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oe25.productType = ""//ประเภทสินค้า 

oe25.pension = false //บำนาญ
oe25.style = "Term" //แบบ (สะสมทรัพย์)
oe25.ageText = "20 - 50 ปี" //อายุรับประกัน_ข้อความ
oe25.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oe25.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oe25.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
oe25.ageMostYear = 50 //อายุรับประกันมากสุด
oe25.timeProtect = 15 //ระยะเวลาคุ้มครอง
oe25.timePayment = 15 //ระยะเวลาชำระเบี้ย
oe25.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
oe25.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oe25.payment = [12] //ชำระเบี้ย
oe25.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
oe25.insuranceMoneyLeast = 1500000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oe25.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oe25.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oe25.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oe25.discount = false
oe25.exceptPayment = false // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oe25.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oe25.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oe25.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oe25.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oe25.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oe25.refundMoney = [] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
oe25.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oe25.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
oe25.healthCheck = true //การตรวจสุขภาพ
oe25.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oe25.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oe25.rider = true //สัญญาเพิ่มเติม
oe25.tax = 100 //อัตราลดหย่อยภาษี
oe25.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
oe25.decimalRefund = 0 //ทศนิยม_เงินคืน
oe25.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
oe25.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oe25.insuranceImageName = imagePrint
oe25.insuranceImagePrint = imagePrint 
oe25.insuranceDataCV = "OE25_CV"
oe25.insuranceDataPremium = oe25Premium
oe25.DataPremiumMemory = []

oe25.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oe25Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return (data[0].PREM * money) / 1000
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

oe25.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe25Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].PREM * money) / 1000

} 

oe25.premium6 = function(prospect,insuranceObject){
    return 0
} 

oe25.premium3 = function(prospect,insuranceObject){
    return 0
}

oe25.premium1 = function(prospect,insuranceObject){
    return 0
}


oe25.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 30
}


export default oe25