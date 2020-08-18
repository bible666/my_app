import InsuranceData from '../../InsuranceData';
import oa39Premium from '../../../json/insurance/Ordinary/OA39/oa39_premium.json'
import imagePrint from '../../../images/Insurance/print/OA39_PRINT.jpg'

let oa39 = Object.assign({}, InsuranceData);
oa39.code = "OA39" //รหัส
oa39.productCode = "A39"
oa39.productLine = "ORD"
oa39.insuranceName = "โอเชี่ยนไลฟ์ คุ้มครองตลอดชีพ 99/2" //ชื่อแบบ
oa39.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oa39.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oa39.productType = ""//ประเภทสินค้า 

oa39.pension = false //บำนาญ
oa39.style = "ตลอดชีพ" //แบบ (สะสมทรัพย์)
oa39.ageText = "30 วัน - 70 ปี" //อายุรับประกัน_ข้อความ
oa39.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oa39.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oa39.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
oa39.ageMostYear = 70 //อายุรับประกันมากสุด
oa39.timeProtect = 99 //ถึงอายุ 90 //ระยะเวลาคุ้มครอง
oa39.timePayment = 2 //ระยะเวลาชำระเบี้ย
oa39.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
oa39.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oa39.payment = [12,6,3,1] //ชำระเบี้ย
oa39.paymentText = "รายปี หรือ รายงวด 6, 3, 1  เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
oa39.insuranceMoneyLeast = 150000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oa39.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oa39.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oa39.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oa39.discount = false
oa39.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oa39.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
oa39.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oa39.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oa39.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oa39.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oa39.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
oa39.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oa39.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
oa39.healthCheck = true //การตรวจสุขภาพ
oa39.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oa39.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oa39.rider = true //สัญญาเพิ่มเติม
oa39.tax = 100 //อัตราลดหย่อยภาษี
oa39.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
oa39.decimalRefund = 0 //ทศนิยม_เงินคืน
oa39.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oa39.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oa39.insuranceImageName = imagePrint
oa39.insuranceImagePrint = imagePrint 
oa39.insuranceDataCV = "oa39_CV"
oa39.insuranceDataPremium = oa39Premium
oa39.DataPremiumMemory = []


oa39.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oa39Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


oa39.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa39Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

oa39.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa39Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

oa39.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa39Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

oa39.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa39Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}
    
oa39.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 4
}



export default oa39