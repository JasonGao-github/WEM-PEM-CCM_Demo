package com.wemccm.common.entity;

public class InputProject extends BaseEntity {

	private String projectNumber;
	//cc 	projectTitle
	private String projectName;
	//cc 	supplyAddress
	private String supplyAddress;
	//=IF('JEN Overheads|Build Up'!B23,"Yes","No")
	private String showContestableBreakdown10;
	
	//---------------------------------------------------------------------------------------
	
	//sum of next 4
	private Double connectionAssets13Total;
//	(
//		(Financials!J10*(1+'JEN Overheads|Build Up'!$B$20))
//	+	SUM('Quantity|Input'!X541, 'Quantity|Input'!X540)
//	)
//	*	1+'JEN Overheads|Build Up'!B10

	private Double PMDEC14Total;
	
	private Double constructionCosts15Total;

	private Double tenderingCosts16Total;
	
	private Double CMAAC17Total;
	
	

	private Double otherProjectCosts19Total;
	
	private Double CCALCTAO20Total;

	private Double publicLightingComponent21Total;

	private Double CIURODASTC22Total;
	
	

	private Double totalProjectCost26Total;
	  
	private Double pioneerSchemeCharges28Total;

	private Double LJENACAAROCIURODA29Total;
	
	private Double lessApplicationFeePrePaymentalreadyPaid30Total;
	
	
	//---------------------------------------------------------------------------------------
	
	
	
	
	
	private Double connectionAssets13Calculate;

	private Double PMDEC14Calculate;

	private Double constructionCosts15Calculate;

	private Double tenderingCosts16Calculate;
	
	private Double CMAAC17Calculate;
	
	

	private Double otherProjectCosts19Calculate;
	
	private Double CCALCTAO20Calculate;

	private Double publicLightingComponent21Calculate;

	private Double CIURODASTC22Calculate;
	
	

	private Double totalProjectCost26Calculate;
	  
	private Double pioneerSchemeCharges28Calculate;

	private Double LJENACAAROCIURODA29Calculate;
	
	private Double lessApplicationFeePrePaymentalreadyPaid30Calculate;
	
	
	//---------------------------------------------------------------------------------------
	
	
	
	
	private Double connectionAssets13Flag;

	private Double PMDEC14Flag;

	private Double constructionCosts15Flag;

	private Double tenderingCosts16Flag;
	
	private Double CMAAC17Flag;
	
	

	private Double otherProjectCosts19Flag;
	
	private Double CCALCTAO20Flag;

	private Double publicLightingComponent21Flag;
	
	private Double CIURODASTC22Flag;
	
	

	private Double totalProjectCost26Flag;
	  
	private Double pioneerSchemeCharges28Flag;

	private Double LJENACAAROCIURODA29Flag;
	
	private Double lessApplicationFeePrePaymentalreadyPaid30Flag;
	
	
	//---------------------------------------------------------------------------------------

	public String getProjectNumber() {
		return projectNumber;
	}

	public void setProjectNumber(String projectNumber) {
		this.projectNumber = projectNumber;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getSupplyAddress() {
		return supplyAddress;
	}

	public void setSupplyAddress(String supplyAddress) {
		this.supplyAddress = supplyAddress;
	}

	public String getShowContestableBreakdown10() {
		return showContestableBreakdown10;
	}

	public void setShowContestableBreakdown10(String showContestableBreakdown10) {
		this.showContestableBreakdown10 = showContestableBreakdown10;
	}

	public Double getConnectionAssets13Total() {
		return connectionAssets13Total;
	}

	public void setConnectionAssets13Total(Double connectionAssets13Total) {
		this.connectionAssets13Total = connectionAssets13Total;
	}

	public Double getPMDEC14Total() {
		return PMDEC14Total;
	}

	public void setPMDEC14Total(Double pMDEC14Total) {
		PMDEC14Total = pMDEC14Total;
	}

	public Double getConstructionCosts15Total() {
		return constructionCosts15Total;
	}

	public void setConstructionCosts15Total(Double constructionCosts15Total) {
		this.constructionCosts15Total = constructionCosts15Total;
	}

	public Double getTenderingCosts16Total() {
		return tenderingCosts16Total;
	}

	public void setTenderingCosts16Total(Double tenderingCosts16Total) {
		this.tenderingCosts16Total = tenderingCosts16Total;
	}

	public Double getCMAAC17Total() {
		return CMAAC17Total;
	}

	public void setCMAAC17Total(Double cMAAC17Total) {
		CMAAC17Total = cMAAC17Total;
	}

	public Double getOtherProjectCosts19Total() {
		return otherProjectCosts19Total;
	}

	public void setOtherProjectCosts19Total(Double otherProjectCosts19Total) {
		this.otherProjectCosts19Total = otherProjectCosts19Total;
	}

	public Double getCCALCTAO20Total() {
		return CCALCTAO20Total;
	}

	public void setCCALCTAO20Total(Double cCALCTAO20Total) {
		CCALCTAO20Total = cCALCTAO20Total;
	}

	public Double getPublicLightingComponent21Total() {
		return publicLightingComponent21Total;
	}

	public void setPublicLightingComponent21Total(Double publicLightingComponent21Total) {
		this.publicLightingComponent21Total = publicLightingComponent21Total;
	}

	public Double getCIURODASTC22Total() {
		return CIURODASTC22Total;
	}

	public void setCIURODASTC22Total(Double cIURODASTC22Total) {
		CIURODASTC22Total = cIURODASTC22Total;
	}

	public Double getTotalProjectCost26Total() {
		return totalProjectCost26Total;
	}

	public void setTotalProjectCost26Total(Double totalProjectCost26Total) {
		this.totalProjectCost26Total = totalProjectCost26Total;
	}

	public Double getPioneerSchemeCharges28Total() {
		return pioneerSchemeCharges28Total;
	}

	public void setPioneerSchemeCharges28Total(Double pioneerSchemeCharges28Total) {
		this.pioneerSchemeCharges28Total = pioneerSchemeCharges28Total;
	}

	public Double getLJENACAAROCIURODA29Total() {
		return LJENACAAROCIURODA29Total;
	}

	public void setLJENACAAROCIURODA29Total(Double lJENACAAROCIURODA29Total) {
		LJENACAAROCIURODA29Total = lJENACAAROCIURODA29Total;
	}

	public Double getLessApplicationFeePrePaymentalreadyPaid30Total() {
		return lessApplicationFeePrePaymentalreadyPaid30Total;
	}

	public void setLessApplicationFeePrePaymentalreadyPaid30Total(Double lessApplicationFeePrePaymentalreadyPaid30Total) {
		this.lessApplicationFeePrePaymentalreadyPaid30Total = lessApplicationFeePrePaymentalreadyPaid30Total;
	}

	public Double getConnectionAssets13Calculate() {
		return connectionAssets13Calculate;
	}

	public void setConnectionAssets13Calculate(Double connectionAssets13Calculate) {
		this.connectionAssets13Calculate = connectionAssets13Calculate;
	}

	public Double getPMDEC14Calculate() {
		return PMDEC14Calculate;
	}

	public void setPMDEC14Calculate(Double pMDEC14Calculate) {
		PMDEC14Calculate = pMDEC14Calculate;
	}

	public Double getConstructionCosts15Calculate() {
		return constructionCosts15Calculate;
	}

	public void setConstructionCosts15Calculate(Double constructionCosts15Calculate) {
		this.constructionCosts15Calculate = constructionCosts15Calculate;
	}

	public Double getTenderingCosts16Calculate() {
		return tenderingCosts16Calculate;
	}

	public void setTenderingCosts16Calculate(Double tenderingCosts16Calculate) {
		this.tenderingCosts16Calculate = tenderingCosts16Calculate;
	}

	public Double getCMAAC17Calculate() {
		return CMAAC17Calculate;
	}

	public void setCMAAC17Calculate(Double cMAAC17Calculate) {
		CMAAC17Calculate = cMAAC17Calculate;
	}

	public Double getOtherProjectCosts19Calculate() {
		return otherProjectCosts19Calculate;
	}

	public void setOtherProjectCosts19Calculate(Double otherProjectCosts19Calculate) {
		this.otherProjectCosts19Calculate = otherProjectCosts19Calculate;
	}

	public Double getCCALCTAO20Calculate() {
		return CCALCTAO20Calculate;
	}

	public void setCCALCTAO20Calculate(Double cCALCTAO20Calculate) {
		CCALCTAO20Calculate = cCALCTAO20Calculate;
	}

	public Double getPublicLightingComponent21Calculate() {
		return publicLightingComponent21Calculate;
	}

	public void setPublicLightingComponent21Calculate(Double publicLightingComponent21Calculate) {
		this.publicLightingComponent21Calculate = publicLightingComponent21Calculate;
	}

	public Double getCIURODASTC22Calculate() {
		return CIURODASTC22Calculate;
	}

	public void setCIURODASTC22Calculate(Double cIURODASTC22Calculate) {
		CIURODASTC22Calculate = cIURODASTC22Calculate;
	}

	public Double getTotalProjectCost26Calculate() {
		return totalProjectCost26Calculate;
	}

	public void setTotalProjectCost26Calculate(Double totalProjectCost26Calculate) {
		this.totalProjectCost26Calculate = totalProjectCost26Calculate;
	}

	public Double getPioneerSchemeCharges28Calculate() {
		return pioneerSchemeCharges28Calculate;
	}

	public void setPioneerSchemeCharges28Calculate(Double pioneerSchemeCharges28Calculate) {
		this.pioneerSchemeCharges28Calculate = pioneerSchemeCharges28Calculate;
	}

	public Double getLJENACAAROCIURODA29Calculate() {
		return LJENACAAROCIURODA29Calculate;
	}

	public void setLJENACAAROCIURODA29Calculate(Double lJENACAAROCIURODA29Calculate) {
		LJENACAAROCIURODA29Calculate = lJENACAAROCIURODA29Calculate;
	}

	public Double getLessApplicationFeePrePaymentalreadyPaid30Calculate() {
		return lessApplicationFeePrePaymentalreadyPaid30Calculate;
	}

	public void setLessApplicationFeePrePaymentalreadyPaid30Calculate(
			Double lessApplicationFeePrePaymentalreadyPaid30Calculate) {
		this.lessApplicationFeePrePaymentalreadyPaid30Calculate = lessApplicationFeePrePaymentalreadyPaid30Calculate;
	}

	public Double getConnectionAssets13Flag() {
		return connectionAssets13Flag;
	}

	public void setConnectionAssets13Flag(Double connectionAssets13Flag) {
		this.connectionAssets13Flag = connectionAssets13Flag;
	}

	public Double getPMDEC14Flag() {
		return PMDEC14Flag;
	}

	public void setPMDEC14Flag(Double pMDEC14Flag) {
		PMDEC14Flag = pMDEC14Flag;
	}

	public Double getConstructionCosts15Flag() {
		return constructionCosts15Flag;
	}

	public void setConstructionCosts15Flag(Double constructionCosts15Flag) {
		this.constructionCosts15Flag = constructionCosts15Flag;
	}

	public Double getTenderingCosts16Flag() {
		return tenderingCosts16Flag;
	}

	public void setTenderingCosts16Flag(Double tenderingCosts16Flag) {
		this.tenderingCosts16Flag = tenderingCosts16Flag;
	}

	public Double getCMAAC17Flag() {
		return CMAAC17Flag;
	}

	public void setCMAAC17Flag(Double cMAAC17Flag) {
		CMAAC17Flag = cMAAC17Flag;
	}

	public Double getOtherProjectCosts19Flag() {
		return otherProjectCosts19Flag;
	}

	public void setOtherProjectCosts19Flag(Double otherProjectCosts19Flag) {
		this.otherProjectCosts19Flag = otherProjectCosts19Flag;
	}

	public Double getCCALCTAO20Flag() {
		return CCALCTAO20Flag;
	}

	public void setCCALCTAO20Flag(Double cCALCTAO20Flag) {
		CCALCTAO20Flag = cCALCTAO20Flag;
	}

	public Double getPublicLightingComponent21Flag() {
		return publicLightingComponent21Flag;
	}

	public void setPublicLightingComponent21Flag(Double publicLightingComponent21Flag) {
		this.publicLightingComponent21Flag = publicLightingComponent21Flag;
	}

	public Double getCIURODASTC22Flag() {
		return CIURODASTC22Flag;
	}

	public void setCIURODASTC22Flag(Double cIURODASTC22Flag) {
		CIURODASTC22Flag = cIURODASTC22Flag;
	}

	public Double getTotalProjectCost26Flag() {
		return totalProjectCost26Flag;
	}

	public void setTotalProjectCost26Flag(Double totalProjectCost26Flag) {
		this.totalProjectCost26Flag = totalProjectCost26Flag;
	}

	public Double getPioneerSchemeCharges28Flag() {
		return pioneerSchemeCharges28Flag;
	}

	public void setPioneerSchemeCharges28Flag(Double pioneerSchemeCharges28Flag) {
		this.pioneerSchemeCharges28Flag = pioneerSchemeCharges28Flag;
	}

	public Double getLJENACAAROCIURODA29Flag() {
		return LJENACAAROCIURODA29Flag;
	}

	public void setLJENACAAROCIURODA29Flag(Double lJENACAAROCIURODA29Flag) {
		LJENACAAROCIURODA29Flag = lJENACAAROCIURODA29Flag;
	}

	public Double getLessApplicationFeePrePaymentalreadyPaid30Flag() {
		return lessApplicationFeePrePaymentalreadyPaid30Flag;
	}

	public void setLessApplicationFeePrePaymentalreadyPaid30Flag(Double lessApplicationFeePrePaymentalreadyPaid30Flag) {
		this.lessApplicationFeePrePaymentalreadyPaid30Flag = lessApplicationFeePrePaymentalreadyPaid30Flag;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	  
	  
	  
	  
	  
	  
	  

}
