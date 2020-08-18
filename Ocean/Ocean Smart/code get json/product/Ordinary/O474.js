import InsuranceData from '../../InsuranceData';
import o474Premium from '../../../json/insurance/Ordinary/O473-O478/o474_premium.json'
import imagePrint from '../../../images/Insurance/print/O474_PRINT.jpg'

let o474 = Object.assign({}, InsuranceData);
o474.code = "O474" //รหัส
o474.productCode = "474"
o474.productLine = "ORD"
o474.insuranceName = "ไทยสมุทร คุ้มได้คืน 20/20" //ชื่อแบบ
o474.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o474.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o474.productType = "" //ประเภทสินค้า 

o474.pension = false //บำนาญ
o474.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o474.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o474.ageLeastYear = 0 // 30 วัน //อายุรับประกันน้อยสุด
o474.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o474.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o474.ageMostYear = 65 //อายุรับประกันมากสุด
o474.timeProtect = 20 //ระยะเวลาคุ้มครอง
o474.timePayment = 15 //ระยะเวลาชำระเบี้ย
o474.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o474.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o474.payment = [12,6,3,1] //ชำระเบี้ย
o474.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o474.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o474.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o474.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o474.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o474.discount = false
o474.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o474.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o474.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o474.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o474.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o474.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o474.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
o474.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
o474.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
o474.healthCheck = true //การตรวจสุขภาพ
o474.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o474.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o474.rider = true //สัญญาเพิ่มเติม
o474.tax = 100 //อัตราลดหย่อยภาษี
o474.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o474.decimalRefund = 0 //ทศนิยม_เงินคืน
o474.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o474.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o474.insuranceImageName = imagePrint
o474.insuranceImagePrint = imagePrint 
o474.insuranceDataCV = "o474_CV"
o474.insuranceDataPremium = o474Premium
o474.DataPremiumMemory = []


o474.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o474Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o474.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o474Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o474.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o474Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o474.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o474Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o474.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o474Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}
o474.commission = function(prospect,insuranceObject){
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


export default o474