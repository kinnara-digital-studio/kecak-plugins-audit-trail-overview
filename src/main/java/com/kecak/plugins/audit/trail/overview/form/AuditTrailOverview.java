package com.kecak.plugins.audit.trail.overview.form;

import java.util.Collection;
import java.util.LinkedList;
import java.util.Map;
import java.util.List;

import org.joget.apps.app.service.AppUtil;
import org.joget.apps.form.model.Element;
import org.joget.apps.form.model.FormBuilderPaletteElement;
import org.joget.apps.form.model.FormData;
import org.joget.apps.form.service.FormUtil;
import org.joget.commons.util.LogUtil;
import org.joget.workflow.model.WorkflowActivity;
import org.joget.workflow.model.service.WorkflowManager;
import org.joget.workflow.util.WorkflowUtil;
import org.springframework.context.ApplicationContext;

public class AuditTrailOverview extends Element implements FormBuilderPaletteElement{

    @Override
    public String getFormBuilderTemplate() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getFormBuilderTemplate'");
        return "Audit Trail Overview";
    }

    @Override
    public String getClassName() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getClassName'");
        return AuditTrailOverview.class.getName();
    }

    @Override
    public String getLabel() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getLabel'");
        return "Audit Trail Overview";
    }

    @Override
    public String getPropertyOptions() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getPropertyOptions'");
        return AppUtil.readPluginResource(getClassName(), "/properties/atoverview.json");

    }

    @Override
    public String getDescription() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getDescription'");
        return getClass().getPackage().getImplementationTitle();
    }

    @Override
    public String getName() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getName'");
        return "Audit Trail Overview";
    }

    @Override
    public String getVersion() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getVersion'");
        return getClass().getPackage().getImplementationVersion();

    }

    @Override
    public String getFormBuilderCategory() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getFormBuilderCategory'");
        return "Kecak";
    }

    @Override
    public String getFormBuilderIcon() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getFormBuilderIcon'");
        return null;
    }

    @Override
    public int getFormBuilderPosition() {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'getFormBuilderPosition'");
        return 100;
    }

    @Override
    public String renderTemplate(FormData formData, Map dataModel) {
        // TODO Auto-generated method stub
        // throw new UnsupportedOperationException("Unimplemented method 'renderTemplate'");
        Map<String, String>[] propertyGrid = getPropertyGrid("step");
        dataModel.put("propertyGrid", propertyGrid);


        ApplicationContext appContext = AppUtil.getApplicationContext();
        WorkflowManager wfManager = (WorkflowManager)appContext.getBean("workflowManager");

        // wfManager.getAssignmentByRecordId(PARAMETER_AS_OPTIONS, PARAMETER_OPTIMIZE_READONLY_ELEMENTS, PARAMETER_DATA_JSON_CONTROLLER, PARAMETER_AS_OPTIONS)
        if (formData.getPrimaryKeyValue() != null)
        {
            String activityId = wfManager.getRunningActivityIdByRecordId(formData.getPrimaryKeyValue(), null, null, WorkflowUtil.getCurrentUsername());
            Collection<WorkflowActivity> history = wfManager.getPreviousActivities(activityId, false);
            LogUtil.info(getClassName(), "History length: " + String.valueOf(history.size()));

            List<String> activityDefID = new LinkedList<>();

            String last = "";
            for (WorkflowActivity items:history)
            {
                LogUtil.info(getClassName(), "Activity Def ID: " + items.getActivityDefId());
                activityDefID.add(items.getActivityDefId());
                String [] arr = ((LinkedList<String>) activityDefID).getLast().split(";");
                last = ((LinkedList<String>) activityDefID).getLast();
            }

            LogUtil.info(getClassName(), "in Index: " + activityDefID.indexOf(last));
            dataModel.put("index", activityDefID.indexOf(last));
        }

        return FormUtil.generateElementHtml(this, formData, "atoverview.ftl", dataModel);
    }
    
}
