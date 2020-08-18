import InsuranceData from '../../InsuranceData';
import o193Premium from '../../../json/insurance/Ordinary/O193/o193_premium.json'
import imagePrint from '../../../images/Insurance/print/O193_PRINT.jpg'

let o193 = Object.assign({}, InsuranceData);
o193.code = "O193" //รหัส
o193.productCode = "193"
o193.productLine = "ORD"
o193.insuranceName = "ไทยสมุทรพูนผล (15/9)" //ชื่อแบบ
o193.insuranceRate = 4.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o193.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o193.productType = ""//ประเภทสินค้า 

o193.pension = false //บำนาญ
o193.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o193.ageText = "1 เดือน 1 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o193.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o193.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o193.ageLeastDay = 1  //อายุรับประกันน้อยสุดวัน
o193.ageMostYear = 60 //อายุรับประกันมากสุด
o193.timeProtect = 15 //ระยะเวลาคุ้มครอง
o193.timePayment = 9 //ระยะเวลาชำระเบี้ย
o193.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o193.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o193.payment = [12,6,3,1] //ชำระเบี้ย
o193.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o193.insuranceMoneyLeast = 50000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o193.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o193.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o193.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o193.discount = false
o193.exceptPayment = false //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o193.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o193.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o193.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o193.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o193.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o193.refundMoney = [0,0,6,0,6,0,6,0,7,0,7,0,7,0,12,175] //7 ครั้ง รวม 51% //เงินคืนระหว่างสัญญา
o193.refundMoneyText = "7 ครั้ง รวม 51%" //เงินคืนระหว่างสัญญา_ข้อความ
o193.refundMoneyLast = 175 // percent % //เงินคืนครบกำหนดสัญญา
o193.healthCheck = true //การตรวจสุขภาพ
o193.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o193.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o193.rider = true //สัญญาเพิ่มเติม
o193.tax = 100 //อัตราลดหย่อยภาษี
o193.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o193.decimalRefund = 2 //ทศนิยม_เงินคืน
o193.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o193.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o193.insuranceImageName = imagePrint
o193.insuranceImagePrint = imagePrint 
o193.insuranceDataCV = "O193_CV"
o193.insuranceDataPremium = o193Premium
o193.DataPremiumMemory = []


o193.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o193Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o193.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o193Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o193.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o193Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o193.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o193Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o193.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o193Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o193.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 50000 && money <= 99999){
        return 10
    }else if(money >= 100000 && money <= 199999){
        return 14
    }else if(money >= 200000 && money <= 499999){
        return 16
    }else if(money >= 500000){
        return 18
    }else{
        return 0
    }

}

export default o193