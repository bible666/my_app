import InsuranceData from '../../InsuranceData';
import o221Premium from '../../../json/insurance/Ordinary/O221/o221_premium.json'
import imagePrint from '../../../images/Insurance/print/O221_PRINT.jpg'

let o221 = Object.assign({}, InsuranceData);
o221.code = "O221" //รหัส
o221.productCode = "221"
o221.productLine = "ORD"
o221.insuranceName = "สบายชัวร์ (โครงการสบายชัวร์ไม่กลัวอะไรเลย)" //ชื่อแบบ
o221.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o221.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o221.productType = ""//ประเภทสินค้า 

o221.pension = false //บำนาญ
o221.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o221.ageText = "1 เดือน 1 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o221.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o221.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o221.ageLeastDay = 1  //อายุรับประกันน้อยสุดวัน
o221.ageMostYear = 60 //อายุรับประกันมากสุด
o221.timeProtect = 25 //ระยะเวลาคุ้มครอง
o221.timePayment = 15 //ระยะเวลาชำระเบี้ย
o221.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o221.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o221.payment = [1] //ชำระเบี้ย
o221.paymentText = "รายเดือนเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o221.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o221.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o221.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o221.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o221.discount = false
o221.exceptPayment = true //แถม WP //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o221.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o221.addInsuranceMoney = 100000 //การเพิ่มจำนวนเงินเอาประกันภัย
o221.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o221.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o221.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o221.refundMoney = [0,0,0,0,0,8,0,0,0,0,8,0,0,0,0,8,0,0,0,0,8,0,0,0,0,160] //เงินคืนระหว่างสัญญา
o221.refundMoneyText = "4 ครั้ง รวม 32%" //เงินคืนระหว่างสัญญา_ข้อความ
o221.refundMoneyLast = 160 // percent % //เงินคืนครบกำหนดสัญญา
o221.healthCheck = true //การตรวจสุขภาพ
o221.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o221.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o221.rider = true //สัญญาเพิ่มเติม
o221.tax = 100 //อัตราลดหย่อยภาษี
o221.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o221.decimalRefund = 2 //ทศนิยม_เงินคืน
o221.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o221.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o221.insuranceImageName = imagePrint
o221.insuranceImagePrint = imagePrint
o221.insuranceDataCV = "o221_CV"
o221.insuranceDataPremium = o221Premium
o221.DataPremiumMemory = []



o221.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o221Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return 0
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return data[0].P1
    }else{
        return 0
    }
}  

o221.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o221Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o221.premium6 = function(prospect,insuranceObject){
    return 0
} 

o221.premium3 = function(prospect,insuranceObject){
    return 0
}

o221.premium1 = function(prospect,insuranceObject){
    return 0
}

o221.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 0
}

export default o221