Return-Path: <linux-mips+bounces-3186-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4968C0791
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2024 01:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE72CB210EF
	for <lists+linux-mips@lfdr.de>; Wed,  8 May 2024 23:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A1357C80;
	Wed,  8 May 2024 23:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ezdt6q/R"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B764502D;
	Wed,  8 May 2024 23:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715210033; cv=none; b=LJ+HlFdrM6RmC5lxUqkrKGbLbMoFtmole0wKL0rNuSkvKgPPAgPKVAoew1P+yWpNCf4yAi3VMnhm8aM4UJ3ul4p4Atirnyk67J8zQsON8eTr3bwUmJq5DqiVZkuOOWrQhWB1px1YAdGAEKdXNpHsvQB4rYAtESfmEGI8V2r6KHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715210033; c=relaxed/simple;
	bh=JUbTIS/I0CkID9zH4mhMiOz062nvn8SobfwMLUDy9V0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y18onhBA7kjKGsypyImGnrXw3bXMelafYbQMgJIqoeeWbSYroTTnTzwYIANMrd12lxL5fdnekDOBD46kf1+7EBuhmR3LMvfV0wa80MnBIkMrI+NoUy4FV4p5Q94NtFK/a7VRFzNIzqyWUZ0ZAKPJ9ExV+jbOs/3cQnY5XtDPrOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ezdt6q/R; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715210031; x=1746746031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JUbTIS/I0CkID9zH4mhMiOz062nvn8SobfwMLUDy9V0=;
  b=ezdt6q/Rc6wQqIAA4kL/IC5nNh2fX4JKyPZbGk75df59NFOAaMSjWkt5
   HoMVbdQabTw/f+FUVKI1IzehcdT3pA0ZG+HKvjjLin5I3Tn025wgT9/z5
   KTEZqer+e/wiJEod4m1poNW2beQ797Q4Cw0rgH2PBeldb8YVwk2NY7gPt
   8/Al7Fr3F//EGcXs9DfCjItQAO8O4cckwARjB+sy2r3C9ZcZ10Spa/o6g
   qs8E7SEMD4TGH/cm670zDvfxdq0/hAw1NEX3OcnVS6hBGmOW7dTq/YUVu
   DmfToO1v4HWpZwoQ8TDEcoLOZTWJ2jFfz75dsVNiWPx2nOHBqfjr/YoEg
   g==;
X-CSE-ConnectionGUID: Kp4tGvroSACrfv6wzEmjsQ==
X-CSE-MsgGUID: XYjsa160Q4yaMvdBLr2VNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="10967363"
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="10967363"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2024 16:13:50 -0700
X-CSE-ConnectionGUID: v4QTxU35Qae1eH8c8+dbvw==
X-CSE-MsgGUID: rDza+m2GRcyQxfiWR0I1eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,146,1712646000"; 
   d="scan'208";a="59904689"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 May 2024 16:13:47 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4qTo-0004DY-2Q;
	Wed, 08 May 2024 23:13:44 +0000
Date: Thu, 9 May 2024 07:13:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel =?iso-8859-1?Q?Gonz=E1lez?= Cabanelas <dgcbueu@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/5] mips: bmips: rework and cache CBR addr handling
Message-ID: <202405090546.iqx9FAqu-lkp@intel.com>
References: <20240503212139.5811-3-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503212139.5811-3-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.9-rc7 next-20240508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/mips-bmips-BCM6358-make-sure-CBR-is-correctly-set/20240504-052513
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240503212139.5811-3-ansuelsmth%40gmail.com
patch subject: [PATCH v2 2/5] mips: bmips: rework and cache CBR addr handling
config: mips-bcm63xx_defconfig (https://download.01.org/0day-ci/archive/20240509/202405090546.iqx9FAqu-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405090546.iqx9FAqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405090546.iqx9FAqu-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: arch/mips/kernel/smp-bmips.o: in function `bmips_ebase_setup':
>> smp-bmips.c:(.text+0x114): undefined reference to `bmips_cbr_addr'
>> mips-linux-ld: smp-bmips.c:(.text+0x118): undefined reference to `bmips_cbr_addr'
   mips-linux-ld: arch/mips/kernel/smp-bmips.o: in function `bmips_cpu_setup':
   smp-bmips.c:(.text+0x1a4): undefined reference to `bmips_cbr_addr'
   mips-linux-ld: smp-bmips.c:(.text+0x1b4): undefined reference to `bmips_cbr_addr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

