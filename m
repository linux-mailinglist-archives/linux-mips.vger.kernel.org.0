Return-Path: <linux-mips+bounces-4180-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0156B929546
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 23:47:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D7541F21675
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 21:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF7F381C8;
	Sat,  6 Jul 2024 21:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwvJdHhh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36293208BC;
	Sat,  6 Jul 2024 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720302441; cv=none; b=gg/Un9CSCtUPB3IHWYtL+5u09epj9Q5zQRP2Dg1pn6IJUjPVFZvH04E3kGjRydiQQ4e/5iVY5o3/WY55Jj17m9hzmJ1jrAuHo6dCDdgs3wlMcm0u5NPZX5jj/bmpBQn9YsM0vFhwAx30enC6AznyJfjtYQz9U718BTSaoEEpM9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720302441; c=relaxed/simple;
	bh=b7tz0BzPgTkRKIfhOuHJPntfjh/mfDWtZRGrng30wSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cra0uamKcgrYD+LuGquNkkUnsZxqE6NmW7UVeTjhnbfoPf6rnfCN/5tr4/9OYIwTEG8AuHDLeWgt+PeHPUCAK6AwYZJ171hBlwUlP9ulK2W8sIjJAN36i12AzRk0z2G3kQFpnqCx040ylh/3deoP7JkWFNMG9THJnXkdX9lPXJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwvJdHhh; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720302440; x=1751838440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b7tz0BzPgTkRKIfhOuHJPntfjh/mfDWtZRGrng30wSo=;
  b=XwvJdHhhnM2isTWidrzQzc7Fxnh/ibccR2plAog0FJltVlAHwRt+y0vQ
   EQhQb0xRwwAVhT20Abv5sFN6dPDpRT69X2Obo2tufp9I2+LSj0NvOuu+2
   17UXEXCX7GBM9gudQiKoECyV0mCc11ulHd7E8NhMT9FC3i828QzMVWTsq
   s0ZmMBdJxk2dM5Oe4I1EyYvGuUU01/8SPgXBl0UcMB1BKR/GLy5X9sUnN
   Uk5kzL0FCcpI09gDWBkJNmhy7vBAOlgj8WZoKcEC3ECk0incHordMtL7F
   4TIyJcWfADbIhLEPZi3bCRFxVD03yUZleLbAmv7uy2BX+oqpCNfplivdp
   g==;
X-CSE-ConnectionGUID: 8fGhTqJUTiqCNqTJK/2eoA==
X-CSE-MsgGUID: lVn9R/cvR5+e4YHAxLxheA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="40054726"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="40054726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 14:47:18 -0700
X-CSE-ConnectionGUID: x56BgKGcSFybPQ0nCuyziw==
X-CSE-MsgGUID: mqcrBhS1RU6JCAqk8hd6QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="51981673"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jul 2024 14:47:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQDFQ-000UJK-1x;
	Sat, 06 Jul 2024 21:47:12 +0000
Date: Sun, 7 Jul 2024 05:46:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 05/10] MIPS: smp: Implement IPI stats
Message-ID: <202407070535.1mCAxzdO-lkp@intel.com>
References: <20240705-b4-mips-ipi-improvements-v2-5-2d50b56268e8@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-5-2d50b56268e8@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0b58e108042b0ed28a71cd7edf5175999955b233]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/MIPS-smp-Make-IPI-interrupts-scalable/20240706-040839
base:   0b58e108042b0ed28a71cd7edf5175999955b233
patch link:    https://lore.kernel.org/r/20240705-b4-mips-ipi-improvements-v2-5-2d50b56268e8%40flygoat.com
patch subject: [PATCH v2 05/10] MIPS: smp: Implement IPI stats
config: mips-rb532_defconfig (https://download.01.org/0day-ci/archive/20240707/202407070535.1mCAxzdO-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070535.1mCAxzdO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070535.1mCAxzdO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/kernel/irq.c:17:
   In file included from include/linux/mm.h:2229:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/mips/kernel/irq.c:29:
>> arch/mips/include/asm/ipi.h:54:6: warning: no previous prototype for function 'mips_smp_ipi_set_virq_range' [-Wmissing-prototypes]
      54 | void mips_smp_ipi_set_virq_range(int virq, int nr)
         |      ^
   arch/mips/include/asm/ipi.h:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | void mips_smp_ipi_set_virq_range(int virq, int nr)
         | ^
         | static 
>> arch/mips/include/asm/ipi.h:58:6: warning: no previous prototype for function 'mips_smp_ipi_set_irqdomain' [-Wmissing-prototypes]
      58 | void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
         |      ^
   arch/mips/include/asm/ipi.h:58:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      58 | void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
         | ^
         | static 
   3 warnings generated.


vim +/mips_smp_ipi_set_virq_range +54 arch/mips/include/asm/ipi.h

42d789a89e6b90 Jiaxun Yang 2024-07-05  48  
42d789a89e6b90 Jiaxun Yang 2024-07-05  49  static inline void mips_smp_show_ipi_stats(struct seq_file *p, int prec)
42d789a89e6b90 Jiaxun Yang 2024-07-05  50  {
42d789a89e6b90 Jiaxun Yang 2024-07-05  51  }
b7a65e07e35cdf Jiaxun Yang 2024-07-05  52  #endif /* CONFIG_GENERIC_IRQ_IPI */
877ae81debcbb0 Jiaxun Yang 2024-07-05  53  #else
877ae81debcbb0 Jiaxun Yang 2024-07-05 @54  void mips_smp_ipi_set_virq_range(int virq, int nr)
877ae81debcbb0 Jiaxun Yang 2024-07-05  55  {
877ae81debcbb0 Jiaxun Yang 2024-07-05  56  }
877ae81debcbb0 Jiaxun Yang 2024-07-05  57  
877ae81debcbb0 Jiaxun Yang 2024-07-05 @58  void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
877ae81debcbb0 Jiaxun Yang 2024-07-05  59  {
877ae81debcbb0 Jiaxun Yang 2024-07-05  60  }
877ae81debcbb0 Jiaxun Yang 2024-07-05  61  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

