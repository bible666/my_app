import InsuranceData from '../../InsuranceData';
import oa37Premium from '../../../json/insurance/Ordinary/OA37/oa37_premium.json'
import imagePrint from '../../../images/Insurance/print/OA37_PRINT.jpg'

let oa37 = Object.assign({}, InsuranceData);
oa37.code = "OA37" //รหัส
oa37.productCode = "A37"
oa37.productLine = "ORD"
oa37.insuranceName = "โอเชี่ยนไลฟ์ คุ้มค่าตลอดชีพ 90/20" //ชื่อแบบ
oa37.insuranceRate = 3 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oa37.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oa37.productType = ""//ประเภทสินค้า 

oa37.pension = false //บำนาญ
oa37.style = "ตลอดชีพ" //แบบ (สะสมทรัพย์)
oa37.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
oa37.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oa37.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oa37.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
oa37.ageMostYear = 60 //อายุรับประกันมากสุด
oa37.timeProtect = 90 //ถึงอายุ 90 //ระยะเวลาคุ้มครอง
oa37.timePayment = 20 //ระยะเวลาชำระเบี้ย
oa37.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
oa37.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oa37.payment = [12,6,3,1] //ชำระเบี้ย
oa37.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
oa37.insuranceMoneyLeast = 200000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oa37.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oa37.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oa37.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
oa37.discount = true
oa37.exceptPayment = true //แถม WP //การยกเว้นชำระเบี้ยประกันภัย
oa37.exceptPaymentText = "แถมฟรี WP(ทุนประกันรวมไม่เกิน 1,000,000 บาท (นับรวมกรมธรรม์สามัญทุกฉบับ))" //การยกเว้นชำระเบี้ย_ข้อความ
oa37.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oa37.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oa37.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oa37.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oa37.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,250] //ไม่มีเงินคืนระหว่างสัญญา //เงินคืนระหว่างสัญญา
oa37.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
oa37.refundMoneyLast = 250 // percent % //เงินคืนครบกำหนดสัญญา
oa37.healthCheck = true //การตรวจสุขภาพ
oa37.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
oa37.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oa37.rider = true //สัญญาเพิ่มเติม
oa37.tax = 100 //อัตราลดหย่อยภาษี
oa37.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
oa37.decimalRefund = 0 //ทศนิยม_เงินคืน
oa37.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oa37.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oa37.insuranceImageName = imagePrint
oa37.insuranceImagePrint = imagePrint 
oa37.insuranceDataCV = "oa37_CV"
oa37.insuranceDataPremium = oa37Premium
oa37.DataPremiumMemory = []

oa37.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oa37Premium.filter(d => d.SEX === sex && d.AGE === age)

   
    
    if(mode === 12){
        if(Number(money) >= 500000){
            return (data[0].SA2_P12 * money) / 1000
        }else{
            return (data[0].SA1_P12 * money) / 1000
        }
    }else if(mode === 6){
        if(Number(money) >= 500000){
            return (data[0].SA2_P6 * money) / 1000
        }else{
            return (data[0].SA1_P6 * money) / 1000
        }
    }else if(mode === 3){
        if(Number(money) >= 500000){
            return (data[0].SA2_P3 * money) / 1000
        }else{
            return (data[0].SA1_P3 * money) / 1000
        }
    }else if(mode === 1){
        if(Number(money) >= 500000){
            return (data[0].SA2_P1 * money) / 1000
        }else{
            return (data[0].SA1_P1 * money) / 1000
        }
    }else{
        return 0
    }
}  

oa37.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oa37Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(Number(money) >= 500000){
            return (data[0].SA2_P12 * money) / 1000
        }else{
            return (data[0].SA1_P12 * money) / 1000
        }
    }else if(mode === 6){
        if(Number(money) >= 500000){
            return (data[0].SA2_P6 * money) / 1000
        }else{
            return (data[0].SA1_P6 * money) / 1000
        }
    }else if(mode === 3){
        if(Number(money) >= 500000){
            return (data[0].SA2_P3 * money) / 1000
        }else{
            return (data[0].SA1_P3 * money) / 1000
        }
    }else if(mode === 1){
        if(Number(money) >= 500000){
            return (data[0].SA2_P1 * money) / 1000
        }else{
            return (data[0].SA1_P1 * money) / 1000
        }
    }else{
        return 0
    }
}  


oa37.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa37Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 500000){
        return (data[0].SA2_P12 * money) / 1000
    }else{
        return (data[0].SA1_P12 * money) / 1000
    }

} 

oa37.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa37Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 500000){
        return (data[0].SA2_P6 * money) / 1000
    }else{
        return (data[0].SA1_P6 * money) / 1000
    }

} 

oa37.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa37Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 500000){
        return (data[0].SA2_P3 * money) / 1000
    }else{
        return (data[0].SA1_P3 * money) / 1000
    }

}

oa37.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oa37Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 500000){
        return (data[0].SA2_P1 * money) / 1000
    }else{
        return (data[0].SA1_P1 * money) / 1000
    }
}

oa37.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(age >= 0 && age <= 30){
        return 35
    }else if(age >= 31 && age <= 50){
        return 30
    }else if(age >= 51 && age <= 60){
        return 20
    }else{
        return 0
    }
}


export default oa37