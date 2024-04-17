<head>
    <style>
        <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
    </style>
</head>

<div class="form-cell" ${elementMetaData!}>
    <style>
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
            <#--  background-color: #ccc;  -->
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
            <#--  background-color: #2C3E50;  -->
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
            height: 14rem;
            justify-content: space-between;
            align-items: center;
            background-color: white;
        }

        .workflow-bar{
            width: 100%;
            display: flex;
            height: 1rem;
            justify-content: space-between;
            align-items: center;
            background-color: #998479;
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
            background-color: #808080;
            border-radius: 50%;
            border: 5px solid #ccc;
            transition: 0.3s ease;
        }

        #workflow-progress .progress-bar .step-check:after {
            content: "";
            position: absolute;
            z-index: -1;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            width: 75px;
            height: 75px;
            background-color: #4591a7;
            border-radius: 50%;
            border: 5px solid #ccc;
            transition: 0.3s ease;
        }

        #workflow-progress .progress-bar .step-editing:after {
            content: "";
            position: absolute;
            z-index: -1;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            width: 75px;
            height: 75px;
            background-color: #FFAE42;
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
            <#--  background-color: #34AD16;  -->
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
    </style>

    <div id="main-container">
        <div class="step-1" id="workflow-progress" data-current-step="1">
            <div class="progress-bar">
                <div class="workflow-bar">
                    <#list propertyGrid! as items>
                        <#if items?index < index!-1>
                        <div class="step step-check step-${items?index}"><span class="material-icons"><i class='fa fa-${items["icon"]}' aria-hidden="true"></i></span>
                        <div class="fa fa-check opaque"></div>
                        <div class="step-label">
                                <div class="step-label-name" id="${items?index}">${items["label"]}</div>
                            </div>
                        </div>
                        <#elseif items?index = index!-1>
                        <div class="step step-editing step-${items?index}"><span class="material-icons"><i class='fa fa-${items["icon"]}'></i></span>
                        <div class="fa fa-check opaque"></div>
                        <div class="step-label">
                                <div class="step-label-name" id="${items?index}">${items["label"]}</div>
                            </div>
                        </div>
                        <#else>
                        <div class="step step-${items?index}"><span class="material-icons"><i class='fa fa-${items["icon"]}'></i></span>
                        <div class="fa fa-check opaque"></div>
                        <div class="step-label">
                                <div class="step-label-name" id="${items?index}">${items["label"]}</div>
                            </div>
                        </div>
                        </#if>
                    </#list>
                </div>                
            </div>
        </div>
    </div>
</div>
