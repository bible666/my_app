import InsuranceData from '../../InsuranceData';
import o152Premium from '../../../json/insurance/Annuity/O152/o152_premium.json'
import imagePrint from '../../../images/Insurance/print/O152_PRINT.jpg'

let o152 = Object.assign({}, InsuranceData);
o152.code = "O152" //รหัส
o152.productCode = "152"
o152.productLine = "ANN"
o152.insuranceName = "ไทยสมุทรบำนาญ 85/55 (บำนาญแบบลดหย่อนภาษีได้)" //ชื่อแบบ
o152.insuranceRate = 2.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o152.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o152.productType = "" //ประเภทสินค้า 

o152.pension = false //บำนาญ
o152.style = "บำนาญ" //แบบ (สะสมทรัพย์)
o152.ageText = "25 - 50 ปี" //อายุรับประกัน_ข้อความ
o152.ageLeastYear = 25 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o152.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o152.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o152.ageMostYear = 50 //อายุรับประกันมากสุด
o152.timeProtect = 85 //ระยะเวลาคุ้มครอง
o152.timePayment = 55 //ระยะเวลาชำระเบี้ย
o152.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o152.protectPaymentAge = true //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o152.payment = [12,1] //ชำระเบี้ย
o152.paymentText = "รายปี หรือ รายเดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o152.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o152.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o152.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o152.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o152.discount = false
o152.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o152.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o152.addInsuranceMoney = 10000 //การเพิ่มจำนวนเงินเอาประกันภัย
o152.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o152.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o152.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o152.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10] // 31 ครั้ง รวม 310% //เงินคืนระหว่างสัญญา
o152.refundMoneyText = "31 ครั้ง รวม 310%" //เงินคืนระหว่างสัญญา_ข้อความ
o152.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
o152.healthCheck = true //การตรวจสุขภาพ
o152.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o152.healthCheckInsuranceMoney = 1000000
//การตรวจสุขภาพเมื่อทุนประกันเกิน
o152.rider = true //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
o152.tax = 100 //อัตราลดหย่อยภาษี
o152.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o152.decimalRefund = 0 //ทศนิยม_เงินคืน
o152.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
o152.decimalPension = 2 //ทศนิยม_เงินบำนาญ
o152.insuranceImageName = "imagePrint"
o152.insuranceImagePrint = "imagePrint" 
o152.insuranceDataCV = "o152_CV"
o152.insuranceDataPremium = "o152Premium"
o152.DataPremiumMemory = []


o152.mprem = function(customerData,insuranceObject){
    let sex = customerData.CSex //เพศของลูกค้า
    let age = customerData.CAge //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o152Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o152.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(age < 36){
        return 25
    }else if(age >= 36 && age <= 40){
        return 19
    }else if(age >= 41 && age <= 45){
        return 12
    }else if(age >= 46 && age <= 49){
        return 7
    }else if(age == 50){
        return 7
    }else{
        return 0
    }
}

export default o152