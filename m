Return-Path: <linux-mips+bounces-4179-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91229929544
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 23:47:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C434281E0F
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 21:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304341CFB9;
	Sat,  6 Jul 2024 21:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITdrNXUD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D961CAA1;
	Sat,  6 Jul 2024 21:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720302440; cv=none; b=lbcyqp/C9MEPbuFo1LTrGt/EWKR9xGG0jPKwnXYwXYawBd7L3vdPWjLx8Fyvx9HzDlkyX633qw98VVgglhz6lQUVjcyjGMsobfbciMNJ0tCum3g3wf/kMsKo6mU+ncwXBWE0lx39+AkDPuXoQF/c9ZlHtgaViFye12UMlBEfL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720302440; c=relaxed/simple;
	bh=7Ic4iXxm1p40APDsnduHJq4A0R78mctyUKyPMZS2hk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jL4qhzsX+NvifbuzUgvtCSHpjZSkvlpMUm9JCCf2gTv/b8aHkphLIhk0G11w7DBDW7amVTOHMbR7EtnWXqKXtQ4eZ+ufeknHj6U8AiF6LrAlQ8QNsXOuOPE/1kQYB1Jq+R2ET1F/h8QHvYMMpb/GyGfvh+pgTg/hO76a5WrN8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITdrNXUD; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720302438; x=1751838438;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Ic4iXxm1p40APDsnduHJq4A0R78mctyUKyPMZS2hk4=;
  b=ITdrNXUDfZsJ0mTul9NyYcMUIdgbVjn3Tk24780XRBcRXQZIiYvX6Wch
   JSt4U0rAjkkveWwuZVwpTFA2D0491vrJFpXPVPrG14Km+QqBBZYXiiWtP
   zE3WdtMiHdfruxn2zKb0AHzRr2ZnpOdb9rYySue/LbWNIUZLBTVM004TB
   ZldagMIha85cGL9L4PNlObmfyQWLn5lbflwLVhAMFyJ0tqMCfJwolK18s
   9eKfnbrgCe8YFRR21LQQqP8CK2IOZlW+24xu46nnDybH8Z/cw9nrIA8dv
   CWl9RaACXreQieBHX5rMlluvZODappJPSOvKcXJbWkpO10oYbWrVBSee4
   g==;
X-CSE-ConnectionGUID: zht3g+V1Tze5kHicqH3www==
X-CSE-MsgGUID: jwIrSZYLQXKs0E4mzwogKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="40054717"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="40054717"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 14:47:17 -0700
X-CSE-ConnectionGUID: s3+ceverTcyQu3MX4ZAu9Q==
X-CSE-MsgGUID: gju+ppFnSlqCG+/TxWJeiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="51981672"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Jul 2024 14:47:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQDFQ-000UJM-21;
	Sat, 06 Jul 2024 21:47:12 +0000
Date: Sun, 7 Jul 2024 05:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 05/10] MIPS: smp: Implement IPI stats
Message-ID: <202407070524.LKSlICvH-lkp@intel.com>
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
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20240707/202407070524.LKSlICvH-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070524.LKSlICvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070524.LKSlICvH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/mips/kernel/irq.c:29:
>> arch/mips/include/asm/ipi.h:54:6: warning: no previous prototype for 'mips_smp_ipi_set_virq_range' [-Wmissing-prototypes]
      54 | void mips_smp_ipi_set_virq_range(int virq, int nr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/mips/include/asm/ipi.h:58:6: warning: no previous prototype for 'mips_smp_ipi_set_irqdomain' [-Wmissing-prototypes]
      58 | void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


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

