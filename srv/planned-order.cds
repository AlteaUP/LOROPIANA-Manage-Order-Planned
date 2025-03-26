using {planned_order} from '../srv/external/planned-order';


@path: '/api'
service PlannedOrderService {
  @readonly
  entity C_RFM_ManageCombinedPlndOrder as
    projection on planned_order.C_RFM_ManageCombinedPlndOrder
    excluding {
      C_RFM_ManageCombinedPlndOrder
    };

  @readonly
  entity C_RFM_ManageMasterPlndOrder   as projection on planned_order.C_RFM_ManageMasterPlndOrder;

  @readonly
  entity C_RFM_ManagePlndOrder         as projection on planned_order.C_RFM_ManagePlndOrder;

  @readonly
  entity C_RFM_MngCombinedPlndOrdComp  as projection on planned_order.C_RFM_MngCombinedPlndOrdComp;

  @readonly
  entity C_RFM_MngMasterPlndOrdComp    as projection on planned_order.C_RFM_MngMasterPlndOrdComp;

}
