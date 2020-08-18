import InsuranceData from '../../InsuranceData';
import o496Premium from '../../../json/insurance/Ordinary/O496/o496_premium.json'
import imagePrint from '../../../images/Insurance/print/O496_PRINT.jpg'

let o496 = Object.assign({}, InsuranceData);
o496.code = "O496" //รหัส
o496.productCode = "496"
o496.productLine = "ORD"
o496.insuranceName = "ไทยสมุทรสบายสบาย 30/15" //ชื่อแบบ
o496.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o496.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o496.productType = "" //ประเภทสินค้า 

o496.pension = false //บำนาญ
o496.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o496.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o496.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o496.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o496.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
o496.ageMostYear = 65 //อายุรับประกันมากสุด
o496.timeProtect = 30 //ระยะเวลาคุ้มครอง
o496.timePayment = 15 //ระยะเวลาชำระเบี้ย
o496.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o496.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o496.payment = [12,6,3,1] //ชำระเบี้ย
o496.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o496.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o496.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o496.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o496.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o496.discount = false
o496.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o496.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o496.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o496.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o496.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o496.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o496.refundMoney = [0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,160] // 29 ครั้ง รวม 58%  //เงินคืนระหว่างสัญญา
o496.refundMoneyText = "29 ครั้ง รวม 58%" //เงินคืนระหว่างสัญญา_ข้อความ
o496.refundMoneyLast = 160 // percent % //เงินคืนครบกำหนดสัญญา
o496.healthCheck = true //การตรวจสุขภาพ
o496.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o496.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o496.rider = true //สัญญาเพิ่มเติม
o496.tax = 100 //อัตราลดหย่อยภาษี
o496.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o496.decimalRefund = 2 //ทศนิยม_เงินคืน
o496.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o496.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o496.insuranceImageName = imagePrint
o496.insuranceImagePrint = imagePrint
o496.insuranceDataCV = "O496_CV"
o496.insuranceDataPremium = o496Premium
o496.DataPremiumMemory = []


o496.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o496Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o496.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o496Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o496.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o496Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o496.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o496Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o496.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o496Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o496.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 100000 && money <= 199999){
        if(age >= 0 && age <= 50){
            return 25
        }else if(age >= 51 && age <= 60){
            return 20
        }else if(age >= 61 && age <= 65){
            return 15
        }else{
            return 0
        }
    }else if(money >= 200000 && money <= 499999 ){
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


export default o496