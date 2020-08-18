import InsuranceData from '../../InsuranceData';
import o147Premium from '../../../json/insurance/Ordinary/O147/o147_premium.json'
import imagePrint from '../../../images/Insurance/print/O147_PRINT.jpg'

let o147 = Object.assign({}, InsuranceData);
o147.code = "O147" //รหัส
o147.productCode = "147"
o147.productLine = "ORD"
o147.insuranceName = "ซีเนียร์ แฮปปี้ 2 (เพื่อผู้สูงอายุ)" //ชื่อแบบ
o147.insuranceRate = 2 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o147.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o147.productType = ""//ประเภทสินค้า 

o147.pension = false //บำนาญ
o147.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o147.ageText = "50 - 75 ปี" //อายุรับประกัน_ข้อความ
o147.ageLeastYear = 50 //อายุรับประกันน้อยสุด
o147.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o147.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o147.ageMostYear = 75 //อายุรับประกันมากสุด
o147.timeProtect = 85 // ถึงอายุครบ 85 ปี //ระยะเวลาคุ้มครอง
o147.timePayment = 85 // ถึงอายุ 85 ปี //ระยะเวลาชำระเบี้ย
o147.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o147.protectPaymentAge = true //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o147.payment = [12] //ชำระเบี้ย
o147.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o147.insuranceMoneyLeast = 50000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o147.insuranceMoneyMost = 500000 //จำนวนเงินเอาประกันภัยสูงสุด
o147.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o147.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o147.discount = false
o147.exceptPayment = false //การยกเว้นชำระเบี้ยประกันภัย
o147.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o147.addInsuranceMoney = 10000 //การเพิ่มจำนวนเงินเอาประกันภัย
o147.mpremMonthLeast = 0 //ไม่มี //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o147.mpremMonthMost = 0 //ไม่มี //เบี้ยประกัยภัยรายเดือนสูงสุด
o147.addMpremMonth = 0 //ไม่มี //การเพิ่มเบี้ยประกันภัยรายเดือน
o147.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืน //เงินคืนระหว่างสัญญา
o147.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
o147.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
o147.healthCheck = false //การตรวจสุขภาพ
o147.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o147.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o147.rider = false //สัญญาเพิ่มเติม
o147.tax = 100 //อัตราลดหย่อยภาษี
o147.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o147.decimalRefund = 0 //ทศนิยม_เงินคืน
o147.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o147.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o147.insuranceImageName = imagePrint
o147.insuranceImagePrint = imagePrint 
o147.insuranceDataCV = "o147_CV"
o147.insuranceDataPremium = o147Premium
o147.DataPremiumMemory = []
o147.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o147Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return (data[0].P12 * money) / 1000
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return 0
    }else{
        return 0 
    }

}

o147.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o147Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 
o147.premium6 = function(prospect,insuranceObject){
    return 0
} 
o147.premium3 = function(prospect,insuranceObject){
    return 0
}
o147.premium1 = function(prospect,insuranceObject){
    return 0
}

o147.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 25
}


export default o147