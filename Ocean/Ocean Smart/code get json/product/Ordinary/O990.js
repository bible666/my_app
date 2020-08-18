import InsuranceData from '../../InsuranceData';
import o990Premium from '../../../json/insurance/Ordinary/O988-O991/o988-o991_premium.json'
import imagePrint from '../../../images/Insurance/print/O990_PRINT.jpg'

let o990 = Object.assign({}, InsuranceData);
o990.code = "O990" //รหัส
o990.productCode = "990"
o990.productLine = "ORD"
o990.insuranceName = "ออมคุ้มครอง 10/4" //ชื่อแบบ
o990.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o990.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o990.productType = ""//ประเภทสินค้า 

o990.pension = false //บำนาญ
o990.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o990.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o990.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o990.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o990.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o990.ageMostYear = 65 //อายุรับประกันมากสุด
o990.timeProtect = 10 //ระยะเวลาคุ้มครอง
o990.timePayment = 4 //ระยะเวลาชำระเบี้ย
o990.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o990.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o990.payment = [12] //ชำระเบี้ย
o990.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o990.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o990.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o990.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o990.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
o990.discount = true
o990.exceptPayment = false // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o990.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o990.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o990.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o990.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o990.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o990.refundMoney = [0,4,4,4,4,4,4,4,4,4,404] //10 ครั้ง รวม 40% //เงินคืนระหว่างสัญญา
o990.refundMoneyText = "10 ครั้ง รวม 40%" //เงินคืนระหว่างสัญญา_ข้อความ
o990.refundMoneyLast = 400// percent % //เงินคืนครบกำหนดสัญญา
o990.healthCheck = false //การตรวจสุขภาพ
o990.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o990.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o990.rider = false //สัญญาเพิ่มเติม
o990.tax = 100 //อัตราลดหย่อยภาษี
o990.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o990.decimalRefund = 2 //ทศนิยม_เงินคืน
o990.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o990.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o990.insuranceImageName = imagePrint
o990.insuranceImagePrint = imagePrint 
o990.insuranceDataCV = "o990_CV"
o990.insuranceDataPremium = o990Premium
o990.DataPremiumMemory = []


o990.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o990Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o990.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o990Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o990.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o990Premium.filter(d => d.SEX === sex && d.AGE === age)
    return (data[0].PDISCOUNT * money) / 1000

} 

o990.premium6 = function(prospect,insuranceObject){
    return 0
} 

o990.premium3 = function(prospect,insuranceObject){
    return 0
}

o990.premium1 = function(prospect,insuranceObject){
    return 0
}

o990.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 2
}



export default o990