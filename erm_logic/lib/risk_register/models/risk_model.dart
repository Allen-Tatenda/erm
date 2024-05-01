class RiskModel {
    int id;
    String riskId;
    int riskOwnerId;
    String riskName;
    String priority;
    String riskDescription;
    String residualImpact;
    String residualLikelihood;
    String riskExposure;
    String relevanceToObjectives;
    String riskManagementCapacity;
    DateTime createdAt;
    DateTime updatedAt;
    RiskOwner riskOwner;

    RiskModel({
        required this.id,
        required this.riskId,
        required this.riskOwnerId,
        required this.riskName,
        required this.priority,
        required this.riskDescription,
        required this.residualImpact,
        required this.residualLikelihood,
        required this.riskExposure,
        required this.relevanceToObjectives,
        required this.riskManagementCapacity,
        required this.createdAt,
        required this.updatedAt,
        required this.riskOwner,
    });

    factory RiskModel.fromJson(Map<String, dynamic> json) => RiskModel(
        id: json["id"],
        riskId: json["risk_id"],
        riskOwnerId: json["risk_owner_id"],
        riskName: json["risk_name"],
        priority: json["priority"],
        riskDescription: json["risk_description"],
        residualImpact: json["residual_impact"],
        residualLikelihood: json["residual_likelihood"],
        riskExposure: json["risk_exposure"],
        relevanceToObjectives: json["relevance_to_objectives"],
        riskManagementCapacity: json["risk_management_capacity"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        riskOwner: RiskOwner.fromJson(json["risk_owner"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "risk_id": riskId,
        "risk_owner_id": riskOwnerId,
        "risk_name": riskName,
        "priority": priority,
        "risk_description": riskDescription,
        "residual_impact": residualImpact,
        "residual_likelihood": residualLikelihood,
        "risk_exposure": riskExposure,
        "relevance_to_objectives": relevanceToObjectives,
        "risk_management_capacity": riskManagementCapacity,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "risk_owner": riskOwner.toJson(),
    };
}

class RiskOwner {
    int id;
    String username;
    String firstname;
    String lastname;
    String designation;
    String roles;
    String department;
    String email;
    dynamic emailVerifiedAt;
    DateTime createdAt;
    DateTime updatedAt;

    RiskOwner({
        required this.id,
        required this.username,
        required this.firstname,
        required this.lastname,
        required this.designation,
        required this.roles,
        required this.department,
        required this.email,
        required this.emailVerifiedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory RiskOwner.fromJson(Map<String, dynamic> json) => RiskOwner(
        id: json["id"],
        username: json["username"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        designation: json["designation"],
        roles: json["roles"],
        department: json["department"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
        "designation": designation,
        "roles": roles,
        "department": department,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
