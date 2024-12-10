Return-Path: <linux-mips+bounces-6929-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A59EAFF9
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 12:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 328162917FF
	for <lists+linux-mips@lfdr.de>; Tue, 10 Dec 2024 11:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C362080D2;
	Tue, 10 Dec 2024 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSuMrLGi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70211DC992;
	Tue, 10 Dec 2024 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733830542; cv=none; b=XxSABz/nBjDr/pFYBGerYvW5iFr4UV7IBSOqP2kTLfj9m+1GQHF9cPGLqmys5T7CknUFgwY/XY44F/HXgN3Tt+TaS5WnDmZTCU5CNHn6lfZyxvvx+w/nCM7wrEPYW1z2DOJeckwhaTuSTB4dDLA15JZA6KtZt1sjPSESPLpQYm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733830542; c=relaxed/simple;
	bh=WHDSe6EUA5S0A1igiIW2WwLpfRxVDyrjbYLfxWAG7Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU4TCxeK4chtIS7mviQBueC3O5P5dwTFQiXeOHBRoTJ1FeyHpXjQe9LPAEjslZsiRySDfUVe31MW6fy014ICiegLl82rC/auVOJ7Od2JaKfmZLX4Dl5zJq40Mj9J7awRnjSnXpzxrFb9Pk+IkTbS4g0vLyI4FN6jCfombgIb3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSuMrLGi; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733830540; x=1765366540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WHDSe6EUA5S0A1igiIW2WwLpfRxVDyrjbYLfxWAG7Ls=;
  b=cSuMrLGiD7EZvkooBsFeYDJsbgvIHc/0tkPCUrXS++bjQj/XdSfle+WA
   oUrcCmGo9dQoE9j/xXN0r2/8NsmWejLgOUuxJ4WniyyWYx2lfCYgw1nAm
   ZgvU/X3nDRK1v6UCR8KaWQi0KzN4qCCuSQqoZBt+etkfm1G+vORGsUUvM
   EeWKR33bamAZ7TMcgIHUpi3Ru+T8+Wv2PJ6js9SJsZUHwMf7edjVjlNMT
   srn/xROAC3+Uq6zoS1BIuIiCz/sxXqV/9xxKHn5VZQq8a/BADlCjEJzna
   kXvGCE4583csm9jBRiSbMt2UMhhMw6kVTkOvnYm/6srtni85Dr3f/CzUt
   Q==;
X-CSE-ConnectionGUID: l+XZeAn1SyWUhGGTLXAzPQ==
X-CSE-MsgGUID: 4oa3EYlzTnuKC2LcsnDd1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="37953221"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="37953221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:35:39 -0800
X-CSE-ConnectionGUID: KnbZnJbTTp+ogeuAnZR5Lw==
X-CSE-MsgGUID: YdwH9kWVRUewkGlVt+S9DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95206413"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Dec 2024 03:35:32 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKyWX-0005TR-0J;
	Tue, 10 Dec 2024 11:35:29 +0000
Date: Tue, 10 Dec 2024 19:35:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kalesh Singh <kaleshsingh@google.com>, akpm@linux-foundation.org,
	vbabka@suse.cz, yang@os.amperecomputing.com, riel@surriel.com,
	david@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux@armlinux.org.uk,
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, davem@davemloft.net,
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com,
	leitao@debian.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH mm-unstable 04/17] mm: alpha: Introduce arch_mmap_hint()
Message-ID: <202412102123.Db7EAmhx-lkp@intel.com>
References: <20241210024119.2488608-5-kaleshsingh@google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210024119.2488608-5-kaleshsingh@google.com>

Hi Kalesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kalesh-Singh/mm-Introduce-generic_mmap_hint/20241210-104424
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241210024119.2488608-5-kaleshsingh%40google.com
patch subject: [PATCH mm-unstable 04/17] mm: alpha: Introduce arch_mmap_hint()
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20241210/202412102123.Db7EAmhx-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412102123.Db7EAmhx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412102123.Db7EAmhx-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/alpha/kernel/osf_sys.c: In function 'arch_get_unmapped_area':
>> arch/alpha/kernel/osf_sys.c:1280:24: error: 'hint' undeclared (first use in this function); did you mean 'uint'?
    1280 |                 return hint;
         |                        ^~~~
         |                        uint
   arch/alpha/kernel/osf_sys.c:1280:24: note: each undeclared identifier is reported only once for each function it appears in


vim +1280 arch/alpha/kernel/osf_sys.c

  1248	
  1249	unsigned long
  1250	arch_get_unmapped_area(struct file *filp, unsigned long addr,
  1251			       unsigned long len, unsigned long pgoff,
  1252			       unsigned long flags, vm_flags_t vm_flags)
  1253	{
  1254		unsigned long limit;
  1255	
  1256		/* "32 bit" actually means 31 bit, since pointers sign extend.  */
  1257		if (current->personality & ADDR_LIMIT_32BIT)
  1258			limit = 0x80000000;
  1259		else
  1260			limit = TASK_SIZE;
  1261	
  1262		if (len > limit)
  1263			return -ENOMEM;
  1264	
  1265		if (flags & MAP_FIXED)
  1266			return addr;
  1267	
  1268		/* First, see if the given suggestion fits.
  1269	
  1270		   The OSF/1 loader (/sbin/loader) relies on us returning an
  1271		   address larger than the requested if one exists, which is
  1272		   a terribly broken way to program.
  1273	
  1274		   That said, I can see the use in being able to suggest not
  1275		   merely specific addresses, but regions of memory -- perhaps
  1276		   this feature should be incorporated into all ports?  */
  1277	
  1278		addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
  1279		if (addr)
> 1280			return hint;
  1281	
  1282		/* Next, try allocating at TASK_UNMAPPED_BASE.  */
  1283		addr = arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE),
  1284						 len, limit);
  1285		if (addr != (unsigned long) -ENOMEM)
  1286			return addr;
  1287	
  1288		/* Finally, try allocating in low memory.  */
  1289		addr = arch_get_unmapped_area_1 (PAGE_SIZE, len, limit);
  1290	
  1291		return addr;
  1292	}
  1293	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

