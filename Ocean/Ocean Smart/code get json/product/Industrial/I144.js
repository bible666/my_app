import InsuranceData from '../../InsuranceData';
import i144Premium from '../../../json/insurance/Industrial/I144/i144_คุ้มทวี_premium.json'
import imagePrint from '../../../images/Insurance/print/I144_PRINT.jpg'

let i144 = Object.assign({}, InsuranceData);
i144.code = "I144" //รหัส
i144.productCode = "144"
i144.productLine = "IND"
i144.insuranceName = "คุ้มทวี (20/15)" //ชื่อแบบ
i144.insuranceRate = 5 //อัตราผลตอบแทนที่ใช้คำนวณเบี้ย
i144.type = "กรมธรรม์ประเภทอุตสาหกรรม" //ประเภท (กรมธรรม์ประเภทสามัญ)
i144.productType = "" //ประเภทสินค้า 

i144.pension = false //บำนาญ
i144.style = "สะสมทรัพย์" //แบบ (สะสมทรัพย์)
i144.ageText = "30 วัน - 60 ปี" //อายุรับประกัน_ข้อความ
i144.ageLeastYear = 0 // 1 เดือน 1 วัน //อายุรับประกันน้อยสุด
i144.ageLeastMonth = 0 //อายุรับประกันน้อยสุด_เดือน
i144.ageLeastDay = 30  //อายุรับประกันน้อยสุดวัน
i144.ageMostYear = 60 //อายุรับประกันมากสุด
i144.timeProtect = 20 //ระยะเวลาคุ้มครอง
i144.timePayment = 15 //ระยะเวลาชำระเบี้ย
i144.protectPolicyAge = false //คุ้มครองตามเงื่อนไขอายุ
i144.protectPaymentAge = false //คุ้มครองชำระเบี้ยตามเงื่อนไขอายุ
i144.payment = [12,6,3,1] //ชำระเบี้ย
i144.paymentText = "รายปี หรือ รายงวด 6, 3, 1 เดือน" //การชำระเบี้ยประกันภัย_ข้อความ
i144.insuranceMoneyLeast = 0 //จำนวนเงินเอาประกันภัยขั้นต่ำ
i144.insuranceMoneyMost = 0 //ไม่จำกัด //จำนวนเงินเอาประกันภัยสูงสุด
i144.insuranceMoneyMostAge10 = 1000000 //จำนวนเงินเอาประกันภัยสูงสุด_เงื่อนไขอายุไม่เกิน10
i144.discountText = "ชำระล่วงหน้า 12 เดือน ลด 7.5%, 6 เดือน ลด 3.5%" //ส่วนลดเบี้ยประกันภัย
i144.discount = true
i144.exceptPayment = false //กรณีทุพพลภาพสิ้นเชิงถาวร //การยกเว้นชำระเบี้ยประกันภัย
i144.exceptPaymentText = "กรณีทุพพลภาพถาวรสิ้นเชิง" //การยกเว้นชำระเบี้ย_ข้อความ
i144.addInsuranceMoney = 0 //การเพิ่มจำนวนเงินเอาประกันภัย
i144.mpremMonthLeast = 500 //เบี้ยประกัยภัยรายเดือนขั้นต่ำ
i144.mpremMonthMost = 4000 //เบี้ยประกัยภัยรายเดือนสูงสุด
i144.addMpremMonth = 100 //การเพิ่มเบี้ยประกันภัยรายเดือน
i144.refundMoney = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,150] //ไม่มีเงินคืน //เงินคืนระหว่างสัญญา
i144.refundMoneyText = "ไม่มีเงินคืนระหว่างสัญญา" //เงินคืนระหว่างสัญญา_ข้อความ
i144.refundMoneyLast = 150 // percent % //เงินคืนครบกำหนดสัญญา
i144.healthCheck = false //การตรวจสุขภาพ
i144.healthCheckText = "ยกเว้นการตรวจสุขภาพ" //การตรวจสุขภาพ_ข้อความ
i144.healthCheckInsuranceMoney = 0 //ยกเว้นการตรวจ
//การตรวจสุขภาพเมื่อทุนประกันเกิน
i144.rider = false //ไม่สามารถซื้อได้ //สัญญาเพิ่มเติม
i144.tax = 100 //อัตราลดหย่อยภาษี
i144.decimalMprem = 0 //ทศนิยม_เบี้ยประกัน
i144.decimalRefund = 0 //ทศนิยม_เงินคืน
i144.decimalRefundLast = 2 //ทศนิยม_เงินครบกำหนดสัญญา
i144.decimalPension = 0 //ทศนิยม_เงินบำนาญ
i144.insuranceImageName = "imagePrint"
i144.insuranceImagePrint = "imagePrint" 
i144.insuranceDataCV = "i144_CV"
i144.insuranceDataPremium = "i144Premium"
i144.DataPremiumMemory = []

i144.commission = function(prospect,insuranceObject){
    let money = Number(insuranceObject.insuranceMoney)
    let age = Number(prospect.genderId)

    if(money >= 500 && money <= 900){
        return 20
    }else if(money >= 1000 && money <= 1400){
        return 25
    }else if(money >= 1500){
        return 30
    }else{
        return 0
    }
}


export default i144