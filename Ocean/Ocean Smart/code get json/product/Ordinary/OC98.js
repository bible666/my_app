import InsuranceData from '../../InsuranceData';
import oc98Premium from '../../../json/insurance/Ordinary/OC98/oc98_premium.json'
import imagePrint from '../../../images/Insurance/print/OC98_PRINT.jpg'

let oc98 = Object.assign({}, InsuranceData);
oc98.code = "OC98" //รหัส
oc98.productCode = "C98"
oc98.productLine = "ORD"
oc98.insuranceName = "ไทยสมุทร รักปั้นเงิน 3/2" //ชื่อแบบ
oc98.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
oc98.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
oc98.productType = ""//ประเภทสินค้า 

oc98.pension = false //บำนาญ
oc98.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
oc98.ageText = "30 วัน - 75 ปี" //อายุรับประกัน_ข้อความ
oc98.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
oc98.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
oc98.ageLeastDay = 30 //อายุรับประกันน้อยสุดวัน
oc98.ageMostYear = 75 //อายุรับประกันมากสุด
oc98.timeProtect = 3 //ระยะเวลาคุ้มครอง
oc98.timePayment = 2 //ระยะเวลาชำระเบี้ย
oc98.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
oc98.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
oc98.payment = [12] //ชำระเบี้ย
oc98.paymentText = "รายปีเท่านั้น" //การชำระเบี้ยประกันภัย_ข้อความ
oc98.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
oc98.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
oc98.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
oc98.discountText = "มีส่วนลด (ขึ้นกับจำนวนเงินเอาประกันภัย)" //ส่วนลดเบี้ยประกันภัย
oc98.discount = true
oc98.exceptPayment = false //การยกเว้นชำระเบี้ยประกันภัย
oc98.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
oc98.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
oc98.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
oc98.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
oc98.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
oc98.refundMoney = [0,2,2,202] //3 ครั้ง รวม 6% //เงินคืนระหว่างสัญญา
oc98.refundMoneyText = "3 ครั้ง รวม 6%" //เงินคืนระหว่างสัญญา_ข้อความ
oc98.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
oc98.healthCheck = false //การตรวจสุขภาพ
oc98.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
oc98.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
oc98.rider = false //สัญญาเพิ่มเติม
oc98.tax = 0 //อัตราลดหย่อยภาษี
oc98.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
oc98.decimalRefund = 2 //ทศนิยม_เงินคืน
oc98.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
oc98.decimalPension = 0 //ทศนิยม_เงินบำนาญ
oc98.insuranceImageName = imagePrint
oc98.insuranceImagePrint = imagePrint 
oc98.insuranceDataCV = "oc98_CV"
oc98.insuranceDataPremium = oc98Premium
oc98.DataPremiumMemory = []

oc98.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = oc98Premium.filter(d => d.SEX === sex && d.AGE === age)
    
    if(mode === 12){

        if(money >= 1000000){
            return (data[0].P4_12 * money) / 1000
       }else if(money >= 500000 && money <= 999999){
            return (data[0].P3_12 * money) / 1000
       }else if(money >= 200000 && money <= 499999){
            return (data[0].P2_12 * money) / 1000 
       }else{
            return (data[0].P1_12 * money) / 1000
       }
      
    }else if(mode === 6){
        if(money >= 1000000){
            return (data[0].P4_6 * money) / 1000
       }else if(money >= 500000 && money <= 999999){
            return (data[0].P3_6 * money) / 1000
       }else if(money >= 200000 && money <= 499999){
            return (data[0].P2_6 * money) / 1000 
       }else{
            return (data[0].P1_6 * money) / 1000
       }
    }else if(mode === 3){
        if(money >= 1000000){
            return (data[0].P4_3 * money) / 1000
       }else if(money >= 500000 && money <= 999999){
            return (data[0].P3_3 * money) / 1000
       }else if(money >= 200000 && money <= 499999){
            return (data[0].P2_3 * money) / 1000 
       }else{
            return (data[0].P1_3 * money) / 1000
       }
    }else if(mode === 1){
        if(money >= 1000000){
            return (data[0].P4_1 * money) / 1000
       }else if(money >= 500000 && money <= 999999){
            return (data[0].P3_1 * money) / 1000
       }else if(money >= 200000 && money <= 499999){
            return (data[0].P2_1 * money) / 1000 
       }else{
            return (data[0].P1_1 * money) / 1000
       }
    }else{
        return 0 
    }
    

}


oc98.mpremDiscount = function(prospect,insuranceObject){
     let sex = prospect.genderId //เพศของลูกค้า
     let age = prospect.age //อายุของลูกค้า
     let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
     let money = insuranceObject.insuranceMoney
 
     let data = oc98Premium.filter(d => d.SEX === sex && d.AGE === age)
     
     if(mode === 12){
 
         if(money >= 1000000){
             return (data[0].P4_12 * money) / 1000
        }else if(money >= 500000 && money <= 999999){
             return (data[0].P3_12 * money) / 1000
        }else if(money >= 200000 && money <= 499999){
             return (data[0].P2_12 * money) / 1000 
        }else{
             return (data[0].P1_12 * money) / 1000
        }
       
     }else if(mode === 6){
         if(money >= 1000000){
             return (data[0].P4_6 * money) / 1000
        }else if(money >= 500000 && money <= 999999){
             return (data[0].P3_6 * money) / 1000
        }else if(money >= 200000 && money <= 499999){
             return (data[0].P2_6 * money) / 1000 
        }else{
             return (data[0].P1_6 * money) / 1000
        }
     }else if(mode === 3){
         if(money >= 1000000){
             return (data[0].P4_3 * money) / 1000
        }else if(money >= 500000 && money <= 999999){
             return (data[0].P3_3 * money) / 1000
        }else if(money >= 200000 && money <= 499999){
             return (data[0].P2_3 * money) / 1000 
        }else{
             return (data[0].P1_3 * money) / 1000
        }
     }else if(mode === 1){
         if(money >= 1000000){
             return (data[0].P4_1 * money) / 1000
        }else if(money >= 500000 && money <= 999999){
             return (data[0].P3_1 * money) / 1000
        }else if(money >= 200000 && money <= 499999){
             return (data[0].P2_1 * money) / 1000 
        }else{
             return (data[0].P1_1 * money) / 1000
        }
     }else{
         return 0 
     }
     
 
 }

oc98.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney

    let data = oc98Premium.filter(d => d.SEX === sex && d.AGE === age)
    if(money >= 1000000){
        return (data[0].P4_12 * money) / 1000
   }else if(money >= 500000 && money <= 999999){
        return (data[0].P3_12 * money) / 1000
   }else if(money >= 200000 && money <= 499999){
        return (data[0].P2_12 * money) / 1000 
   }else{
        return (data[0].P1_12 * money) / 1000
   }

} 

oc98.premium6 = function(prospect,insuranceObject){
    return 0
} 

oc98.premium3 = function(prospect,insuranceObject){
    return 0
}

oc98.premium1 = function(prospect,insuranceObject){
    return 0
}

oc98.commission = function(prospect,insuranceObject){
     let money = Number(insuranceObject.insuranceMoney)
     let age = Number(prospect.genderId)
     return 0.5
 }
 


export default oc98