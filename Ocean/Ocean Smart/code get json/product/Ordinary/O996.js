import InsuranceData from '../../InsuranceData';
import o996Premium from '../../../json/insurance/Ordinary/O992-O996/o992-o996_premium.json'
import imagePrint from '../../../images/Insurance/print/O996_PRINT.jpg'

let o996 = Object.assign({}, InsuranceData);
o996.code = "O996" //รหัส
o996.productCode = "996"
o996.productLine = "ORD"
o996.insuranceName = "ออมคุ้มครอง 10/10" //ชื่อแบบ
o996.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o996.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o996.productType = ""//ประเภทสินค้า 

o996.pension = false //บำนาญ
o996.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o996.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o996.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o996.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o996.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o996.ageMostYear = 60 //อายุรับประกันมากสุด
o996.timeProtect = 10 //ระยะเวลาคุ้มครอง
o996.timePayment = 10 //ระยะเวลาชำระเบี้ย
o996.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o996.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o996.payment = [12] //ชำระเบี้ย
o996.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o996.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o996.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o996.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o996.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o996.discount = false
o996.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o996.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o996.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o996.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o996.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o996.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o996.refundMoney = [0,2,2,2,2,2,2,2,2,2,202] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o996.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o996.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
o996.healthCheck = true //การตรวจสุขภาพ
o996.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o996.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o996.rider = true //สัญญาเพิ่มเติม
o996.tax = 100 //อัตราลดหย่อยภาษี
o996.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o996.decimalRefund = 2 //ทศนิยม_เงินคืน
o996.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o996.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o996.insuranceImageName = imagePrint
o996.insuranceImagePrint = imagePrint 
o996.insuranceDataCV = "o996_CV"
o996.insuranceDataPremium = o996Premium
o996.DataPremiumMemory = []

o996.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o996Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o996.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o996Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o996.premium6 = function(prospect,insuranceObject){
return 0
} 

o996.premium3 = function(prospect,insuranceObject){
return 0
}

o996.premium1 = function(prospect,insuranceObject){
return 0
}


o996.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 3
}

export default o996