Return-Path: <linux-mips+bounces-6858-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 344D89E3560
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 09:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0214E168F3D
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 08:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D452192D70;
	Wed,  4 Dec 2024 08:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIfLPvQn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAF31865FA;
	Wed,  4 Dec 2024 08:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733301031; cv=none; b=iHiEssxfWyQW5LF2Th1d8vp9/+kEVRSKdWRbgaPrs3KpWtsDgkpVta/aCaZXP8zABhs8ntnveNZ6nUOozwkMwzeV344aADTAY3B7aXBpid3+3I4akF06u53gcIxra5sJL7aNM1T92joizVyCOh9SFeInqxbba7/ji7lfEgqapvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733301031; c=relaxed/simple;
	bh=gvOpS/CSU9zOtDTEg/2CzkuI1bv/x96uWiHEJDSy0l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWUkq//3GzlxfMm9r1dPt6/dDQW15ngtAAEGmF04jjlzfxPv5y6oczLlTh4VNDRXXyZmPS5uWgliUw8mZPSvPqx61DDNjbHpEzd8ebeQPSk/7DYnfaK7S0QlwRY7nbSNLG9mWbvO/BINzbA+le7/WwgydzIZQUok4wLCyzcwfps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIfLPvQn; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733301028; x=1764837028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gvOpS/CSU9zOtDTEg/2CzkuI1bv/x96uWiHEJDSy0l4=;
  b=MIfLPvQnmGv5Fco+BW556A/JcHxsCop6UQc9CIFmWPTc92/2IVMcl60n
   g0AXjtVzsQwo38/Tu77E1+j17Yi+rzGxdEkhopsHwB/IOiAxgo2twaP7L
   KLNpHRg5SVxNJq1eLI9cwG9V88RtAKlOEogzeXql7/CIyU/M92vb4UHh9
   OoC0FZDhRVMypuWygZ3a4GyyjDLrSYwl0K8x7xRZbGnIw8G26uTG/WUaj
   S54sXHa8wbmGmSDNXbHWVgD1khhenWazoDbm0i2dVNwMzsv7vWD/KEuKe
   RbuzSadfYkOsmkq9QF+Cpjb6s7xEi5l2FonNWNJDsQfd7T0Hqt4lxY8Om
   Q==;
X-CSE-ConnectionGUID: XyhH4beeSACckgSPli/IhQ==
X-CSE-MsgGUID: O9WujM8zSXGUvDPZLtkUQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="21135969"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="21135969"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:30:28 -0800
X-CSE-ConnectionGUID: 9J2fsjFmSYmXETH0NbSCQQ==
X-CSE-MsgGUID: wTnypkPZRRqunuh3ulGTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="97760319"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 04 Dec 2024 00:30:24 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIkly-0002lV-1c;
	Wed, 04 Dec 2024 08:30:17 +0000
Date: Wed, 4 Dec 2024 16:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: =?unknown-8bit?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: oe-kbuild-all@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	=?unknown-8bit?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	=?unknown-8bit?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Subject: Re: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5
 NVMEM
Message-ID: <202412041614.WGhDRXyh-lkp@intel.com>
References: <20241203-rmem-v1-5-24f4970cf14e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241203-rmem-v1-5-24f4970cf14e@bootlin.com>

Hi Théo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 40384c840ea1944d7c5a392e8975ed088ecf0b37]

url:    https://github.com/intel-lab-lkp/linux/commits/Th-o-Lebrun/dt-bindings-nvmem-rmem-Add-mobileye-eyeq5-bootloader-config/20241204-103417
base:   40384c840ea1944d7c5a392e8975ed088ecf0b37
patch link:    https://lore.kernel.org/r/20241203-rmem-v1-5-24f4970cf14e%40bootlin.com
patch subject: [PATCH 5/6] nvmem: rmem: add CRC validation for Mobileye EyeQ5 NVMEM
config: arc-randconfig-001 (https://download.01.org/0day-ci/archive/20241204/202412041614.WGhDRXyh-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041614.WGhDRXyh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041614.WGhDRXyh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/nvmem/rmem.c: In function 'rmem_eyeq5_checksum':
>> drivers/nvmem/rmem.c:66:9: error: cleanup argument not a function
      66 |         void *buf __free(kfree) = NULL;
         |         ^~~~
>> drivers/nvmem/rmem.c:97:15: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Werror=implicit-function-declaration]
      97 |         buf = kmalloc(header.size, GFP_KERNEL);
         |               ^~~~~~~
         |               mm_alloc
>> drivers/nvmem/rmem.c:97:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      97 |         buf = kmalloc(header.size, GFP_KERNEL);
         |             ^
   cc1: some warnings being treated as errors


vim +66 drivers/nvmem/rmem.c

    62	
    63	static int rmem_eyeq5_checksum(struct rmem *priv)
    64	{
    65		struct rmem_eyeq5_header header;
  > 66		void *buf __free(kfree) = NULL;
    67		u32 computed_crc, *target_crc;
    68		size_t data_size;
    69		int ret;
    70	
    71		ret = rmem_read(priv, 0, &header, sizeof(header));
    72		if (ret)
    73			return ret;
    74	
    75		if (header.magic != RMEM_EYEQ5_MAGIC)
    76			return -EINVAL;
    77	
    78		/*
    79		 * Avoid massive kmalloc() if header read is invalid;
    80		 * the check would be done by the next rmem_read() anyway.
    81		 */
    82		if (header.size > priv->mem->size)
    83			return -EINVAL;
    84	
    85		/*
    86		 *           0 +-------------------+
    87		 *             | Header (12 bytes) | \
    88		 *             +-------------------+ |
    89		 *             |                   | | data to be CRCed
    90		 *             |        ...        | |
    91		 *             |                   | /
    92		 *   data_size +-------------------+
    93		 *             |   CRC (4 bytes)   |
    94		 * header.size +-------------------+
    95		 */
    96	
  > 97		buf = kmalloc(header.size, GFP_KERNEL);
    98		if (!buf)
    99			return -ENOMEM;
   100	
   101		ret = rmem_read(priv, 0, buf, header.size);
   102		if (ret)
   103			return ret;
   104	
   105		data_size = header.size - sizeof(*target_crc);
   106		target_crc = buf + data_size;
   107		computed_crc = crc32(U32_MAX, buf, data_size) ^ U32_MAX;
   108	
   109		if (computed_crc == *target_crc)
   110			return 0;
   111	
   112		dev_err(priv->dev,
   113			"checksum failed: computed %#x, expected %#x, header (%#x, %#x, %#x)\n",
   114			computed_crc, *target_crc, header.magic, header.version, header.size);
   115		return -EINVAL;
   116	}
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

