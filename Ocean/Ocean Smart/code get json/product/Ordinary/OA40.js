import InsuranceData from '../../InsuranceData';
import oa40Premium from '../../../json/insurance/Ordinary/OA40/oa40_premium.json'
import imagePrint from '../../../images/Insurance/print/OA40_PRINT.jpg'

let oa40 = Object.assign({}, InsuranceData);
oa40.code = "OA40" //รหัส
oa40.productCode = "A40"
oa40.productLine = "ORD"
oa40.insuranceName = "โอเชี่ยนไลฟ์ คุ้มครองตลอดชีพ 99/5" //ชื่อแบบ
oa40.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oa40.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oa40.productType = ""//ประเภทสินค้า 

oa40.pension = false //บำนาญ
oa40.style = "ตลอดชีพ" //แบบ (สะสมทรัพย์)
oa40.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
oa40.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oa40.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oa40.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
oa40.ageMostYear = 65 //อายุรับประกันมากสุด
oa40.timeProtect = 99 //ถึงอายุ 90 //ระยะเวลาคุ้มครอง
oa40.timePayment = 5 //ระยะเวลาชำระเบี้ย
oa40.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
oa40.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oa40.payment = [12,6,3,1] //ชำระเบี้ย
oa40.paymentText = "รายปี หรือ รายงวด 6, 3, 1  เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
oa40.insuranceMoneyLeast = 150000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oa40.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oa40.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oa40.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oa40.discount = false
oa40.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oa40.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
oa40.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oa40.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oa40.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oa40.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oa40.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
oa40.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oa40.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
oa40.healthCheck = true //การตรวจสุขภาพ
oa40.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oa40.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oa40.rider = true //สัญญาเพิ่มเติม
oa40.tax = 100 //อัตราลดหย่อยภาษี
oa40.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
oa40.decimalRefund = 0 //ทศนิยม_เงินคืน
oa40.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oa40.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oa40.insuranceImageName = imagePrint
oa40.insuranceImagePrint = imagePrint 
oa40.insuranceDataCV = "oa40_CV"
oa40.insuranceDataPremium = oa40Premium
oa40.DataPremiumMemory = []


oa40.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oa40Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


oa40.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa40Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

oa40.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa40Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

oa40.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa40Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

oa40.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa40Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}


oa40.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    
    if(money >= 150000 && money <= 499999){
        return 10
    }else if(money >= 500000) {
        return 15
    }else{
        return 0
    }
}


export default oa40