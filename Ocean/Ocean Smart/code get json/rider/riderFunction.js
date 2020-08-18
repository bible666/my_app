//Json
import cpaJson from '../../json/rider/cpa/cpa.json'
import cpa26Json from '../../json/rider/cpa/cpa26.json'
import dabJson from '../../json/rider/dab/dab.json'
import dab2Json from '../../json/rider/dab/dab2.json'
import hcJson from '../../json/rider/hc/hc.json'
import hcTotalJson from '../../json/rider/hc/hctotal.json'
import pbJson from '../../json/rider/pb/pb.json'
import cbJson from '../../json/rider/cb/cb.json'
import ciJson from '../../json/rider/ci/ci.json'
import ci50Json from '../../json/rider/ci/ci50.json'

import opdJson from '../../json/rider/opd/opd.json'
import hpJson from '../../json/rider/hp/hp.json'

let riderFunction = {
    cpaRprm:function(){},
    cpa26Rprm:function(){},
    dabRprm:function(){},
    dab2Rprm:function(){},
    hcRprm:function(){},
    hcTotalRprm:function(){},
    pbRprm:function(){},
    cbRprm:function(){},
    ciRprm:function(){},
    ci50Rprm:function(){},
    opdRprm:function(){},
    hpRprm:function(){},
    cpaCommission:function(){},
    dabCommission:function(){},
    hcCommission:function(){},
    pbCommission:function(){},
    cbCommission:function(){},
    ciCommission:function(){},
    opdCommission:function(){},
    hpCommssion:function(){}
}



riderFunction.cpaCommission = function(insuranceData,insuranceObject,prospect){
    let cpaRprm = insuranceObject.cpaName === "CPA" ? riderFunction.cpaRprm(insuranceObject,prospect) : riderFunction.cpa26Rprm(insuranceObject,prospect)
    let cpaPercent = 30
    let cpaComission = cpaRprm * (cpaPercent / 100)
    return {rprm:Number(cpaRprm),percent:Number(cpaPercent),commission:Number(cpaComission)}
}

riderFunction.dabCommission = function(insuranceData,insuranceObject,prospect){
    let dabRprm = insuranceObject.dabName === "DAB" ? riderFunction.dabRprm(insuranceObject,prospect) : riderFunction.dab2Rprm(insuranceObject,prospect)
    let dabPercent = 15
    let dabComission = dabRprm * (dabPercent / 100)
    return {rprm:Number(dabRprm),percent:Number(dabPercent),commission:Number(dabComission)}
}

riderFunction.hcCommission = function(insuranceData,insuranceObject,prospect){
    let hcRprm = insuranceObject.hcName === "HC" ? riderFunction.hcRprm(insuranceObject,prospect) : riderFunction.hcTotalRprm(insuranceObject,prospect)
    let hcPercent = 15
    let hcComission = hcRprm * (hcPercent / 100)
    return {rprm:Number(hcRprm),percent:Number(hcPercent),commission:Number(hcComission)}
}

riderFunction.pbCommission = function(insuranceData,insuranceObject,prospect){
    let pbRprm = riderFunction.pbRprm(insuranceData,insuranceObject,prospect)           
    let pbPercent = 15
    let pbCommission = pbRprm * (pbPercent / 100)
    return {rprm:Number(pbRprm),percent:Number(pbPercent),commission:Number(pbCommission)}
}

riderFunction.cbCommission = function(insuranceData,insuranceObject,prospect){
    let cbRprm = riderFunction.cbRprm(insuranceObject,prospect)
    let cbPercent = 20
    let cbCommission = cbRprm * (cbPercent / 100)
    return {rprm:Number(cbRprm),percent:Number(cbPercent),commission:Number(cbCommission)}
}

riderFunction.ciCommission = function(insuranceData,insuranceObject,prospect){
    let ciRprm = insuranceObject.ciName === "CI" ? riderFunction.ciRprm(insuranceObject,prospect) : riderFunction.ci50Rprm(insuranceObject,prospect)
    let ciPercent = 20
    let ciCommission = ciRprm * (ciPercent/100)
    return {rprm:Number(ciRprm),percent:Number(ciPercent),commission:Number(ciCommission)}

}

riderFunction.opdCommission = function(insuranceData,insuranceObject,prospect){
    let opdRprm = 0
    let opdPercent = 20
    let opdCommission = opdRprm * (opdPercent/100)
    return {rprm:Number(opdRprm),percent:Number(opdPercent),commission:Number(opdCommission)}
}

riderFunction.hpCommission = function(insuranceData,insuranceObject,prospect){
    let hpRprm = 0
    let hpPercent = 20
    let hpCommission = hpRprm * (hpPercent/100)
    return {rprm:Number(hpRprm),percent:Number(hpPercent),commission:Number(hpCommission)}
}

riderFunction.cpaRprm = function (insuranceObject,prospect){
    let cpaMoney = Number(insuranceObject.cpaMoney.split(',').join('') / 100000)
    let cpa = (cpaJson.filter(d => d.PAMOD === insuranceObject.insuranceMode )[0].PARPRM) * cpaMoney
    return cpa
      
}

riderFunction.cpa26Rprm = function(insuranceObject,prospect){
    let cpaMoney = Number(insuranceObject.cpaMoney.split(',').join('') / 100000)
    let cpa = (cpa26Json.filter(d => d.PAMOD === insuranceObject.insuranceMode )[0].PARPRM) * cpaMoney
    return cpa 
}

riderFunction.dabRprm = function(insuranceObject,prospect){
    let dabMoney = Number(insuranceObject.dabMoney.split(',').join('') / 100)
    let dab = (dabJson.filter(d => d.MODE === insuranceObject.insuranceMode && d.AGE === prospect.age)[0].RPRM) * dabMoney
    return dab
}

riderFunction.dab2Rprm = function(insuranceObject,prospect){
    let dabMoney = Number(insuranceObject.dabMoney.split(',').join('') / 100)
    let dab = (dab2Json.filter(d => d.MODE === insuranceObject.insuranceMode && d.AGE === prospect.age)[0].RPRM) * dabMoney
    return dab
}

riderFunction.hcRprm = function(insuranceObject,prospect){
    let sex = prospect.genderId === 1 ? "M" : "F"
    let hcMoney = insuranceObject.hcMoney
    let value =  hcJson.filter(d => d.PLAN === hcMoney && d.MODE === insuranceObject.insuranceMode && d.SEX === sex && d.AGE === prospect.age)[0].RPRM
    let hc =  parseInt(value.split(',').join(''))
    return hc
}

riderFunction.hcTotalRprm = function(insuranceObject,prospect){
    let hcMoney = insuranceObject.hcMoney
    let hc = hcTotalJson.filter(d => d.PLAN === Number(hcMoney) && d.SEX === prospect.genderId && d.AGE === prospect.age)[0].RPRM
    return hc

}

riderFunction.pbRprm = function(insuranceData,insuranceObject,prospect){
            //คำนวณหาระยะเวลาคุ้มครอง
            let pbSex = insuranceObject.pbSex 
            let pbBirthYear = insuranceObject.pbBirthYear
            let pbAge = insuranceObject.pbAge
            let x = 65 - Number(pbAge)
            let y = 25 - Number(prospect.age)
            var z = 0
            
            if(insuranceData.protectPaymentAge){
                z = insuranceData.timePayment - prospect.age
            }else{
                z = insuranceData.timePayment
            }
            
            var year = 0
            if(x <= y && x <= z){
                year = x
            }else if(y <= x && y <= z){
                year = y
            }else if(z <= x && z <= y){
                year = z
            }

            console.log("pb year " + year)
            var rate = pbJson.filter(d => d.AGE === pbAge && d.SEX === pbSex === 1 ? "M" : "F" && d.RTM === year)[0].RPRM
            var mprem = 0
            if(insuranceData.discount){
                //มีส่วนลด
                mprem = insuranceData.mpremDisount(prospect,insuranceObject)
            }else{
                mprem = insuranceData.mprem(prospect,insuranceObject)
            }
            console.log("MY PB " + rate + " rm = " + mprem)
            rate = ((rate * mprem) / 10000).toFixed(2)
            return Number(rate)
    
}

riderFunction.cbRprm = function(insuranceObject,prospect){
    let cbMoney = Number(insuranceObject.cbMoney.split(',').join('') / 100)
    cb = ((cbJson.filter(d => d.MODE === insuranceObject.insuranceMode && d.AGE === prospect.age && d.SEX === prospect.genderId)[0].RPRM) * cbMoney) / 10000
    return cb
}

riderFunction.ciRprm = function(insuranceObject,prospect){
    let sex = prospect.genderId === 1 ? "M" : "F"
    let ciMoney = insuranceObject.ciMoney
    ci = ciJson.filter(d => d.PLAN === ciMoney && d.SEX === sex && d.AGE === prospect.age && d.MODE === insuranceObject.insuranceMode)[0].RPRM
    return ci

}

riderFunction.ci50Rprm = function(insuranceObject,prospect){
    var ci = 0
    let ciMoney = Number(insuranceObject.ciMoney.split(',').join(''))
    let filterData = ci50Json.filter(d => d.SEX === prospect.genderId && d.AGE === prospect.age)[0]
    if(insuranceObject.insuranceMode === 12){
         ci = (filterData.P12 * ciMoney) / 1000
    }else if(insuranceObject.insuranceMode === 6){
         ci = (filterData.P6 * ciMoney) / 1000
    }else if(insuranceObject.insuranceMode === 3){
         ci = (filterData.P3 * ciMoney ) / 1000  
    }else if(insuranceObject.insuranceMode === 1){
         ci = (filterData.P1 * ciMoney) / 1000 
    }

    return ci
}

riderFunction.opdRprm = function(insuranceObject,prospect){
    let opdMoney = insuranceObject.opdMoney
    let filterData = opdJson.filter(d => d.PLAN === opdMoney && d.SEX === prospect.genderId.toString() && d.AGE === prospect.age && d.MODE === insuranceObject.insuranceMode)
    return filterData[0].RPRM
}

riderFunction.hpRprm = function(insuranceObject,prospect){
    let hpMoney = insuranceObject.hpMoney
    
    let filterData = hpJson.filter(d => d.PLAN === hpMoney+" " && d.SEX === prospect.genderId.toString() && d.AGE === prospect.age && d.MODE === insuranceObject.insuranceMode)
    console.log("HP FILTER "+hpMoney)
    console.log(filterData)
    console.log(hpJson)
    return filterData[0].RPRM
}

export default riderFunction