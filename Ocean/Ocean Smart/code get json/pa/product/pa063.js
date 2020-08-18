import paData from '../paData'
import pa063Premium from '../../../json/pa/pa_โอเชี่ยนไลฟ์พีเอวีไอพี.json'


let pa063 = Object.assign({}, paData);
pa063.paCode = "PA063";
pa063.paName = "โอเชี่ยนไลฟ์ พีเอ วีไอพี";
pa063.paPlan = [2000000,3000000];
pa063.paCompensatePlan = [1000];
pa063.paPlanMode = "12";
pa063.paPremium = function(sex,age,plan,cashback){
    let premium = pa063Premium.filter(d => d.AGE === Number(age) && d.PLAN === Number(plan))[0]
    return premium.RPRM
}


pa063.commission = function(insuranceObject,prospect){
    let plan = Number(insuranceObject.paPlan)
    return 12
}


export default pa063