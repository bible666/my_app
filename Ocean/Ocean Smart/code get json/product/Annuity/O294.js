import InsuranceData from '../../InsuranceData';
import o294Premium from '../../../json/insurance/Annuity/O294/o294_premium.json'
import imagePrint from '../../../images/Insurance/print/O294_PRINT.jpg'

let o294 = Object.assign({}, InsuranceData);
o294.code = "O294" //รหัส
o294.productCode = "294"
o294.productLine = "ANN"
o294.insuranceName = "เซฟเกษียณ มีบำนาญ 90/60 (บำนาญแบบลดหย่อนภาษีได้)" //ชื่อแบบ
o294.insuranceRate = 2.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o294.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o294.productType = "" //ประเภทสินค้า 

o294.pension = true //บำนาญ
o294.style = "บำนาญ" //แบบ (สะสมทรัพย์)
o294.ageText = "20 - 55 ปี" //อายุรับประกัน_ข้อความ
o294.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o294.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o294.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o294.ageMostYear = 55 //อายุรับประกันมากสุด
o294.timeProtect = 90 //ระยะเวลาคุ้มครอง
o294.timePayment = 60 //ระยะเวลาชำระเบี้ย
o294.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o294.protectPaymentAge = true //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o294.payment = [12,6,3,1] //ชำระเบี้ย
o294.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o294.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o294.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o294.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o294.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o294.discount = false
o294.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o294.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o294.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o294.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o294.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o294.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o294.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,18,18,18,18,18] // รวม 555% หรือ รวม 559.68% //เงินคืนระหว่างสัญญา
o294.refundMoneyText = "รวม 480% หรือ 484.08%" //เงินคืนระหว่างสัญญา_ข้อความ
o294.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
o294.healthCheck = true //การตรวจสุขภาพ
o294.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o294.healthCheckInsuranceMoney = 2000000 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o294.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
o294.tax = 100 //อัตราลดหย่อยภาษี
o294.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o294.decimalRefund = 0 //ทศนิยม_เงินคืน
o294.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
o294.decimalPension = 2 //ทศนิยม_เงินบำนาญ
o294.insuranceImageName = "imagePrint"
o294.insuranceImagePrint = "imagePrint" 
o294.insuranceDataCV = "o294_CV"
o294.insuranceDataPremium = "o294Premium"
o294.DataPremiumMemory = []


o294.mprem = function(customerData,insuranceObject){
    let sex = customerData.CSex //เพศของลูกค้า
    let age = customerData.CAge //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o294Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o294.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(age >= 20 && age <= 35){
        return 25
    }else if(age >= 36 && age <= 40){
        return 21
    }else if(age >= 41 && age <= 45){
        return 18
    }else if(age >= 46 && age <= 50){
        return 11
    }else if(age >= 51 && age <= 54){
        return 7
    }else if(age == 55){
        return 7
    }else{
        return 0
    }
}


export default o294