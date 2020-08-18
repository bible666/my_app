import InsuranceData from '../../InsuranceData';
import o218Premium from '../../../json/insurance/Ordinary/O218/o218_premium.json'
import imagePrint from '../../../images/Insurance/print/O218_PRINT.jpg'

let o218 = Object.assign({}, InsuranceData);
o218.code = "O218" //รหัส
o218.productCode = "218"
o218.productLine = "ORD"
o218.insuranceName = "สบายชัวร์" //ชื่อแบบ
o218.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
o218.type = "กรมธรรม์ประเภทสามัญ" //ประเภท (กรมธรรม์ประเภทสามัญ)
o218.productType = ""//ประเภทสินค้า 

o218.pension = false //บำนาญ
o218.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
o218.ageText = "1 เดือน 1 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
o218.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
o218.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
o218.ageLeastDay = 1  //อายุรับประกันน้อยสุดวัน
o218.ageMostYear = 60 //อายุรับประกันมากสุด
o218.timeProtect = 25 //ระยะเวลาคุ้มครอง
o218.timePayment = 15 //ระยะเวลาชำระเบี้ย
o218.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
o218.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
o218.payment = [12,6,3,1] //ชำระเบี้ย
o218.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
o218.insuranceMoneyLeast = 100000 //จำนวนเงินเอาประกันภัยขั้นต่ำ
o218.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
o218.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
o218.discountText = "ไม่มีส่วนลด" //ส่วนลดเบี้ยประกันภัย
o218.discount = false
o218.exceptPayment = true//การยกเว้นชำระเบี้ยประกันภัย
o218.exceptPaymentText = "ไม่แถมสัญญาเพิ่มเติม WP" //การยกเว้นชำระเบี้ย_ข้อความ
o218.addInsuranceMoney = 1 //การเพิ่มจำนวนเงินเอาประกันภัย
o218.mpremMonthLeast = 0 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
o218.mpremMonthMost = 0 //เบี้ยประกัยภัยรายเดือนสูงสุด
o218.addMpremMonth = 0 //การเพิ่มเบี้ยประกันภัยรายเดือน
o218.refundMoney = [0,0,0,0,0,8,0,0,0,0,8,0,0,0,0,8,0,0,0,0,8,0,0,0,0,160] //เงินคืนระหว่างสัญญา
o218.refundMoneyText = "4 ครั้ง รวม 32%" //เงินคืนระหว่างสัญญา_ข้อความ
o218.refundMoneyLast = 160 // percent % //เงินคืนครบกำหนดสัญญา
o218.healthCheck = true //การตรวจสุขภาพ
o218.healthCheckText = "ตามหลักเกณฑ์ฯ  ของบริษัทฯ" //การตรวจสุขภาพ_ข้อความ
o218.healthCheckInsuranceMoney = 0 //การตรวจสุขภาพเมื่อทุนประกันเกิน
o218.rider = true //สัญญาเพิ่มเติม
o218.tax = 100 //อัตราลดหย่อยภาษี
o218.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
o218.decimalRefund = 2 //ทศนิยม_เงินคืน
o218.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
o218.decimalPension = 0 //ทศนิยม_เงินบำนาญ
o218.insuranceImageName = imagePrint
o218.insuranceImagePrint = imagePrint
o218.insuranceDataCV = "o218_CV"
o218.insuranceDataPremium = o218Premium
o218.DataPremiumMemory = []


o218.mprem = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let mode = insuranceObject.insuranceMode //ลูกค้าจ่ายเบี้ย ทุกกี่เดือน
    let money = insuranceObject.insuranceMoney

    let data = o218Premium.filter(d => d.SEX === sex && d.AGE === age)
    
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


o218.premium12 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney
    let data = o218Premium.filter(d => d.SEX === sex && d.AGE === age)

    return (data[0].P12 * money) / 1000

} 
o218.premium6 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney
    let data = o218Premium.filter(d => d.SEX === sex && d.AGE === age)

    return (data[0].P6 *money) / 1000

} 
o218.premium3 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney
    let data = o218Premium.filter(d => d.SEX === sex && d.AGE === age)

    return (data[0].P3 * money) / 1000

}
o218.premium1 = function(prospect,insuranceObject){
    let sex = prospect.genderId //เพศของลูกค้า
    let age = prospect.age //อายุของลูกค้า
    let money = insuranceObject.insuranceMoney
    let data = o218Premium.filter(d => d.SEX === sex && d.AGE === age)

    return (data[0].P1 * money) / 1000

}

o218.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)
    if(money >= 100000 && money <= 199999){
        if(age >= 0 && age <= 40){
            return 30
        }else if(age >= 41 && age <= 50){
            return 25
        }else if(age >= 51 && age <= 60){
            return 20
        }else{
            return 0
        }
    }else if(money >= 200000 ){
        if(age >= 0 && age <= 40){
            return 35
        }else if(age >= 41 && age <= 50){
            return 30
        }else if(age >= 51 && age <= 60){
            return 25
        }else{
            return 0
        }
    }else{
        return 0
    }
}

export default o218