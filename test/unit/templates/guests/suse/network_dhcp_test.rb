require_relative "../../../base"

require "vagrant/util/template_renderer"

describe "templates/guests/suse/network_dhcp" do
  let(:template) { "guests/suse/network_dhcp" }

  it "renders the template" do
    result = Vagrant::Util::TemplateRenderer.render(template, options: {
      interface: "en0",
    })
    expect(result).to eq <<-EOH.gsub(/^ {6}/, "")
      #VAGRANT-BEGIN
      # The contents below are automatically generated by Vagrant. Do not modify.
      BOOTPROTO='dhcp'
      STARTMODE='auto'
      DEVICE='ethen0'
      #VAGRANT-END
    EOH
  end
end
