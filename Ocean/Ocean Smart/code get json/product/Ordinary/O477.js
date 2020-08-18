import InsuranceData from '../../InsuranceData';
import o477Premium from '../../../json/insurance/Ordinary/O473-O478/o477_premium.json'
import imagePrint from '../../../images/Insurance/print/O477_PRINT.jpg'

let o477 = Object.assign({}, InsuranceData);
o477.code = "O477" //รหัส
o477.productCode = "477"
o477.productLine = "ORD"
o477.insuranceName = "ไทยสมุทร คุ้มได้คืน 20/15" //ชื่อแบบ
o477.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o477.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o477.productType = "" //ประเภทสินค้า 

o477.pension = false //บำนาญ
o477.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o477.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o477.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o477.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o477.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o477.ageMostYear = 65 //อายุรับประกันมากสุด
o477.timeProtect = 20 //ระยะเวลาคุ้มครอง
o477.timePayment = 15 //ระยะเวลาชำระเบี้ย
o477.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o477.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o477.payment = [12,6,3,1] //ชำระเบี้ย
o477.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o477.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o477.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o477.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o477.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o477.discount = false
o477.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o477.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o477.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o477.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o477.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o477.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o477.refundMoney = [0,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,152] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o477.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o477.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
o477.healthCheck = true //การตรวจสุขภาพ
o477.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o477.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o477.rider = true //สัญญาเพิ่มเติม
o477.tax = 100 //อัตราลดหย่อยภาษี
o477.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o477.decimalRefund = 2 //ทศนิยม_เงินคืน
o477.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o477.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o477.insuranceImageName = imagePrint
o477.insuranceImagePrint = imagePrint 
o477.insuranceDataCV = "o477_CV"
o477.insuranceDataPremium = o477Premium
o477.DataPremiumMemory = []


o477.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney


    let data = o477Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o477.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o477Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o477.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o477Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o477.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o477Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o477.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o477Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o477.commission = function(prospect,insuranceObject){
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


export default o477