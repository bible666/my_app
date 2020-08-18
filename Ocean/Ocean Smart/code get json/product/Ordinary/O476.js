import InsuranceData from '../../InsuranceData';
import o476Premium from '../../../json/insurance/Ordinary/O473-O478/o476_premium.json'
import imagePrint from '../../../images/Insurance/print/O476_PRINT.jpg'
import o475 from './O475';

let o476 = Object.assign({}, InsuranceData);
o476.code = "O476" //รหัส
o476.productCode = "476"
o476.productLine = "ORD"
o476.insuranceName = "ไทยสมุทร คุ้มได้คืน 20/10" //ชื่อแบบ
o476.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o476.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o476.productType = "" //ประเภทสินค้า 

o476.pension = false //บำนาญ
o476.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o476.ageText = "1 เดือน 1 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o476.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o476.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o476.ageLeastDay = 1 //อายุรับประกันน้อยสุดวัน
o476.ageMostYear = 65 //อายุรับประกันมากสุด
o476.timeProtect = 20 //ระยะเวลาคุ้มครอง
o476.timePayment = 10 //ระยะเวลาชำระเบี้ย
o476.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o476.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o476.payment = [12,6,3,1] //ชำระเบี้ย
o476.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o476.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o476.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o476.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o476.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o476.discount = false
o476.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o476.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o476.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o476.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o476.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o476.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o476.refundMoney = [0,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,150] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o476.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o476.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
o476.healthCheck = true //การตรวจสุขภาพ
o476.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o476.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o476.rider = true //สัญญาเพิ่มเติม
o476.tax = 100 //อัตราลดหย่อยภาษี
o476.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o476.decimalRefund = 2 //ทศนิยม_เงินคืน
o476.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o476.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o476.insuranceImageName = imagePrint
o476.insuranceImagePrint = imagePrint 
o476.insuranceDataCV = "o476_CV"
o476.insuranceDataPremium = o476Premium
o476.DataPremiumMemory = []


o476.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney


    let data = o476Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o476.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o476Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o476.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o476Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o476.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o476Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o476.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o476Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}

o476.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 100000 && money <= 199000){
        if(age >= 0 && age <= 50){
            return 20
        }else if(age >= 51 && age <= 60){
            return 15
        }else if(age >= 61 && age <= 65){
            return 10
        }else{
            return 0
        }
    }else if(money >= 200000 && money <= 499000 ){
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


export default o476