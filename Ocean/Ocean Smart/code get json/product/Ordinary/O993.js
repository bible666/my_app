import InsuranceData from '../../InsuranceData';
import o993Premium from '../../../json/insurance/Ordinary/O992-O996/o992-o996_premium.json'
import imagePrint from '../../../images/Insurance/print/O993_PRINT.jpg'

let o993 = Object.assign({}, InsuranceData);
o993.code = "O993" //รหัส
o993.productCode = "993"
o993.productLine = "ORD"
o993.insuranceName = "ออมคุ้มครอง 10/7" //ชื่อแบบ
o993.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o993.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o993.productType = ""//ประเภทสินค้า 

o993.pension = false //บำนาญ
o993.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o993.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o993.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o993.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o993.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o993.ageMostYear = 60 //อายุรับประกันมากสุด
o993.timeProtect = 10 //ระยะเวลาคุ้มครอง
o993.timePayment = 7 //ระยะเวลาชำระเบี้ย
o993.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o993.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o993.payment = [12] //ชำระเบี้ย
o993.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o993.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o993.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o993.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o993.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o993.discount = false
o993.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o993.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o993.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o993.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o993.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o993.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o993.refundMoney = [0,2,2,2,2,2,2,2,2,2,202] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o993.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o993.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
o993.healthCheck = true //การตรวจสุขภาพ
o993.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o993.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o993.rider = true //สัญญาเพิ่มเติม
o993.tax = 100 //อัตราลดหย่อยภาษี
o993.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o993.decimalRefund = 2 //ทศนิยม_เงินคืน
o993.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o993.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o993.insuranceImageName = imagePrint
o993.insuranceImagePrint = imagePrint 
o993.insuranceDataCV = "o993_CV"
o993.insuranceDataPremium = o993Premium
o993.DataPremiumMemory = []

o993.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o993Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o993.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o993Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o993.premium6 = function(prospect,insuranceObject){
return 0
} 

o993.premium3 = function(prospect,insuranceObject){
return 0
}

o993.premium1 = function(prospect,insuranceObject){
return 0
}

o993.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 2.5
}



export default o993