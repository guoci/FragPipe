# Workflow: glyco-N-TMT



crystalc.run-crystalc=false
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
msbooster.predict-rt=false
msbooster.predict-spectra=false
msbooster.rt-model=DIA-NN
msbooster.run-msbooster=false
msbooster.spectra-model=DIA-NN
msfragger.Y_type_masses=0 203.07937 406.15874 568.21156 730.26438 892.3172 349.137279
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
msfragger.fragment_ion_series=b,y,Y
msfragger.fragment_mass_tolerance=20
msfragger.fragment_mass_units=1
msfragger.group_variable=0
msfragger.intensity_transform=0
msfragger.ion_series_definitions=
msfragger.isotope_error=0/1/2
msfragger.labile_search_mode=nglycan
msfragger.localize_delta_mass=true
msfragger.mass_diff_to_variable_mod=0
msfragger.mass_offsets=0 203.0793762 568.2115783 892.3172301 1038.3751372 1054.370056 1095.3966063 1200.4279631 1216.4228819 1241.4545134 1257.4494322 1298.4759825 1362.480789 1378.4757078 1387.5124205 1403.5073393 1419.5022581 1444.5338896 1460.5288084 1501.5553587 1524.5336149 1533.5703276 1540.5285337 1548.5448607 1549.5652464 1565.5601652 1581.555084 1589.571411 1606.5867155 1622.5816343 1647.6132658 1663.6081846 1686.5864408 1694.6027678 1695.6231535 1702.5813596 1704.6347349 1710.5976866 1711.6180723 1727.6129911 1735.6293181 1736.6497038 1751.6242369 1752.6446226 1768.6395414 1784.6344602 1793.6711729 1809.6660917 1825.6610105 1848.6392667 1850.692642 1856.6555937 1857.6759794 1864.6341855 1866.6875608 1872.6505125 1873.6708982 1880.6668395 1889.665817 1897.682144 1898.7025297 1907.7141111 1913.6770628 1914.6974485 1930.6923673 1938.7086943 1946.6872861 1954.7036131 1955.7239988 1971.7189176 1987.7138364 1996.7505491 2010.6920926 2012.7454679 2018.7084196 2019.7288053 2026.6870114 2028.7403867 2042.7196654 2043.7400511 2053.7720182 2059.7349699 2060.7553556 2069.766937 2075.7298887 2076.7502744 2092.7451932 2100.7615202 2101.7819059 2108.740112 2110.7934873 2116.756439 2117.7768247 2133.7717435 2141.7880705 2142.8084562 2157.7829893 2158.803375 2172.7449185 2174.7982938 2188.7398373 2190.7932126 2204.7724913 2205.792877 2206.8132627 2215.8248441 2221.7877958 2222.8081815 2231.8197629 2237.7827146 2245.7990416 2246.8194273 2254.7980191 2256.8513944 2262.8143461 2263.8347318 2270.7929379 2278.8092649 2279.8296506 2287.8459776 2313.8728635 2320.8562009 2334.7977444 2336.8511197 2350.7926632 2350.8303984 2352.8460385 2352.8711698 2366.8253172 2391.8569487 2393.8725888 2407.8518675 2408.8722532 2424.867172 2425.8875577 2432.883499 2434.8991391 2448.8784178 2457.8773953 2459.9307706 2463.840347 2465.8937223 2475.9256894 2481.8886411 2498.9039456 2528.8781431 2539.9304959 2545.8934476 2553.9097746 2555.9254147 2569.9046934 2570.9250791 2571.9454648 2580.9570462 2586.9199979 2621.9835965 2627.9465482 2643.941467 2644.9618527 2674.9360502 2701.9833218 2715.9626005 2716.9829862 2717.9782406 2772.9840696 2775.024841 2786.9633483 2789.9993741 2791.0197598 2798.0157011 2814.0106199 2823.0095974 2861.0001219 2864.0361477 2871.0572203 2878.0154264 2880.0310665 2896.0511166 2919.0419767 2935.0368955 2937.0776669 2966.0314787 2968.0471188 3007.058029 3009.0736691 3010.1191861 3048.0845793 3064.0794981 3081.0948026 3083.1104427 3083.135574 3138.1162717 3140.1570431 3147.1152492 3153.1159361 3155.1315762 3156.1519619 3210.1374052 3226.132324 3228.1730954 3229.1683498 3234.148651 3284.1741788 3300.1690976 3302.209869 3372.1902311 3374.2058712 3405.2004544 3407.2412258 3447.2473904 3448.2426448 3448.2677761 3503.2484738 3517.2277525 3519.2685239 3520.2637783 3521.284164 3589.248886 3591.2645261 3594.3005519 3663.2856596 3665.3012997 3665.326431 3704.3122099 3720.3071287 3738.3428189 3809.3435667 3812.3795925 3827.3541256 3866.3650358 3882.3599546 3886.4163661 3959.432754 4028.4178617 4101.4593809 4103.475021 4118.4495541 4176.4914089 4247.517288 4272.5237882 4307.5496516 4393.5500638 4409.5449826 4412.5810084 4412.6061397 4412.6187436 4468.6072231 4475.6031644 4483.5817562 4833.7394252 5563.008575 6441.3465264 6586.3840478 6732.4419549
msfragger.mass_offsets_detailed=
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
msfragger.output_report_topN_dda_plus=5
msfragger.output_report_topN_dia1=5
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
msfragger.require_precursor=true
msfragger.restrict_deltamass_to=N
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
msfragger.table.fix-mods=0.0,C-Term Peptide,true,-1; 229.16293,N-Term Peptide,true,-1; 0.0,C-Term Protein,true,-1; 0.0,N-Term Protein,true,-1; 0.0,G (glycine),true,-1; 0.0,A (alanine),true,-1; 0.0,S (serine),true,-1; 0.0,P (proline),true,-1; 0.0,V (valine),true,-1; 0.0,T (threonine),true,-1; 57.02146,C (cysteine),true,-1; 0.0,L (leucine),true,-1; 0.0,I (isoleucine),true,-1; 0.0,N (asparagine),true,-1; 0.0,D (aspartic acid),true,-1; 0.0,Q (glutamine),true,-1; 229.16293,K (lysine),true,-1; 0.0,E (glutamic acid),true,-1; 0.0,M (methionine),true,-1; 0.0,H (histidine),true,-1; 0.0,F (phenylalanine),true,-1; 0.0,R (arginine),true,-1; 0.0,Y (tyrosine),true,-1; 0.0,W (tryptophan),true,-1; 0.0,B ,true,-1; 0.0,J,true,-1; 0.0,O,true,-1; 0.0,U,true,-1; 0.0,X,true,-1; 0.0,Z,true,-1
msfragger.table.var-mods=15.9949,M,true,3; 42.0106,[^,true,1; 79.96633,STY,false,3; -17.0265,nQnC,false,1; -18.0106,nE,false,1; 4.025107,K,false,3; 6.020129,R,false,3
msfragger.track_zero_topN=0
msfragger.use_all_mods_in_first_search=false
msfragger.use_detailed_offsets=false
msfragger.use_topN_peaks=300
msfragger.write_calibrated_mzml=false
msfragger.write_uncalibrated_mgf=false
msfragger.zero_bin_accept_expect=0
msfragger.zero_bin_mult_expect=1
opair.activation1=HCD
opair.activation2=ETD
opair.filterOxonium=true
opair.glyco_db=HexNAc(1),HexNAc(2)Hex(1),HexNAc(2)Hex(3),HexNAc(2)Hex(3)Fuc(1),HexNAc(2)Hex(4),HexNAc(3)Hex(3),HexNAc(2)Hex(4)Fuc(1),HexNAc(2)Hex(5),HexNAc(3)Hex(3)Fuc(1),HexNAc(3)Hex(4),HexNAc(4)Hex(3),HexNAc(2)Hex(5)Fuc(1),HexNAc(2)Hex(6),HexNAc(3)Hex(3)Fuc(2),HexNAc(3)Hex(4)Fuc(1),HexNAc(3)Hex(5),HexNAc(4)Hex(3)Fuc(1),HexNAc(4)Hex(4),HexNAc(5)Hex(3),HexNAc(2)Hex(6)Fuc(1),HexNAc(3)Hex(3)Fuc(3),HexNAc(2)Hex(7),HexNAc(3)Hex(4)NeuAc(1),HexNAc(3)Hex(4)Fuc(2),HexNAc(3)Hex(5)Fuc(1),HexNAc(3)Hex(6),HexNAc(4)Hex(3)NeuAc(1),HexNAc(4)Hex(4)Fuc(1),HexNAc(4)Hex(5),HexNAc(5)Hex(3)Fuc(1),HexNAc(5)Hex(4),HexNAc(2)Hex(7)Fuc(1),HexNAc(3)Hex(4)Fuc(1)NeuAc(1),HexNAc(3)Hex(4)Fuc(3),HexNAc(2)Hex(8),HexNAc(6)Hex(3),HexNAc(3)Hex(5)NeuAc(1),HexNAc(3)Hex(5)Fuc(2),HexNAc(3)Hex(6)Fuc(1),HexNAc(4)Hex(3)Fuc(1)NeuAc(1),HexNAc(4)Hex(3)Fuc(3),HexNAc(4)Hex(4)NeuAc(1),HexNAc(4)Hex(4)Fuc(2),HexNAc(4)Hex(5)Fuc(1),HexNAc(4)Hex(6),HexNAc(5)Hex(3)Fuc(2),HexNAc(5)Hex(4)Fuc(1),HexNAc(5)Hex(5),HexNAc(2)Hex(8)Fuc(1),HexNAc(6)Hex(3)Fuc(1),HexNAc(3)Hex(5)Fuc(1)NeuAc(1),HexNAc(3)Hex(5)Fuc(3),HexNAc(2)Hex(9),HexNAc(6)Hex(4),HexNAc(3)Hex(6)NeuAc(1),HexNAc(3)Hex(6)Fuc(2),HexNAc(4)Hex(3)NeuAc(2),HexNAc(3)Hex(7)Fuc(1),HexNAc(4)Hex(4)Fuc(1)NeuAc(1),HexNAc(4)Hex(4)Fuc(3),HexNAc(7)Hex(3),HexNAc(4)Hex(5)NeuAc(1),HexNAc(4)Hex(5)Fuc(2),HexNAc(4)Hex(6)Fuc(1),HexNAc(5)Hex(3)Fuc(1)NeuAc(1),HexNAc(4)Hex(7),HexNAc(5)Hex(4)NeuAc(1),HexNAc(5)Hex(4)Fuc(2),HexNAc(5)Hex(5)Fuc(1),HexNAc(5)Hex(6),HexNAc(6)Hex(3)Fuc(2),HexNAc(2)Hex(9)Fuc(1),HexNAc(6)Hex(4)Fuc(1),HexNAc(3)Hex(6)Fuc(1)NeuAc(1),HexNAc(3)Hex(6)Fuc(3),HexNAc(2)Hex(10),HexNAc(6)Hex(5),HexNAc(4)Hex(4)NeuAc(2),HexNAc(4)Hex(4)Fuc(2)NeuAc(1),HexNAc(7)Hex(3)Fuc(1),HexNAc(4)Hex(5)Fuc(1)NeuAc(1),HexNAc(4)Hex(5)Fuc(3),HexNAc(7)Hex(4),HexNAc(4)Hex(6)NeuAc(1),HexNAc(4)Hex(6)Fuc(2),HexNAc(4)Hex(7)Fuc(1),HexNAc(5)Hex(4)Fuc(1)NeuAc(1),HexNAc(5)Hex(4)Fuc(3),HexNAc(4)Hex(8),HexNAc(8)Hex(3),HexNAc(5)Hex(5)NeuAc(1),HexNAc(5)Hex(5)Fuc(2),HexNAc(5)Hex(6)Fuc(1),HexNAc(6)Hex(3)Fuc(1)NeuAc(1),HexNAc(6)Hex(3)Fuc(3),HexNAc(6)Hex(4)NeuAc(1),HexNAc(6)Hex(4)Fuc(2),HexNAc(2)Hex(10)Fuc(1),HexNAc(6)Hex(5)Fuc(1),HexNAc(2)Hex(11),HexNAc(6)Hex(6),HexNAc(4)Hex(5)NeuAc(2),HexNAc(4)Hex(5)Fuc(2)NeuAc(1),HexNAc(4)Hex(5)Fuc(4),HexNAc(7)Hex(4)Fuc(1),HexNAc(4)Hex(6)Fuc(1)NeuAc(1),HexNAc(4)Hex(6)Fuc(3),HexNAc(7)Hex(5),HexNAc(4)Hex(7)NeuAc(1),HexNAc(5)Hex(4)NeuAc(2),HexNAc(5)Hex(4)Fuc(2)NeuAc(1),HexNAc(4)Hex(8)Fuc(1),HexNAc(8)Hex(3)Fuc(1),HexNAc(5)Hex(5)Fuc(1)NeuAc(1),HexNAc(5)Hex(5)Fuc(3),HexNAc(4)Hex(9),HexNAc(5)Hex(6)NeuAc(1),HexNAc(5)Hex(6)Fuc(2),HexNAc(6)Hex(3)Fuc(2)NeuAc(1),HexNAc(9)Hex(3),HexNAc(6)Hex(5)Fuc(2),HexNAc(2)Hex(11)Fuc(1),HexNAc(6)Hex(6)Fuc(1),HexNAc(2)Hex(12),HexNAc(4)Hex(5)Fuc(1)NeuAc(2),HexNAc(6)Hex(7),HexNAc(4)Hex(5)Fuc(5),HexNAc(4)Hex(6)NeuAc(2),HexNAc(5)Hex(4)Fuc(1)NeuAc(2),HexNAc(7)Hex(6),HexNAc(5)Hex(5)NeuAc(2),HexNAc(5)Hex(5)Fuc(2)NeuAc(1),HexNAc(5)Hex(6)Fuc(1)NeuAc(1),HexNAc(5)Hex(6)Fuc(3),HexNAc(6)Hex(3)Fuc(1)NeuAc(2),HexNAc(8)Hex(5),HexNAc(6)Hex(4)NeuAc(2),HexNAc(5)Hex(8)Fuc(1),HexNAc(9)Hex(3)Fuc(1),HexNAc(2)Hex(10)Fuc(1)NeuAc(1),HexNAc(6)Hex(5)Fuc(1)NeuAc(1),HexNAc(9)Hex(4),HexNAc(6)Hex(6)NeuAc(1),HexNAc(6)Hex(7)Fuc(1),HexNAc(4)Hex(7)NeuAc(2),HexNAc(7)Hex(6)Fuc(1),HexNAc(4)Hex(8)Fuc(1)NeuAc(1),HexNAc(5)Hex(5)Fuc(1)NeuAc(2),HexNAc(7)Hex(7),HexNAc(5)Hex(6)NeuAc(2),HexNAc(5)Hex(6)Fuc(2)NeuAc(1),HexNAc(5)Hex(6)Fuc(4),HexNAc(8)Hex(5)Fuc(1),HexNAc(5)Hex(7)Fuc(1)NeuAc(1),HexNAc(9)Hex(4)Fuc(1),HexNAc(6)Hex(6)Fuc(1)NeuAc(1),HexNAc(6)Hex(7)NeuAc(1),HexNAc(6)Hex(7)Fuc(2),HexNAc(4)Hex(7)Fuc(1)NeuAc(2),HexNAc(7)Hex(7)Fuc(1),HexNAc(5)Hex(6)Fuc(1)NeuAc(2),HexNAc(5)Hex(6)Fuc(3)NeuAc(1),HexNAc(7)Hex(8),HexNAc(6)Hex(6)NeuAc(2),HexNAc(6)Hex(6)Fuc(4),HexNAc(4)Hex(5)NeuAc(4),HexNAc(6)Hex(7)Fuc(1)NeuAc(1),HexNAc(6)Hex(7)Fuc(3),HexNAc(7)Hex(4)Fuc(1)NeuAc(2),HexNAc(7)Hex(5)NeuAc(2),HexNAc(6)Hex(9)Fuc(1),HexNAc(5)Hex(6)NeuAc(3),HexNAc(7)Hex(8)Fuc(1),HexNAc(6)Hex(3)Fuc(4)NeuAc(2),HexNAc(5)Hex(7)Fuc(1)NeuAc(2),HexNAc(7)Hex(9),HexNAc(5)Hex(8)Fuc(4),HexNAc(6)Hex(6)Fuc(1)NeuAc(2),HexNAc(6)Hex(7)NeuAc(2),HexNAc(6)Hex(7)Fuc(4),HexNAc(4)Hex(7)Fuc(1)NeuAc(3),HexNAc(6)Hex(9)NeuAc(1),HexNAc(5)Hex(6)Fuc(1)NeuAc(3),HexNAc(7)Hex(8)NeuAc(1),HexNAc(5)Hex(6)Fuc(7),HexNAc(6)Hex(5)Fuc(1)NeuAc(3),HexNAc(6)Hex(6)NeuAc(3),HexNAc(6)Hex(7)Fuc(1)NeuAc(2),HexNAc(8)Hex(9),HexNAc(6)Hex(7)Fuc(5),HexNAc(7)Hex(7)NeuAc(2),HexNAc(7)Hex(7)Fuc(4),HexNAc(6)Hex(11)Fuc(1),HexNAc(5)Hex(6)Fuc(2)NeuAc(3),HexNAc(7)Hex(8)Fuc(1)NeuAc(1),HexNAc(7)Hex(8)Fuc(3),HexNAc(6)Hex(6)Fuc(1)NeuAc(3),HexNAc(6)Hex(7)NeuAc(3),HexNAc(6)Hex(7)Fuc(4)NeuAc(1),HexNAc(8)Hex(9)Fuc(1),HexNAc(7)Hex(4)NeuAc(4),HexNAc(7)Hex(7)Fuc(1)NeuAc(2),HexNAc(7)Hex(8)NeuAc(2),HexNAc(7)Hex(8)Fuc(4),HexNAc(6)Hex(7)Fuc(1)NeuAc(3),HexNAc(8)Hex(9)NeuAc(1),HexNAc(6)Hex(9)Fuc(1)NeuAc(2),HexNAc(6)Hex(9)Fuc(5),HexNAc(7)Hex(8)Fuc(3)NeuAc(1),HexNAc(9)Hex(10),HexNAc(7)Hex(8)Fuc(5),HexNAc(8)Hex(8)NeuAc(2),HexNAc(6)Hex(7)NeuAc(4),HexNAc(6)Hex(7)Fuc(4)NeuAc(2),HexNAc(8)Hex(9)Fuc(1)NeuAc(1),HexNAc(8)Hex(9)Fuc(3),HexNAc(5)Hex(6)Fuc(1)NeuAc(5),HexNAc(7)Hex(8)NeuAc(3),HexNAc(9)Hex(10)Fuc(1),HexNAc(6)Hex(7)Fuc(1)NeuAc(4),HexNAc(8)Hex(9)NeuAc(2),HexNAc(6)Hex(7)Fuc(5)NeuAc(2),HexNAc(7)Hex(6)Fuc(1)NeuAc(4),HexNAc(7)Hex(7)NeuAc(4),HexNAc(7)Hex(8)Fuc(3)NeuAc(2),HexNAc(6)Hex(7)Fuc(2)NeuAc(4),HexNAc(8)Hex(9)Fuc(3)NeuAc(1),HexNAc(8)Hex(10)NeuAc(2),HexNAc(7)Hex(7)Fuc(1)NeuAc(4),HexNAc(7)Hex(8)NeuAc(4),HexNAc(9)Hex(10)Fuc(3),HexNAc(10)Hex(11)Fuc(1),HexNAc(7)Hex(8)Fuc(1)NeuAc(4),HexNAc(6)Hex(7)Fuc(4)NeuAc(4),HexNAc(8)Hex(9)Fuc(3)NeuAc(2),HexNAc(8)Hex(10)NeuAc(3),HexNAc(9)Hex(10)Fuc(1)NeuAc(2),HexNAc(6)Hex(7)Fuc(5)NeuAc(4),HexNAc(9)Hex(7)Fuc(1)NeuAc(4),HexNAc(11)Hex(11)NeuAc(1),HexNAc(8)Hex(9)Fuc(1)NeuAc(4),HexNAc(8)Hex(10)NeuAc(4),HexNAc(10)Hex(12)Fuc(1)NeuAc(1),HexNAc(8)Hex(10)Fuc(6)NeuAc(1),HexNAc(12)Hex(5)Fuc(2)NeuAc(3),HexNAc(9)Hex(10)Fuc(3)NeuAc(2),HexNAc(10)Hex(7)Fuc(1)NeuAc(4),HexNAc(9)Hex(11)NeuAc(3),HexNAc(10)Hex(11)Fuc(3)NeuAc(2),HexNAc(10)Hex(11)Fuc(6)NeuAc(3),HexNAc(14)Hex(15)Fuc(6)NeuAc(1),HexNAc(14)Hex(15)Fuc(5)NeuAc(2),HexNAc(14)Hex(15)Fuc(6)NeuAc(2)
opair.max_glycans=1
opair.max_isotope_error=2
opair.min_isotope_error=0
opair.ms1_tol=20
opair.ms2_tol=20
opair.oxonium_filtering_file=
opair.oxonium_minimum_intensity=0.05
opair.reverse_scan_order=false
opair.run-opair=false
opair.single_scan_type=false
peptide-prophet.cmd-opts=--nonparam --expectscore --decoyprobs --masswidth 4000.0 --glyc
peptide-prophet.combine-pepxml=true
peptide-prophet.run-peptide-prophet=true
percolator.cmd-opts=--only-psms --no-terminate --post-processing-tdc
percolator.keep-tsv-files=false
percolator.min-prob=0.5
percolator.run-percolator=false
phi-report.dont-use-prot-proph-file=false
phi-report.filter=--sequential --prot 0.01
phi-report.pep-level-summary=false
phi-report.print-decoys=false
phi-report.prot-level-summary=false
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
ptmshepherd.cap_y_ions=0,203.07937,406.15874,568.21156,730.26438,892.3172,349.137279
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
ptmshepherd.glyco_fdr=0.01
ptmshepherd.glyco_isotope_max=3
ptmshepherd.glyco_isotope_min=-1
ptmshepherd.glyco_ppm_tol=50
ptmshepherd.glycodatabase=HexNAc(1),HexNAc(2)Hex(1),HexNAc(2)Hex(3),HexNAc(2)Hex(3)Fuc(1),HexNAc(2)Hex(4),HexNAc(3)Hex(3),HexNAc(2)Hex(4)Fuc(1),HexNAc(2)Hex(5),HexNAc(3)Hex(3)Fuc(1),HexNAc(3)Hex(4),HexNAc(4)Hex(3),HexNAc(2)Hex(5)Fuc(1),HexNAc(2)Hex(6),HexNAc(3)Hex(3)Fuc(2),HexNAc(3)Hex(4)Fuc(1),HexNAc(3)Hex(5),HexNAc(4)Hex(3)Fuc(1),HexNAc(4)Hex(4),HexNAc(5)Hex(3),HexNAc(2)Hex(6)Fuc(1),HexNAc(3)Hex(3)Fuc(3),HexNAc(2)Hex(7),HexNAc(3)Hex(4)NeuAc(1),HexNAc(3)Hex(4)Fuc(2),HexNAc(3)Hex(5)Fuc(1),HexNAc(3)Hex(6),HexNAc(4)Hex(3)NeuAc(1),HexNAc(4)Hex(4)Fuc(1),HexNAc(4)Hex(5),HexNAc(5)Hex(3)Fuc(1),HexNAc(5)Hex(4),HexNAc(2)Hex(7)Fuc(1),HexNAc(3)Hex(4)Fuc(1)NeuAc(1),HexNAc(3)Hex(4)Fuc(3),HexNAc(2)Hex(8),HexNAc(6)Hex(3),HexNAc(3)Hex(5)NeuAc(1),HexNAc(3)Hex(5)Fuc(2),HexNAc(3)Hex(6)Fuc(1),HexNAc(4)Hex(3)Fuc(1)NeuAc(1),HexNAc(4)Hex(3)Fuc(3),HexNAc(4)Hex(4)NeuAc(1),HexNAc(4)Hex(4)Fuc(2),HexNAc(4)Hex(5)Fuc(1),HexNAc(4)Hex(6),HexNAc(5)Hex(3)Fuc(2),HexNAc(5)Hex(4)Fuc(1),HexNAc(5)Hex(5),HexNAc(2)Hex(8)Fuc(1),HexNAc(6)Hex(3)Fuc(1),HexNAc(3)Hex(5)Fuc(1)NeuAc(1),HexNAc(3)Hex(5)Fuc(3),HexNAc(2)Hex(9),HexNAc(6)Hex(4),HexNAc(3)Hex(6)NeuAc(1),HexNAc(3)Hex(6)Fuc(2),HexNAc(4)Hex(3)NeuAc(2),HexNAc(3)Hex(7)Fuc(1),HexNAc(4)Hex(4)Fuc(1)NeuAc(1),HexNAc(4)Hex(4)Fuc(3),HexNAc(7)Hex(3),HexNAc(4)Hex(5)NeuAc(1),HexNAc(4)Hex(5)Fuc(2),HexNAc(4)Hex(6)Fuc(1),HexNAc(5)Hex(3)Fuc(1)NeuAc(1),HexNAc(4)Hex(7),HexNAc(5)Hex(4)NeuAc(1),HexNAc(5)Hex(4)Fuc(2),HexNAc(5)Hex(5)Fuc(1),HexNAc(5)Hex(6),HexNAc(6)Hex(3)Fuc(2),HexNAc(2)Hex(9)Fuc(1),HexNAc(6)Hex(4)Fuc(1),HexNAc(3)Hex(6)Fuc(1)NeuAc(1),HexNAc(3)Hex(6)Fuc(3),HexNAc(2)Hex(10),HexNAc(6)Hex(5),HexNAc(4)Hex(4)NeuAc(2),HexNAc(4)Hex(4)Fuc(2)NeuAc(1),HexNAc(7)Hex(3)Fuc(1),HexNAc(4)Hex(5)Fuc(1)NeuAc(1),HexNAc(4)Hex(5)Fuc(3),HexNAc(7)Hex(4),HexNAc(4)Hex(6)NeuAc(1),HexNAc(4)Hex(6)Fuc(2),HexNAc(4)Hex(7)Fuc(1),HexNAc(5)Hex(4)Fuc(1)NeuAc(1),HexNAc(5)Hex(4)Fuc(3),HexNAc(4)Hex(8),HexNAc(8)Hex(3),HexNAc(5)Hex(5)NeuAc(1),HexNAc(5)Hex(5)Fuc(2),HexNAc(5)Hex(6)Fuc(1),HexNAc(6)Hex(3)Fuc(1)NeuAc(1),HexNAc(6)Hex(3)Fuc(3),HexNAc(6)Hex(4)NeuAc(1),HexNAc(6)Hex(4)Fuc(2),HexNAc(2)Hex(10)Fuc(1),HexNAc(6)Hex(5)Fuc(1),HexNAc(2)Hex(11),HexNAc(6)Hex(6),HexNAc(4)Hex(5)NeuAc(2),HexNAc(4)Hex(5)Fuc(2)NeuAc(1),HexNAc(4)Hex(5)Fuc(4),HexNAc(7)Hex(4)Fuc(1),HexNAc(4)Hex(6)Fuc(1)NeuAc(1),HexNAc(4)Hex(6)Fuc(3),HexNAc(7)Hex(5),HexNAc(4)Hex(7)NeuAc(1),HexNAc(5)Hex(4)NeuAc(2),HexNAc(5)Hex(4)Fuc(2)NeuAc(1),HexNAc(4)Hex(8)Fuc(1),HexNAc(8)Hex(3)Fuc(1),HexNAc(5)Hex(5)Fuc(1)NeuAc(1),HexNAc(5)Hex(5)Fuc(3),HexNAc(4)Hex(9),HexNAc(5)Hex(6)NeuAc(1),HexNAc(5)Hex(6)Fuc(2),HexNAc(6)Hex(3)Fuc(2)NeuAc(1),HexNAc(9)Hex(3),HexNAc(6)Hex(5)Fuc(2),HexNAc(2)Hex(11)Fuc(1),HexNAc(6)Hex(6)Fuc(1),HexNAc(2)Hex(12),HexNAc(4)Hex(5)Fuc(1)NeuAc(2),HexNAc(6)Hex(7),HexNAc(4)Hex(5)Fuc(5),HexNAc(4)Hex(6)NeuAc(2),HexNAc(5)Hex(4)Fuc(1)NeuAc(2),HexNAc(7)Hex(6),HexNAc(5)Hex(5)NeuAc(2),HexNAc(5)Hex(5)Fuc(2)NeuAc(1),HexNAc(5)Hex(6)Fuc(1)NeuAc(1),HexNAc(5)Hex(6)Fuc(3),HexNAc(6)Hex(3)Fuc(1)NeuAc(2),HexNAc(8)Hex(5),HexNAc(6)Hex(4)NeuAc(2),HexNAc(5)Hex(8)Fuc(1),HexNAc(9)Hex(3)Fuc(1),HexNAc(2)Hex(10)Fuc(1)NeuAc(1),HexNAc(6)Hex(5)Fuc(1)NeuAc(1),HexNAc(9)Hex(4),HexNAc(6)Hex(6)NeuAc(1),HexNAc(6)Hex(7)Fuc(1),HexNAc(4)Hex(7)NeuAc(2),HexNAc(7)Hex(6)Fuc(1),HexNAc(4)Hex(8)Fuc(1)NeuAc(1),HexNAc(5)Hex(5)Fuc(1)NeuAc(2),HexNAc(7)Hex(7),HexNAc(5)Hex(6)NeuAc(2),HexNAc(5)Hex(6)Fuc(2)NeuAc(1),HexNAc(5)Hex(6)Fuc(4),HexNAc(8)Hex(5)Fuc(1),HexNAc(5)Hex(7)Fuc(1)NeuAc(1),HexNAc(9)Hex(4)Fuc(1),HexNAc(6)Hex(6)Fuc(1)NeuAc(1),HexNAc(6)Hex(7)NeuAc(1),HexNAc(6)Hex(7)Fuc(2),HexNAc(4)Hex(7)Fuc(1)NeuAc(2),HexNAc(7)Hex(7)Fuc(1),HexNAc(5)Hex(6)Fuc(1)NeuAc(2),HexNAc(5)Hex(6)Fuc(3)NeuAc(1),HexNAc(7)Hex(8),HexNAc(6)Hex(6)NeuAc(2),HexNAc(6)Hex(6)Fuc(4),HexNAc(4)Hex(5)NeuAc(4),HexNAc(6)Hex(7)Fuc(1)NeuAc(1),HexNAc(6)Hex(7)Fuc(3),HexNAc(7)Hex(4)Fuc(1)NeuAc(2),HexNAc(7)Hex(5)NeuAc(2),HexNAc(6)Hex(9)Fuc(1),HexNAc(5)Hex(6)NeuAc(3),HexNAc(7)Hex(8)Fuc(1),HexNAc(6)Hex(3)Fuc(4)NeuAc(2),HexNAc(5)Hex(7)Fuc(1)NeuAc(2),HexNAc(7)Hex(9),HexNAc(5)Hex(8)Fuc(4),HexNAc(6)Hex(6)Fuc(1)NeuAc(2),HexNAc(6)Hex(7)NeuAc(2),HexNAc(6)Hex(7)Fuc(4),HexNAc(4)Hex(7)Fuc(1)NeuAc(3),HexNAc(6)Hex(9)NeuAc(1),HexNAc(5)Hex(6)Fuc(1)NeuAc(3),HexNAc(7)Hex(8)NeuAc(1),HexNAc(5)Hex(6)Fuc(7),HexNAc(6)Hex(5)Fuc(1)NeuAc(3),HexNAc(6)Hex(6)NeuAc(3),HexNAc(6)Hex(7)Fuc(1)NeuAc(2),HexNAc(8)Hex(9),HexNAc(6)Hex(7)Fuc(5),HexNAc(7)Hex(7)NeuAc(2),HexNAc(7)Hex(7)Fuc(4),HexNAc(6)Hex(11)Fuc(1),HexNAc(5)Hex(6)Fuc(2)NeuAc(3),HexNAc(7)Hex(8)Fuc(1)NeuAc(1),HexNAc(7)Hex(8)Fuc(3),HexNAc(6)Hex(6)Fuc(1)NeuAc(3),HexNAc(6)Hex(7)NeuAc(3),HexNAc(6)Hex(7)Fuc(4)NeuAc(1),HexNAc(8)Hex(9)Fuc(1),HexNAc(7)Hex(4)NeuAc(4),HexNAc(7)Hex(7)Fuc(1)NeuAc(2),HexNAc(7)Hex(8)NeuAc(2),HexNAc(7)Hex(8)Fuc(4),HexNAc(6)Hex(7)Fuc(1)NeuAc(3),HexNAc(8)Hex(9)NeuAc(1),HexNAc(6)Hex(9)Fuc(1)NeuAc(2),HexNAc(6)Hex(9)Fuc(5),HexNAc(7)Hex(8)Fuc(3)NeuAc(1),HexNAc(9)Hex(10),HexNAc(7)Hex(8)Fuc(5),HexNAc(8)Hex(8)NeuAc(2),HexNAc(6)Hex(7)NeuAc(4),HexNAc(6)Hex(7)Fuc(4)NeuAc(2),HexNAc(8)Hex(9)Fuc(1)NeuAc(1),HexNAc(8)Hex(9)Fuc(3),HexNAc(5)Hex(6)Fuc(1)NeuAc(5),HexNAc(7)Hex(8)NeuAc(3),HexNAc(9)Hex(10)Fuc(1),HexNAc(6)Hex(7)Fuc(1)NeuAc(4),HexNAc(8)Hex(9)NeuAc(2),HexNAc(6)Hex(7)Fuc(5)NeuAc(2),HexNAc(7)Hex(6)Fuc(1)NeuAc(4),HexNAc(7)Hex(7)NeuAc(4),HexNAc(7)Hex(8)Fuc(3)NeuAc(2),HexNAc(6)Hex(7)Fuc(2)NeuAc(4),HexNAc(8)Hex(9)Fuc(3)NeuAc(1),HexNAc(8)Hex(10)NeuAc(2),HexNAc(7)Hex(7)Fuc(1)NeuAc(4),HexNAc(7)Hex(8)NeuAc(4),HexNAc(9)Hex(10)Fuc(3),HexNAc(10)Hex(11)Fuc(1),HexNAc(7)Hex(8)Fuc(1)NeuAc(4),HexNAc(6)Hex(7)Fuc(4)NeuAc(4),HexNAc(8)Hex(9)Fuc(3)NeuAc(2),HexNAc(8)Hex(10)NeuAc(3),HexNAc(9)Hex(10)Fuc(1)NeuAc(2),HexNAc(6)Hex(7)Fuc(5)NeuAc(4),HexNAc(9)Hex(7)Fuc(1)NeuAc(4),HexNAc(11)Hex(11)NeuAc(1),HexNAc(8)Hex(9)Fuc(1)NeuAc(4),HexNAc(8)Hex(10)NeuAc(4),HexNAc(10)Hex(12)Fuc(1)NeuAc(1),HexNAc(8)Hex(10)Fuc(6)NeuAc(1),HexNAc(12)Hex(5)Fuc(2)NeuAc(3),HexNAc(9)Hex(10)Fuc(3)NeuAc(2),HexNAc(10)Hex(7)Fuc(1)NeuAc(4),HexNAc(9)Hex(11)NeuAc(3),HexNAc(10)Hex(11)Fuc(3)NeuAc(2),HexNAc(10)Hex(11)Fuc(6)NeuAc(3),HexNAc(14)Hex(15)Fuc(6)NeuAc(1),HexNAc(14)Hex(15)Fuc(5)NeuAc(2),HexNAc(14)Hex(15)Fuc(6)NeuAc(2)
ptmshepherd.histo_smoothbins=2
ptmshepherd.iontype_a=false
ptmshepherd.iontype_b=true
ptmshepherd.iontype_c=false
ptmshepherd.iontype_x=false
ptmshepherd.iontype_y=true
ptmshepherd.iontype_z=false
ptmshepherd.iterloc_maxEpoch=100
ptmshepherd.iterloc_mode=false
ptmshepherd.localization_allowed_res=N
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
ptmshepherd.print_full_glyco_params=true
ptmshepherd.prob_mass=1.0
ptmshepherd.remainder_masses=203.07937
ptmshepherd.remove_glycan_delta_mass=true
ptmshepherd.run-shepherd=true
ptmshepherd.run_diagextract_mode=true
ptmshepherd.run_diagmine_mode=false
ptmshepherd.run_glyco_mode=true
ptmshepherd.spectra_maxfragcharge=2
ptmshepherd.spectra_ppmtol=20
ptmshepherd.varmod_masses=
quantitation.run-label-free-quant=false
run-psm-validation=true
run-validation-tab=true
saintexpress.fragpipe.cmd-opts=
saintexpress.max-replicates=3
saintexpress.run-saint-express=true
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
speclibgen.easypqp.ignore_unannotated=true
speclibgen.easypqp.im-cal=Automatic selection of a run as reference IM
speclibgen.easypqp.labile_mode=N-glyco+HexNAc
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
tmtintegrator.allow_unlabeled=false
tmtintegrator.best_psm=true
tmtintegrator.channel_num=TMT-10
tmtintegrator.extraction_tool=IonQuant
tmtintegrator.glyco_qval=0.01
tmtintegrator.groupby=-1
tmtintegrator.log2transformed=true
tmtintegrator.max_pep_prob_thres=0
tmtintegrator.min_ntt=0
tmtintegrator.min_pep_prob=0.9
tmtintegrator.min_percent=0.05
tmtintegrator.min_purity=0.5
tmtintegrator.min_site_prob=0
tmtintegrator.mod_tag=N-glyco
tmtintegrator.ms1_int=true
tmtintegrator.outlier_removal=true
tmtintegrator.philosopher-msstats=false
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
workflow.description=<p style\="margin-top\: 0">For search and TMT quantitation of enriched N-glycopeptides fragmented with CID/HCD. Performs MSFragger glyco search, glycan FDR control in PTM-Shepherd, and TMT quant/summarization with TMT-Integrator. Settings are provided for TMT-10 with virtual reference channel - method can be adapated for other TMT settings by adjusting TMT-Integrator parameters.</p>
workflow.input.data-type.im-ms=false
workflow.input.data-type.regular-ms=true
workflow.misc.save-sdrf=true
workflow.saved-with-ver=21.2-build56
