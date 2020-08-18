import InsuranceData from '../../InsuranceData';
import oe58Premium from '../../../json/insurance/Ordinary/OE58/oe58_premium.json'
import imagePrint from '../../../images/Insurance/print/OE58_PRINT.jpg'

let oe58 = Object.assign({}, InsuranceData);
oe58.code = "OE58" //รหัส
oe58.productCode = "E58"
oe58.productLine = "ORD"
oe58.insuranceName = "โอเชี่ยนไลฟ์ เซฟรับทรัพย์ 15/8" //ชื่อแบบ
oe58.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oe58.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oe58.productType = "" //ประเภทสินค้า 

oe58.pension = false //บำนาญ
oe58.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
oe58.ageText = "30 วัน - 70 ปี" //อายุรับประกัน_ข้อความ
oe58.ageLeastYear = 0// 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oe58.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oe58.ageLeastDay = 30   //อายุรับประกันน้อยสุดวัน
oe58.ageMostYear = 70 //อายุรับประกันมากสุด
oe58.timeProtect = 15 //ระยะเวลาคุ้มครอง
oe58.timePayment = 8 //ระยะเวลาชำระเบี้ย
oe58.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
oe58.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oe58.payment = [12,6,3,1] //ชำระเบี้ย
oe58.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
oe58.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oe58.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oe58.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oe58.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oe58.discount = false
oe58.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oe58.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oe58.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oe58.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oe58.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oe58.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oe58.refundMoney = [0,10,10,10,10,10,10,10,10,12,12,12,12,12,12,800] //เงินคืนระหว่างสัญญา
oe58.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oe58.refundMoneyLast = 800 // percent % //เงินคืนครบกำหนดสัญญา
oe58.healthCheck = false //การตรวจสุขภาพ
oe58.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
oe58.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oe58.rider = false //สัญญาเพิ่มเติม
oe58.tax = 100 //อัตราลดหย่อยภาษี
oe58.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
oe58.decimalRefund = 2 //ทศนิยม_เงินคืน
oe58.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oe58.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oe58.insuranceImageName = imagePrint
oe58.insuranceImagePrint = imagePrint 
oe58.insuranceDataCV = "OE58_CV"
oe58.insuranceDataPremium = oe58Premium
oe58.DataPremiumMemory = []



oe58.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oe58Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

oe58.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe58Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

oe58.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe58Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

oe58.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe58Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

oe58.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe58Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

oe58.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(money >= 30000 && money < 50000){
        if(age <= 50)

        {
            return 6
        }else{
            return 3
        }
    }else if(money >= 50000){
        if(age <= 50){
            return 8
        }else{
            return 5
        }
    }else{
        return 0
    }
}


export default oe58