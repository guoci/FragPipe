# Workflow: glyco-O-open-Hybrid

crystalc.run-crystalc=true
database.decoy-tag=rev_
diann.fragpipe.cmd-opts=
diann.generate-msstats=true
diann.heavy=
diann.library=
diann.light=
diann.medium=
diann.q-value=0.01
diann.quantification-strategy=3
diann.quantification-strategy-2=QuantUMS (high accuracy)
diann.run-dia-nn=false
diann.run-dia-plex=false
diann.run-specific-protein-q-value=false
diann.unrelated-runs=false
diann.use-predicted-spectra=false
diatracer.corr-threshold=0.3
diatracer.delta-apex-im=0.01
diatracer.delta-apex-rt=3
diatracer.mass-defect-filter=true
diatracer.mass-defect-offset=0.1
diatracer.rf-max=500
diatracer.run-diatracer=false
diatracer.write-intermediate-files=false
diaumpire.AdjustFragIntensity=true
diaumpire.BoostComplementaryIon=false
diaumpire.CorrThreshold=0
diaumpire.DeltaApex=0.2
diaumpire.ExportPrecursorPeak=false
diaumpire.Q1=true
diaumpire.Q2=true
diaumpire.Q3=true
diaumpire.RFmax=500
diaumpire.RPmax=25
diaumpire.RTOverlap=0.3
diaumpire.SE.EstimateBG=false
diaumpire.SE.IsoPattern=0.3
diaumpire.SE.MS1PPM=10
diaumpire.SE.MS2PPM=20
diaumpire.SE.MS2SN=1.1
diaumpire.SE.MassDefectFilter=true
diaumpire.SE.MassDefectOffset=0.1
diaumpire.SE.NoMissedScan=1
diaumpire.SE.SN=1.1
diaumpire.run-diaumpire=false
fpop.fpop-tmt=false
fpop.label_control=
fpop.label_fpop=
fpop.region_size=1
fpop.run-fpop=false
fpop.subtract-control=false
freequant.mz-tol=10
freequant.rt-tol=0.4
freequant.run-freequant=false
ionquant.excludemods=
ionquant.heavy=
ionquant.imtol=0.05
ionquant.ionfdr=0.01
ionquant.light=
ionquant.locprob=0.75
ionquant.maxlfq=1
ionquant.mbr=0
ionquant.mbrimtol=0.05
ionquant.mbrmincorr=0
ionquant.mbrrttol=1
ionquant.mbrtoprun=10
ionquant.medium=
ionquant.minfreq=0
ionquant.minions=1
ionquant.minisotopes=2
ionquant.minscans=3
ionquant.mztol=10
ionquant.normalization=1
ionquant.peptidefdr=1
ionquant.proteinfdr=1
ionquant.requantify=1
ionquant.rttol=0.4
ionquant.run-ionquant=true
ionquant.tp=0
ionquant.uniqueness=0
ionquant.use-labeling=false
ionquant.use-lfq=true
ionquant.writeindex=0
msbooster.find-best-rt-model=false
msbooster.find-best-spectra-model=false
msbooster.koina-url=
msbooster.predict-rt=true
msbooster.predict-spectra=true
msbooster.rt-model=DIA-NN
msbooster.run-msbooster=false
msbooster.spectra-model=DIA-NN
msfragger.Y_type_masses=0 203.07937 406.15874 568.21156 730.26438 349.137279
msfragger.activation_types=all
msfragger.allowed_missed_cleavage_1=2
msfragger.allowed_missed_cleavage_2=2
msfragger.analyzer_types=all
msfragger.calibrate_mass=2
msfragger.check_spectral_files=true
msfragger.clip_nTerm_M=true
msfragger.deisotope=1
msfragger.delta_mass_exclude_ranges=(-1.5,3.5)
msfragger.deneutralloss=1
msfragger.diagnostic_fragments=204.086646 186.076086 168.065526 366.139466 144.0656 138.055 512.197375 292.1026925 274.0921325 657.2349 243.026426 405.079246 485.045576 308.09761
msfragger.diagnostic_intensity_filter=0.1
msfragger.digest_max_length=50
msfragger.digest_min_length=7
msfragger.fragment_ion_series=b,y,c,z,Y
msfragger.fragment_mass_tolerance=20
msfragger.fragment_mass_units=1
msfragger.group_variable=0
msfragger.intensity_transform=0
msfragger.ion_series_definitions=
msfragger.isotope_error=0
msfragger.labile_search_mode=labile
msfragger.localize_delta_mass=true
msfragger.mass_diff_to_variable_mod=0
msfragger.mass_offsets=0
msfragger.mass_offsets_detailed=
msfragger.max_fragment_charge=2
msfragger.max_variable_mods_combinations=5000
msfragger.max_variable_mods_per_peptide=3
msfragger.min_fragments_modelling=2
msfragger.min_matched_fragments=4
msfragger.min_sequence_matches=2
msfragger.minimum_peaks=15
msfragger.minimum_ratio=0.00
msfragger.misc.fragger.clear-mz-hi=0
msfragger.misc.fragger.clear-mz-lo=0
msfragger.misc.fragger.digest-mass-hi=5000
msfragger.misc.fragger.digest-mass-lo=400
msfragger.misc.fragger.enzyme-dropdown-1=stricttrypsin
msfragger.misc.fragger.enzyme-dropdown-2=null
msfragger.misc.fragger.precursor-charge-hi=4
msfragger.misc.fragger.precursor-charge-lo=1
msfragger.misc.fragger.remove-precursor-range-hi=3.5
msfragger.misc.fragger.remove-precursor-range-lo=-1.5
msfragger.misc.slice-db=1
msfragger.num_enzyme_termini=2
msfragger.output_format=tsv_pepXML
msfragger.output_max_expect=50
msfragger.output_report_topN=1
msfragger.output_report_topN_dda_plus=5
msfragger.output_report_topN_dia1=5
msfragger.override_charge=false
msfragger.precursor_mass_lower=-200
msfragger.precursor_mass_mode=corrected
msfragger.precursor_mass_units=0
msfragger.precursor_mass_upper=4000
msfragger.precursor_true_tolerance=20
msfragger.precursor_true_units=1
msfragger.remainder_fragment_masses=
msfragger.remove_precursor_peak=2
msfragger.report_alternative_proteins=true
msfragger.require_precursor=true
msfragger.restrict_deltamass_to=ST-
msfragger.reuse_dia_fragment_peaks=false
msfragger.run-msfragger=true
msfragger.search_enzyme_cut_1=KR
msfragger.search_enzyme_cut_2=
msfragger.search_enzyme_name_1=stricttrypsin
msfragger.search_enzyme_name_2=null
msfragger.search_enzyme_nocut_1=
msfragger.search_enzyme_nocut_2=
msfragger.search_enzyme_sense_1=C
msfragger.search_enzyme_sense_2=C
msfragger.table.fix-mods=0.0,C-Term Peptide,true,-1; 0.0,N-Term Peptide,true,-1; 0.0,C-Term Protein,true,-1; 0.0,N-Term Protein,true,-1; 0.0,G (glycine),true,-1; 0.0,A (alanine),true,-1; 0.0,S (serine),true,-1; 0.0,P (proline),true,-1; 0.0,V (valine),true,-1; 0.0,T (threonine),true,-1; 57.02146,C (cysteine),true,-1; 0.0,L (leucine),true,-1; 0.0,I (isoleucine),true,-1; 0.0,N (asparagine),true,-1; 0.0,D (aspartic acid),true,-1; 0.0,Q (glutamine),true,-1; 0.0,K (lysine),true,-1; 0.0,E (glutamic acid),true,-1; 0.0,M (methionine),true,-1; 0.0,H (histidine),true,-1; 0.0,F (phenylalanine),true,-1; 0.0,R (arginine),true,-1; 0.0,Y (tyrosine),true,-1; 0.0,W (tryptophan),true,-1; 0.0,B ,true,-1; 0.0,J,true,-1; 0.0,O,true,-1; 0.0,U,true,-1; 0.0,X,true,-1; 0.0,Z,true,-1
msfragger.table.var-mods=15.9949,M,true,3; 42.0106,[^,true,1; 79.96633,STY,false,3; -17.0265,nQnC,false,1; -18.0106,nE,false,1; 4.025107,K,false,3; 6.020129,R,false,3
msfragger.track_zero_topN=0
msfragger.use_all_mods_in_first_search=false
msfragger.use_detailed_offsets=false
msfragger.use_topN_peaks=300
msfragger.write_calibrated_mzml=true
msfragger.write_uncalibrated_mgf=false
msfragger.zero_bin_accept_expect=0
msfragger.zero_bin_mult_expect=1
opair.activation1=ETD
opair.activation2=ETD
opair.filterOxonium=true
opair.glyco_db=
opair.max_glycans=4
opair.max_isotope_error=2
opair.min_isotope_error=0
opair.ms1_tol=20
opair.ms2_tol=20
opair.oxonium_filtering_file=
opair.oxonium_minimum_intensity=0.05
opair.reverse_scan_order=false
opair.run-opair=true
opair.single_scan_type=true
peptide-prophet.cmd-opts=--nonparam --expectscore --decoyprobs --masswidth 4000.0
peptide-prophet.combine-pepxml=true
peptide-prophet.run-peptide-prophet=true
percolator.cmd-opts=--only-psms --no-terminate --post-processing-tdc
percolator.keep-tsv-files=false
percolator.min-prob=0.5
percolator.run-percolator=false
phi-report.dont-use-prot-proph-file=false
phi-report.filter=--sequential --prot 0.01 --mapmods
phi-report.pep-level-summary=false
phi-report.print-decoys=false
phi-report.prot-level-summary=true
phi-report.remove-contaminants=false
phi-report.run-report=true
protein-prophet.cmd-opts=--maxppmdiff 2000000
protein-prophet.run-protein-prophet=true
ptmprophet.cmdline=
ptmprophet.override-defaults=false
ptmprophet.run-ptmprophet=false
ptmshepherd.adv_params=false
ptmshepherd.annotation-common=false
ptmshepherd.annotation-custom=false
ptmshepherd.annotation-glyco=true
ptmshepherd.annotation-unimod=false
ptmshepherd.annotation_file=
ptmshepherd.annotation_tol=0.01
ptmshepherd.cap_y_ions=0,203.07937,406.15874,568.21156,730.26438,349.137279
ptmshepherd.decoy_type=1
ptmshepherd.diag_ions=204.086646,186.076086,168.065526,366.139466,144.0656,138.055,512.197375,292.1026925,274.0921325,657.2349,243.026426,405.079246,485.045576,308.09761
ptmshepherd.diagmine_diagMinFoldChange=3.0
ptmshepherd.diagmine_diagMinSpecDiff=25
ptmshepherd.diagmine_fragMinFoldChange=3.0
ptmshepherd.diagmine_fragMinPropensity=12.5
ptmshepherd.diagmine_fragMinSpecDiff=25
ptmshepherd.diagmine_minIonsPerSpec=2
ptmshepherd.diagmine_minPeps=25
ptmshepherd.diagmine_pepMinFoldChange=3.0
ptmshepherd.diagmine_pepMinSpecDiff=25
ptmshepherd.glyco_fdr=1.00
ptmshepherd.glyco_isotope_max=3
ptmshepherd.glyco_isotope_min=-1
ptmshepherd.glyco_ppm_tol=50
ptmshepherd.glycodatabase=
ptmshepherd.histo_smoothbins=2
ptmshepherd.iontype_a=false
ptmshepherd.iontype_b=true
ptmshepherd.iontype_c=true
ptmshepherd.iontype_x=false
ptmshepherd.iontype_y=true
ptmshepherd.iontype_z=true
ptmshepherd.iterloc_maxEpoch=100
ptmshepherd.iterloc_mode=false
ptmshepherd.localization_allowed_res=ST
ptmshepherd.n_glyco=false
ptmshepherd.normalization-psms=true
ptmshepherd.normalization-scans=false
ptmshepherd.output_extended=false
ptmshepherd.peakpicking_mass_units=0
ptmshepherd.peakpicking_minPsm=10
ptmshepherd.peakpicking_promRatio=0.3
ptmshepherd.peakpicking_width=0.002
ptmshepherd.precursor_mass_units=0
ptmshepherd.precursor_tol=0.01
ptmshepherd.print_decoys=false
ptmshepherd.print_full_glyco_params=false
ptmshepherd.prob_mass=0.5
ptmshepherd.remainder_masses=203.07937
ptmshepherd.remove_glycan_delta_mass=true
ptmshepherd.run-shepherd=true
ptmshepherd.run_diagextract_mode=false
ptmshepherd.run_diagmine_mode=false
ptmshepherd.run_glyco_mode=false
ptmshepherd.spectra_maxfragcharge=2
ptmshepherd.spectra_ppmtol=20
ptmshepherd.varmod_masses=
quantitation.run-label-free-quant=false
run-psm-validation=true
run-validation-tab=true
saintexpress.fragpipe.cmd-opts=
saintexpress.max-replicates=10
saintexpress.run-saint-express=false
saintexpress.virtual-controls=100
skyline.run-skyline=false
skyline.skyline=true
skyline.skyline-custom=false
skyline.skyline-custom-path=
skyline.skyline-daily=false
skyline.skyline-mode=0
skyline.skyline-mods-mode=Default
speclibgen.convert-pepxml=false
speclibgen.convert-psm=true
speclibgen.easypqp.extras.max_delta_ppm=15
speclibgen.easypqp.extras.max_delta_unimod=0.02
speclibgen.easypqp.extras.max_glycan_qval=1
speclibgen.easypqp.extras.rt_lowess_fraction=0
speclibgen.easypqp.fragment.a=false
speclibgen.easypqp.fragment.b=true
speclibgen.easypqp.fragment.c=false
speclibgen.easypqp.fragment.x=false
speclibgen.easypqp.fragment.y=true
speclibgen.easypqp.fragment.z=false
speclibgen.easypqp.im-cal=Automatic selection of a run as reference IM
speclibgen.easypqp.labile_mode=O-glyco
speclibgen.easypqp.neutral_loss=false
speclibgen.easypqp.rt-cal=noiRT
speclibgen.easypqp.select-file.text=
speclibgen.easypqp.select-im-file.text=
speclibgen.keep-intermediate-files=false
speclibgen.run-speclibgen=false
tab-run.delete_calibrated_mzml=false
tab-run.delete_temp_files=false
tab-run.sub_mzml_prob_threshold=0.5
tab-run.write_sub_mzml=false
tmtintegrator.add_Ref=-1
tmtintegrator.aggregation_method=0
tmtintegrator.allow_overlabel=true
tmtintegrator.allow_unlabeled=true
tmtintegrator.best_psm=true
tmtintegrator.channel_num=TMT-6
tmtintegrator.extraction_tool=IonQuant
tmtintegrator.glyco_qval=0.01
tmtintegrator.groupby=0
tmtintegrator.log2transformed=true
tmtintegrator.max_pep_prob_thres=0
tmtintegrator.min_ntt=0
tmtintegrator.min_pep_prob=0.9
tmtintegrator.min_percent=0.05
tmtintegrator.min_purity=0.5
tmtintegrator.min_site_prob=-1
tmtintegrator.mod_tag=none
tmtintegrator.ms1_int=true
tmtintegrator.outlier_removal=true
tmtintegrator.philosopher-msstats=false
tmtintegrator.print_RefInt=false
tmtintegrator.prot_exclude=none
tmtintegrator.prot_norm=0
tmtintegrator.psm_norm=false
tmtintegrator.quant_level=2
tmtintegrator.ref_tag=Bridge
tmtintegrator.run-tmtintegrator=false
tmtintegrator.tolerance=20
tmtintegrator.top3_pep=true
tmtintegrator.unique_gene=0
tmtintegrator.unique_pep=false
tmtintegrator.use_glycan_composition=true
workflow.description=<p style\="margin-top\: 0">For hybrid activation open search of O-glycopeptides. NOTE\: glycan assignment/FDR control is NOT yet supported for open searches and is not performed in this workflow.</p>
workflow.input.data-type.im-ms=false
workflow.input.data-type.regular-ms=true
workflow.misc.save-sdrf=true
workflow.saved-with-ver=21.2-build45
