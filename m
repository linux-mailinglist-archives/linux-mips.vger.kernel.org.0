Return-Path: <linux-mips+bounces-12536-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D5CD2FE5
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 14:47:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4FDE63001636
	for <lists+linux-mips@lfdr.de>; Sat, 20 Dec 2025 13:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED3D026ED29;
	Sat, 20 Dec 2025 13:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCmLMJOG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117642641FC;
	Sat, 20 Dec 2025 13:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238422; cv=none; b=sBwzXjOO3OikQQ++9x4Gx91Muqnve6p/nfjGOd+V2lwGjl71S7GsK60jMzfBZWVbRuRfHMmG6vC4g4nKXXRiNFqMSqmD9sp9Ee1UARKYqINZDJTkPxsMj9cFZgxc7ReynW1OGmj09MDzh1Bu/hCbVYybUK9FObFi5yvnublXZg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238422; c=relaxed/simple;
	bh=mg0C+4JvGjCoIqDQ0gw+w3ko0LP3L+QMx2EtAcbTWXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrGLdBTjDOrsIsypJgEvMqw/Og7pM4YifghpEjnUxsnmW8UI2YNii+nx+FVGynUGlr/CpK79LgjebeP51lB5X0d53RqyO8lSe12Ch5vYqd0thg3FOXA35S1hW3N95T7Wcgo+Wu4F0mnLAAtxDABIriUKu/XbHy7zd3f8qA1ozKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCmLMJOG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238420; x=1797774420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mg0C+4JvGjCoIqDQ0gw+w3ko0LP3L+QMx2EtAcbTWXY=;
  b=HCmLMJOGeoCo08qxNOAkg2DxY5JB+UBfcp45M/u9lxUkEY391IRIj3Ck
   BLaYzn5LU5nIDQY8dFwGNWBjwQaWv4wmB7jivW8cao3zrqZKaz6+vyrvT
   SzBZi/AUOEZICVlZ1tlu9F1f/5OXZ50R7R4iTDRKw1VGqr/ltqNQP8RUV
   3cYNbzPA2A6U/TmbhCyT+NjTk2oYd1wW3BW6fiKR2Z7/Lqsnw5LPE4rrP
   W4AdrFV4f2pwp8k2AcpyrFHRdQzILw0GkmZVuM3tPRqgwkICO6G4TIqMQ
   Ik9+mCoFHpY82avNPUmzp+OMTLfqCSRV9LV4QJGOhFFHnk0qdICCvm56r
   g==;
X-CSE-ConnectionGUID: joPC7Y9AScGl8/HQJU1WGg==
X-CSE-MsgGUID: oRoN9JEcRWGaQOUb77GIbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68110717"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68110717"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:47:00 -0800
X-CSE-ConnectionGUID: JzUVON0yTAWl/bhgOMz6qg==
X-CSE-MsgGUID: uPZuWzmvSUCYCu6PZRn0bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198864810"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIK-000000004Zt-3NbM;
	Sat, 20 Dec 2025 13:46:52 +0000
Date: Sat, 20 Dec 2025 21:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linusw@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>
Subject: Re: [PATCH 05/13] pinctrl: eyeq5: Use match data
Message-ID: <202512202102.TqCsNdqY-lkp@intel.com>
References: <20251217-eyeq6lplus-v1-5-e9cdbd3af4c2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217-eyeq6lplus-v1-5-e9cdbd3af4c2@bootlin.com>

Hi Benoît,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Beno-t-Monin/dt-bindings-mips-Add-Mobileye-EyeQ6Lplus-SoC/20251217-214926
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251217-eyeq6lplus-v1-5-e9cdbd3af4c2%40bootlin.com
patch subject: [PATCH 05/13] pinctrl: eyeq5: Use match data
config: parisc-randconfig-r051-20251218 (https://download.01.org/0day-ci/archive/20251220/202512202102.TqCsNdqY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202102.TqCsNdqY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202102.TqCsNdqY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/auxiliary_bus.h:11,
                    from drivers/pinctrl/pinctrl-eyeq5.c:21:
   drivers/pinctrl/pinctrl-eyeq5.c: In function 'eq5p_pinconf_set':
>> include/vdso/bits.h:7:40: warning: 'offset' is used uninitialized [-Wuninitialized]
       7 | #define BIT(nr)                 (UL(1) << (nr))
         |                                 ~~~~~~~^~~~~~~~
   drivers/pinctrl/pinctrl-eyeq5.c:533:19: note: in expansion of macro 'BIT'
     533 |         u32 val = BIT(offset);
         |                   ^~~
   drivers/pinctrl/pinctrl-eyeq5.c:532:22: note: 'offset' declared here
     532 |         unsigned int offset;
         |                      ^~~~~~


vim +/offset +7 include/vdso/bits.h

3945ff37d2f48d Vincenzo Frascino 2020-03-20  6  
3945ff37d2f48d Vincenzo Frascino 2020-03-20 @7  #define BIT(nr)			(UL(1) << (nr))
cbdb1f163af2bb Andy Shevchenko   2022-11-28  8  #define BIT_ULL(nr)		(ULL(1) << (nr))
3945ff37d2f48d Vincenzo Frascino 2020-03-20  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

