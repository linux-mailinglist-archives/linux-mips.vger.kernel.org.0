Return-Path: <linux-mips+bounces-4024-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED791C34F
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 18:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B79A7B238A5
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 16:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5971C8FC6;
	Fri, 28 Jun 2024 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OWzUdkq7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE841C232D;
	Fri, 28 Jun 2024 16:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719590899; cv=none; b=bGUfPicrRxEuETSu/WoaHhy1N589KgMMA0r7x5MxmP1pnGNigt22My2Rq6M06eE9tG+Ucmbe4FWL3ytYBIvwpHtU8ctt3kDZ+TVg+b/kTl3Zyx/MK0FdItffNsfikPX6YJ3U1UfGtyAIEPk/uCw6tGBRztPJ5bE49Sd2UBmMjdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719590899; c=relaxed/simple;
	bh=zzorYU/27hnfjB1vjJiodp8DNsccMxFGZ8yXSPHKSPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YveUBvcIy5AO+X1rmzHzv668NOAM/lEeOJOKMBhV7bDcOtTQ0NDW+Ii7dhY3A4hd3fHsA3hDFcPtvpPX7GVMGU5LPHSf4PCHQ6HVVSybV6zxcL9OWQi2mfwm0IENJ+E6t3uoqV08GbJGhY0+jfi2YdVJBXrbLe2EgEnsy5jTAI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OWzUdkq7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719590897; x=1751126897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zzorYU/27hnfjB1vjJiodp8DNsccMxFGZ8yXSPHKSPw=;
  b=OWzUdkq7INJ1DYSHSxDhGCQFLwqTS0juuly81ExZWArlbzURHN1Nn7Le
   O5TfdmGfP0kk5MRDWAYr42eYkBDkRiCdbTCpLY8BR5sRsmQf9y7EFApNe
   urHNnXA75xBqSsRRJxQGOBMVIs2lIdscroPELLRqgB2Ehxxw4DLYvewAk
   5Dd+jZc1glCkzD/gHdNkNP4oxg645AlrfC2rJv6IJMU52iaiSAI/43v24
   w3dqtETtJKpL0CSr6EfzfmjCnAEG3LpGQO5+sef6ejqx9zFWQqFUDf1cX
   fKvDqm/N86SeCN/sZ6UtTIOkEC/6uYaJT3AXcNJPWQzLpQAFL0pve+ZIX
   A==;
X-CSE-ConnectionGUID: jMxsMrIiSzGCBF51oJ6cWw==
X-CSE-MsgGUID: HdnRXe/zQKeKMhM1GS6XAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="42201322"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="42201322"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 09:08:16 -0700
X-CSE-ConnectionGUID: acw2AI8ZR92T05WVV7j1zw==
X-CSE-MsgGUID: 6iW7oFrTT8ShSatx/+rPiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="49395167"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Jun 2024 09:08:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNE8w-000HJm-1d;
	Fri, 28 Jun 2024 16:08:10 +0000
Date: Sat, 29 Jun 2024 00:07:14 +0800
From: kernel test robot <lkp@intel.com>
To: Shiji Yang <yangshiji66@outlook.com>, linux-mips@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Khalid Aziz <khalid@gonehiking.org>, Baoquan He <bhe@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>
Subject: Re: [PATCH V2] mips: kernel: fix detect_memory_region() function
Message-ID: <202406282354.0hGuOKo0-lkp@intel.com>
References: <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCP286MB089598ABD1E2F66003D71EB8BCD52@TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM>

Hi Shiji,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v6.10-rc5 next-20240627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shiji-Yang/mips-kernel-fix-detect_memory_region-function/20240626-070033
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/TYCP286MB089598ABD1E2F66003D71EB8BCD52%40TYCP286MB0895.JPNP286.PROD.OUTLOOK.COM
patch subject: [PATCH V2] mips: kernel: fix detect_memory_region() function
config: mips-randconfig-r113-20240628 (https://download.01.org/0day-ci/archive/20240628/202406282354.0hGuOKo0-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240628/202406282354.0hGuOKo0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406282354.0hGuOKo0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/mips/kernel/setup.c:104:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *dm @@
   arch/mips/kernel/setup.c:104:53: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/kernel/setup.c:104:53: sparse:     got void *dm
>> arch/mips/kernel/setup.c:105:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *dm @@
   arch/mips/kernel/setup.c:105:33: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/kernel/setup.c:105:33: sparse:     got void *dm
>> arch/mips/kernel/setup.c:105:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/kernel/setup.c:105:55: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/kernel/setup.c:105:55: sparse:     got void *
   arch/mips/kernel/setup.c:106:62: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *mem @@     got void *dm @@
   arch/mips/kernel/setup.c:106:62: sparse:     expected void volatile [noderef] __iomem *mem
   arch/mips/kernel/setup.c:106:62: sparse:     got void *dm
   arch/mips/kernel/setup.c:107:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void *dm @@
   arch/mips/kernel/setup.c:107:41: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/kernel/setup.c:107:41: sparse:     got void *dm
   arch/mips/kernel/setup.c:107:63: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *mem @@     got void * @@
   arch/mips/kernel/setup.c:107:63: sparse:     expected void const volatile [noderef] __iomem *mem
   arch/mips/kernel/setup.c:107:63: sparse:     got void *
   arch/mips/kernel/setup.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +104 arch/mips/kernel/setup.c

    97	
    98	void __init detect_memory_region(phys_addr_t start, phys_addr_t sz_min, phys_addr_t sz_max)
    99	{
   100		void *dm = (void *)KSEG1ADDR(&detect_magic);
   101		phys_addr_t size;
   102	
   103		for (size = sz_min; size < sz_max; size <<= 1) {
 > 104			__raw_writel(MIPS_MEM_TEST_PATTERN, dm);
 > 105			if (__raw_readl(dm) == __raw_readl(dm + size)) {
   106				__raw_writel(~MIPS_MEM_TEST_PATTERN, dm);
   107				if (__raw_readl(dm) == __raw_readl(dm + size))
   108					break;
   109			}
   110		}
   111	
   112		pr_debug("Memory: %lluMB of RAM detected at 0x%llx (min: %lluMB, max: %lluMB)\n",
   113			((unsigned long long) size) / SZ_1M,
   114			(unsigned long long) start,
   115			((unsigned long long) sz_min) / SZ_1M,
   116			((unsigned long long) sz_max) / SZ_1M);
   117	
   118		memblock_add(start, size);
   119	}
   120	#endif /* CONFIG_64BIT */
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

