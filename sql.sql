CREATE TABLE `USERS` (
  `user_id` <type>,
  `username` <type>,
  `firstname` <type>,
  `lastname` <type>,
  `designation` <type>,
  `roles` <type>,
  `department` <type>,
  PRIMARY KEY (`user_id`)
);

CREATE TABLE `TREATMENTS` (
  `id` <type>,
  `risk_id` <type>,
  `treatment_name` <type>,
  `treatment_description` <type>,
  `owner_id` <type>,
  `start_date` <type>,
  `end_date` <type>,
  `progress` <type>,
  `status` <type>,
  `budget` <type>,
  `division` <type>,
  PRIMARY KEY (`id`)
);

CREATE TABLE `RISKS` (
  `id` <type>,
  `risk_id` <type>,
  `risk_name` <type>,
  `risk_owner_id` <type>,
  `priority` <type>,
  `risk_description` <type>,
  `residual_impact` <type>,
  `residual_likelihood` <type>,
  `risk_exposure` <type>,
  `relevance_to_objectives` <type>,
  `risk_management_capacity` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`risk_owner_id`) REFERENCES `USERS`(`user_id`)
);

CREATE TABLE `IDENTIFIED RISKS` (
  `id` <type>,
  `risk_identification_id` <type>,
  `identified_risk_name` <type>,
  `identified_risk_description` <type>,
  `estimated_likelihood` <type>,
  `priority` <type>,
  `identified_by` <type>,
  `date_identified` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`identified_by`) REFERENCES `USERS`(`user_id`),
  KEY `UN` (`risk_identification_id`)
);

CREATE TABLE `DISCUSSIONS` (
  `id` <type>,
  `Discussion_owner_id` <type>,
  `item_id(eg RTI01)` <type>,
  `discussion_text` <type>,
  `date` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Discussion_owner_id`) REFERENCES `USERS`(`user_id`),
  FOREIGN KEY (`item_id(eg RTI01)`) REFERENCES `RISKS`(`risk_id`)
);

CREATE TABLE `INTERNAL AUDIT` (
  `id` <type>,
  `risk_id` <type>,
  `controls_evaluation_id` <type>,
  `treatments_evaluation_id` <type>,
  `findings_on_controls_id` <type>,
  `findings_on_treatments_id` <type>,
  PRIMARY KEY (`id`)
);

CREATE TABLE `CONTROLS EVALUATION` (
  `id` <type>,
  `risk_id` <type>,
  `code` <type>,
  `name` <type>,
  `control_type` <type>,
  `design` <type>,
  `operation_effectiveness` <type>,
  `documentation` <type>,
  `monitoring` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`risk_id`) REFERENCES `INTERNAL AUDIT`(`risk_id`)
);

CREATE TABLE `FINDINGS ON CONTROLS` (
  `id` <type>,
  `controls_evaluation_id` <type>,
  `name` <type>,
  `findings` <type>,
  `recommendations` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `CONTROLS EVALUATION`(`id`)
);

CREATE TABLE `RISK IMPACT PER AREA` (
  `id` <type>,
  `risk_id` <type>,
  `operational_impact` <type>,
  `financial_impact` <type>,
  `reputational_impact` <type>,
  `legal_and_regulatory_compliance` <type>,
  PRIMARY KEY (`id`)
);

CREATE TABLE `INCIDENT` (
  `incident_id` <type>,
  `risk_id` <type>,
  `incident_name` <type>,
  `likelihood` <type>,
  `incident_description` <type>,
  PRIMARY KEY (`incident_id`)
);

CREATE TABLE `TREATMENTS EVALUATION` (
  `id` <type>,
  `risk_id` <type>,
  `code` <type>,
  `name` <type>,
  `design_and_implementation` <type>,
  `level_of_risk_reduction` <type>,
  `ongoing_monitoring_and_review` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`risk_id`) REFERENCES `INTERNAL AUDIT`(`risk_id`)
);

CREATE TABLE `FINDINGS ON TREATMENTS` (
  `id` <type>,
  `treatments_evaluation_id` <type>,
  `name` <type>,
  `findings` <type>,
  `recommendations` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`treatments_evaluation_id`) REFERENCES `TREATMENTS EVALUATION`(`risk_id`)
);

CREATE TABLE `action_plan_monitoring` (
  `id` <type>,
  `treatments_evaluation_id` <type>,
  `status` <type>,
  `name` <type>,
  `progress` <type>,
  `code` <type>,
  `treatment` <type>,
  `treater_id` <type>,
  `start_date` <type>,
  `end_date` <type>,
  `followup_comments` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`treatments_evaluation_id`) REFERENCES `FINDINGS ON TREATMENTS`(`treatments_evaluation_id`),
  FOREIGN KEY (`treatments_evaluation_id`) REFERENCES `TREATMENTS EVALUATION`(`id`)
);

CREATE TABLE `RISK CAUSES` (
  `risk_cause_id` <type>,
  `risk_cause_name` <type>,
  `risk_cause_description` <type>,
  `consequence_id` <type>,
  `risk_id` <type>,
  PRIMARY KEY (`risk_cause_id`)
);

CREATE TABLE `REPORTS` (
  `id` <type>,
  `risk_id` <type>,
  `generated_by` <type>,
  `date_and_time` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`risk_id`) REFERENCES `INTERNAL AUDIT`(`risk_id`)
);

CREATE TABLE `action_plan_monitoring` (
  `id` <type>,
  `controls_evaluation_id` <type>,
  `status` <type>,
  `name` <type>,
  `progress` <type>,
  `code` <type>,
  `control` <type>,
  `controller_id` <type>,
  `start_date` <type>,
  `end_date` <type>,
  `followup_comments` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`controls_evaluation_id`) REFERENCES `CONTROLS EVALUATION`(`id`)
);

CREATE TABLE `EXISTING CONTROLS` (
  `id` <type>,
  `risk_id` <type>,
  `control_name` <type>,
  `contol_description` <type>,
  `control_owner` <type>,
  `effectiveness` <type>,
  `control_type` <type>,
  PRIMARY KEY (`id`)
);

CREATE TABLE `RISK RESPONSE` (
  `id` <type>,
  `risk_id` <type>,
  `response_name` <type>,
  `response_description` <type>,
  PRIMARY KEY (`id`)
);

CREATE TABLE `CRITICAL ASSETS` (
  `id` <type>,
  `asset_id` <type>,
  `asset_type` <type>,
  `asset` <type>,
  `location` <type>,
  `purchase_date` <type>,
  `purchase_price` <type>,
  `current_value` <type>,
  `depreciation` <type>,
  `expected_lifespan` <type>,
  `category` <type>,
  `owner_id` <type>,
  `risk_id` <type>,
  `status` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`owner_id`) REFERENCES `USERS`(`user_id`),
  KEY `Key` (`status`)
);

CREATE TABLE `COMMENTS` (
  `id` <type>,
  `commenter_id` <type>,
  `discussion_id` <type>,
  `comment` <type>,
  `date` <type>,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`discussion_id`) REFERENCES `DISCUSSIONS`(`id`)
);

