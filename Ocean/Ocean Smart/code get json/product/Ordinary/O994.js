import InsuranceData from '../../InsuranceData';
import o994Premium from '../../../json/insurance/Ordinary/O992-O996/o992-o996_premium.json'
import imagePrint from '../../../images/Insurance/print/O994_PRINT.jpg'

let o994 = Object.assign({}, InsuranceData);
o994.code = "O994" //รหัส
o994.productCode = "994"
o994.productLine = "ORD"
o994.insuranceName = "ออมคุ้มครอง 10/8" //ชื่อแบบ
o994.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o994.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o994.productType = ""//ประเภทสินค้า 

o994.pension = false //บำนาญ
o994.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o994.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o994.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o994.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o994.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o994.ageMostYear = 60 //อายุรับประกันมากสุด
o994.timeProtect = 10 //ระยะเวลาคุ้มครอง
o994.timePayment = 8 //ระยะเวลาชำระเบี้ย
o994.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o994.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o994.payment = [12] //ชำระเบี้ย
o994.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o994.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o994.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o994.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o994.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o994.discount = false
o994.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o994.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o994.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o994.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o994.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o994.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o994.refundMoney = [0,2,2,2,2,2,2,2,2,2,202] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o994.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o994.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
o994.healthCheck = true //การตรวจสุขภาพ
o994.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o994.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o994.rider = true //สัญญาเพิ่มเติม
o994.tax = 100 //อัตราลดหย่อยภาษี
o994.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o994.decimalRefund = 2 //ทศนิยม_เงินคืน
o994.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o994.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o994.insuranceImageName = imagePrint
o994.insuranceImagePrint = imagePrint 
o994.insuranceDataCV = "o994_CV"
o994.insuranceDataPremium = o994Premium
o994.DataPremiumMemory = []


o994.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o994Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o994.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o994Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o994.premium6 = function(prospect,insuranceObject){
return 0
} 

o994.premium3 = function(prospect,insuranceObject){
return 0
}

o994.premium1 = function(prospect,insuranceObject){
return 0
}

o994.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 2.5
}


export default o994