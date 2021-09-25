package com.wemccm.common.pojo;

public class nonContestableProjectComponentIdDetailPojo {
	// NonContestableProjectComponent
		private double cost;
		private String NonContestableProjectComponentDescription;
		private Integer projectTypeId;

//				ProjectType
		private String name;
		private String ProjectTypeDescription;
		private String projectManagement;
		private String design;
		
		
		
		public double getCost() {
			return cost;
		}
		public void setCost(double cost) {
			this.cost = cost;
		}
		public String getNonContestableProjectComponentDescription() {
			return NonContestableProjectComponentDescription;
		}
		public void setNonContestableProjectComponentDescription(String nonContestableProjectComponentDescription) {
			NonContestableProjectComponentDescription = nonContestableProjectComponentDescription;
		}
		public Integer getProjecTypeId() {
			return projectTypeId;
		}
		public void setProjecTypeId(Integer projecTypeId) {
			this.projectTypeId = projecTypeId;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getProjectTypeDescription() {
			return ProjectTypeDescription;
		}
		public void setProjectTypeDescription(String projectTypeDescription) {
			ProjectTypeDescription = projectTypeDescription;
		}
		public String getProjectManagement() {
			return projectManagement;
		}
		public void setProjectManagement(String projectManagement) {
			this.projectManagement = projectManagement;
		}
		public String getDesign() {
			return design;
		}
		public void setDesign(String design) {
			this.design = design;
		}
		
		
}
