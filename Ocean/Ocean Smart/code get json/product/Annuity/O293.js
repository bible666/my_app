import InsuranceData from '../../InsuranceData';
import o293Premium from '../../../json/insurance/Annuity/O293/o293_premium.json'
import imagePrint from '../../../images/Insurance/print/O293_PRINT.jpg'

let o293 = Object.assign({}, InsuranceData);
o293.code = "O293" //รหัส
o293.productCode = "293"
o293.productLine = "ANN"
o293.insuranceName = "เซฟเกษียณ มีบำนาญ 90/5 (บำนาญแบบลดหย่อนภาษีได้)" //ชื่อแบบ
o293.insuranceRate = 2.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o293.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o293.productType = "" //ประเภทสินค้า 

o293.pension = true //บำนาญ
o293.style = "บำนาญ" //แบบ (สะสมทรัพย์)
o293.ageText = "20 - 55 ปี" //อายุรับประกัน_ข้อความ
o293.ageLeastYear = 20 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o293.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o293.ageLeastDay = 0  //อายุรับประกันน้อยสุดวัน
o293.ageMostYear = 55 //อายุรับประกันมากสุด
o293.timeProtect = 90 //ระยะเวลาคุ้มครอง
o293.timePayment = 5 //ระยะเวลาชำระเบี้ย
o293.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
o293.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o293.payment = [12,6,3,1] //ชำระเบี้ย
o293.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o293.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o293.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o293.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o293.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o293.discount = false
o293.exceptPayment = false //ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o293.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o293.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o293.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o293.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o293.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o293.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,18,18,18,18,18] // รวม 480% หรือ รวม 480.08% //เงินคืนระหว่างสัญญา
o293.refundMoneyText = "รวม 480% หรือ 484.08%" //เงินคืนระหว่างสัญญา_ข้อความ
o293.refundMoneyLast = 0 // percent % //เงินคืนครบกำหนดสัญญา
o293.healthCheck = true //การตรวจสุขภาพ
o293.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o293.healthCheckInsuranceMoney = 2000000 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o293.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
o293.tax = 100 //อัตราลดหย่อยภาษี
o293.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o293.decimalRefund = 0 //ทศนิยม_เงินคืน
o293.decimalRefundLast = 0 //ทศนิยม_เงินครบกำหนดสัญญา
o293.decimalPension = 2 //ทศนิยม_เงินบำนาญ
o293.insuranceImageName = "imagePrint"
o293.insuranceImagePrint = "imagePrint" 
o293.insuranceDataCV = "o293_CV"
o293.insuranceDataPremium = "o293Premium"
o293.DataPremiumMemory = []


o293.mprem = function(customerData,insuranceObject){
    let sex = customerData.CSex //เพศของลูกค้า
    let age = customerData.CAge //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน

    let data = o293Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o293.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 7
}

export default o293