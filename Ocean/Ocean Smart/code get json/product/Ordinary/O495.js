import InsuranceData from '../../InsuranceData';
import o495Premium from '../../../json/insurance/Ordinary/O495/o495_premium.json'
import imagePrint from '../../../images/Insurance/print/O495_PRINT.jpg'

let o495 = Object.assign({}, InsuranceData);
o495.code = "O495" //รหัส
o495.productCode = "495"
o495.productLine = "ORD"
o495.insuranceName = "ไทยสมุทรสบายสบาย 30/10" //ชื่อแบบ
o495.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o495.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o495.productType = ""//ประเภทสินค้า 

o495.pension = false //บำนาญ
o495.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o495.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o495.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o495.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o495.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
o495.ageMostYear = 65 //อายุรับประกันมากสุด
o495.timeProtect = 30 //ระยะเวลาคุ้มครอง
o495.timePayment = 10 //ระยะเวลาชำระเบี้ย
o495.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o495.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o495.payment = [12,6,3,1] //ชำระเบี้ย
o495.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o495.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o495.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o495.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o495.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o495.discount = false
o495.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o495.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o495.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o495.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o495.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o495.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o495.refundMoney = [0,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,160] // 29 ครั้ง รวม 58%  //เงินคืนระหว่างสัญญา
o495.refundMoneyText = "29 ครั้ง รวม 58%" //เงินคืนระหว่างสัญญา_ข้อความ
o495.refundMoneyLast = 160 // percent % //เงินคืนครบกำหนดสัญญา
o495.healthCheck = true //การตรวจสุขภาพ
o495.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o495.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o495.rider = true //สัญญาเพิ่มเติม
o495.tax = 100 //อัตราลดหย่อยภาษี
o495.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o495.decimalRefund = 2 //ทศนิยม_เงินคืน
o495.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o495.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o495.insuranceImageName = imagePrint
o495.insuranceImagePrint = imagePrint
o495.insuranceDataCV = "O495_CV"
o495.insuranceDataPremium = o495Premium
o495.DataPremiumMemory = []

o495.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney


    let data = o495Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o495.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o495Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o495.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o495Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o495.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o495Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o495.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o495Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o495.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 100000 && money <= 199999){
        if(age >= 0 && age <= 50){
            return 20
        }else if(age >= 51 && age <= 60){
            return 15
        }else if(age >= 61 && age <= 65){
            return 10
        }else{
            return 0
        }
    }else if(money >= 200000 && money <= 499999 ){
        if(age >= 0 && age <= 50){
            return 25
        }else if(age >= 51 && age <= 60){
            return 20
        }else if(age >= 61 && age <= 65){
            return 15
        }else{
            return 0
        }
    }else if(money >= 500000){
        if(age >= 0 && age <= 50){
            return 30
        }else if(age >= 51 && age <= 60){
            return 25
        }else if(age >= 61 && age <= 65){
            return 20
        }else{
            return 0
        }
    }else{
        return 0
    }

}


export default o495