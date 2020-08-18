import InsuranceData from '../../InsuranceData';
import i129Premium from '../../../json/insurance/Industrial/I129-130/i129-i130_คุ้มคุ้ม_premium.json'
import imagePrint from '../../../images/Insurance/print/I129_PRINT.jpg'

let i129 = Object.assign({}, InsuranceData);
i129.code = "I129" //รหัส
i129.productCode = "129"
i129.productLine = "IND"
i129.insuranceName = "คุ้มทวี 20/15" //ชื่อแบบ
i129.insuranceRate = 4 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
i129.type = "กรมธรรม์ประเภทอุตสาหกรรม" //ประเภท (กรมธรรม์ประเภทสามัญ)
i129.productType = "" //ประเภทสินค้า 

i129.pension = false //บำนาญ
i129.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
i129.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
i129.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
i129.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
i129.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
i129.ageMostYear = 60 //อายุรับประกันมากสุด
i129.timeProtect = 20 //ระยะเวลาคุ้มครอง
i129.timePayment = 15 //ระยะเวลาชำระเบี้ย
i129.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
i129.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
i129.payment = [12,6,3,1] //ชำระเบี้ย
i129.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
i129.insuranceMoneyLeast = 0 //จำนวนเงินเอาประกันภัยขั้นต่ำ
i129.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
i129.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
i129.discountText = "ชำระล่วงหน้า 12 เดือน ลด 7.5%, 6 เดือน ลด 3.5%" //ส่วนลดเบี้ยประกันภัย
i129.discount = true
i129.exceptPayment = false //กรณีทุพพลภาพสิ้นเชิงถาวร //การยกเว้นชำระเบี้ยประกันภัย
i129.exceptPaymentText = "กรณีทุพพลภาพถาวรสิ้นเชิง" //การยกเว้นชำระเบี้ย_ข้อความ
i129.addInsuranceMoney = 0 //เพิ่มตามตาราง //การเพิ่มจำนวนเงินเอาประกันภัย
i129.mpremMonthLeast = 500 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
i129.mpremMonthMost = 2000 //เบี้ยประกัยภัยรายเดือนสูงสุด
i129.addMpremMonth = 100 // เพิ่มตามตาราง //การเพิ่มเบี้ยประกันภัยรายเดือน
i129.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,200] //ไม่มีเงินคืน //เงินคืนระหว่างสัญญา
i129.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
i129.refundMoneyLast = 200 // percent % //เงินคืนครบกำหนดสัญญา
i129.healthCheck = false //การตรวจสุขภาพ
i129.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
i129.healthCheckInsuranceMoney = 0 //ยกเว้นการตรวจ
//การตรวจสุขภาพเมื่อทุนประกันเกิน
i129.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
i129.tax = 100 //อัตราลดหย่อยภาษี
i129.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
i129.decimalRefund = 0 //ทศนิยม_เงินคืน
i129.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
i129.decimalPension = 0 //ทศนิยม_เงินบำนาญ
i129.insuranceImageName = "imagePrint"
i129.insuranceImagePrint = "imagePrint" 
i129.insuranceDataCV = "i129_CV"
i129.insuranceDataPremium = "i129Premium"
i129.DataPremiumMemory = []


i129.commission = function(prospect,insuranceObject){
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


export default i129