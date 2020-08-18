import InsuranceData from '../../InsuranceData';
import i130Premium from '../../../json/insurance/Industrial/I129-130/i129-i130_คุ้มคุ้ม_premium.json'  
import imagePrint from '../../../images/Insurance/print/I130_PRINT.jpg'

let i130 = Object.assign({}, InsuranceData);
i130.code = "I130" //รหัส
i130.productCode = "130"
i130.productLine = "IND"
i130.insuranceName = "คุ้มทวี 20/20" //ชื่อแบบ
i130.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
i130.type = "กรมธรรม์ประเภทอุตสาหกรรม" //ประเภท (กรมธรรม์ประเภทสามัญ)
i130.productType = "" //ประเภทสินค้า 

i130.pension = false //บำนาญ
i130.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
i130.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
i130.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
i130.ageLeastMonth = 1 //อายุรับประกันน้อยสุด_เดือน
i130.ageLeastDay = 1  //อายุรับประกันน้อยสุดวัน
i130.ageMostYear = 65 //อายุรับประกันมากสุด
i130.timeProtect = 20 //ระยะเวลาคุ้มครอง
i130.timePayment = 20 //ระยะเวลาชำระเบี้ย
i130.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
i130.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
i130.payment = [12,6,3,1] //ชำระเบี้ย
i130.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
i130.insuranceMoneyLeast = 0 //จำนวนเงินเอาประกันภัยขั้นต่ำ
i130.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
i130.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
i130.discountText = "ชำระล่วงหน้า 12 เดือน ลด 7.5%, 6 เดือน ลด 3.5%" //ส่วนลดเบี้ยประกันภัย
i130.discount = true
i130.exceptPayment = false //กรณีทุพพลภาพสิ้นเชิงถาวร //การยกเว้นชำระเบี้ยประกันภัย
i130.exceptPaymentText = "กรณีทุพพลภาพถาวรสิ้นเชิง" //การยกเว้นชำระเบี้ย_ข้อความ
i130.addInsuranceMoney = 0 //การเพิ่มจำนวนเงินเอาประกันภัย
i130.mpremMonthLeast = 500 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
i130.mpremMonthMost = 2000 //เบี้ยประกัยภัยรายเดือนสูงสุด
i130.addMpremMonth = 100 //การเพิ่มเบี้ยประกันภัยรายเดือน
i130.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,200] //ไม่มีเงินคืน //เงินคืนระหว่างสัญญา
i130.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
i130.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
i130.healthCheck = false //การตรวจสุขภาพ
i130.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
i130.healthCheckInsuranceMoney = 0 //ยกเว้นการตรวจ
//การตรวจสุขภาพเมื่อทุนประกันเกิน
i130.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
i130.tax = 100 //อัตราลดหย่อยภาษี
i130.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
i130.decimalRefund = 0 //ทศนิยม_เงินคืน
i130.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
i130.decimalPension = 0 //ทศนิยม_เงินบำนาญ
i130.insuranceImageName = "imagePrint"
i130.insuranceImagePrint = "imagePrint" 
i130.insuranceDataCV = "i130_CV"
i130.insuranceDataPremium = "i130Premium"
i130.DataPremiumMemory = []



i130.commission = function(prospect,insuranceObject){
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

export default i130