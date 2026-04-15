Return-Path: <linux-mips+bounces-14149-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC4SGVjW3mnwIwAAu9opvQ
	(envelope-from <linux-mips+bounces-14149-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 02:05:44 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8673FF355
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 02:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E7A1307E63D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 00:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8228C4369A;
	Wed, 15 Apr 2026 00:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ami3MaUS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6587E3FCC;
	Wed, 15 Apr 2026 00:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776211523; cv=none; b=P/5DvLfP+i1AyL/un8GXsdIAddgp6tzPIj1vJZ1UEZmr0kyBnaTkX0lDQoGJMHgvDizvfK2SWdGe9IQi0oiHHNhvlUHwzSzwFJaWjAcxIsh8loM/9nr3xO1G4yAOtuiynE26F8mUPSTC7ncvdiGDWftP7kLy12577PmBQz0KveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776211523; c=relaxed/simple;
	bh=QJYIaV4E/IuyvGOiNpoWNfCl5bg8HnBgQPPphrXTlN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hUKPijhRso+mzEhScGhpBAUYfluIheFJJ7WdMJceMFJhcNPNapk3bksfz47Cfa5KYFA5jE/hgPEZ3O6Tqcd2ltVcidNLjLb1EBdeQY1u5sHwL1IL/HK0y5+Y2h7Fx2IXgrkBGdE6NrD0IG9QwOUoOWR0Qs4JbmsxU8l+0js2erA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ami3MaUS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776211521; x=1807747521;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QJYIaV4E/IuyvGOiNpoWNfCl5bg8HnBgQPPphrXTlN0=;
  b=ami3MaUSFWqxo8jF4Hv85hdciQnRJhtTN7rDaq4tTAuXcJLwpVGUXUoR
   kx+GiAkj/+qo0icqYzrChY75VOaDDglYXVGJCc2NUf7Dk+bMiF4MoF7ts
   RZ/+ilMVvoajBHHsIEobqoIrUFNUYaEhxoG1Gt/udpqHCJcerEK4y0vrV
   9ZVBmF9oWIayjUL0LeSJxpmY5+pa6EBasx/4Z4RKAIcI7SwcBSKcHRU1B
   plavl+c5EdT9BQHSqakqj3/VXRFv5t922QizBxB57dZblG6aPMHOGOrzE
   k7fQBEiayCB0B+aU45V7oOjRBbfmeCIwLsG4nB4uJbuh0XHbB7L2MTNfN
   g==;
X-CSE-ConnectionGUID: 8SZGL7bRTaOGUgrxm024fg==
X-CSE-MsgGUID: og3SviV5SUuzFrC1Ux8Ldg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76213639"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="76213639"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 17:05:21 -0700
X-CSE-ConnectionGUID: mZ0DOTvRQYeYCuydP7vqmQ==
X-CSE-MsgGUID: hZmcqFH2TPy0KShEpm8T3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253643556"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 17:05:18 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCnkq-000000001zV-0vKp;
	Wed, 15 Apr 2026 00:05:16 +0000
Date: Wed, 15 Apr 2026 08:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: oe-kbuild-all@lists.linux.dev, yoelvisoliveros@gmail.com,
	len.bao@gmx.us, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <202604150717.26IAjbLy-lkp@intel.com>
References: <20260412000226.2711800-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412000226.2711800-1-m32285159@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,gmx.us,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14149-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,alpha.franken.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: CB8673FF355
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/staging-octeon-remove-SPI-POW-PKO-and-Helper-typedef-enums/20260415-004127
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260412000226.2711800-1-m32285159%40gmail.com
patch subject: [PATCH] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260415/202604150717.26IAjbLy-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150717.26IAjbLy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150717.26IAjbLy-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet.c:23:
>> drivers/staging/octeon/octeon-stubs.h:1270:22: error: 'cvmx_helper_interface_mode' defined as wrong kind of tag
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon/octeon-stubs.h:1270:49: error: return type is an incomplete type
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h: In function 'cvmx_helper_interface_get_mode':
>> drivers/staging/octeon/octeon-stubs.h:1273:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
    1273 |         return 0;
         |                ^
   drivers/staging/octeon/octeon-stubs.h:1270:49: note: declared here
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_change_mtu':
>> drivers/staging/octeon/ethernet.c:252:14: error: void value not ignored as it ought to be
     252 |             (cvmx_helper_interface_get_mode(interface) !=
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_common_set_multicast_list':
   drivers/staging/octeon/ethernet.c:298:14: error: void value not ignored as it ought to be
     298 |             (cvmx_helper_interface_get_mode(interface) !=
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_set_mac_filter':
   drivers/staging/octeon/ethernet.c:350:14: error: void value not ignored as it ought to be
     350 |             (cvmx_helper_interface_get_mode(interface) !=
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/ethernet.c: In function 'cvm_oct_probe':
>> drivers/staging/octeon/ethernet.c:801:22: error: 'cvmx_helper_interface_mode' defined as wrong kind of tag
     801 |                 enum cvmx_helper_interface_mode imode =
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon/ethernet.c:802:21: error: variable 'imode' has initializer but incomplete type
     802 |                     cvmx_helper_interface_get_mode(interface);
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon/ethernet.c:801:49: error: storage size of 'imode' isn't known
     801 |                 enum cvmx_helper_interface_mode imode =
         |                                                 ^~~~~
>> drivers/staging/octeon/ethernet.c:801:49: warning: unused variable 'imode' [-Wunused-variable]
--
   In file included from drivers/staging/octeon/octeon-ethernet.h:41,
                    from drivers/staging/octeon/ethernet-mdio.c:15:
>> drivers/staging/octeon/octeon-stubs.h:1270:22: error: 'cvmx_helper_interface_mode' defined as wrong kind of tag
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon/octeon-stubs.h:1270:49: error: return type is an incomplete type
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/octeon/octeon-stubs.h: In function 'cvmx_helper_interface_get_mode':
>> drivers/staging/octeon/octeon-stubs.h:1273:16: error: 'return' with a value, in function returning void [-Wreturn-mismatch]
    1273 |         return 0;
         |                ^
   drivers/staging/octeon/octeon-stubs.h:1270:49: note: declared here
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cvmx_helper_interface_mode +1270 drivers/staging/octeon/octeon-stubs.h

  1269	
> 1270	static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
  1271									   interface)
  1272	{
> 1273		return 0;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

