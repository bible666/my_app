import InsuranceData from '../../InsuranceData';
import o494Premium from '../../../json/insurance/Ordinary/O494/o494_premium.json'
import imagePrint from '../../../images/Insurance/print/O494_PRINT.jpg'

let o494 = Object.assign({}, InsuranceData);
o494.code = "O494" //รหัส
o494.productCode = "494"
o494.productLine = "ORD"
o494.insuranceName = "ไทยสมุทรสบายสบาย 30/5" //ชื่อแบบ
o494.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o494.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o494.productType = "" //ประเภทสินค้า 

o494.pension = false //บำนาญ
o494.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o494.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o494.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o494.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o494.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
o494.ageMostYear = 65 //อายุรับประกันมากสุด
o494.timeProtect = 30 //ระยะเวลาคุ้มครอง
o494.timePayment = 5 //ระยะเวลาชำระเบี้ย
o494.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o494.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o494.payment = [12,6,3,1] //ชำระเบี้ย
o494.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o494.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o494.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o494.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o494.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o494.discount = false
o494.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o494.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o494.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o494.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o494.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o494.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o494.refundMoney = [0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,160] // 29 ครั้ง รวม 58%  //เงินคืนระหว่างสัญญา
o494.refundMoneyText = "29 ครั้ง รวม 58%" //เงินคืนระหว่างสัญญา_ข้อความ
o494.refundMoneyLast = 160 // percent % //เงินคืนครบกำหนดสัญญา
o494.healthCheck = true //การตรวจสุขภาพ
o494.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o494.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o494.rider = true //สัญญาเพิ่มเติม
o494.tax = 100 //อัตราลดหย่อยภาษี
o494.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o494.decimalRefund = 2 //ทศนิยม_เงินคืน
o494.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o494.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o494.insuranceImageName = imagePrint
o494.insuranceImagePrint = "O494_PRINT.jpg" 
o494.insuranceDataCV = "O494_CV"
o494.insuranceDataPremium = o494Premium
o494.DataPremiumMemory = []


o494.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney


    let data = o494Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        return (data[0].P12 * money) / 1000
    }else if(mode === 6){
        return (data[0].P6 * money) / 1000
    }else if(mode === 3){
        return (data[0].P3 * money) / 1000
    }else if(mode === 1){
        return (data[0].P1 * money) / 1000
    }else{
        return 0
    }
}  

o494.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o494Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o494.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o494Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o494.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o494Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o494.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o494Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}


o494.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 100000 && money <= 199999){
        if(age >= 0 && age <= 50){
            return 12
        }else if(age >= 51 && age <= 60){
            return 8
        }else if(age >= 61 && age <= 65){
            return 4
        }else{
            return 0
        }
    }else if(money >= 200000 && money <= 499999 ){
        if(age >= 0 && age <= 50){
            return 15
        }else if(age >= 51 && age <= 60){
            return 10
        }else if(age >= 61 && age <= 65){
            return 5
        }else{
            return 0
        }
    }else if(money >= 500000){
        if(age >= 0 && age <= 50){
            return 18
        }else if(age >= 51 && age <= 60){
            return 12
        }else if(age >= 61 && age <= 65){
            return 6
        }else{
            return 0
        }
    }else{
        return 0
    }

}

export default o494