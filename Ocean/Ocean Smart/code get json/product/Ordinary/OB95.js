import InsuranceData from '../../InsuranceData';
import ob95Premium from '../../../json/insurance/Ordinary/OB95/ob95_premium.json'
import imagePrint from '../../../images/Insurance/print/OB95_PRINT.jpg'

let ob95 = Object.assign({}, InsuranceData);
ob95.code = "OB95" //รหัส
ob95.productCode = "B95"
ob95.productLine = "ORD"
ob95.insuranceName = "โอเชี่ยนไลฟ์ เซฟรับทรัพย์ 14/7" //ชื่อแบบ
ob95.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
ob95.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
ob95.productType = ""//ประเภทสินค้า 

ob95.pension = false //บำนาญ
ob95.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
ob95.ageText = "30 วัน - 70 ปี" //อายุรับประกัน_ข้อความ
ob95.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
ob95.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
ob95.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
ob95.ageMostYear = 70 //อายุรับประกันมากสุด
ob95.timeProtect = 14 //ถึงอายุ 90 //ระยะเวลาคุ้มครอง
ob95.timePayment = 7 //ระยะเวลาชำระเบี้ย
ob95.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
ob95.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
ob95.payment = [12] //ชำระเบี้ย
ob95.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
ob95.insuranceMoneyLeast = 50000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
ob95.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
ob95.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
ob95.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
ob95.discount = true
ob95.exceptPayment = false //การยกเว้นชำระเบี้ยประกันภัย
ob95.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
ob95.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
ob95.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
ob95.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
ob95.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
ob95.refundMoney = [0,5,5,5,5,5,5,5,5,5,5,5,5,5,775] //13 ครั้งรวม 65% //เงินคืนระหว่างสัญญา
ob95.refundMoneyText = "13 ครั้ง รวม 65%" //เงินคืนระหว่างสัญญา_ข้อความ
ob95.refundMoneyLast = 775 // percent % //เงินคืนครบกำหนดสัญญา
ob95.healthCheck = false //การตรวจสุขภาพ
ob95.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
ob95.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
ob95.rider = false //สัญญาเพิ่มเติม
ob95.tax = 100 //อัตราลดหย่อยภาษี
ob95.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
ob95.decimalRefund = 2 //ทศนิยม_เงินคืน
ob95.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
ob95.decimalPension = 0 //ทศนิยม_เงินบำนาญ
ob95.insuranceImageName = imagePrint
ob95.insuranceImagePrint = imagePrint 
ob95.insuranceDataCV = "ob95_CV"
ob95.insuranceDataPremium = ob95Premium
ob95.DataPremiumMemory = []


ob95.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = ob95Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_12 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_12 * money) / 1000
        }else{
            return (data[0].P1_12 * money) / 1000
        }
    }else if(mode === 6){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_6 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_6 * money) / 1000
        }else{
            return (data[0].P1_6 * money) / 1000
        }
    }else if(mode === 3){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_3 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_3 * money) / 1000
        }else{
            return (data[0].P1_3 * money) / 1000
        }
    }else if(mode === 1){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_1 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_1 * money) / 1000
        }else{
            return (data[0].P1_1 * money) / 1000
        }
    }else{
        return 0
    }
}  

ob95.mpremDiscount = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = ob95Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_12 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_12 * money) / 1000
        }else{
            return (data[0].P1_12 * money) / 1000
        }
    }else if(mode === 6){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_6 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_6 * money) / 1000
        }else{
            return (data[0].P1_6 * money) / 1000
        }
    }else if(mode === 3){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_3 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_3 * money) / 1000
        }else{
            return (data[0].P1_3 * money) / 1000
        }
    }else if(mode === 1){
        if(Number(insuranceObject.insuranceMoney) >= 1000000){
            return (data[0].P3_1 * money) / 1000
        }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
            return (data[0].P2_1 * money) / 1000
        }else{
            return (data[0].P1_1 * money) / 1000
        }
    }else{
        return 0
    }
}  


ob95.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = ob95Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 1000000){
        return (data[0].P3_12 * money) / 1000
    }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
        return (data[0].P2_12 * money) / 1000
    }else{
        return (data[0].P1_12 * money) / 1000
    }

} 

ob95.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = ob95Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 1000000){
        return (data[0].P3_6 * money) / 1000
    }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
        return (data[0].P2_6 * money) / 1000
    }else{
        return (data[0].P1_6 * money) / 1000
    }

} 

ob95.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = ob95Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 1000000){
        return (data[0].P3_3 * money) / 1000
    }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
        return (data[0].P2_3 * money) / 1000
    }else{
        return (data[0].P1_3 * money) / 1000
    }

}

ob95.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = ob95Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(Number(insuranceObject.insuranceMoney) >= 1000000){
        return (data[0].P3_1 * money) / 1000
    }else if(Number(insuranceObject.insuranceMoney) >= 300000 && Number(insuranceObject.insuranceMoney) <= 999999){
        return (data[0].P2_1 * money) / 1000
    }else{
        return (data[0].P1_1 * money) / 1000
    }

}

ob95.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    return 7
}



export default ob95