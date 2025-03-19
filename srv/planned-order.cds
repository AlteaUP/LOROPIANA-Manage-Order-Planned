using {cds_ui_rfm_mng_mstrplndord as external_planned_order} from '../srv/external/planned-order';

@path: '/api'
service PlannedOrderService {
  entity PlannedOrders as projection on external_planned_order.C_RFM_ManageMfgOrder;
}
