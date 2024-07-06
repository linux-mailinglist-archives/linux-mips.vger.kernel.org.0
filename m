Return-Path: <linux-mips+bounces-4181-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 291D79295BD
	for <lists+linux-mips@lfdr.de>; Sun,  7 Jul 2024 01:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B4211F21906
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 23:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B7A2B9D2;
	Sat,  6 Jul 2024 23:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZfYfvTDM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C00C1C68C;
	Sat,  6 Jul 2024 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720307124; cv=none; b=sVhf5hgACejRMFU/D/hvy5oG1IeCgxj9wi02wwSWPwJgSRme9iJ/dVfIS5qV55s3HzF5iYTIQxBDRxi+/yTafUPctCu9HP1WBTRcT6ZjVvWkUjioS08qiLbeO+QxeU/K3p9NUz3ldlsUa6uucgXRZTQyCMDzootLmPl4TuKideI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720307124; c=relaxed/simple;
	bh=Paxqs1AoAgfS8pd6lrOBQKSIUitO1qqZ3j+xzPdzl54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YvDrxmrL7QW2v0Qm5346Uy7iUJSSRGJ521XrE2p4ohQ3jYVz46SG6pUz2Z+Szmoq4inZiyKaS5Ff64L6M0EhgZZVFc0/wAl8czrejD+Ef8+Y0DypgBzpKoaIXbqn+DbtQCHVG948X/ymhkVe+2TG7sPCBfSBLBJIQBxKK3/LwSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZfYfvTDM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720307122; x=1751843122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Paxqs1AoAgfS8pd6lrOBQKSIUitO1qqZ3j+xzPdzl54=;
  b=ZfYfvTDMqCSWAb//xXkgERqm9Uk8Lfc/40w4+FbhJbGpimPAEcinHqpD
   kIXXJFtFimU1r4LSzXsPLHv0mFM3DEwNFY4vjeRUokS4JGa5nsQiVb//r
   TNKOW+tB34jhjwiesKRfBDKnLnrrve3dxTua2Xa6NrDuj0/SP48dWB3S3
   pXG+KjSoePNNDDzUSkd7cZGxJOkReV3d5QVbvjns9G1gQSFI1BTOR45oD
   xwJpTj1NKLyqEPPLW3HsTAv72ZLy4tvwarnKgVOto4fv67hc4Wcl5si42
   2OUx6WnzLrT8vKmHNomgUGJyi+uJrF4GjPJj8/g6DERQu1dWpnd0NfBi7
   A==;
X-CSE-ConnectionGUID: x56etugARVygSyxnX1fl7Q==
X-CSE-MsgGUID: e+9hGENARZ+zLzyZezIAmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="28148092"
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="28148092"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 16:05:22 -0700
X-CSE-ConnectionGUID: dk4QW3nkTnGVE2//uLQtlw==
X-CSE-MsgGUID: FvYMdwicRLOvpAYk8vEZQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,188,1716274800"; 
   d="scan'208";a="47038346"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jul 2024 16:05:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQESy-000UNY-2s;
	Sat, 06 Jul 2024 23:05:16 +0000
Date: Sun, 7 Jul 2024 07:05:11 +0800
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
Subject: Re: [PATCH v2 06/10] irqchip: irq-mips-gic: Switch to ipi_mux
Message-ID: <202407070606.q2TZuFwp-lkp@intel.com>
References: <20240705-b4-mips-ipi-improvements-v2-6-2d50b56268e8@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240705-b4-mips-ipi-improvements-v2-6-2d50b56268e8@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0b58e108042b0ed28a71cd7edf5175999955b233]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/MIPS-smp-Make-IPI-interrupts-scalable/20240706-040839
base:   0b58e108042b0ed28a71cd7edf5175999955b233
patch link:    https://lore.kernel.org/r/20240705-b4-mips-ipi-improvements-v2-6-2d50b56268e8%40flygoat.com
patch subject: [PATCH v2 06/10] irqchip: irq-mips-gic: Switch to ipi_mux
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20240707/202407070606.q2TZuFwp-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070606.q2TZuFwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070606.q2TZuFwp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-mips-gic.c:27:
   arch/mips/include/asm/ipi.h:54:6: warning: no previous prototype for 'mips_smp_ipi_set_virq_range' [-Wmissing-prototypes]
      54 | void mips_smp_ipi_set_virq_range(int virq, int nr)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/ipi.h:58:6: warning: no previous prototype for 'mips_smp_ipi_set_irqdomain' [-Wmissing-prototypes]
      58 | void mips_smp_ipi_set_irqdomain(struct irq_domain *d)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mips-gic.c: In function 'gic_of_init':
>> drivers/irqchip/irq-mips-gic.c:751:15: error: too many arguments to function 'gic_ipi_mux_init'
     751 |         ret = gic_ipi_mux_init(node, gic_irq_domain);
         |               ^~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mips-gic.c:642:19: note: declared here
     642 | static inline int gic_ipi_mux_init(struct device_node *node)
         |                   ^~~~~~~~~~~~~~~~


vim +/gic_ipi_mux_init +751 drivers/irqchip/irq-mips-gic.c

   663	
   664	static int __init gic_of_init(struct device_node *node,
   665				      struct device_node *parent)
   666	{
   667		unsigned int cpu_vec, i, gicconfig;
   668		unsigned long reserved;
   669		phys_addr_t gic_base;
   670		struct resource res;
   671		size_t gic_len;
   672		int ret;
   673	
   674		/* Find the first available CPU vector. */
   675		i = 0;
   676		reserved = (C_SW0 | C_SW1) >> __ffs(C_SW0);
   677		while (!of_property_read_u32_index(node, "mti,reserved-cpu-vectors",
   678						   i++, &cpu_vec))
   679			reserved |= BIT(cpu_vec);
   680	
   681		cpu_vec = find_first_zero_bit(&reserved, hweight_long(ST0_IM));
   682		if (cpu_vec == hweight_long(ST0_IM)) {
   683			pr_err("No CPU vectors available\n");
   684			return -ENODEV;
   685		}
   686	
   687		if (of_address_to_resource(node, 0, &res)) {
   688			/*
   689			 * Probe the CM for the GIC base address if not specified
   690			 * in the device-tree.
   691			 */
   692			if (mips_cm_present()) {
   693				gic_base = read_gcr_gic_base() &
   694					~CM_GCR_GIC_BASE_GICEN;
   695				gic_len = 0x20000;
   696				pr_warn("Using inherited base address %pa\n",
   697					&gic_base);
   698			} else {
   699				pr_err("Failed to get memory range\n");
   700				return -ENODEV;
   701			}
   702		} else {
   703			gic_base = res.start;
   704			gic_len = resource_size(&res);
   705		}
   706	
   707		if (mips_cm_present()) {
   708			write_gcr_gic_base(gic_base | CM_GCR_GIC_BASE_GICEN);
   709			/* Ensure GIC region is enabled before trying to access it */
   710			__sync();
   711		}
   712	
   713		mips_gic_base = ioremap(gic_base, gic_len);
   714		if (!mips_gic_base) {
   715			pr_err("Failed to ioremap gic_base\n");
   716			return -ENOMEM;
   717		}
   718	
   719		gicconfig = read_gic_config();
   720		gic_shared_intrs = FIELD_GET(GIC_CONFIG_NUMINTERRUPTS, gicconfig);
   721		gic_shared_intrs = (gic_shared_intrs + 1) * 8;
   722	
   723		if (cpu_has_veic) {
   724			/* Always use vector 1 in EIC mode */
   725			gic_cpu_pin = 0;
   726			set_vi_handler(gic_cpu_pin + GIC_PIN_TO_VEC_OFFSET,
   727				       __gic_irq_dispatch);
   728		} else {
   729			gic_cpu_pin = cpu_vec - GIC_CPU_PIN_OFFSET;
   730			irq_set_chained_handler(MIPS_CPU_IRQ_BASE + cpu_vec,
   731						gic_irq_dispatch);
   732		}
   733	
   734		gic_irq_domain = irq_domain_add_simple(node, GIC_NUM_LOCAL_INTRS +
   735						       gic_shared_intrs, 0,
   736						       &gic_irq_domain_ops, NULL);
   737		if (!gic_irq_domain) {
   738			pr_err("Failed to add IRQ domain");
   739			return -ENXIO;
   740		}
   741	
   742		board_bind_eic_interrupt = &gic_bind_eic_interrupt;
   743	
   744		/* Setup defaults */
   745		for (i = 0; i < gic_shared_intrs; i++) {
   746			change_gic_pol(i, GIC_POL_ACTIVE_HIGH);
   747			change_gic_trig(i, GIC_TRIG_LEVEL);
   748			write_gic_rmask(i);
   749		}
   750	
 > 751		ret = gic_ipi_mux_init(node, gic_irq_domain);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

