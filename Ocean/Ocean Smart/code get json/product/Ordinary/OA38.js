import InsuranceData from '../../InsuranceData';
import oa38Premium from '../../../json/insurance/Ordinary/OA38/oa38_premium.json'
import imagePrint from '../../../images/Insurance/print/OA38_PRINT.jpg'

let oa38 = Object.assign({}, InsuranceData);
oa38.code = "OA38" //รหัส
oa38.productCode = "A38"
oa38.productLine = "ORD"
oa38.insuranceName = "โอเชี่ยนไลฟ์ คุ้มครองตลอดชีพ 99/1" //ชื่อแบบ
oa38.insuranceRate = 3.25 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oa38.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oa38.productType = ""//ประเภทสินค้า 

oa38.pension = false //บำนาญ
oa38.style = "ตลอดชีพ" //แบบ (สะสมทรัพย์)
oa38.ageText = "30 วัน - 70 ปี" //อายุรับประกัน_ข้อความ
oa38.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oa38.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oa38.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
oa38.ageMostYear = 70 //อายุรับประกันมากสุด
oa38.timeProtect = 99 //ถึงอายุ 90 //ระยะเวลาคุ้มครอง
oa38.timePayment = 1 //ระยะเวลาชำระเบี้ย
oa38.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
oa38.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oa38.payment = [0] //ชำระเบี้ย
oa38.paymentText = "ชำระครั้งเดียว" //การชำระเบี้ยประกันภัย_ข้อความ
oa38.insuranceMoneyLeast = 200000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oa38.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oa38.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oa38.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
oa38.discount = false
oa38.exceptPayment = false //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oa38.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oa38.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oa38.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oa38.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oa38.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oa38.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
oa38.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oa38.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
oa38.healthCheck = true //การตรวจสุขภาพ
oa38.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oa38.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oa38.rider = true //สัญญาเพิ่มเติม
oa38.tax = 100 //อัตราลดหย่อยภาษี
oa38.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
oa38.decimalRefund = 0 //ทศนิยม_เงินคืน
oa38.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oa38.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oa38.insuranceImageName = imagePrint
oa38.insuranceImagePrint = imagePrint 
oa38.insuranceDataCV = "oa38_CV"
oa38.insuranceDataPremium = oa38Premium
oa38.DataPremiumMemory = []


oa38.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oa38Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return 0
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return 0
    }else if(mode=== 0){
        return (data[0].P0 * money) / 1000
    }else{
        return 0
    }
}  

oa38.premium12 = function(prospect,insuranceObject){
return 0

} 

oa38.premium6 = function(prospect,insuranceObject){
return 0
} 

oa38.premium3 = function(prospect,insuranceObject){
return 0
}

oa38.premium1 = function(prospect,insuranceObject){
return 0
}

oa38.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 2
}


export default oa38