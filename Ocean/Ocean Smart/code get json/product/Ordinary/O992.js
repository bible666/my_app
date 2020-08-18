import InsuranceData from '../../InsuranceData';
import o992Premium from '../../../json/insurance/Ordinary/O992-O996/o992-o996_premium.json'
import imagePrint from '../../../images/Insurance/print/O992_PRINT.jpg'

let o992 = Object.assign({}, InsuranceData);
o992.code = "O992" //รหัส
o992.productCode = "992"
o992.productLine = "ORD"
o992.insuranceName = "ออมคุ้มครอง 10/6" //ชื่อแบบ
o992.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o992.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o992.productType = ""//ประเภทสินค้า 

o992.pension = false //บำนาญ
o992.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o992.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o992.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o992.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o992.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o992.ageMostYear = 60 //อายุรับประกันมากสุด
o992.timeProtect = 10 //ระยะเวลาคุ้มครอง
o992.timePayment = 6 //ระยะเวลาชำระเบี้ย
o992.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o992.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o992.payment = [12] //ชำระเบี้ย
o992.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o992.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o992.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o992.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o992.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o992.discount = false
o992.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o992.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o992.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o992.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o992.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o992.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o992.refundMoney = [0,2,2,2,2,2,2,2,2,2,202] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o992.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o992.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
o992.healthCheck = true //การตรวจสุขภาพ
o992.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o992.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o992.rider = true //สัญญาเพิ่มเติม
o992.tax = 100 //อัตราลดหย่อยภาษี
o992.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o992.decimalRefund = 2 //ทศนิยม_เงินคืน
o992.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o992.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o992.insuranceImageName = imagePrint
o992.insuranceImagePrint = imagePrint 
o992.insuranceDataCV = "o992_CV"
o992.insuranceDataPremium = o992Premium
o992.DataPremiumMemory = []

o992.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o992Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o992.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o992Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o992.premium6 = function(prospect,insuranceObject){
return 0
} 

o992.premium3 = function(prospect,insuranceObject){
return 0
}

o992.premium1 = function(prospect,insuranceObject){
return 0
}

o992.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 2.5
}



export default o992