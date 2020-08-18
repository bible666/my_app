import InsuranceData from '../../InsuranceData';
import oe61Premium from '../../../json/insurance/Ordinary/OE61/oe61_premium.json'
import imagePrint from '../../../images/Insurance/print/OE61_PRINT.jpg'

let oe61 = Object.assign({}, InsuranceData);
oe61.code = "OE61" //รหัส
oe61.productCode = "E61"
oe61.productLine = "ORD"
oe61.insuranceName = "โอเชี่ยนไลฟ์ ซุปเปอร์ เฮลท์แคร์ 90/10" //ชื่อแบบ
oe61.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oe61.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oe61.productType = "" //ประเภทสินค้า 

oe61.pension = false //บำนาญ
oe61.style = "ตลอดชีพ" //แบบ (สะสมทรัพย์)
oe61.ageText = "6 - 50 ปี" //อายุรับประกัน_ข้อความ
oe61.ageLeastYear = 6 //อายุรับประกันน้อยสุด
oe61.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oe61.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
oe61.ageMostYear = 50 //อายุรับประกันมากสุด
oe61.timeProtect = 90 //ระยะเวลาคุ้มครอง
oe61.timePayment = 10 //ระยะเวลาชำระเบี้ย
oe61.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
oe61.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oe61.payment = [12,6,3,1] //ชำระเบี้ย
oe61.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
oe61.insuranceMoneyLeast = 200000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oe61.insuranceMoneyMost = 5000000 //จำนวนเงินเอาประกันภัยสูงสุด
oe61.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oe61.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
oe61.discount = true
oe61.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oe61.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oe61.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oe61.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oe61.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oe61.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oe61.refundMoney = [] //เงินคืนระหว่างสัญญา
oe61.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oe61.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
oe61.healthCheck = true //การตรวจสุขภาพ
oe61.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oe61.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oe61.rider = false //สัญญาเพิ่มเติม
oe61.tax = 100 //อัตราลดหย่อยภาษี
oe61.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
oe61.decimalRefund = 2 //ทศนิยม_เงินคืน
oe61.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oe61.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oe61.insuranceImageName = imagePrint
oe61.insuranceImagePrint = imagePrint 
oe61.insuranceDataCV = "oe61_CV"
oe61.insuranceDataPremium = oe61Premium
oe61.DataPremiumMemory = []


oe61.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 25
}

export default oe61