import InsuranceData from '../../InsuranceData';
import oe24Premium from '../../../json/insurance/Ordinary/OE24/oe24_premium.json'
import imagePrint from '../../../images/Insurance/print/OE24_PRINT.jpg'

let oe24 = Object.assign({}, InsuranceData);
oe24.code = "OE24" //รหัส
oe24.productCode = "E24"
oe24.productLine = "ORD"
oe24.insuranceName = "โอเชี่ยนไลฟ์ ชั่วระยะเวลา 10 ปี" //ชื่อแบบ
oe24.insuranceRate = 2 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oe24.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oe24.productType = "" //ประเภทสินค้า 

oe24.pension = false //บำนาญ
oe24.style = "Term" //แบบ (สะสมทรัพย์)
oe24.ageText = "20 - 50 ปี" //อายุรับประกัน_ข้อความ
oe24.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oe24.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oe24.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
oe24.ageMostYear = 50 //อายุรับประกันมากสุด
oe24.timeProtect = 10 //ระยะเวลาคุ้มครอง
oe24.timePayment = 10 //ระยะเวลาชำระเบี้ย
oe24.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
oe24.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oe24.payment = [12] //ชำระเบี้ย
oe24.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
oe24.insuranceMoneyLeast = 1500000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oe24.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oe24.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oe24.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oe24.discount = false
oe24.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oe24.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oe24.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oe24.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oe24.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oe24.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oe24.refundMoney = [] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
oe24.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oe24.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
oe24.healthCheck = true //การตรวจสุขภาพ
oe24.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oe24.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oe24.rider = true //สัญญาเพิ่มเติม
oe24.tax = 100 //อัตราลดหย่อยภาษี
oe24.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
oe24.decimalRefund = 0 //ทศนิยม_เงินคืน
oe24.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
oe24.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oe24.insuranceImageName = imagePrint
oe24.insuranceImagePrint = imagePrint 
oe24.insuranceDataCV = "OE24_CV"
oe24.insuranceDataPremium = oe24Premium
oe24.DataPremiumMemory = []


oe24.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oe24Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

oe24.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe24Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].PREM * money) / 1000

} 

oe24.premium6 = function(prospect,insuranceObject){
    return 0
} 

oe24.premium3 = function(prospect,insuranceObject){
    return 0
}

oe24.premium1 = function(prospect,insuranceObject){
    return 0
}

oe24.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 20
}


export default oe24