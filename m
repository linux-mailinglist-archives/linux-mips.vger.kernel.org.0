Return-Path: <linux-mips+bounces-3952-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48098917FC9
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 13:34:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A461F26764
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jun 2024 11:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A42180A6A;
	Wed, 26 Jun 2024 11:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFuKZ4rD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FAF17F51D;
	Wed, 26 Jun 2024 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719401628; cv=none; b=uCifncTh1xAgcA1g0ydCLhMp1djOgwXmERYGGC7IuOZhHwy3S/sUUBR7RTejWrBHnn8E9JPb3mYzFvnhWN4mmw+Hu3LXFg3nklTfPALu8CZH/dDQw/1HEp1aD9lkpCQ8Fe1iEFtk4QX+Tk2NWtPtcMCm5ZEIpYo9+fEf66tO72A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719401628; c=relaxed/simple;
	bh=9ZwFb0l03Kp1RAFAFT45v/mJ2mRrnVcu7V9EgEP0f3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/qPhVOFoJ5UBxD5trfwyoDDGRi4Lt2GfTPzYn8fhvFb4Gk87q8radso8XLJprPOTQRf4SewheEmQsHRtecs6GllX/50dMDcGjDawb1EJJ7xc3R8lpd4NN0AwGOdqI6WXmMTsD4kNEvgXW/r+EvhS0oNZNWxRYKwyy/j9bPNgpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFuKZ4rD; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719401627; x=1750937627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ZwFb0l03Kp1RAFAFT45v/mJ2mRrnVcu7V9EgEP0f3Y=;
  b=JFuKZ4rDoPULLLsEQNblCdigcS4qEOJd0lNVLOFju0hm90C3X6678VmJ
   FxN6IsSFppN9RPZ7GqyI6hzgfzB9jOSk2NTq2t3yqHFhF91ktu0kyLskP
   BgpbCdV+IrH+eICEMJbiWCHDiQmkb8UxzMhVRMXcoiVJnRMggcw7tlV8J
   so9/gGVQftJKzqeu4q85JnHpLrW0655xa7LpUwBLNN/PVCYdItSq3pbNN
   N3rJyEaAP0fOZvoYQQGvmmyZA60pg5kB9etDZ+U+yYE4OfvoPfhUqhOqv
   t03i7Yix8ZLDqX0HraPYpwTyyxJUwLRBoVB0ivQbbGmvLNFNpryhwtSzS
   w==;
X-CSE-ConnectionGUID: GfGR41wTQuG6sqOrX+z0dA==
X-CSE-MsgGUID: Z4hO/AURR3+ZbdlEzZyWIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27057369"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="27057369"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 04:33:44 -0700
X-CSE-ConnectionGUID: w3GcokUbTp6EubPCW3719A==
X-CSE-MsgGUID: YFjj4ifuSEyONunsnNQFwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; 
   d="scan'208";a="48423311"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2024 04:33:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMQu8-000FEO-2Y;
	Wed, 26 Jun 2024 11:33:36 +0000
Date: Wed, 26 Jun 2024 19:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, tglx@linutronix.de,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
	paulburton@kernel.org, peterz@infradead.org, mail@birger-koblitz.de,
	bert@biot.com, john@phrozen.org, sander@svanheule.net
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	kabel@kernel.org, ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: Re: [PATCH 4/6] clocksource: realtek: Add timer driver for rtl-otto
 platforms
Message-ID: <202406261928.jfuyByiO-lkp@intel.com>
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
config: m68k-kismet-CONFIG_COMMON_CLK-CONFIG_REALTEK_OTTO_TIMER-0-0 (https://download.01.org/0day-ci/archive/20240626/202406261928.jfuyByiO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240626/202406261928.jfuyByiO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406261928.jfuyByiO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for COMMON_CLK when selected by REALTEK_OTTO_TIMER
   WARNING: unmet direct dependencies detected for COMMON_CLK
     Depends on [n]: !HAVE_LEGACY_CLK [=y]
     Selected by [y]:
     - REALTEK_OTTO_TIMER [=y] && GENERIC_CLOCKEVENTS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

