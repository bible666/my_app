import InsuranceData from '../../InsuranceData';
import o988Premium from '../../../json/insurance/Ordinary/O988-O991/o988-o991_premium.json'
import imagePrint from '../../../images/Insurance/print/O988_PRINT.jpg'

let o988 = Object.assign({}, InsuranceData);
o988.code = "O988" //รหัส
o988.productCode = "988"
o988.productLine = "ORD"
o988.insuranceName = "ออมคุ้มครอง 10/2" //ชื่อแบบ
o988.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o988.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o988.productType = ""//ประเภทสินค้า 

o988.pension = false //บำนาญ
o988.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o988.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o988.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o988.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o988.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o988.ageMostYear = 65 //อายุรับประกันมากสุด
o988.timeProtect = 10 //ระยะเวลาคุ้มครอง
o988.timePayment = 2 //ระยะเวลาชำระเบี้ย
o988.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o988.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o988.payment = [12] //ชำระเบี้ย
o988.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o988.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o988.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o988.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o988.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
o988.discount = true
o988.exceptPayment = false // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o988.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o988.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o988.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o988.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o988.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o988.refundMoney = [0,2,2,2,2,2,2,2,2,2,202] //10 ครั้ง รวม 20% //เงินคืนระหว่างสัญญา
o988.refundMoneyText = "10 ครั้ง รวม 20%" //เงินคืนระหว่างสัญญา_ข้อความ
o988.refundMoneyLast = 200// percent % //เงินคืนครบกำหนดสัญญา
o988.healthCheck = false //การตรวจสุขภาพ
o988.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o988.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o988.rider = false //สัญญาเพิ่มเติม
o988.tax = 100 //อัตราลดหย่อยภาษี
o988.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o988.decimalRefund = 2 //ทศนิยม_เงินคืน
o988.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o988.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o988.insuranceImageName = imagePrint
o988.insuranceImagePrint = imagePrint 
o988.insuranceDataCV = "o988_CV"
o988.insuranceDataPremium = o988Premium
o988.DataPremiumMemory = []


o988.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o988Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(Number(insuranceObject.insuranceMoney) >= 50000){
            return (data[0].PDISCOUNT * money) / 1000
        }else{
            return (data[0].P12 * money) / 1000
        }
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return 0
    }else{
        return 0
    }
}  

o988.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o988Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(Number(insuranceObject.insuranceMoney) >= 50000){
            return (data[0].PDISCOUNT * money) / 1000
        }else{
            return (data[0].P12 * money) / 1000
        }
    }else if(mode === 6){
        return 0
    }else if(mode === 3){
        return 0
    }else if(mode === 1){
        return 0
    }else{
        return 0
    }
}  


o988.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o988Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 50000){
        return (data[0].PDISCOUNT * money) / 1000
    }else{
        return (data[0].P12 * money) / 1000
    }

} 

o988.premium6 = function(prospect,insuranceObject){
    return 0
} 

o988.premium3 = function(prospect,insuranceObject){
    return 0
}

o988.premium1 = function(prospect,insuranceObject){
    return 0
}

o988.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 1

}


export default o988