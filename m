Return-Path: <linux-mips+bounces-8001-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3310EA475A4
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 06:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72D301887AB5
	for <lists+linux-mips@lfdr.de>; Thu, 27 Feb 2025 05:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D819C215779;
	Thu, 27 Feb 2025 05:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8X07Jon"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197221516A;
	Thu, 27 Feb 2025 05:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740635871; cv=none; b=C1LIT6aQWNfNvAEepznUZl4xtP7N8kR2mPdFjZf4Ovr3GD3St3ZU7vjA7YAK3yP9J2zjeoJCrYG2sfc6p5A4UilWlZ4wk0cLm8w/b7O8KYhjJA3hRM9uaj80Pn8oSQSjb4wc12x6z5bhQoxLUI4ZRReSop2+siUlPsFKbpMBPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740635871; c=relaxed/simple;
	bh=2SafO12uI4h/H25nQ13IVaO/mucCyOzb83y4kdC0s7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+uHoEdBjb3nN+9xOt3fmfmXBSQXtde1AIcE6959jzqeqLp/PU2wPwze5OSUZPOFXaQ8EKarDeHJDE9vFEDluDG1BVy9Ae2fp2J5NkutO2Jf769sz4GlqeRcROfTIX+5lUVCX0Kev29dkncZL46AbW/E9C7oNbx7hmZJsQJH/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8X07Jon; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740635870; x=1772171870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2SafO12uI4h/H25nQ13IVaO/mucCyOzb83y4kdC0s7E=;
  b=M8X07JonQpr5Y2m0dWCfz5XWPY4n3vEEO8yOnQMh0iwWupQjW4tS68R+
   wquGznzy4w/bLBkKiYhN14+Ufh3ZRFdLYu8smEcPl5a6kuJkQ72aeCxBL
   vJBZk17IDJRg9f42wcijYybbuH5v0jhi6dO6kIgahax7Efrixpot7vA0V
   xErsLBIDtSbQ6vPsvxPdIOQ6toK5oLRg4BfIxST8S3zx7X1/QgdMA7y4V
   X1ardlYPHOYROyHuBq4MhAbRWhvZAPjIjgh+eBEfXcPZhvA6ZAm9yBMzN
   6OtL/7/g/KtO72cmzlQbLiVEM8/iube2SnIKO1uqz4qRk8VxWWL+5Zipz
   Q==;
X-CSE-ConnectionGUID: ppCewY0qRwGwOYpQhRycAA==
X-CSE-MsgGUID: E9vSov/iQ2C7gWadoGgtIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="29113642"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="29113642"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 21:57:49 -0800
X-CSE-ConnectionGUID: 1O0BGv2cRtizHUdxu57vMA==
X-CSE-MsgGUID: gCMMkIefR4GuMUemt9rdFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154113781"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Feb 2025 21:57:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnWtn-000Cvi-2T;
	Thu, 27 Feb 2025 05:57:37 +0000
Date: Thu, 27 Feb 2025 13:57:22 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Arnd Bergmann <arnd@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>,
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
Message-ID: <202502271317.S0YZiPk1-lkp@intel.com>
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
[also build test ERROR on next-20250226]
[cannot apply to soc/for-next linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Herbert-Xu/crypto-lib-Kconfig-Select-and-hide-arch-options/20250226-125220
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/Z76aUfPIbhPAsHbv%40gondor.apana.org.au
patch subject: [PATCH] crypto: lib/Kconfig - Select and hide arch options
config: s390-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250227/202502271317.S0YZiPk1-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502271317.S0YZiPk1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502271317.S0YZiPk1-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/crypto/chacha-glue.o: in function `chacha20_s390':
>> chacha-glue.c:(.text+0x30e): undefined reference to `chacha_crypt_generic'
   s390-linux-ld: arch/s390/crypto/chacha-glue.o: in function `chacha_crypt_arch':
   chacha-glue.c:(.text+0x3f6): undefined reference to `chacha_crypt_generic'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

