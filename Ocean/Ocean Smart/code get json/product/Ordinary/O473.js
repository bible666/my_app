import InsuranceData from '../../InsuranceData';
import o473Premium from '../../../json/insurance/Ordinary/O473-O478/o473_premium.json'
import imagePrint from '../../../images/Insurance/print/O473_PRINT.jpg'

let o473 = Object.assign({}, InsuranceData);
o473.code = "O473" //รหัส
o473.productCode = "473"
o473.productLine = "ORD"
o473.insuranceName = "ไทยสมุทร คุ้มได้เต็ม 20/10" //ชื่อแบบ
o473.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o473.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o473.productType = "" //ประเภทสินค้า 

o473.pension = false //บำนาญ
o473.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o473.ageText = "1 เดือน 1 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o473.ageLeastYear = 0 // 30 วัน //อายุรับประกันน้อยสุด
o473.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o473.ageLeastDay = 1 //อายุรับประกันน้อยสุดวัน
o473.ageMostYear = 65 //อายุรับประกันมากสุด
o473.timeProtect = 20 //ระยะเวลาคุ้มครอง
o473.timePayment = 10 //ระยะเวลาชำระเบี้ย
o473.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o473.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o473.payment = [12,6,3,1] //ชำระเบี้ย
o473.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o473.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o473.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o473.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o473.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o473.discount = false
o473.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o473.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
o473.addInsuranceMoney = 1000 //การเพิ่มจำนวนเงินเอาประกันภัย
o473.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o473.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o473.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o473.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
o473.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
o473.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
o473.healthCheck = true //การตรวจสุขภาพ
o473.healthCheckText = "ตามหลักเกณฑ์ฯ ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o473.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o473.rider = true //สัญญาเพิ่มเติม
o473.tax = 100 //อัตราลดหย่อยภาษี
o473.decimalMprem = 2 //ทศนิยม_เบี้ยประกัน
o473.decimalRefund = 0 //ทศนิยม_เงินคืน
o473.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o473.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o473.insuranceImageName = imagePrint
o473.insuranceImagePrint = imagePrint 
o473.insuranceDataCV = "o473_CV"
o473.insuranceDataPremium = o473Premium
o473.DataPremiumMemory = []


o473.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o473Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o473.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o473Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P12 * money) / 1000

} 

o473.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o473Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P6 * money) / 1000
} 

o473.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o473Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P3 * money) / 1000
}

o473.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o473Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].P1 * money) / 1000
}


o473.commission = function(prospect,insuranceObject){
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

export default o473