import InsuranceData from '../../InsuranceData';
import o991Premium from '../../../json/insurance/Ordinary/O988-O991/o988-o991_premium.json'
import imagePrint from '../../../images/Insurance/print/O991_PRINT.jpg'

let o991 = Object.assign({}, InsuranceData);
o991.code = "O991" //รหัส
o991.productCode = "991"
o991.productLine = "ORD"
o991.insuranceName = "ออมคุ้มครอง 10/5" //ชื่อแบบ
o991.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o991.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o991.productType = ""//ประเภทสินค้า 

o991.pension = false //บำนาญ
o991.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o991.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o991.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o991.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o991.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o991.ageMostYear = 65 //อายุรับประกันมากสุด
o991.timeProtect = 10 //ระยะเวลาคุ้มครอง
o991.timePayment = 5 //ระยะเวลาชำระเบี้ย
o991.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o991.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o991.payment = [12] //ชำระเบี้ย
o991.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o991.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o991.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o991.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o991.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
o991.discount = true
o991.exceptPayment = false // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o991.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o991.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o991.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o991.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o991.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o991.refundMoney = [0,5,5,5,5,5,5,5,5,5,505] //10 ครั้ง รวม 50% //เงินคืนระหว่างสัญญา
o991.refundMoneyText = "10 ครั้ง รวม 50%" //เงินคืนระหว่างสัญญา_ข้อความ
o991.refundMoneyLast = 500// percent % //เงินคืนครบกำหนดสัญญา
o991.healthCheck = false //การตรวจสุขภาพ
o991.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o991.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o991.rider = false //สัญญาเพิ่มเติม
o991.tax = 100 //อัตราลดหย่อยภาษี
o991.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o991.decimalRefund = 2 //ทศนิยม_เงินคืน
o991.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o991.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o991.insuranceImageName = imagePrint
o991.insuranceImagePrint = imagePrint 
o991.insuranceDataCV = "o991_CV"
o991.insuranceDataPremium = o991Premium
o991.DataPremiumMemory = []


o991.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o991Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o991.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o991Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o991.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o991Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 50000){
        return (data[0].PDISCOUNT * money) / 1000
    }else{
        return (data[0].P12 * money) / 1000
    }

} 

o991.premium6 = function(prospect,insuranceObject){
    return 0
} 

o991.premium3 = function(prospect,insuranceObject){
    return 0
}

o991.premium1 = function(prospect,insuranceObject){
    return 0
}

o991.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 2
}


export default o991