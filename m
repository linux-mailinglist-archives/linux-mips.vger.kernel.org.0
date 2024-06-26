Return-Path: <linux-mips+bounces-3962-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBF69199B9
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 23:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9490B20B82
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 21:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E0B193084;
	Wed, 26 Jun 2024 21:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHFElrjU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C9C16A928;
	Wed, 26 Jun 2024 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719436985; cv=none; b=G7c858fKpHuBTqf5z/fS9ELBpYyif1jtLRjH3NCKeVQc4Jjvr4IWQ5JtciE7kFsGL2z6GA8GJfujPzmOtnITwVZbTxG3JondFBwA8w+JcRCOwmkhOvCBHzO9P5qhkv4t3n0f3gz907bpLDcq1Wvob2U69Wk6npXr7WG9E6hOwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719436985; c=relaxed/simple;
	bh=f4nVLOzta92hqUMfbJwPA04s+mQnQATUqGTW4c+CO3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1MpiRB6qnXNmStMl+khLEyTFvl3l77ZGLcAjdx1JPZrxzn8CjKrjiliHkl+1M6BaphGAWjZeXCg5PrB6e0sOGd5HEdI3wO6+HUTJJy0CLe/SorNgq+Su4HMPqLoW4UqsMBbxm1OxXtQ/KkqO6ru3C5kqDgNao0zZbWo2BXpKJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHFElrjU; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719436984; x=1750972984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f4nVLOzta92hqUMfbJwPA04s+mQnQATUqGTW4c+CO3s=;
  b=kHFElrjUhr0ruf2kLfo0ZosVeHwAOle0At2FGy++0XzkYWB0Jy/BL7i8
   tT0f2w3EGSvS46ecEfbV+i6k4Re3gyCUdq9QKkrNZNAFhHeWaFRPqaBWC
   h+HyQgRrUKiC0kVrI8qNDqaEiwuPCe6W1IDFS2gB1LpOYo8qdA/rkQwU9
   AdYa4M+feMo9ENXBiF3rVbNN+YI8LAM6M3MDY9sPkcc5Jok03I86FsEgk
   NBXEEbUJzn8GUEdufs1pOObtg4Aw38LKCS4+VetCy/fNtJVeYNGPAtYCv
   v/43haQhAMMUEFJwdhWE09eKVRux/NRpFp6wj0XOrB34Sh/bIdsvc1J7U
   A==;
X-CSE-ConnectionGUID: dxZO9einTzGV0JgrQ6kZVw==
X-CSE-MsgGUID: YOT2yJLsQXiahSLkPHOKYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="20307547"
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="20307547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 14:23:03 -0700
X-CSE-ConnectionGUID: eucNGz6ARgWIexgd0PGxqw==
X-CSE-MsgGUID: vVdluytuQzCpKty0TEu4kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,268,1712646000"; 
   d="scan'208";a="43962303"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2024 14:22:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMa6S-000FZD-24;
	Wed, 26 Jun 2024 21:22:56 +0000
Date: Thu, 27 Jun 2024 05:22:09 +0800
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
Subject: Re: [PATCH v2 6/8] clocksource: realtek: Add timer driver for
 rtl-otto platforms
Message-ID: <202406270511.czjiMAQk-lkp@intel.com>
References: <20240624012300.1713290-7-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624012300.1713290-7-chris.packham@alliedtelesis.co.nz>

Hi Chris,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on tip/timers/core tip/irq/core tip/smp/core linus/master v6.10-rc5 next-20240625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chris-Packham/mips-dts-realtek-use-serial-instead-of-uart-in-node-name/20240626-054938
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240624012300.1713290-7-chris.packham%40alliedtelesis.co.nz
patch subject: [PATCH v2 6/8] clocksource: realtek: Add timer driver for rtl-otto platforms
config: m68k-randconfig-r081-20240627 (https://download.01.org/0day-ci/archive/20240627/202406270511.czjiMAQk-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406270511.czjiMAQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406270511.czjiMAQk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tegra/hdmi.c:35:
>> drivers/gpu/drm/tegra/hdmi.h:122: warning: "ACR_ENABLE" redefined
     122 | #define ACR_ENABLE         (1 << 31)
         | 
   In file included from arch/m68k/include/asm/m520xsim.h:19,
                    from arch/m68k/include/asm/mcfsim.h:24,
                    from arch/m68k/include/asm/io_no.h:35,
                    from arch/m68k/include/asm/io.h:6,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/m68k/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from include/linux/regulator/consumer.h:35,
                    from drivers/gpu/drm/tegra/hdmi.c:17:
   arch/m68k/include/asm/m52xxacr.h:47: note: this is the location of the previous definition
      47 | #define ACR_ENABLE      0x00008000      /* Enable this ACR */
         | 

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for COMMON_CLK
   Depends on [n]: !HAVE_LEGACY_CLK [=y]
   Selected by [y]:
   - REALTEK_OTTO_TIMER [=y] && GENERIC_CLOCKEVENTS [=y]


vim +/ACR_ENABLE +122 drivers/gpu/drm/tegra/hdmi.h

edec4af4c3d6d22 Thierry Reding 2012-11-15  119  
edec4af4c3d6d22 Thierry Reding 2012-11-15  120  #define ACR_SUBPACK_CTS(x) (((x) & 0xffffff) << 8)
edec4af4c3d6d22 Thierry Reding 2012-11-15  121  #define ACR_SUBPACK_N(x)   (((x) & 0xffffff) << 0)
edec4af4c3d6d22 Thierry Reding 2012-11-15 @122  #define ACR_ENABLE         (1 << 31)
edec4af4c3d6d22 Thierry Reding 2012-11-15  123  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

