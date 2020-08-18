import InsuranceData from '../../InsuranceData';
import i136Premium from '../../../json/insurance/Industrial/I136/i136_คุ้มทวี_premium.json'
import imagePrint from '../../../images/Insurance/print/I136_PRINT.jpg'

let i136 = Object.assign({}, InsuranceData);
i136.code = "I136" //รหัส
i136.productCode = "136"
i136.productLine = "IND"
i136.insuranceName = "คุ้มทวี 20/10" //ชื่อแบบ
i136.insuranceRate = 3.5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
i136.type = "กรมธรรม์ประเภทอุตสาหกรรม" //ประเภท (กรมธรรม์ประเภทสามัญ)
i136.productType = "" //ประเภทสินค้า 

i136.pension = false //บำนาญ
i136.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
i136.ageText = "30 วัน - 55 ปี" //อายุรับประกัน_ข้อความ
i136.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
i136.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
i136.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
i136.ageMostYear = 55 //อายุรับประกันมากสุด
i136.timeProtect = 20 //ระยะเวลาคุ้มครอง
i136.timePayment = 10 //ระยะเวลาชำระเบี้ย
i136.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
i136.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
i136.payment = [12,6,3,1] //ชำระเบี้ย
i136.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
i136.insuranceMoneyLeast = 0 //จำนวนเงินเอาประกันภัยขั้นต่ำ
i136.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
i136.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
i136.discountText = "ชำระล่วงหน้า 12 เดือน ลด 7.5%, 6 เดือน ลด 3.5%" //ส่วนลดเบี้ยประกันภัย
i136.discount = true
i136.exceptPayment = false //กรณีทุพพลภาพสิ้นเชิงถาวร //การยกเว้นชำระเบี้ยประกันภัย
i136.exceptPaymentText = "กรณีทุพพลภาพถาวรสิ้นเชิง" //การยกเว้นชำระเบี้ย_ข้อความ
i136.addInsuranceMoney = 0 //การเพิ่มจำนวนเงินเอาประกันภัย
i136.mpremMonthLeast = 500 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
i136.mpremMonthMost = 2000 //เบี้ยประกัยภัยรายเดือนสูงสุด
i136.addMpremMonth = 100 //การเพิ่มเบี้ยประกันภัยรายเดือน
i136.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150] //ไม่มีเงินคืน //เงินคืนระหว่างสัญญา
i136.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
i136.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
i136.healthCheck = false //การตรวจสุขภาพ
i136.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
i136.healthCheckInsuranceMoney = 0 //ยกเว้นการตรวจ
//การตรวจสุขภาพเมื่อทุนประกันเกิน
i136.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
i136.tax = 100 //อัตราลดหย่อยภาษี
i136.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
i136.decimalRefund = 0 //ทศนิยม_เงินคืน
i136.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
i136.decimalPension = 0 //ทศนิยม_เงินบำนาญ
i136.insuranceImageName = "imagePrint"
i136.insuranceImagePrint = "imagePrint" 
i136.insuranceDataCV = "i136_CV"
i136.insuranceDataPremium = "i136Premium"
i136.DataPremiumMemory = []

i136.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 500 && money <= 900){
        return 15
    }else if(money >= 1000 && money <= 1400){
        return 20
    }else if(money >= 1500){
        return 25
    }else{
        return 0
    }
    
}


export default i136