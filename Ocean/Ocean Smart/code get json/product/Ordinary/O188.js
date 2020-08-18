import InsuranceData from '../../InsuranceData';
import o188Premium from '../../../json/insurance/Ordinary/O188/o188_premium.json'
import imagePrint from '../../../images/Insurance/print/O188_PRINT.jpg'

let o188 = Object.assign({}, InsuranceData);
o188.code = "O188" //รหัส
o188.productCode = "188"
o188.productLine = "ORD"
o188.insuranceName = "วางใจคุ้มค่า" //ชื่อแบบ
o188.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o188.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o188.productType = ""//ประเภทสินค้า 

o188.pension = false //บำนาญ
o188.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o188.ageText = "1 เดือน 1 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o188.ageLeastYear = 0.0833 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o188.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o188.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o188.ageMostYear = 60 //อายุรับประกันมากสุด
o188.timeProtect = 20 //ระยะเวลาคุ้มครอง
o188.timePayment = 10 //ระยะเวลาชำระเบี้ย
o188.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o188.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o188.payment = [12,6,3,1] //ชำระเบี้ย
o188.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o188.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o188.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o188.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o188.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o188.discount = false
o188.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o188.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o188.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o188.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o188.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o188.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o188.refundMoney = [0,0,6,0,6,0,6,0,7,0,7,0,7,0,12,175] //7 ครั้ง รวม 51% //เงินคืนระหว่างสัญญา
o188.refundMoneyText = "5 ครั้ง รวม 50%" //เงินคืนระหว่างสัญญา_ข้อความ
o188.refundMoneyLast = 110 // percent % //เงินคืนครบกำหนดสัญญา
o188.healthCheck = false //การตรวจสุขภาพ
o188.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o188.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o188.rider = true //สัญญาเพิ่มเติม
o188.tax = 100 //อัตราลดหย่อยภาษี
o188.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o188.decimalRefund = 2 //ทศนิยม_เงินคืน
o188.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o188.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o188.insuranceImageName = imagePrint
o188.insuranceImagePrint = imagePrint 
o188.insuranceDataCV = "o188_CV"
o188.insuranceDataPremium = o188Premium
o188.DataPremiumMemory = []
o188.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o188Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return data[0].P12
    }else if(mode === 6){
        return data[0].P6
    }else if(mode === 3){
        return data[0].P3
    }else if(mode === 1){
        return data[0].P1
    }else{
        return 0 
    }
    

}

o188.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 0
}

export default o188