Return-Path: <linux-mips+bounces-8002-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34274A475F2
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 07:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2A77188EA50
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 06:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE92E212D67;
	Thu, 27 Feb 2025 06:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLcK+e0G"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D683BE65;
	Thu, 27 Feb 2025 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740637840; cv=none; b=iIT4vl1KxD1QI1kQGbYnp+O8Ox5S57xgjwNadC0hDEU1CfdLZqBHGg+KS4U5tDHPVd0Q6keKDv9LdH3onCuQ06ru2hCTOVv/cVvUq4Bo6n7GKWWS4/za3ewqw8xYcUAOv3AiWwqeUHFxVjXeJXUXAKVg6pdB/Lg+tXPc4PaNVc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740637840; c=relaxed/simple;
	bh=cDXogVH7qIKQIn5aWp/tZGtaiEXuiVz5z4jfmzCT9t8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fF2nGk9bfE74ARUvNONxrw1jKjvkwVt787x3afxRqNb4ls7cC02Sz1xlggDpTtrbgen1YyT7OSqbPY++lTIPQ9ftOX1e1Y8UDhkGvrAR/JUvMKPekTOoT0F3TAEwA7fIfKQ9F0NTXtkDFNBbxyutm7zREEYHAeaNej8xVHjkHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLcK+e0G; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740637839; x=1772173839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDXogVH7qIKQIn5aWp/tZGtaiEXuiVz5z4jfmzCT9t8=;
  b=BLcK+e0GbQtcytAr9YBPdYhXUwpnVdxZtlISZQVvlvzEjiiXNv1jL+4W
   PlS2QSY5d77/q4ZmKVZqHkhm1+DpLzr2zgabFNQ878x1c69He3btGanLR
   mKj9ShXYO1ZvcJScSpPmdOIdIjfd/dzE6VyUngRvtohhA7Qc16tkWz54R
   80Luxh/8Afy91bl995iatc5b7AwSVaUVDG8Y5ZZ6JUTsTWgi8m8VP6A3E
   2L7CwGy2Td1ykgl2R+RLtwSBVeYy7QDoAnVHO8HQ6HtLYlTVoozve62tC
   PXO3oFX77NZjvrJUeLTWipJX8h6PUZQHSsuskTn81CeCkQ9AJn6V1XWe2
   w==;
X-CSE-ConnectionGUID: h6uy7IHQRj6/Y2czrMuw8A==
X-CSE-MsgGUID: sRlJpZL3S4a0BrJa6e2pmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29116578"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="29116578"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 22:30:38 -0800
X-CSE-ConnectionGUID: gI0PRdtTSVu6czkCzvpurA==
X-CSE-MsgGUID: +Fof8z9QS42eu8Wf1ufG6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="116959206"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 22:30:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnXP7-000Cxq-2t;
	Thu, 27 Feb 2025 06:30:23 +0000
Date: Thu, 27 Feb 2025 14:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] crypto: lib/Kconfig - Select and hide arch options
Message-ID: <202502271449.k2LZdEgF-lkp@intel.com>
References: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z76aUfPIbhPAsHbv@gondor.apana.org.au>

Hi Herbert,

kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[cannot apply to soc/for-next linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-lib-Kconfig-Select-and-hide-arch-options/20250226-125220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/Z76aUfPIbhPAsHbv%40gondor.apana.org.au
patch subject: [PATCH] crypto: lib/Kconfig - Select and hide arch options
config: x86_64-buildonly-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271449.k2LZdEgF-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271449.k2LZdEgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271449.k2LZdEgF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o
>> ERROR: modpost: "curve25519_generic" [arch/x86/crypto/curve25519-x86_64.ko] undefined!
>> ERROR: modpost: "curve25519_base_point" [arch/x86/crypto/curve25519-x86_64.ko] undefined!
>> ERROR: modpost: "curve25519_null_point" [arch/x86/crypto/curve25519-x86_64.ko] undefined!
>> ERROR: modpost: "curve25519_null_point" [lib/crypto/libcurve25519.ko] undefined!
>> ERROR: modpost: "curve25519_generic" [lib/crypto/libcurve25519.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

