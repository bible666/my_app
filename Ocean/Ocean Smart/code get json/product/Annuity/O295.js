import InsuranceData from '../../InsuranceData';
import o295Premium from '../../../json/insurance/Annuity/O295/o295_premium.json'
import imagePrint from '../../../images/Insurance/print/O295_PRINT.jpg'

let o295 = Object.assign({}, InsuranceData);
o295.code = "O295" //รหัส
o295.productCode = "295"
o295.productLine = "ANN"
o295.insuranceName = "เซฟเกษียณ มีบำนาญ 90/55 (บำนาญแบบลดหย่อนภาษีได้)" //ชื่อแบบ
o295.insuranceRate = 2.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o295.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o295.productType = "" //ประเภทสินค้า 

o295.pension = true //บำนาญ
o295.style = "บำนาญ" //แบบ (สะสมทรัพย์)
o295.ageText = "20 - 50 ปี" //อายุรับประกัน_ข้อความ
o295.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o295.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o295.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o295.ageMostYear = 50 //อายุรับประกันมากสุด
o295.timeProtect = 90 //ระยะเวลาคุ้มครอง
o295.timePayment = 55 //ระยะเวลาชำระเบี้ย
o295.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o295.protectPaymentAge = true //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o295.payment = [12,6,3,1] //ชำระเบี้ย
o295.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o295.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o295.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o295.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o295.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o295.discount = false
o295.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o295.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o295.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o295.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o295.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o295.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o295.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,18,18,18,18,18] // รวม 555% หรือ รวม 559.68% //เงินคืนระหว่างสัญญา
o295.refundMoneyText = "รวม 555% หรือ 559.68%" //เงินคืนระหว่างสัญญา_ข้อความ
o295.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
o295.healthCheck = true //การตรวจสุขภาพ
o295.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o295.healthCheckInsuranceMoney = 1000000 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o295.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
o295.tax = 100 //อัตราลดหย่อยภาษี
o295.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o295.decimalRefund = 0 //ทศนิยม_เงินคืน
o295.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
o295.decimalPension = 2 //ทศนิยม_เงินบำนาญ
o295.insuranceImageName = "imagePrint"
o295.insuranceImagePrint = "imagePrint" 
o295.insuranceDataCV = "o295_CV"
o295.insuranceDataPremium = "o295Premium"
o295.DataPremiumMemory = []

o295.mprem = function(customerData,insuranceObject){
    let sex = customerData.CSex //เพศของลูกค้า
    let age = customerData.CAge //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o295Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o295.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(age >= 20 && age <= 30){
        return 25
    }else if(age >= 31 && age <= 35){
        return 21
    }else if(age >= 36 && age <= 40){
        return 18
    }else if(age >= 41 && age <= 45){
        return 11
    }else if(age >= 46 && age <= 49){
        return 7
    }else if(age == 50){
        return 7
    }else{
        return 0
    }
}

export default o295