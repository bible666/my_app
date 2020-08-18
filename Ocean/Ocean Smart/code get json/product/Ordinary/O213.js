import InsuranceData from '../../InsuranceData';
import o213Premium from '../../../json/insurance/Ordinary/O213/o213_premium.json'
import imagePrint from '../../../images/Insurance/print/O213_PRINT.jpg'

let o213 = Object.assign({}, InsuranceData);
o213.code = "O213" //รหัส
o213.productCode = "213"
o213.productLine = "ORD"
o213.insuranceName = "ซีเนียร์ 85/85 (เพื่อผู้สูงอายุ)" //ชื่อแบบ
o213.insuranceRate = 2 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o213.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o213.productType = ""//ประเภทสินค้า 

o213.pension = false //บำนาญ
o213.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o213.ageText = "50 - 63 ปี" //อายุรับประกัน_ข้อความ
o213.ageLeastYear = 50 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o213.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o213.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o213.ageMostYear = 63 //อายุรับประกันมากสุด
o213.timeProtect = 25 //ระยะเวลาคุ้มครอง
o213.timePayment = 15 //ระยะเวลาชำระเบี้ย
o213.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o213.protectPaymentAge = true //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o213.payment = [12] //ชำระเบี้ย
o213.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o213.insuranceMoneyLeast = 50000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o213.insuranceMoneyMost = 400000 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o213.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o213.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o213.discount = false
o213.exceptPayment = false //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o213.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o213.addInsuranceMoney = 100000 //การเพิ่มจำนวนเงินเอาประกันภัย
o213.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o213.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o213.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o213.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,25,0,0,0,0,25,0,0,0,0,25,0,0,0,0,25,0,0,0,0,100] //เงินคืนระหว่างสัญญา
o213.refundMoneyText = "4 ครั้ง รวม 100%" //เงินคืนระหว่างสัญญา_ข้อความ
o213.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
o213.healthCheck = false //การตรวจสุขภาพ
o213.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o213.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o213.rider = false //สัญญาเพิ่มเติม
o213.tax = 0 //อัตราลดหย่อยภาษี
o213.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o213.decimalRefund = 2 //ทศนิยม_เงินคืน
o213.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o213.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o213.insuranceImageName = imagePrint
o213.insuranceImagePrint = imagePrint
o213.insuranceDataCV = "O213_CV"
o213.insuranceDataPremium = o213Premium
o213.DataPremiumMemory = []


o213.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o213Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o213.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o213Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o213.premium6 = function(prospect,insuranceObject){
    return 0
} 

o213.premium3 = function(prospect,insuranceObject){
    return 0
}

o213.premium1 = function(prospect,insuranceObject){
    return 0
}

o213.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 25
}

export default o213