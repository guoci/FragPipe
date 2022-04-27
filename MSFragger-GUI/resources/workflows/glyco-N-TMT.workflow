# Workflow: glyco-N-TMT

crystalc.run-crystalc=false
database.decoy-tag=rev_
diann.fragpipe.cmd-opts=
diann.library=
diann.q-value=0.01
diann.quantification-strategy=3
diann.run-dia-nn=false
diann.run-specific-protein-q-value=0.01
diann.use-predicted-spectra=false
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
freequant.mz-tol=10
freequant.rt-tol=0.4
freequant.run-freequant=false
ionquant.excludemods=
ionquant.heavy=
ionquant.ibaq=0
ionquant.imtol=0.05
ionquant.ionfdr=0.01
ionquant.light=
ionquant.locprob=0.75
ionquant.mbr=0
ionquant.mbrimtol=0.05
ionquant.mbrmincorr=0
ionquant.mbrrttol=1
ionquant.mbrtoprun=100000
ionquant.medium=
ionquant.minexps=1
ionquant.minfreq=0.5
ionquant.minions=2
ionquant.minisotopes=2
ionquant.minscans=3
ionquant.mztol=10
ionquant.normalization=1
ionquant.peptidefdr=1
ionquant.proteinfdr=1
ionquant.requantify=1
ionquant.rttol=0.4
ionquant.run-ionquant=true
ionquant.tp=3
ionquant.writeindex=0
msbooster.predict-rt=true
msbooster.predict-spectra=true
msbooster.run-msbooster=false
msbooster.use-correlated-features=false
msfragger.Y_type_masses=0 203.07937 406.15874 568.21156 730.26438 892.3172 349.137279
msfragger.add_topN_complementary=0
msfragger.allowed_missed_cleavage_1=2
msfragger.allowed_missed_cleavage_2=2
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
msfragger.fragment_ion_series=b,y,Y
msfragger.fragment_mass_tolerance=20
msfragger.fragment_mass_units=1
msfragger.intensity_transform=0
msfragger.ion_series_definitions=
msfragger.isotope_error=0/1/2
msfragger.labile_search_mode=nglycan
msfragger.localize_delta_mass=true
msfragger.mass_diff_to_variable_mod=0
msfragger.mass_offsets=0 203.07937 349.137279 406.15874 552.216649 568.21156 714.269469 2026.68694 2188.73976 2350.79258 730.26438 876.322289 892.3172 1038.375109 1054.37002 1200.427929 1216.42284 1362.480749 1378.47566 1524.533569 1458.44199 1540.52848 1686.586389 1702.5813 1864.63412 1095.39657 1241.454479 1257.44939 1403.507299 1694.602716 1549.565208 1840.660625 1548.544807 1419.50221 1565.560119 1856.655536 2147.750952 1710.597627 1581.55503 1727.612939 2018.708356 1872.650447 1298.47594 1444.533849 1589.571357 1460.52876 1606.586669 1897.682086 1752.644578 1751.624177 1622.58158 1768.639489 2059.734906 2350.830322 1914.697398 2205.792815 2496.888231 2351.850724 2642.94614 1913.676997 2204.772413 1784.6344 1930.692309 2221.787726 2076.750218 2075.729817 1946.68722 2092.745129 2237.782637 1501.55531 1647.613219 1938.708636 1793.671128 1663.60813 1809.666039 2100.761456 2391.856872 1955.723948 1954.703547 2245.798963 1825.66095 1971.718859 2262.814276 2553.909692 2117.776768 2408.872185 2263.834677 2116.756367 2407.851783 1987.71377 2133.771679 2424.867096 2715.962512 3007.057929 2279.829588 2570.925005 2425.887497 2716.982914 3008.07833 3299.173747 2571.945406 2863.040823 2278.809187 2569.904603 2861.00002 2586.919916 2878.015332 2311.81941 2457.877319 2619.930139 1704.63468 1850.692589 2141.788006 2432.883422 1996.750498 1866.6875 2012.745409 2158.803318 2157.782917 2028.74032 2174.798229 2465.893646 2756.989062 3048.084479 2320.856138 2611.951555 2466.914047 2190.79314 2336.851049 2627.946466 2482.908958 2774.004375 3065.099791 2481.888557 2772.983973 3064.07939 2352.84596 2789.999286 3081.094702 2644.961778 2936.057195 2791.019687 3082.115104 2643.941377 2935.036793 3226.13221 3517.227626 2952.052106 2805.994197 2676.9516 3114.104926 3405.200342 1907.71405 2053.771959 2069.76687 2215.824779 2393.87251 2539.930419 2555.92533 2701.983239 3575.269489 2717.97815 2864.036059 3155.131476 4028.417725 3009.073567 2110.79342 2256.851329 2272.84624 2434.89906 2580.956969 2759.0047 2921.05752 3083.11034 3229.168249 3448.24253 2313.87279 2459.930699 2475.92561 2621.983519 2800.03125 2946.089159 3432.247619
msfragger.max_fragment_charge=2
msfragger.max_variable_mods_combinations=5000
msfragger.max_variable_mods_per_peptide=3
msfragger.min_fragments_modelling=2
msfragger.min_matched_fragments=4
msfragger.min_sequence_matches=2
msfragger.minimum_peaks=15
msfragger.minimum_ratio=0.00
msfragger.misc.fragger.clear-mz-hi=132
msfragger.misc.fragger.clear-mz-lo=126.11
msfragger.misc.fragger.digest-mass-hi=5000
msfragger.misc.fragger.digest-mass-lo=400
msfragger.misc.fragger.enzyme-dropdown-1=stricttrypsin
msfragger.misc.fragger.enzyme-dropdown-2=null
msfragger.misc.fragger.precursor-charge-hi=4
msfragger.misc.fragger.precursor-charge-lo=1
msfragger.misc.fragger.remove-precursor-range-hi=1.5
msfragger.misc.fragger.remove-precursor-range-lo=-1.5
msfragger.misc.slice-db=1
msfragger.num_enzyme_termini=2
msfragger.output_format=tsv_pepXML
msfragger.output_max_expect=50
msfragger.output_report_topN=1
msfragger.override_charge=false
msfragger.precursor_mass_lower=-20
msfragger.precursor_mass_mode=corrected
msfragger.precursor_mass_units=1
msfragger.precursor_mass_upper=20
msfragger.precursor_true_tolerance=20
msfragger.precursor_true_units=1
msfragger.remainder_fragment_masses=203.07937
msfragger.remove_precursor_peak=1
msfragger.report_alternative_proteins=true
msfragger.restrict_deltamass_to=N
msfragger.run-msfragger=true
msfragger.search_enzyme_cut_1=KR
msfragger.search_enzyme_cut_2=
msfragger.search_enzyme_name_1=stricttrypsin
msfragger.search_enzyme_name_2=null
msfragger.search_enzyme_nocut_1=
msfragger.search_enzyme_nocut_2=
msfragger.search_enzyme_sense_1=C
msfragger.search_enzyme_sense_2=C
msfragger.table.fix-mods=0.000000,C-Term Peptide,true,-1; 229.162932,N-Term Peptide,true,-1; 0.000000,C-Term Protein,true,-1; 0.000000,N-Term Protein,true,-1; 0.000000,G (glycine),true,-1; 0.000000,A (alanine),true,-1; 0.000000,S (serine),true,-1; 0.000000,P (proline),true,-1; 0.000000,V (valine),true,-1; 0.000000,T (threonine),true,-1; 57.021460,C (cysteine),true,-1; 0.000000,L (leucine),true,-1; 0.000000,I (isoleucine),true,-1; 0.000000,N (asparagine),true,-1; 0.000000,D (aspartic acid),true,-1; 0.000000,Q (glutamine),true,-1; 229.162932,K (lysine),true,-1; 0.000000,E (glutamic acid),true,-1; 0.000000,M (methionine),true,-1; 0.000000,H (histidine),true,-1; 0.000000,F (phenylalanine),true,-1; 0.000000,R (arginine),true,-1; 0.000000,Y (tyrosine),true,-1; 0.000000,W (tryptophan),true,-1; 0.000000,B ,true,-1; 0.000000,J,true,-1; 0.000000,O,true,-1; 0.000000,U,true,-1; 0.000000,X,true,-1; 0.000000,Z,true,-1
msfragger.table.var-mods=15.994900,M,true,3; 42.010600,[^,true,1; 79.966330,STY,false,3; -17.026500,nQnC,false,1; -18.010600,nE,false,1; 4.025107,K,false,3; 6.020129,R,false,3
msfragger.track_zero_topN=0
msfragger.use_all_mods_in_first_search=false
msfragger.use_topN_peaks=300
msfragger.write_calibrated_mgf=false
msfragger.zero_bin_accept_expect=0
msfragger.zero_bin_mult_expect=1
peptide-prophet.cmd-opts=--nonparam --expectscore --decoyprobs --masswidth 4000.0 --glyc
peptide-prophet.combine-pepxml=true
peptide-prophet.run-peptide-prophet=true
percolator.cmd-opts=--only-psms --no-terminate --post-processing-tdc
percolator.keep-tsv-files=false
percolator.min-prob=0.5
percolator.run-percolator=false
phi-report.dont-use-prot-proph-file=false
phi-report.filter=--sequential --prot 0.01 --mapmods
phi-report.pep-level-summary=false
phi-report.philosoher-msstats=false
phi-report.print-decoys=false
phi-report.prot-level-summary=false
phi-report.run-report=true
protein-prophet.cmd-opts=--maxppmdiff 2000000
protein-prophet.run-protein-prophet=true
ptmprophet.cmdline=--keepold --static --em 1 --nions b --mods STY\:79.966331,M\:15.9949 --minprob 0.5
ptmprophet.run-ptmprophet=false
ptmshepherd.adv_params=false
ptmshepherd.annotation-common=false
ptmshepherd.annotation-custom=false
ptmshepherd.annotation-glyco=true
ptmshepherd.annotation-unimod=false
ptmshepherd.annotation_file=
ptmshepherd.annotation_tol=0.01
ptmshepherd.cap_y_ions=0,203.07937,406.15874,568.21156,730.26438,892.3172,349.137279
ptmshepherd.decoy_type=1
ptmshepherd.diag_ions=204.086646,186.076086,168.065526,366.139466,144.0656,138.055,512.197375,292.1026925,274.0921325,657.2349,243.026426,405.079246,485.045576,308.09761
ptmshepherd.diagextract_mode=true
ptmshepherd.diagmine_minIons=25
ptmshepherd.diagmine_minIonsPerSpec=2
ptmshepherd.diagmine_minSpecDiff=0.25
ptmshepherd.diagmine_mode=false
ptmshepherd.glyco_adducts=
ptmshepherd.glyco_fdr=0.01
ptmshepherd.glyco_isotope_max=3
ptmshepherd.glyco_isotope_min=-1
ptmshepherd.glyco_mode=true
ptmshepherd.glyco_ppm_tol=50
ptmshepherd.glycodatabase=
ptmshepherd.histo_smoothbins=2
ptmshepherd.iontype_a=false
ptmshepherd.iontype_b=true
ptmshepherd.iontype_c=false
ptmshepherd.iontype_x=false
ptmshepherd.iontype_y=true
ptmshepherd.iontype_z=false
ptmshepherd.localization_allowed_res=N
ptmshepherd.localization_background=4
ptmshepherd.max_adducts=0
ptmshepherd.n_glyco=true
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
ptmshepherd.prob_dhexOx=2,0.5,0.1
ptmshepherd.prob_dhexY=2,0.5
ptmshepherd.prob_neuacOx=2,0.05,0.2
ptmshepherd.prob_neugcOx=2,0.05,0.2
ptmshepherd.prob_phosphoOx=2,0.05,0.2
ptmshepherd.prob_regY=5,0.5
ptmshepherd.prob_sulfoOx=2,0.05,0.2
ptmshepherd.remainder_masses=203.07937
ptmshepherd.remove_glycan_delta_mass=false
ptmshepherd.run-shepherd=true
ptmshepherd.spectra_maxfragcharge=2
ptmshepherd.spectra_ppmtol=20
ptmshepherd.varmod_masses=
quantitation.run-label-free-quant=false
run-psm-validation=true
speclibgen.easypqp.extras.max_delta_ppm=15
speclibgen.easypqp.extras.max_delta_unimod=0.02
speclibgen.easypqp.extras.rt_lowess_fraction=0
speclibgen.easypqp.im-cal=Automatic selection of a run as reference IM
speclibgen.easypqp.rt-cal=noiRT
speclibgen.easypqp.select-file.text=
speclibgen.easypqp.select-im-file.text=
speclibgen.keep-intermediate-files=false
speclibgen.run-speclibgen=false
tmtintegrator.add_Ref=-1
tmtintegrator.aggregation_method=0
tmtintegrator.allow_overlabel=true
tmtintegrator.allow_unlabeled=false
tmtintegrator.best_psm=true
tmtintegrator.channel_num=10
tmtintegrator.dont-run-fq-lq=false
tmtintegrator.glyco_qval=0.01
tmtintegrator.groupby=-1
tmtintegrator.max_pep_prob_thres=0
tmtintegrator.min_ntt=0
tmtintegrator.min_pep_prob=0.9
tmtintegrator.min_percent=0.05
tmtintegrator.min_purity=0.5
tmtintegrator.min_site_prob=0
tmtintegrator.mod_tag=N-glyco
tmtintegrator.ms1_int=true
tmtintegrator.outlier_removal=true
tmtintegrator.print_RefInt=false
tmtintegrator.prot_exclude=none
tmtintegrator.prot_norm=1
tmtintegrator.psm_norm=false
tmtintegrator.quant_level=2
tmtintegrator.ref_tag=pool
tmtintegrator.run-tmtintegrator=true
tmtintegrator.tolerance=20
tmtintegrator.top3_pep=true
tmtintegrator.unique_gene=0
tmtintegrator.unique_pep=false
tmtintegrator.use_glycan_composition=true
workflow.description=<p style\="margin-top\: 0"> For search and TMT quantitation of enriched N-glycopeptides fragmented with CID/HCD. Performs MSFragger glyco search, glycan FDR control in PTM-Shepherd, and TMT quant/summarization with TMT-Integrator. Settings are provided for TMT-10 with virtual reference channel - method can be adapated for other TMT settings by adjusting TMT-Integrator parameters. </p>
workflow.input.data-type.im-ms=false
workflow.input.data-type.regular-ms=true
workflow.saved-with-ver=17.2-build21
