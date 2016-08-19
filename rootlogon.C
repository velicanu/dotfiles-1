void setStyle();
void rootlogon();

void rootlogon()
{
  TString cmsswbase = getenv("CMSSW_BASE");
  if (cmsswbase.Length() > 0) {
    gSystem->Load("libFWCoreFWLite.so");
    //#include "FWLiteEnabler.h";
    //FWLiteEnabler::enable();
  }
  setStyle();
}

void setStyle()
{
  gStyle->SetErrorX(0);
  gStyle->SetPalette(1,0);
  gStyle->SetPadColor(0);
  gStyle->SetPadBorderSize(0);
  gStyle->SetPadBorderMode(0);
  gStyle->SetCanvasColor(0);
  gStyle->SetCanvasBorderMode(0);
  gStyle->SetCanvasBorderSize(0);
  gStyle->SetFrameBorderMode(0);
  gStyle->SetFrameLineColor(0);
  gStyle->SetPadTickX(1);
  gStyle->SetPadTickY(1);

  //gStyle->SetTextFont(43);
  //gStyle->SetTextSize(20);

  //gStyle->SetLabelFont(43,"XYZ");
  //gStyle->SetLabelSize(20,"XYZ");
  //gStyle->SetTitleFont(43,"XYZ");
  //gStyle->SetTitleSize(20,"XYZ");
  gStyle->SetTitleColor(1,"XYZ");

  gStyle->SetTitleFillColor(0);
  gStyle->SetTitleBorderSize(0);
  gStyle->SetTitleOffset(1.25,"X");
  gStyle->SetTitleOffset(1.5,"Y");
  gStyle->SetLabelOffset(0.01,"X");
  gStyle->SetLabelOffset(0.01,"Y");

  gStyle->SetHistFillColor(1);
  gStyle->SetHistFillStyle(0);
  gStyle->SetHistLineColor(1);
  gStyle->SetHistLineStyle(0);
  gStyle->SetHistLineWidth(1);
  gStyle->SetEndErrorSize(0);
  gStyle->SetMarkerStyle(20);
  gStyle->SetMarkerSize(1);
  gStyle->SetOptFit(1111);
  gStyle->SetStatColor(0);
  gStyle->SetStatBorderSize(1);

  gStyle->SetOptTitle(0);
  gStyle->SetOptStat(0);

  gStyle->SetPadLeftMargin(0.15);
  gStyle->SetPadBottomMargin(0.15);
  gStyle->SetPadTopMargin(0.05);
  gStyle->SetPadRightMargin(0.05);

  gStyle->SetLegendBorderSize(0);

  gROOT->ForceStyle();
}
