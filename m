Return-Path: <linux-mips+bounces-3954-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1D19180AC
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 14:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 931511F218A4
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 12:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA0B181CE2;
	Wed, 26 Jun 2024 12:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="krkbnRWZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E9617E445;
	Wed, 26 Jun 2024 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403788; cv=none; b=b61sNUrnuOGmdA3GNGSLf5OdpoxCtdiqKBFZvn1ftZ3paEeqrWIvpMDnNpxwvv08sHRAJWR0X7HfrEssDOLJQaoE3CLmPrD5z3PbwFokbfv0djUVt5Zo7Rz9NF6V+iICnrGWx7ac9YGjafSyaYEV2iUBaFGzjasgjdPPpsDOW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403788; c=relaxed/simple;
	bh=682UDvYYZ1aAaGOxp1reyfhaKc8P3rmiduqOQFcN4nQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UqCCg2DZV2DWw2dfNThC8PhvxofPnbtJPr+0m44z8DqwcY2LCjpykMxEohEPG7nCEznMSxxQVmPa7KVeLrPrbnhhBgOgMioOE4XP11h/3ab+mNYML1ZGfbSXor0z7ziLNjPJrGRChLK6+Mqg5xhP5VecQVw2pcL2F8n/3iZRffs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=krkbnRWZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719403786; x=1750939786;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=682UDvYYZ1aAaGOxp1reyfhaKc8P3rmiduqOQFcN4nQ=;
  b=krkbnRWZn3Hr3Xz0Q3d8Vd2HiAu0dOWMRyFiLptlPPJhpQ+XTls/KfD8
   O+CthtdtQI0nXFyl3ynXYwQiAiJLlfvLZAX7MGZ5rZBd/WTs5NDO4Zlyx
   t30qbXZ1DMLsJyWGYM/C3WejLS+RZEUrecPMNJiJMKM+TItRa/6+Cb3pj
   93jm3V+v15tTxsQEETm8KcR8e169cVW39JvT+8z6y7VoUaNhx09CZqq55
   oiCGBogxhOr4n2wErCkvHL1TCxvnFa8ZFzxC/RQEjWpXMOcdxvs0Tys/E
   D5fTrWQ5i/ZA3+M/lr/V4+pU7HivD/ZlAkneWuHYKZfFl5tEWhEuDgSEi
   w==;
X-CSE-ConnectionGUID: I0u8Pdc7R+ihfPbkIiSZsA==
X-CSE-MsgGUID: SIXu6npoRgSRPVD9NoZ6Og==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="34002238"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="34002238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 05:09:45 -0700
X-CSE-ConnectionGUID: ISumHd2+RkGM5L2H+zSVDA==
X-CSE-MsgGUID: CYSlF/ybQrivsmPJO4HTXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="81528052"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Jun 2024 05:09:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMRT0-000FFW-0X;
	Wed, 26 Jun 2024 12:09:38 +0000
Date: Wed, 26 Jun 2024 20:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
	paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
	bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, kabel@kernel.org, ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH 4/6] clocksource: realtek: Add timer driver for rtl-otto
 platforms
Message-ID: <202406261940.lYNjMHKC-lkp@intel.com>
References: <20240621042737.674128-5-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621042737.674128-5-chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tip/timers/core tip/irq/core tip/smp/core linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/dt-bindings-mips-realtek-Add-rtl930x-soc-compatible/20240625-160622
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240621042737.674128-5-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH 4/6] clocksource: realtek: Add timer driver for rtl-otto platforms
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240626/202406261940.lYNjMHKC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406261940.lYNjMHKC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261940.lYNjMHKC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/clocksource/timer-rtl-otto.c:105:2: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'void *' [-Wvoid-pointer-to-int-cast]
     105 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:97:24: note: expanded from macro 'RTTM_DEBUG'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                  smp_processor_id(), (u32)base)
         |                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/printk.h:588:26: note: expanded from macro 'pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:127:2: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'void *' [-Wvoid-pointer-to-int-cast]
     127 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:97:24: note: expanded from macro 'RTTM_DEBUG'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                  smp_processor_id(), (u32)base)
         |                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/printk.h:588:26: note: expanded from macro 'pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:139:2: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'void *' [-Wvoid-pointer-to-int-cast]
     139 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:97:24: note: expanded from macro 'RTTM_DEBUG'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                  smp_processor_id(), (u32)base)
         |                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/printk.h:588:26: note: expanded from macro 'pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:151:2: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'void *' [-Wvoid-pointer-to-int-cast]
     151 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:97:24: note: expanded from macro 'RTTM_DEBUG'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      97 |                  smp_processor_id(), (u32)base)
         |                  ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/linux/printk.h:588:26: note: expanded from macro 'pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:270:22: note: expanded from macro 'dynamic_pr_debug'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     270 |                            pr_fmt(fmt), ##__VA_ARGS__)
         |                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:163:2: warning: cast to smaller integer type 'u32' (aka 'unsigned int') from 'void *' [-Wvoid-pointer-to-int-cast]


vim +105 drivers/clocksource/timer-rtl-otto.c

    93	
    94	/* Aggregated control functions for kernel clock framework */
    95	#define RTTM_DEBUG(base)			\
    96		pr_debug("------------- %d %08x\n",	\
    97			 smp_processor_id(), (u32)base)
    98	
    99	static irqreturn_t rttm_timer_interrupt(int irq, void *dev_id)
   100	{
   101		struct clock_event_device *clkevt = dev_id;
   102		struct timer_of *to = to_timer_of(clkevt);
   103	
   104		rttm_ack_irq(to->of_base.base);
 > 105		RTTM_DEBUG(to->of_base.base);
   106		clkevt->event_handler(clkevt);
   107	
   108		return IRQ_HANDLED;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

