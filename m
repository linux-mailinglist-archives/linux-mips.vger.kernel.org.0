Return-Path: <linux-mips+bounces-3947-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEFC9175F8
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 04:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9EF9B1C20C27
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 02:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE63A15EA2;
	Wed, 26 Jun 2024 02:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kpcRmUrS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F075A20322;
	Wed, 26 Jun 2024 02:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719367339; cv=none; b=qgbOIAYIVe9wq81/Mls4/gD1QQghjjlyf+zsd5O6I0Lcw5qsMwJ87jwr7RXJS89aa2uiC2DVLFN5vkkQHcnepsM0g3Tr/JXJLZ4991v0rDUf2CauYBUkTt8eOv3AeoqWPlQ+nbswNzBktYyYApvf08WXX1hf/Ul07nTk0zrEgLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719367339; c=relaxed/simple;
	bh=Q/gXBFW+DSTfTpYsHN1lhrLN83CrHjkMiZzYrMFiL/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vge46elzVN5ipluMfNuoRD4cM1Wy5NIf7YQicXMynA+41gGS9HOfi+wRAb/2xSw3qDnDzEEAq2gc9P9REaYXsGYhKEWGCIrJDsS85d8Qx1OzOyRZkx22nQryuOj3McvISo7vmUD38OniM78SGee2pRAknuSbNVdB4tzI8siCcsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kpcRmUrS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719367338; x=1750903338;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q/gXBFW+DSTfTpYsHN1lhrLN83CrHjkMiZzYrMFiL/E=;
  b=kpcRmUrSTtUZKtLEoR4pVpkixegBndbMqVpEicxCpdKpIjJC/1Ez1x/4
   aFr6eCG0l7LpLp+M2zKmEVQ9GhShHGhYcAc2bS/j6QOoGck+AKZy5HLT1
   OJbJgtPUfpXUeQObmICjCN216HSnFPl0AURxUMu4w9UxCm0wShKzmB1Xw
   nksjCKkKN+2sW8up8vk9Q0oOfa3GD4a2GX/iOxo+0u6XFjjrBwXbPj7iy
   Hit3/4bf9Jc49o2zzdgbtnqIHhRqnQL9kRoKDuo9FHVZ5c2PgRFU1LT7T
   5w2NNGDeWVFcA4RAlFbuxno3TURlumUcQfugS6VrhLViS1e1AFVcQkh6Z
   w==;
X-CSE-ConnectionGUID: xFZt+xutQL2Aq5ejoruBUA==
X-CSE-MsgGUID: /Y6kfKAqR0WpWtxbr+yzaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16379685"
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="16379685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 19:02:18 -0700
X-CSE-ConnectionGUID: x/TpQN/dRwy9CEmSl+mEjg==
X-CSE-MsgGUID: GMq7NKfxTO2cSK6K4CeD5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,265,1712646000"; 
   d="scan'208";a="43707028"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 25 Jun 2024 19:02:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMHz8-000EtO-2b;
	Wed, 26 Jun 2024 02:02:10 +0000
Date: Wed, 26 Jun 2024 10:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
	paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
	bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	kabel@kernel.org, ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH 4/6] clocksource: realtek: Add timer driver for rtl-otto
 platforms
Message-ID: <202406260925.EyDSt3VD-lkp@intel.com>
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
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20240626/202406260925.EyDSt3VD-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240626/202406260925.EyDSt3VD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406260925.EyDSt3VD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:573,
                    from include/linux/kernel.h:31,
                    from include/linux/clk.h:13,
                    from drivers/clocksource/timer-rtl-otto.c:5:
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_timer_interrupt':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:105:9: note: in expansion of macro 'RTTM_DEBUG'
     105 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_next_event':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:127:9: note: in expansion of macro 'RTTM_DEBUG'
     127 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_state_oneshot':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:139:9: note: in expansion of macro 'RTTM_DEBUG'
     139 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_state_periodic':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:151:9: note: in expansion of macro 'RTTM_DEBUG'
     151 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_state_shutdown':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:163:9: note: in expansion of macro 'RTTM_DEBUG'
     163 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_setup_timer':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:171:9: note: in expansion of macro 'RTTM_DEBUG'
     171 |         RTTM_DEBUG(base);
         |         ^~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c: In function 'rttm_cpu_starting':
>> drivers/clocksource/timer-rtl-otto.c:97:38: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
      97 |                  smp_processor_id(), (u32)base)
         |                                      ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call'
     269 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:588:9: note: in expansion of macro 'dynamic_pr_debug'
     588 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:96:9: note: in expansion of macro 'pr_debug'
      96 |         pr_debug("------------- %d %08x\n",     \
         |         ^~~~~~~~
   drivers/clocksource/timer-rtl-otto.c:234:9: note: in expansion of macro 'RTTM_DEBUG'
     234 |         RTTM_DEBUG(to->of_base.base);
         |         ^~~~~~~~~~


vim +97 drivers/clocksource/timer-rtl-otto.c

    93	
    94	/* Aggregated control functions for kernel clock framework */
    95	#define RTTM_DEBUG(base)			\
    96		pr_debug("------------- %d %08x\n",	\
  > 97			 smp_processor_id(), (u32)base)
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

