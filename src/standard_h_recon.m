function h = standard_h_recon(patch_1,  patch_2,  patch_3,  patch_4,  patch_5,  patch_6, patch_7,   patch_8,  patch_9, patch_10)

	%reconstruction Three Level H
	r_llll = reconstruct_from_haar_swatches(patch_1, patch_2, patch_3,patch_4);
	r_ll = reconstruct_from_haar_swatches(r_llll, patch_5, patch_6,patch_7);
	h = reconstruct_from_haar_swatches(r_ll,patch_8,patch_9, patch_10);
end
