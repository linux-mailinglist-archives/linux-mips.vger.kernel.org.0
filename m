Return-Path: <linux-mips+bounces-4297-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAB492F4AB
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 06:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3FC2838E8
	for <lists+linux-mips@lfdr.de>; Fri, 12 Jul 2024 04:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9B114F70;
	Fri, 12 Jul 2024 04:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mEfVEBiA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EF1FC12;
	Fri, 12 Jul 2024 04:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720759152; cv=none; b=Nr3PoXdH0CwV9Ho4RsOfMiaqraxT6Dc4044BGrbKWaqLpsu29BWVknF8vtcONzuaVu7qDbE9HwljD9PAlybsv5xTymiEB05KMEPpP2DnGyJYu7r+vYmxfWWhOnYDCpcFF+thWF5qir1NSuXFd5T8F2mGmzjbK0aM9Z8JqYXGVlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720759152; c=relaxed/simple;
	bh=jFD0QbqRtwhNi4AqIG+ommVUe7wohMG8x1QNLLzGEn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C00lgg1O87N239yL766ngUxPaHovIsaGUedvQSbBMyLy8yCQfc4rfso/AJZc5Hn7G9MzM0TPA8MYyGMTtNihWT1UZTcU0qFi8XGiXUgInBqSzDjME0JHCCc8FOrTKuVjIFx8JEnRSv+CDQ+i/yieQsPK1xMpu0mQ1PUPD+2FPEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mEfVEBiA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720759151; x=1752295151;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jFD0QbqRtwhNi4AqIG+ommVUe7wohMG8x1QNLLzGEn4=;
  b=mEfVEBiAiVRp+mJiyg0dlloBQR7QtKWI9kZhfMaz1wrp3ch4g51qmibF
   7D+unD87g6sPC5I1RbzDbfaq1yeiYBUMP/i0MNmf9TSzKEazMLQ+FyWMQ
   EWdpUhMiUS0QgYpuM/BYRYrN2ly6jnRv7OKveUXN2VgGVTmN7HsFzyKZx
   EFoWDwdQhKYbkm+9oKs15fekE8zV+sl3XGaq3ddVGVawBFoyfjmcyev87
   kOz9c8nTc0EHpwq8pBQjEEDg3rHp2oYIGi9Nv6Sow8rQRe6WH9XakdjkY
   /s8jKt/wi06QByuIlt6HAuLdtXlL5Geafl2sj6+/oldonLRdMLFaWgAw5
   Q==;
X-CSE-ConnectionGUID: ee2hP4NBTLa6bMykikct4w==
X-CSE-MsgGUID: 6YdvmyG+QDaqTmlbM4KOWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="29579545"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="29579545"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 21:39:10 -0700
X-CSE-ConnectionGUID: tqJYofqXR6+Uzu7U3XBswQ==
X-CSE-MsgGUID: afLuhZKeQreKX217xga8Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48880450"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2024 21:39:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS83i-000aKQ-1p;
	Fri, 12 Jul 2024 04:39:02 +0000
Date: Fri, 12 Jul 2024 12:38:07 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksandar Rikalo <arikalo@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v5 04/11] irqchip/mips-gic: Support multi-cluster in
 for_each_online_cpu_gic()
Message-ID: <202407121224.kUAil6pa-lkp@intel.com>
References: <20240711082656.1889440-5-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711082656.1889440-5-arikalo@gmail.com>

Hi Aleksandar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on tip/timers/core linus/master v6.10-rc7]
[cannot apply to daniel-lezcano/clockevents/next next-20240711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksandar-Rikalo/MIPS-CPS-Add-a-couple-of-multi-cluster-utility-functions/20240711-164850
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20240711082656.1889440-5-arikalo%40gmail.com
patch subject: [PATCH v5 04/11] irqchip/mips-gic: Support multi-cluster in for_each_online_cpu_gic()
config: mips-allnoconfig (https://download.01.org/0day-ci/archive/20240712/202407121224.kUAil6pa-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121224.kUAil6pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121224.kUAil6pa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-mips-gic.c:102: warning: expecting prototype for for_each_online_cpu_gic(). Prototype was for gic_unlock_cluster() instead


vim +102 drivers/irqchip/irq-mips-gic.c

    90	
    91	/**
    92	 * for_each_online_cpu_gic() - Iterate over online CPUs, access local registers
    93	 * @cpu: An integer variable to hold the current CPU number
    94	 * @gic_lock: A pointer to raw spin lock used as a guard
    95	 *
    96	 * Iterate over online CPUs & configure the other/redirect register region to
    97	 * access each CPUs GIC local register block, which can be accessed from the
    98	 * loop body using read_gic_vo_*() or write_gic_vo_*() accessor functions or
    99	 * their derivatives.
   100	 */
   101	static inline void gic_unlock_cluster(void)
 > 102	{
   103		if (mips_cps_multicluster_cpus())
   104			mips_cm_unlock_other();
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

