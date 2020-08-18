import InsuranceData from '../../InsuranceData';
import o539Premium from '../../../json/insurance/Ordinary/O539/o539_premium.json'
import imagePrint from '../../../images/Insurance/print/O539_PRINT.jpg'

let o539 = Object.assign({}, InsuranceData);
o539.code = "O539" //รหัส
o539.productCode = "539"
o539.productLine = "ORD"
o539.insuranceName = "เพื่อนคู่ชีวิต B450 (20/15)" //ชื่อแบบ
o539.insuranceRate = 4.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o539.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o539.productType = "" //ประเภทสินค้า 

o539.pension = false //บำนาญ
o539.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o539.ageText = "15 - 70 ปี" //อายุรับประกัน_ข้อความ
o539.ageLeastYear = 15 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o539.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o539.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o539.ageMostYear = 70 //อายุรับประกันมากสุด
o539.timeProtect = 20 //ระยะเวลาคุ้มครอง
o539.timePayment = 15 //ระยะเวลาชำระเบี้ย
o539.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o539.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o539.payment = [12,6,3,1] //ชำระเบี้ย
o539.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o539.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o539.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o539.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o539.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o539.discount = false
o539.exceptPayment = true //การยกเว้นชำระเบี้ยประกันภัย
o539.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o539.addInsuranceMoney = 10000 //การเพิ่มจำนวนเงินเอาประกันภัย
o539.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o539.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o539.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o539.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //เงินคืนระหว่างสัญญา
o539.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
o539.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
o539.healthCheck = true //การตรวจสุขภาพ
o539.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o539.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o539.rider = true //สัญญาเพิ่มเติม
o539.tax = 100 //อัตราลดหย่อยภาษี
o539.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o539.decimalRefund = 0 //ทศนิยม_เงินคืน
o539.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o539.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o539.insuranceImageName = imagePrint
o539.insuranceImagePrint = imagePrint
o539.insuranceDataCV = "o539_CV"
o539.insuranceDataPremium = o539Premium
o539.DataPremiumMemory = []


o539.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o539Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o539.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o539Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o539.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o539Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o539.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o539Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o539.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o539Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o539.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 100000 && money <= 190000){
        return 20
    }else if(money >= 200000 && money <= 490000){
        return 30
    }else if(money >= 500000){
        return 35
    }else{
        return 0
    }

}

export default o539