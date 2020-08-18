import InsuranceData from '../../InsuranceData';
import i145Premium from '../../../json/insurance/Industrial/I145/i145_ ไทยสมุทรคุ้ม_premium.json'
import imagePrint from '../../../images/Insurance/print/I145_PRINT.jpg'

let i145 = Object.assign({}, InsuranceData);
i145.code = "I145" //รหัส
i145.productCode = "145"
i145.productLine = "IND"
i145.insuranceName = "ไทยสมุทรคุ้มนาน 90/20" //ชื่อแบบ
i145.insuranceRate = 3 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
i145.type = "กรมธรรม์ประเภทอุตสาหกรรม" //ประเภท (กรมธรรม์ประเภทสามัญ)
i145.productType = "" //ประเภทสินค้า 

i145.pension = false //บำนาญ
i145.style = "ตลอดชีพ" //แบบ (สะสมทรัพย์)
i145.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
i145.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
i145.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
i145.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
i145.ageMostYear = 60 //อายุรับประกันมากสุด
i145.timeProtect = 90 //ระยะเวลาคุ้มครอง
i145.timePayment = 20 //ระยะเวลาชำระเบี้ย
i145.protectPolicyAge = true //คุ้มครองตามเงื่อนไขอายุ
i145.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
i145.payment = [12,6,3,1] //ชำระเบี้ย
i145.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
i145.insuranceMoneyLeast = 0 //จำนวนเงินเอาประกันภัยขั้นต่ำ
i145.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
i145.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
i145.discountText = "ชำระล่วงหน้า 12 เดือน ลด 7.5%, 6 เดือน ลด 3.5%" //ส่วนลดเบี้ยประกันภัย
i145.discount = true
i145.exceptPayment = false //กรณีทุพพลภาพสิ้นเชิงถาวร //การยกเว้นชำระเบี้ยประกันภัย
i145.exceptPaymentText = "กรณีทุพพลภาพถาวรสิ้นเชิง" //การยกเว้นชำระเบี้ย_ข้อความ
i145.addInsuranceMoney = 0 //การเพิ่มจำนวนเงินเอาประกันภัย
i145.mpremMonthLeast = 500 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
i145.mpremMonthMost = 4000 //เบี้ยประกัยภัยรายเดือนสูงสุด
i145.addMpremMonth = 100 //การเพิ่มเบี้ยประกันภัยรายเดือน
i145.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,100] //ไม่มีเงินคืน //เงินคืนระหว่างสัญญา
i145.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
i145.refundMoneyLast = 100 // percent % //เงินคืนครบกำหนดสัญญา
i145.healthCheck = false //การตรวจสุขภาพ
i145.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
i145.healthCheckInsuranceMoney = 0 //ยกเว้นการตรวจ
//การตรวจสุขภาพเมื่อทุนประกันเกิน
i145.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
i145.tax = 100 //อัตราลดหย่อยภาษี
i145.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
i145.decimalRefund = 0 //ทศนิยม_เงินคืน
i145.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
i145.decimalPension = 0 //ทศนิยม_เงินบำนาญ
i145.insuranceImageName = "imagePrint"
i145.insuranceImagePrint = "imagePrint" 
i145.insuranceDataCV = "i145_CV"
i145.insuranceDataPremium = "i145Premium"
i145.DataPremiumMemory = []

i145.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 500 && money <= 900){
        return 25
    }else if(money >= 1000 && money <= 1400){
        return 30
    }else if(money >= 1500){
        return 35
    }else{
        return 0
    }
}

export default i145