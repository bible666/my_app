import InsuranceData from '../../InsuranceData';
import o989Premium from '../../../json/insurance/Ordinary/O988-O991/o988-o991_premium.json'
import imagePrint from '../../../images/Insurance/print/O989_PRINT.jpg'

let o989 = Object.assign({}, InsuranceData);
o989.code = "O989" //รหัส
o989.productCode = "989"
o989.productLine = "ORD"
o989.insuranceName = "ออมคุ้มครอง 10/3" //ชื่อแบบ
o989.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o989.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o989.productType = ""//ประเภทสินค้า 

o989.pension = false //บำนาญ
o989.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o989.ageText = "30 วัน - 65 ปี" //อายุรับประกัน_ข้อความ
o989.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o989.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
o989.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
o989.ageMostYear = 65 //อายุรับประกันมากสุด
o989.timeProtect = 10 //ระยะเวลาคุ้มครอง
o989.timePayment = 3 //ระยะเวลาชำระเบี้ย
o989.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o989.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o989.payment = [12] //ชำระเบี้ย
o989.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
o989.insuranceMoneyLeast = 30000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o989.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o989.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o989.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
o989.discount = true
o989.exceptPayment = false // ไม่แถม WP //การยกเว้นชำระเบี้ยประกันภัย
o989.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o989.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o989.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o989.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o989.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o989.refundMoney = [0,3,3,3,3,3,3,3,3,3,303] //10 ครั้ง รวม 30% //เงินคืนระหว่างสัญญา
o989.refundMoneyText = "10 ครั้ง รวม 30%" //เงินคืนระหว่างสัญญา_ข้อความ
o989.refundMoneyLast = 300// percent % //เงินคืนครบกำหนดสัญญา
o989.healthCheck = false //การตรวจสุขภาพ
o989.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
o989.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o989.rider = false //สัญญาเพิ่มเติม
o989.tax = 100 //อัตราลดหย่อยภาษี
o989.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o989.decimalRefund = 2 //ทศนิยม_เงินคืน
o989.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o989.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o989.insuranceImageName = imagePrint
o989.insuranceImagePrint = imagePrint 
o989.insuranceDataCV = "o989_CV"
o989.insuranceDataPremium = o989Premium
o989.DataPremiumMemory = []


o989.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o989Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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

o989.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o989Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o989.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = o989Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 50000){
        return (data[0].PDISCOUNT * money) / 1000
    }else{
        return (data[0].P12 * money) / 1000
    }

} 

o989.premium6 = function(prospect,insuranceObject){
    return 0
} 

o989.premium3 = function(prospect,insuranceObject){
    return 0
}

o989.premium1 = function(prospect,insuranceObject){
    return 0
}

o989.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 1

}



export default o989