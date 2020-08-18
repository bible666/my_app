
import paData from './paData'

let paNull = Object.assign({}, paData);
paNull.paCode = "";
paNull.paName = "ไม่เลือกซื้อ";
paNull.paPlan = [];
paNull.paCompensatePlan = [];
paNull.paPlanMode = "";

paNull.paPremium = function(sex,age,plan,cashback){
  return 0
}

export default paNull
