Return-Path: <linux-mips+bounces-3265-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F43A8C47D8
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 21:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF731C23156
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 19:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A5876C61;
	Mon, 13 May 2024 19:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B3/TvDQb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A9F77107;
	Mon, 13 May 2024 19:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715629734; cv=none; b=TEjLScff29YDanoZswNrHiOdSqxhsCbOlnjbHVBE8Fcy5wsF+Y4t+L//f6THYYSSStPFdbq8yUhpdYYllM9yihT3p9uqmRYLScBASjNfNuVkxBWimuAq5aXI5Z8mqF46R63jP6Kjrow0jW3WLMNr+sGUi3z5QLa6Miub1w42ImU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715629734; c=relaxed/simple;
	bh=GWnloP3tT/YXXyk4QBq6IzLYt0yUwn9pk8D1SDfG4So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2+mXEth7QChItbvHU3ny4AkpaBxmTh5CS3rYXsqLuJuujlFrPgfd9IMslC/HQ7JPZuQ6o6V6LkATH4c873+LpViwtlQTPinQ/9DiEsRa99PER/GrViLXD5jC4qEa796VEgvS6qb4yVW+cdNz9LlIhREX5bS3dlOBaiGuxJJ3gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B3/TvDQb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715629733; x=1747165733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GWnloP3tT/YXXyk4QBq6IzLYt0yUwn9pk8D1SDfG4So=;
  b=B3/TvDQb229/Hm75qbULTKzVRU0FfCX9mNBSo8pmFCH8mAnL3p6MVXby
   ehCfmQHIIxz9Y6VdwuVXqNgc9JziP4vw7JMptfX6eXvDeF+HObWVoeZsj
   +gdNhxBEpGk7bwZldmdiRDeh/mDii3FoVTl+OaQJoT62KKiBk3RpkPnTp
   /q7Uhzrt/lh8L1lUjGmm/ov0HbLQMJuY+Qx5TsDBCED1gE1clvkwIQj8C
   OAgbYe4649BC/7MQgz+KWaeONYL9q7z0qn9bvLOJUvv4gu9+WxW+do5ja
   YsXBj0H9iNXU6JF4r3Eni//D/vCpVpm5C53MwSZK1u2GsDU+jzyWQBKv9
   A==;
X-CSE-ConnectionGUID: 05owgKGfSt+70jjdh7jKsA==
X-CSE-MsgGUID: 4figUi2uRWy8r3+cfFmAyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="29074350"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="29074350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 12:48:52 -0700
X-CSE-ConnectionGUID: XA58acsLS7aXmsJ6E+RhRw==
X-CSE-MsgGUID: BDcvxECwSLyPGiiR4vN7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="67912153"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2024 12:48:51 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6bfE-000Ac9-04;
	Mon, 13 May 2024 19:48:48 +0000
Date: Tue, 14 May 2024 03:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH] clocksource: Add node counter timer driver for
 MIPS/Loongson64
Message-ID: <202405140342.uKkbQKIJ-lkp@intel.com>
References: <20240512-loongson_nodecnt-v1-1-2157b92ef8f8@flygoat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240512-loongson_nodecnt-v1-1-2157b92ef8f8@flygoat.com>

Hi Jiaxun,

kernel test robot noticed the following build errors:

[auto build test ERROR on 75fa778d74b786a1608d55d655d42b480a6fa8bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiaxun-Yang/clocksource-Add-node-counter-timer-driver-for-MIPS-Loongson64/20240512-200356
base:   75fa778d74b786a1608d55d655d42b480a6fa8bd
patch link:    https://lore.kernel.org/r/20240512-loongson_nodecnt-v1-1-2157b92ef8f8%40flygoat.com
patch subject: [PATCH] clocksource: Add node counter timer driver for MIPS/Loongson64
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20240514/202405140342.uKkbQKIJ-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140342.uKkbQKIJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405140342.uKkbQKIJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/loongson64/time.o: in function `plat_time_init':
>> time.c:(.init.text+0xb4): undefined reference to `nodecnt_clocksource_init'
>> mips64el-linux-ld: time.c:(.init.text+0xcc): undefined reference to `nodecnt_clocksource_init'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

