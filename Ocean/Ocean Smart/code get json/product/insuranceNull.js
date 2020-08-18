import InsuranceData from '../InsuranceData';

let insuranceNull = Object.assign({}, InsuranceData);
insuranceNull.code = "" //รหัส
insuranceNull.productCode = ""
insuranceNull.productLine = ""
insuranceNull.insuranceName = "ไม่เลือกซื้อ" //ชื่อแบบ
insuranceNull.insuranceRate =  //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
insuranceNull.type = "" //ประเภท (กรมธรรม์ประเภทสามัญ)
insuranceNull.productType = ""//ประเภทสินค้า 

insuranceNull.pension = false //บำนาญ
insuranceNull.style = "" //แบบ (สะสมทรัพย์)
insuranceNull.ageText = "" //อายุรับประกัน_ข้อความ
insuranceNull.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
insuranceNull.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
insuranceNull.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
insuranceNull.ageMostYear = 0 //อายุรับประกันมากสุด
insuranceNull.timeProtect = 0 //ระยะเวลาคุ้มครอง
insuranceNull.timePayment = 0//ระยะเวลาชำระเบี้ย
insuranceNull.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
insuranceNull.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
insuranceNull.payment = [] //ชำระเบี้ย
insuranceNull.paymentText = "" //การชำระเบี้ยประกันภัย_ข้อความ
insuranceNull.insuranceMoneyLeast = 0 //จำนวนเงินเอาประกันภัยขั้นต่ำ
insuranceNull.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
insuranceNull.insuranceMoneyMostAge10 = 0 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
insuranceNull.discount = "" //ส่วนลดเบี้ยประกันภัย
insuranceNull.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
insuranceNull.exceptPaymentText = "" //การยกเว้นชำระเบี้ย_ข้อความ
insuranceNull.addInsuranceMoney = 0 //การเพิ่มจำนวนเงินเอาประกันภัย
insuranceNull.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
insuranceNull.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
insuranceNull.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
insuranceNull.refundMoney = [] //เงินคืนระหว่างสัญญา
insuranceNull.refundMoneyText = "" //เงินคืนระหว่างสัญญา_ข้อความ
insuranceNull.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
insuranceNull.healthCheck = false //การตรวจสุขภาพ
insuranceNull.healthCheckText = "0" //การตรวจสุขภาพ_ข้อความ
insuranceNull.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
insuranceNull.rider = false //สัญญาเพิ่มเติม
insuranceNull.tax = 0 //อัตราลดหย่อยภาษี
insuranceNull.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
insuranceNull.decimalRefund = 0 //ทศนิยม_เงินคืน
insuranceNull.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
insuranceNull.decimalPension = 0 //ทศนิยม_เงินบำนาญ
insuranceNull.insuranceImageName = ""
insuranceNull.insuranceImagePrint = "" 
insuranceNull.insuranceDataCV = ""
insuranceNull.insuranceDataPremium = null
insuranceNull.DataPremiumMemory = []
insuranceNull.mprem = function(prospect,insuranceObject){
    return 0
}
insuranceNull.premium12 = function(prospect,insuranceObject){
    return 0
} 
insuranceNull.premium6 = function(prospect,insuranceObject){
    return 0
} 
insuranceNull.premium3 = function(prospect,insuranceObject){
    return 0
}
insuranceNull.premium1 = function(prospect,insuranceObject){
    return 0
}


export default insuranceNull