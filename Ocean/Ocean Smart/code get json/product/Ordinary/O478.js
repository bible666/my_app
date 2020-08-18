import InsuranceData from '../../InsuranceData';
import o478Premium from '../../../json/insurance/Ordinary/O473-O478/o478_premium.json'
import imagePrint from '../../../images/Insurance/print/O478_PRINT.jpg'

let o478 = Object.assign({}, InsuranceData);
o478.code = "O478" //รหัส
o478.productCode = "478"
o478.productLine = "ORD"
o478.insuranceName = "ไทยสมุทร คุ้มได้คืน 20/20" //ชื่อแบบ
o478.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o478.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o478.productType = "" //ประเภทสินค้า 

o478.pension = false //บำนาญ
o478.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o478.ageText = "1 เดือน 1 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o478.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o478.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o478.ageLeastDay = 1 //อายุรับประกันน้อยสุดวัน
o478.ageMostYear = 65 //อายุรับประกันมากสุด
o478.timeProtect = 20 //ระยะเวลาคุ้มครอง
o478.timePayment = 20 //ระยะเวลาชำระเบี้ย
o478.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o478.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o478.payment = [12,6,3,1] //ชำระเบี้ย
o478.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o478.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o478.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o478.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o478.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o478.discount = false
o478.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o478.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o478.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o478.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o478.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o478.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o478.refundMoney = [0,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,150] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o478.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o478.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
o478.healthCheck = true //การตรวจสุขภาพ
o478.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o478.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o478.rider = true //สัญญาเพิ่มเติม
o478.tax = 100 //อัตราลดหย่อยภาษี
o478.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o478.decimalRefund = 2 //ทศนิยม_เงินคืน
o478.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o478.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o478.insuranceImageName = imagePrint
o478.insuranceImagePrint = imagePrint 
o478.insuranceDataCV = "o478_CV"
o478.insuranceDataPremium = o478Premium
o478.DataPremiumMemory = []


o478.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney


    let data = o478Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o478.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o478Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o478.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o478Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o478.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o478Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o478.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o478Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o478.commission = function(prospect,insuranceObject){
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
        }else if(age >= 61 && age <= 65){
            return 25
        }else{
            return 0
        }
    }else{
        return 0
    }
}


export default o478