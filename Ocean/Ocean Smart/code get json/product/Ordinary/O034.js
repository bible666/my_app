import InsuranceData from '../../InsuranceData';
import o034Premium from '../../../json/insurance/Ordinary/O034/o034_premium.json'
import imagePrint from '../../../images/Insurance/print/O034_PRINT.jpg'

let o034 = Object.assign({}, InsuranceData);
o034.code = "O034" //รหัส
o034.productCode = "034"
o034.productLine = "ORD"
o034.insuranceName = "เซฟรับทรัพย์ คุ้มกระจาย" //ชื่อแบบ
o034.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o034.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o034.productType = ""//ประเภทสินค้า 

o034.pension = false //บำนาญ
o034.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o034.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o034.ageLeastYear = 0.0833 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o034.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o034.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o034.ageMostYear = 60 //อายุรับประกันมากสุด
o034.timeProtect = 15 //ระยะเวลาคุ้มครอง
o034.timePayment = 8//ระยะเวลาชำระเบี้ย
o034.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o034.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o034.payment = [12,6,3,1] //ชำระเบี้ย
o034.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o034.insuranceMoneyLeast = 50000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o034.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o034.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o034.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o034.discount = false //ส่วนลดพิเศษ
o034.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o034.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o034.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o034.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o034.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o034.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o034.refundMoney = [0,10,10,10,10,10,10,10,10,12,12,12,12,12,12,800] //เงินคืนระหว่างสัญญา
o034.refundMoneyText = "14 ครั้ง รวม 152%" //เงินคืนระหว่างสัญญา_ข้อความ
o034.refundMoneyLast = 800 // percent % //เงินคืนครบกำหนดสัญญา
o034.healthCheck = false //การตรวจสุขภาพ
o034.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o034.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o034.rider = false //สัญญาเพิ่มเติม
o034.tax = 100 //อัตราลดหย่อยภาษี
o034.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o034.decimalRefund = 2 //ทศนิยม_เงินคืน
o034.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o034.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o034.insuranceImageName = imagePrint
o034.insuranceImagePrint = imagePrint 
o034.insuranceDataCV = "o034_CV"
o034.insuranceDataPremium = o034Premium
o034.DataPremiumMemory = []


o034.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o034Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return (data[0].P12 * money) / 1000
    }else if(mode === 6){
        return (data[0].P6 * money) / 1000
    }else if(mode === 3){
        return (data[0].P3 * money) / 1000
    }else if(mode === 1){
        return (data[0].P1 * money) / 1000
    }else{
        return 0 
    }
    
}



o034.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o034Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 
o034.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o034Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000

} 
o034.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o034Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000

}
o034.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o034Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000

}

o034.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(age >= 0 && age <= 50){
        return 8
    }else if(age >= 51 && age <= 65){
        return 5
    }else{
        return 0
    }
}

export default o034