import InsuranceData from '../../InsuranceData';
import o475Premium from '../../../json/insurance/Ordinary/O473-O478/o475_premium.json'
import imagePrint from '../../../images/Insurance/print/O475_PRINT.jpg'
import o474 from './O474';

let o475 = Object.assign({}, InsuranceData);
o475.code = "O475" //รหัส
o475.productCode = "475"
o475.productLine = "ORD"
o475.insuranceName = "ไทยสมุทร คุ้มได้คืน 20/20" //ชื่อแบบ
o475.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o475.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o475.productType = "" //ประเภทสินค้า 

o475.pension = false //บำนาญ
o475.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o475.ageText = "1 เดือน 1 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o475.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o475.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o475.ageLeastDay = 1 //อายุรับประกันน้อยสุดวัน
o475.ageMostYear = 65 //อายุรับประกันมากสุด
o475.timeProtect = 20 //ระยะเวลาคุ้มครอง
o475.timePayment = 10 //ระยะเวลาชำระเบี้ย
o475.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o475.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o475.payment = [12,6,3,1] //ชำระเบี้ย
o475.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o475.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o475.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o475.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o475.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o474.discount = false
o475.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o475.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o475.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o475.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o475.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o475.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o475.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
o475.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o475.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
o475.healthCheck = true //การตรวจสุขภาพ
o475.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o475.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o475.rider = true //สัญญาเพิ่มเติม
o475.tax = 100 //อัตราลดหย่อยภาษี
o475.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o475.decimalRefund = 0 //ทศนิยม_เงินคืน
o475.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o475.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o475.insuranceImageName = imagePrint
o475.insuranceImagePrint = imagePrint 
o475.insuranceDataCV = "o475_CV"
o475.insuranceDataPremium = o475Premium
o475.DataPremiumMemory = []


o475.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney


    let data = o475Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o475.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o475Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o475.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o475Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o475.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o475Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o475.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o475Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o475.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 100000 && money <= 199000){
        if(age >= 0 && age <= 50){
            return 25
        }else if(age >= 51 && age <= 60){
            return 20
        }else if(age >= 61 && age <= 65){
            return 15
        }else{
            return 0
        }
    }else if(money >= 200000 && money <= 499000 ){
        if(age >= 0 && age <= 50){
            return 30
        }else if(age >= 51 && age <= 60){
            return 25
        }else if(age >= 61 && age <= 65){
            return 20
        }else{
            return 0
        }
    }else if(money >= 500000){
        if(age >= 0 && age <= 50){
            return 35
        }else if(age >= 51 && age <= 60){
            return 30
        }else{
            return 0
        }
    }else{
        return 0
    }

}



export default o475