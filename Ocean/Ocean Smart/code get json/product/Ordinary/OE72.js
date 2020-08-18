import InsuranceData from '../../InsuranceData';
import oe72Premium from '../../../json/insurance/Ordinary/OE72/oe72_premium.json'
import imagePrint from '../../../images/Insurance/print/OE25_PRINT.jpg'

let oe72 = Object.assign({}, InsuranceData);
oe72.code = "OE72" //รหัส
oe72.productCode = "E72"
oe72.productLine = "ORD"
oe72.insuranceName = "โอเชี่ยนไลฟ์ ซูเปอร์ รีเทิร์น 10/5" //ชื่อแบบ
oe72.insuranceRate = 4.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oe72.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oe72.productType = "" //ประเภทสินค้า 

oe72.pension = false //บำนาญ
oe72.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
oe72.ageText = "30 วัน - 70 ปี" //อายุรับประกัน_ข้อความ
oe72.ageLeastYear = 0 //อายุรับประกันน้อยสุด
oe72.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oe72.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
oe72.ageMostYear = 70 //อายุรับประกันมากสุด
oe72.timeProtect = 10 //ระยะเวลาคุ้มครอง
oe72.timePayment = 5 //ระยะเวลาชำระเบี้ย
oe72.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
oe72.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oe72.payment = [12] //ชำระเบี้ย
oe72.paymentText = "รายปี" //การชำระเบี้ยประกันภัย_ข้อความ
oe72.insuranceMoneyLeast = 50000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oe72.insuranceMoneyMost = 0 //จำนวนเงินเอาประกันภัยสูงสุด
oe72.insuranceMoneyMostAge10 = 0 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oe72.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oe72.discount = false
oe72.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oe72.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oe72.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oe72.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oe72.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oe72.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oe72.refundMoney = [0,20,20,20,20,20,20,100,100,100,110] //เงินคืนระหว่างสัญญา
oe72.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oe72.refundMoneyLast = "110%" //เงินคืนครบกำหนดสัญญา
oe72.healthCheck = false //การตรวจสุขภาพ
oe72.healthCheckText = "ไม่ต้องตรวจสุขภาพ แต่ต้องแถลงคำถามสุขภาพ" //การตรวจสุขภาพ_ข้อความ
oe72.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oe72.rider = false //สัญญาเพิ่มเติม
oe72.tax = 100 //อัตราลดหย่อยภาษี
oe72.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
oe72.decimalRefund = 0 //ทศนิยม_เงินคืน
oe72.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oe72.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oe72.insuranceImageName = imagePrint
oe72.insuranceImagePrint = imagePrint 
oe72.insuranceDataCV = "OE72_CV"
oe72.insuranceDataPremium = oe72Premium
oe72.DataPremiumMemory = []


oe72.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oe72Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


oe72.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe72Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

oe72.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe72Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

oe72.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe72Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

oe72.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oe72Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

oe72.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(money >= 50000 && money < 100000){
        return 2
    }else if(money >= 100000 && money < 500000){
        return 2.5
    }else if(money >= 500000){
        return 3
    }else{
        return 0
    }
}


export default oe72