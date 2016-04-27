<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" onclick="save('save')" form="form-perpetual-payments" data-toggle="tooltip" title="" class="btn btn-success" data-original-title="Save">
                    <i class="fa fa-check"></i></button>
                <button type="submit" form="form-perpetual-payments" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Save & Close">
                    <i class="fa fa-save text-success"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-times-circle text-danger"></i></a>
            </div>
            <h1><?php echo $heading_title; ?></h1>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-perpetual-payments" class="form-horizontal">
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-auth-id"><?php echo $entry_auth_id; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="perpetual_payments_auth_id" value="<?php echo $perpetual_payments_auth_id; ?>" placeholder="<?php echo $entry_auth_id; ?>" id="input-auth-id" class="form-control"/>
                            <?php if ($error_auth_id) { ?>
                            <div class="text-danger"><?php echo $error_auth_id; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group required">
                        <label class="col-sm-2 control-label" for="input-auth-pass"><?php echo $entry_auth_pass; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="perpetual_payments_auth_pass" value="<?php echo $perpetual_payments_auth_pass; ?>" placeholder="<?php echo $entry_auth_pass; ?>" id="input-auth-pass" class="form-control"/>
                            <?php if ($error_auth_pass) { ?>
                            <div class="text-danger"><?php echo $error_auth_pass; ?></div>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_test; ?>"><?php echo $entry_test; ?></span></label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <?php if ($perpetual_payments_test) { ?>
                                <input type="radio" name="perpetual_payments_test" value="1" checked="checked"/>
                                <?php echo $text_yes; ?>
                                <?php } else { ?>
                                <input type="radio" name="perpetual_payments_test" value="1"/>
                                <?php echo $text_yes; ?>
                                <?php } ?>
                            </label>
                            <label class="radio-inline">
                                <?php if (!$perpetual_payments_test) { ?>
                                <input type="radio" name="perpetual_payments_test" value="0" checked="checked"/>
                                <?php echo $text_no; ?>
                                <?php } else { ?>
                                <input type="radio" name="perpetual_payments_test" value="0"/>
                                <?php echo $text_no; ?>
                                <?php } ?>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_total; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="perpetual_payments_total" value="<?php echo $perpetual_payments_total; ?>" placeholder="<?php echo $entry_total; ?>" id="input-total" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
                        <div class="col-sm-10">
                            <select name="perpetual_payments_order_status_id" id="input-order-status" class="form-control">
                                <?php foreach ($order_statuses as $order_status) { ?>
                                <?php if ($order_status['order_status_id'] == $perpetual_payments_order_status_id) { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-geo-zone"><?php echo $entry_geo_zone; ?></label>
                        <div class="col-sm-10">
                            <select name="perpetual_payments_geo_zone_id" id="input-geo-zone" class="form-control">
                                <option value="0"><?php echo $text_all_zones; ?></option>
                                <?php foreach ($geo_zones as $geo_zone) { ?>
                                <?php if ($geo_zone['geo_zone_id'] == $perpetual_payments_geo_zone_id) { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                        <div class="col-sm-10">
                            <select name="perpetual_payments_status" id="input-status" class="form-control">
                                <?php if ($perpetual_payments_status) { ?>
                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                <option value="1"><?php echo $text_enabled; ?></option>
                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
                        <div class="col-sm-10">
                            <input type="text" name="perpetual_payments_sort_order" value="<?php echo $perpetual_payments_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
function save(type) {
    var input   = document.createElement('input');
    input.type  = 'hidden';
    input.name  = 'button';
    input.value = type;
    form        = $("form[id^='form-']").append(input);
    form.submit();
}
//--></script>
<?php echo $footer; ?>