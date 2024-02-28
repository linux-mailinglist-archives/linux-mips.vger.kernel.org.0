Return-Path: <linux-mips+bounces-1876-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF186B7C9
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 19:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A685928867E
	for <lists+linux-mips@lfdr.de>; Wed, 28 Feb 2024 18:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46FEF71ECA;
	Wed, 28 Feb 2024 18:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bn6+6x/h"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8185540869
	for <linux-mips@vger.kernel.org>; Wed, 28 Feb 2024 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709146792; cv=none; b=S6DJ6efeyIovMPy2Wt5Tu2yZIqbQJIQELwkhYeC71nCyzBd33HPTM5NvnnNp2/VZH8M5vqp3XAL2OSD3CYgE4AK2p9lB9XaIAqKoY7v/3v5uB4zKF7v73LDY5uHjQtSW4669nDnRmlOWFyAjD8rw/aKfwI+74NNh6owci7Icf1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709146792; c=relaxed/simple;
	bh=onoEJyTpA25HiML0tNOBoStRARmj75r5f13Go/OTA6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gYRscuOGlCrSHQyTfVliWNjmysIopt3egHck/+BN68cDwxAbPYVGZCU0bAI5hgA6rHpnNyV+On9XOsZvEecGLMviRqCgaB10iBfvCRBnP6HRqUzObDzYXBhW284adWqVbXK0F3Kb8PZXRZhHp9dGtpKsYXLtoOuZhgMpR0/9k7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bn6+6x/h; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709146791; x=1740682791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=onoEJyTpA25HiML0tNOBoStRARmj75r5f13Go/OTA6g=;
  b=bn6+6x/hDi0NDV4nu6jmraXOT7/rRw/isnFG7Ef76XGvBYrUrg72U2tD
   FwtA4PZ9MuYj8lC7xes/+k7QkOzjNgtlhNo6PEzTkLQaj6EJxEKGH9Aj0
   QaYSZhrzCqSYO1L6UqhKGINku+cDFLXGFs869OSVmd1mpZZXsr3RZzROk
   vXAAHWcVDVeZDVlNzGxZ28KLTf3MfmvbeZE3uFgOQJVEx8Pf1T5GQbP4k
   6xdLDvG/RIzKwItX0OGpYbhhLgFCDeWv1kLLpPiq2xQ6os/WqiHILhiWy
   teY+83hteGFUyk56l0wrU21CTdCHg3INsQ0I4yWBnoIprhE6ilgpIwMqZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="21026272"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="21026272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 10:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7449086"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Feb 2024 10:59:48 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfP9e-000CK3-21;
	Wed, 28 Feb 2024 18:59:46 +0000
Date: Thu, 29 Feb 2024 02:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [mips-linux:mips-next 40/44] mips-mt.c:2643: Error: Unable to parse
 register name $fp
Message-ID: <202402290221.ZtSBWldd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   af43e871c93640a69af58ddb33aec2d4be80bf6b
commit: dd6d29a6148990bb1d39a37c6c2830e6daf9cb46 [40/44] MIPS: Implement microMIPS MT ASE helpers
config: mips-randconfig-r032-20230725 (https://download.01.org/0day-ci/archive/20240229/202402290221.ZtSBWldd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290221.ZtSBWldd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290221.ZtSBWldd-lkp@intel.com/

Note: the mips-linux/mips-next HEAD af43e871c93640a69af58ddb33aec2d4be80bf6b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   mips-mt.c: Assembler messages:
>> mips-mt.c:2643: Error: Unable to parse register name $fp
   mips-mt.c:2646:  Info: macro invoked from here
   {standard input}:2652:   Info: macro invoked from here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

