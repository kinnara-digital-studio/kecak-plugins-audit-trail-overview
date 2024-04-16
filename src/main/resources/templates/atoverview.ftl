<div class="form-cell" ${elementMetaData!}>
    <style>
        :root {
            /*---------------------------------
   Configure the number of Nodes-1
  ---------------------------------*/
            --NumberOfWorkflowTransitions: 5;
        }

        .hidden {
            display: none;
        }

        .opaque {
            opacity: 0;
            transition: 0.3s ease;
        }

        .disabled {
            opacity: 0.4;
            pointer-events: none;
        }

        .status-label {
            display: none;
        }

        * {
            box-sizing: border-box;
        }

        #workflow-progress {
            width: 90%;
            margin: 0px auto;
            font-size: 2.5em;
            font-weight: 900;
            position: relative;
        }

        @media (max-width: 767px) {
            #workflow-progress {
                font-size: 1.5em;
            }
        }

        #workflow-progress:before {
            content: "";
            position: absolute;
            left: 0;
            top: 50%;
            height: 20px;
            width: 100%;
            background-color: #ccc;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
        }

        #workflow-progress:after {
            content: "";
            position: absolute;
            left: 0;
            top: 50%;
            height: 20px;
            width: 100%;
            background-color: #2C3E50;
            -webkit-transform: scaleX(0) translateY(-50%);
            transform: scaleX(0) translateY(-50%);
            -webkit-transform-origin: left center;
            transform-origin: left center;
            transition: -webkit-transform 0.5s ease;
            transition: transform 0.5s ease;
            transition: transform 0.5s ease, -webkit-transform 0.5s ease;
        }

        #workflow-progress.step-2:after {
            -webkit-transform: scaleX(calc(1/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(1/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-3:after {
            -webkit-transform: scaleX(calc(2/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(2/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-4:after {
            -webkit-transform: scaleX(calc(3/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(3/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-5:after {
            -webkit-transform: scaleX(calc(4/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(4/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-6:after {
            -webkit-transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-7:after {
            -webkit-transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-8:after {
            -webkit-transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-9:after {
            -webkit-transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress.step-10:after {
            -webkit-transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
            transform: scaleX(calc(5/var(--NumberOfWorkflowTransitions))) translateY(-50%);
        }

        #workflow-progress .progress-bar {
            width: 100%;
            display: flex;
            height: 200px;
            justify-content: space-between;
            align-items: center;
        }

        #workflow-progress .progress-bar .step {
            z-index: 2;
            position: relative;
        }

        #workflow-progress .progress-bar .step .step-label {
            position: absolute;
            top: calc(100% + 25px);
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%);
            white-space: nowrap;
            font-size: 0.4em;
            font-weight: 600;
            color: #ccc;
            transition: 0.3s ease;
        }

        @media (max-width: 767px) {
            #workflow-progress .progress-bar .step .step-label {
                top: calc(100% + 15px);
            }
        }

        #workflow-progress .progress-bar .step span {
            color: #ccc;
            transition: 0.3s ease;
            display: block;
            -webkit-transform: translate3d(0, 0, 0) scale(1);
            transform: translate3d(0, 0, 0) scale(1);
        }

        #workflow-progress .progress-bar .step .fa-check {
            color: #fff;
            position: absolute;
            left: 50%;
            top: 50%;
            transition: -webkit-transform 0.3s ease;
            transition: transform 0.3s ease;
            transition: transform 0.3s ease, -webkit-transform 0.3s ease;
            -webkit-transform: translate3d(-50%, -50%, 0) scale(0);
            transform: translate3d(-50%, -50%, 0) scale(0);
        }

        #workflow-progress .progress-bar .step.active span,
        #workflow-progress .progress-bar .step.active .step-label {
            color: #C80000;
        }

        #workflow-progress .progress-bar .step.valid .fa-check {
            -webkit-transform: translate3d(-50%, -50%, 0) scale(1);
            transform: translate3d(-50%, -50%, 0) scale(1);
        }

        #workflow-progress .progress-bar .step.valid span {
            color: #34AD16;
            -webkit-transform: translate3d(0, 0, 0) scale(2);
            transform: translate3d(0, 0, 0) scale(2);
        }

        #workflow-progress .progress-bar .step.valid .step-label {
            color: #34AD16 !important;
            display: block;
        }

        #workflow-progress .progress-bar .step:after {
            content: "";
            position: absolute;
            z-index: -1;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            width: 75px;
            height: 75px;
            background-color: #fff;
            border-radius: 50%;
            border: 5px solid #ccc;
            transition: 0.3s ease;
        }

        @media (max-width: 767px) {
            #workflow-progress .progress-bar .step:after {
                width: 40px;
                height: 40px;
            }
        }

        #workflow-progress .progress-bar .step.active:after {
            border: 5px solid #C80000;
            background: gold;
        }

        #workflow-progress .progress-bar .step.valid:after {
            background-color: #34AD16;
            border: 5px solid #34AD16;
        }

        .substate-active:before {
            content: "<";
        }

        .substate-active {
            font-weight: bold;
        }

        .substate-active:after {
            content: ">";
        }

        #workflow-progress .progress-bar .step-label-substates ul {
            margin-top: 10px;
        }

        .material-icons {
            font-size: 48px;
        }

        /*-------------------------------------------*/
        /*------TEST CODE TO BE REMOVED IN PROD------*/
        /*-------------------------------------------*/
        .button-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            width: 100%;
            margin: 100px auto 0px;
        }

        .button-container .btn {
            display: inline-block;
            background-color: #2C3E50;
            color: #fff;
            padding: 10px 15px;
            border-radius: 10px;
            text-transform: uppercase;
            font-weight: 900;
            border: 3px solid #2C3E50;
            transition: 0.3s ease;
            cursor: pointer;
            text-align: center;
        }

        @media (max-width: 767px) {
            .button-container .btn {
                width: 100%;
                margin-bottom: 15px;
            }
        }

        .button-container .btn:hover {
            background-color: transparent;
            color: #2C3E50;
            -webkit-transform: scale(1.02);
            transform: scale(1.02);
        }
    </style>

    <div id="main-container">
        <div class="step-1" id="workflow-progress" data-current-step="1">
            <div class="progress-bar">
                <#list propertyGrid! as items>
                    <div class="step step-${items?index}"><span class="material-icons">${items["icon"]}</span>
                        <#if items?index <= index>
                        <div class="fa fa-check opaque">Index: ${index}</div>
                        <#else>
                        <div class="fa fa-check opaque">Not inside index</div>
                        </#if>
                        <div class="step-label">
                            <div class="step-label-name" id="${items?index}">${items["label"]}</div>
                        </div>
                    </div>
                </#list>

<#--                  

                <div class="step step-2"><span>A</span>
                    <div class="fa fa-check opaque"></div>
                    <div class="step-label">
                        <div class="step-label-name" id="2">Assessment</div>
                    </div>
                </div>

                <div class="step step-3"><span class="fas fa-edit"></span>
                    <div class="fa fa-check opaque"></div>
                    <div class="step-label">
                        <div class="step-label-name" id="3">Review</div>
                        <div class="step-label-substates" style="position:absolute; font-size:0.8em;">
                            <ul>
                                <li class="step-label-substate" id='3.1'>In Progress</li>
                                <li class="step-label-substate" id="3.2">Rejected</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="step step-4"><span>M</span>
                    <div class="fa fa-check opaque"></div>
                    <div class="step-label">
                        <div class="step-label-name" id="4">Mitigation</div>
                    </div>
                </div>

                <div class="step step-5"><span class="fa fa-hourglass"></span>
                    <div class="fa fa-check opaque"></div>
                    <div class="step-label">
                        <div class="step-label-name" id="5">Wait Decision</div>
                        <div class="step-label-substates" style="position:absolute; font-size:0.8em;">
                            <ul>
                                <li class="step-label-substate" id="5.1">In Progress</li>
                                <li class="step-label-substate" id="5.2">Rejected</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="step step-6"><span class="fa fa-award"></span>
                    <div class="fa fa-check opaque"></div>
                    <div class="step-label">
                        <div class="step-label-name" id="6">Complete</div>
                    </div>
                </div>  -->

            </div>
        </div>
    </div>
    <!----------------------------------->
    <!--TEST CODE TO BE REMOVED IN PROD-->
    <!------------------------------------>
    <#--  <div class="button-container">
        <div class="btn btn-prev disabled"> previous step</div>
        <div class="btn btn-next"> next step</div>
        <div class="btn btn-reset">Reset</div>
    </div>  -->
    <#--  <script>
        //#####################################
        // WOPROG - Workflow Progress Bar v0.1
        // By Luciano Veronese
        // December 2018
        //#####################################

        //---------------------
        // Values to be updated
        //---------------------
        var NumberOfWorkflowNodes = 6; /* Number of Workflow Nodes */
        var TxtVLId = 26351; // Field ID of the values list (flat, text, calculated) that hosts the workflow status
        //---------------------

        var stateMap = new Map();
        var substateIdMap = new Map();
        var nTargetState;
        var nTargetSubState;

        //Sys.Application.add_load(function() { // When the webform is loaded...
        console.log("_______WOPROG CUSTOM OBJECT START_______");
        debugger;
        // Fetch the value of the target WF state 
        var sVLvalue = $('[id*="f' + TxtVLId + 'c"]').text().trim();
        // Get main state name (remove possible substates)
        // Substates are VL items below the main state and that start with the '>' separator
        //var sTargetState=(sVLvalue.split('>'))[0]; 
        //var sTargetSubState=(sVLvalue.split('>'))[1]; 
        sTargetState = "Review";
        sTargetSubState = "In Progress";

        // Read the HTML structure to map the values list names and the IDs
        $('.progress-bar .step-label').each(function (index) {
            var sCurrentMainState = $(this).children("div.step-label-name").text();
            stateMap.set(sCurrentMainState, index + 1); // Build map [state name, state number]

            var ultag = $(this).children("div.step-label-substates"); // Check if substates are defined
            if (ultag.html()) {
                // Substates are defined in the HTML, so build the map [substate name, ID] 
                ultag.find("li").each(function (i) {
                    substateIdMap.set(sCurrentMainState + ">" + $(this).text(), $(this).attr("id"));
                });
            }
        });

        // Get the numeric ID of the active main state (used to land the animation to)
        nTargetState = stateMap.get(sTargetState);
        console.log("Active Main State: " + sTargetState + ", " + nTargetState);

        console.log("---MAIN STATES---");
        const sm = stateMap.forEach((v, k) => { console.log(v, k); });
        console.log("---DETECTED SUB STATES---");
        const ssm = substateIdMap.forEach((v, k) => { console.log(v, k); });

        /* Start from the beginning and run the animation until the landing state */
        reset();
        for (var i = 1; i < nTargetState; i++)
            StepForward();

        // Check is an active substates (AFTER the animation) is defined  so we have to apply the style
        if (sTargetSubState) {
            // Get unique substate identifier as substates might have the same name, but different IDs
            var SubstateID = substateIdMap.get(sTargetState + ">" + sTargetSubState);
            console.log("Styling active substate: " + sTargetState + ">" + sTargetSubState + ", " + SubstateID);
            $("[id='" + SubstateID + "']").addClass('substate-active');
        }

        //});

        //-----------------------
        // Reset the workflow bar
        //-----------------------
        function reset() {
            $('#workflow-progress').data('current-step', 0);

            // Reset all the classes
            $(".step").each(function () {
                $(this).removeClass("active");
                $(this).find('span').removeClass('opaque');
                $(this).removeClass("valid");
                $(this).find('.fa.fa-check').addClass('opaque');
            });
            // Set first state active
            StepForward();
            // Remove formatting of substates
            $(".progress-bar").find(".step-label-substate").removeClass('substate-active');
        }

        //---------------------------------------
        // Move the workflow bar one step forward
        //---------------------------------------
        function StepForward() {
            var currentStepNum = $('#workflow-progress').data('current-step');
            var nextStepNum = (currentStepNum + 1);
            var currentStep = $('.step.step-' + currentStepNum);
            var nextStep = $('.step.step-' + nextStepNum);
            var progressBar = $('#workflow-progress');

            $('.workflow-progress').removeClass('.step-' + currentStepNum).addClass('.step-' + (currentStepNum + 1));

            currentStep.removeClass('active').addClass('valid');
            currentStep.find('span').addClass('opaque');
            currentStep.find('.fa.fa-check').removeClass('opaque');

            nextStep.addClass('active');
            progressBar.removeAttr('class').addClass('step-' + nextStepNum).data('current-step', nextStepNum);

            /*------TEST CODE TO BE REMOVED IN PROD------*/
            $('.btn-prev').removeClass('disabled');
            if (currentStepNum > NumberOfWorkflowNodes) { return false; }
            if (nextStepNum == NumberOfWorkflowNodes) { $(this).addClass('disabled'); }
        }

        /*-------------TEST CODE TO BE REMOVED IN PROD-------------*/

        $('.btn-reset').on('click', reset);

        $('.btn-next').on('click', StepForward);

        $('.btn-prev').on('click', function () {
            var currentStepNum = $('#workflow-progress').data('current-step');
            var prevStepNum = (currentStepNum - 1);
            var currentStep = $('.step.step-' + currentStepNum);
            var prevStep = $('.step.step-' + prevStepNum);
            var progressBar = $('#workflow-progress');
            $('.btn-next').removeClass('disabled');
            if (currentStepNum == 1) {
                return false;
            }
            if (prevStepNum == 1) {
                $(this).addClass('disabled');
            }
            $('.workflow-progress').removeClass('.step-' + currentStepNum).addClass('.step-' + (prevStepNum));

            currentStep.removeClass('active');
            prevStep.find('span').removeClass('opaque');
            prevStep.find('.fa.fa-check').addClass('opaque');

            prevStep.addClass('active').removeClass('valid');
            progressBar.removeAttr('class').addClass('step-' + prevStepNum).data('current-step', prevStepNum);
        });

        $("div.step.step-1").on("click", function () {

            var nTargetState = stateMap.get(sTargetState);
            console.log(sTargetState);
            reset();
            for (var i = 1; i <= nTargetState - 1; i++)
                StepForward();
        });

    </script>  -->
</div>
