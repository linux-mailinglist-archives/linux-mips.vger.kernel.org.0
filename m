Return-Path: <linux-mips+bounces-2244-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48381878C65
	for <lists+linux-mips@lfdr.de>; Tue, 12 Mar 2024 02:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 787951C20F6E
	for <lists+linux-mips@lfdr.de>; Tue, 12 Mar 2024 01:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48B217F7;
	Tue, 12 Mar 2024 01:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W+K7qJUb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BE68821
	for <linux-mips@vger.kernel.org>; Tue, 12 Mar 2024 01:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710207549; cv=none; b=tZGWK60iA1WjYXgL3WkcVUUARfQytu2yCORtkAfgRqe7mlayG/Lhnj1uWZbdRTytiyJI5zrIZTCdrOMacFPRsOBVf0tIXTh6R6qCwGQ9cuDPekH/KaKaPkaWMtlq/ZhW8B44fyaQfXe7sK9NrUy8519jTHsYHZC/J7aDfKqQI30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710207549; c=relaxed/simple;
	bh=iRyZ1FEKxHpPxBPHzNqd5wGFZU/xj8FRL0JPXhhO870=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFsARm7/NiaKxTm03SdEarcU4PsDZipuQDJx0yHyb0Iv4UJ/4NmqfHSLHvDMBK3MgkE8N7LNOiQdVFZjVccu2rOtiwWHrKZJ+xyf5ttBF9e0JXyZxeCrIOmLASrkGGMjS/Y5xgOEOAMgmVeXV3yQUiiPTNIy8DrA9DoNtZtcAjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W+K7qJUb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710207548; x=1741743548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRyZ1FEKxHpPxBPHzNqd5wGFZU/xj8FRL0JPXhhO870=;
  b=W+K7qJUbph9m+aC53syN6LIi6A81rljXzKm0K6ojdujhM6w8/s1+zEJe
   n9fumV7oqf2BptwMKV42ZUYT3bCoIjIqgSibJdmWaRAJgNPsCyV9+hznu
   8BEP21TqhqpLCqU9cIp2aqhtfIY6FusQ8lfnQ/yniGAFEYDhgUShM7bKK
   bL3mn0YXtYqlXdpF8QmKmn/PSzO7pIh1Ycd9AO0z8eeiBLYFXMHz3EAfU
   WeHRYQWKxNRY68AR50/TmZxUiWyAkEMBhsZHsljZJd9fmkeKjnmepEzqm
   1kuI4FrCmoIrhZdrYi05KRFDINHmCaAbP/PC1FlU2SmuZD2cfIdZ+AxFt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5019433"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="5019433"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 18:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="42350029"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Mar 2024 18:39:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjr6d-0009co-0f;
	Tue, 12 Mar 2024 01:39:03 +0000
Date: Tue, 12 Mar 2024 09:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 47/56] arch/mips/ralink/timer.c:136:48: error:
 array has incomplete element type 'const struct of_device_id'
Message-ID: <202403120926.hoXbeGnb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   732932220078f6312f3ef57c17523d3d7f995655
commit: 5804be0618486f8979208e323188e44f8013a6a3 [47/56] MIPS: ralink: Remove unused of_gpio.h
config: mips-rt305x_defconfig (https://download.01.org/0day-ci/archive/20240312/202403120926.hoXbeGnb-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120926.hoXbeGnb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120926.hoXbeGnb-lkp@intel.com/

Note: the mips-linux/mips-next HEAD 732932220078f6312f3ef57c17523d3d7f995655 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> arch/mips/ralink/timer.c:136:48: error: array has incomplete element type 'const struct of_device_id'
     136 | static const struct of_device_id rt_timer_match[] = {
         |                                                ^
   include/linux/device/driver.h:106:15: note: forward declaration of 'struct of_device_id'
     106 |         const struct of_device_id       *of_match_table;
         |                      ^
   1 error generated.


vim +136 arch/mips/ralink/timer.c

80ecbd245791fe John Crispin 2013-08-08  135  
80ecbd245791fe John Crispin 2013-08-08 @136  static const struct of_device_id rt_timer_match[] = {
80ecbd245791fe John Crispin 2013-08-08  137  	{ .compatible = "ralink,rt2880-timer" },
80ecbd245791fe John Crispin 2013-08-08  138  	{},
80ecbd245791fe John Crispin 2013-08-08  139  };
80ecbd245791fe John Crispin 2013-08-08  140  

:::::: The code at line 136 was first introduced by commit
:::::: 80ecbd245791fec5da4baa88c7273ec7f9ae7782 MIPS: ralink: Add support for periodic timer irq

:::::: TO: John Crispin <blogic@openwrt.org>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

