import InsuranceData from '../../InsuranceData';
import o153Premium from '../../../json/insurance/Annuity/O153/o153_premium.json'
import imagePrint from '../../../images/Insurance/print/O153_PRINT.jpg'

let o153 = Object.assign({}, InsuranceData);
o153.code = "O153" //รหัส
o153.productCode = "153"
o153.productLine = "ANN"
o153.insuranceName = "ไทยสมุทรบำนาญ 85/60 (บำนาญแบบลดหย่อนภาษีได้)" //ชื่อแบบ
o153.insuranceRate = 2.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o153.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o153.productType = "" //ประเภทสินค้า 

o153.pension = false //บำนาญ
o153.style = "บำนาญ" //แบบ (สะสมทรัพย์)
o153.ageText = "25 - 55 ปี" //อายุรับประกัน_ข้อความ
o153.ageLeastYear = 25 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o153.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o153.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o153.ageMostYear = 55 //อายุรับประกันมากสุด
o153.timeProtect = 85 //ระยะเวลาคุ้มครอง
o153.timePayment = 60 //ระยะเวลาชำระเบี้ย
o153.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o153.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o153.payment = [12,1] //ชำระเบี้ย
o153.paymentText = "รายปี หรือ รายเดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o153.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o153.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o153.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o153.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o153.discount = false
o153.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o153.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o153.addInsuranceMoney = 10000 //การเพิ่มจำนวนเงินเอาประกันภัย
o153.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o153.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o153.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o153.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12] // 26 ครั้ง รวม 310% //เงินคืนระหว่างสัญญา
o153.refundMoneyText = "26 ครั้ง รวม 312%" //เงินคืนระหว่างสัญญา_ข้อความ
o153.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
o153.healthCheck = true //การตรวจสุขภาพ
o153.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o153.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o153.rider = true //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
o153.tax = 100 //อัตราลดหย่อยภาษี
o153.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o153.decimalRefund = 0 //ทศนิยม_เงินคืน
o153.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
o153.decimalPension = 2 //ทศนิยม_เงินบำนาญ
o153.insuranceImageName = "imagePrint"
o153.insuranceImagePrint = "imagePrint" 
o153.insuranceDataCV = "o153_CV"
o153.insuranceDataPremium = "o153Premium"
o153.DataPremiumMemory = []

o153.mprem = function(customerData,insuranceObject){
    let sex = customerData.CSex //เพศของลูกค้า
    let age = customerData.CAge //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o153Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return data[0].P12
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return data[0].P1
    }else{
        return 0
    }
} 

o153.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(age < 41){
        return 25
    }else if(age >= 41 && age <= 45){
        return 19
    }else if(age >= 46 && age <= 50){
        return 12
    }else if(age >= 51 && age <= 54){
        return 7
    }else if(age == 55){
        return 7
    }else{
        return 0
    }
}


export default o153