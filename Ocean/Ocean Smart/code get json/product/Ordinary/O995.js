import InsuranceData from '../../InsuranceData';
import o995Premium from '../../../json/insurance/Ordinary/O992-O996/o992-o996_premium.json'
import imagePrint from '../../../images/Insurance/print/O995_PRINT.jpg'

let o995 = Object.assign({}, InsuranceData);
o995.code = "O995" //รหัส
o995.productCode = "995"
o995.productLine = "ORD"
o995.insuranceName = "ออมคุ้มครอง 10/9" //ชื่อแบบ
o995.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o995.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o995.productType = ""//ประเภทสินค้า 

o995.pension = false //บำนาญ
o995.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o995.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o995.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o995.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o995.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o995.ageMostYear = 60 //อายุรับประกันมากสุด
o995.timeProtect = 10 //ระยะเวลาคุ้มครอง
o995.timePayment = 9 //ระยะเวลาชำระเบี้ย
o995.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o995.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o995.payment = [12] //ชำระเบี้ย
o995.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o995.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o995.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o995.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o995.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o995.discount = false
o995.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o995.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o995.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o995.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o995.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o995.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o995.refundMoney = [0,2,2,2,2,2,2,2,2,2,202] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o995.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o995.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
o995.healthCheck = true //การตรวจสุขภาพ
o995.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o995.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o995.rider = true //สัญญาเพิ่มเติม
o995.tax = 100 //อัตราลดหย่อยภาษี
o995.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o995.decimalRefund = 2 //ทศนิยม_เงินคืน
o995.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o995.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o995.insuranceImageName = imagePrint
o995.insuranceImagePrint = imagePrint 
o995.insuranceDataCV = "o995_CV"
o995.insuranceDataPremium = o995Premium
o995.DataPremiumMemory = []

o995.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o995Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o995.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o995Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o995.premium6 = function(prospect,insuranceObject){
return 0
} 

o995.premium3 = function(prospect,insuranceObject){
return 0
}

o995.premium1 = function(prospect,insuranceObject){
return 0
}

o995.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 3
}


export default o995