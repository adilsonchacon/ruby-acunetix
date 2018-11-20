require 'nokogiri'

require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'version')
require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'ra_cvss')
require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'ra_cvss3')
require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'ra_cve')
require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'ra_cwe')
require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'ra_reference')
require File.join(File.dirname(__FILE__), 'ruby_acunetix', 'ra_report_item')

module RubyAcunetix

  def self.parse(path)
    report_items = []
    
    doc = Nokogiri::XML(File.open(path))
    doc.xpath('//ReportItems/ReportItem').map do |xml_report_item|
      report_item = RaReportItem.new
      [:Name, :ModuleName, :Details, :Affects, :Parameter, :AOP_SourceFile, :AOP_SourceLine, :IsFalsePositive, :Severity, :Type, :Impact, :Description, :DetailedInformation, :Recommendation, :Request].each do |field|
        report_item.send("#{ra_underscore(field.to_s)}=", xml_report_item.css(field.to_s).text)
      end
      
      cwe = xml_report_item.css('CWEList')
      report_item.cwe = RaCwe.parse(cwe.css('CWE')) if !cwe.nil?

      cve = xml_report_item.css('CVEList')
      report_item.cve = RaCve.parse(cve.css('CVE')) if !cve.nil?

      cvss = xml_report_item.css('CVSS')
      report_item.cvss = RaCvss.parse(cvss) if !cvss.nil? 
      
      cvss3 = xml_report_item.css('CVSS3')
      report_item.cvss3 = RaCvss3.parse(cvss3) if !cvss3.nil? 
      
      report_item.references = []
      
      references = xml_report_item.css('References')
      if !references.nil? 
        references.css('Reference').each do |reference|
          report_item.references.push(RaReference.parse(reference))
        end
      end
            
      report_items.push report_item
    end
    
    report_items
  end

  def self.ra_underscore(value)
    value.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

end
