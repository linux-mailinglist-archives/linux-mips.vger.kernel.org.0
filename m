Return-Path: <linux-mips+bounces-14193-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eP2eJ2ij4mkX8gAAu9opvQ
	(envelope-from <linux-mips+bounces-14193-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 23:17:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9799241EA1C
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 23:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA90D30125A1
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 21:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7212FE59B;
	Fri, 17 Apr 2026 21:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HI/2s/ts"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F387E2BDC3F;
	Fri, 17 Apr 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776460638; cv=none; b=Mmak1yDYCfn4qyEyvY/2tUNKznOg8z6h96soMwPu3ACNid4aFVr5BgJdMNpZE9CvYMBKvi/+PoT4MKtOaXjRMUbJ1qnUCh8BFVpVuTKGF2xRbKSRqcYFDWxL+VtNP7CsEz5OXzac6PU6H/UAwApd1mc+1Gh0+bbXg4cG3Y3n6zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776460638; c=relaxed/simple;
	bh=epwlFBsalxdWuyw5+up4ZTUPp6kN7di9A6zZ9iMpm/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hd4TH2n6Jm7YWalWkUNz5RTjy1sYMbj6BCB25rN6P8gUfTMXZSIq6Y5wGH8kaw8FCWRhHyiZ0v7fInms1+FPETGw1Iv0TG2MGcvAsoT0zc27nkG6ev8H+rWurMn5qx/Q9srk7QSSh2SpqDT87OnBSBUJqAQT8SDAag0QhqQUBEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HI/2s/ts; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776460637; x=1807996637;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=epwlFBsalxdWuyw5+up4ZTUPp6kN7di9A6zZ9iMpm/c=;
  b=HI/2s/tsZnj8GUIWZ+0NLFLxz8/dO79bxnvFBJbThThbtHD58BenYF1T
   rrBT1mG69CVOxpRROAbmynNHOmMZuXWf4xm6zFsax5UG/YYYjzQakofHw
   KbreLNukwteaqVyG9nm/YkCJqWj84iSpM+L0yXczKphw250YWJyK5fPEN
   kZzRAziYI1Svyh/+WR7P1xxQ8ubdK+1pm0wj7XLSqCC26r2xUMYp2D5vz
   +9IwEdFs6zVvK6KrFZ1EWAOYcrvLSMxclmjBkvWfMJT2GrsZBu404g4Is
   6/XJx779UB3QtTRrX7l5gIJytFchlLYNXUaAgQ+Ifzywr2GHSWxl8+45y
   A==;
X-CSE-ConnectionGUID: VGmPVxWHR12mWEmJy/Ivwg==
X-CSE-MsgGUID: F+SHlaRiS0SXNGZQ34+PcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81359264"
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="81359264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 14:17:16 -0700
X-CSE-ConnectionGUID: 5ASwowp/TbqcQytqdkzjPg==
X-CSE-MsgGUID: V+h3r/JcTpagkaHHqD2fsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,185,1770624000"; 
   d="scan'208";a="269156937"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Apr 2026 14:17:14 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDqYo-000000000hs-2thS;
	Fri, 17 Apr 2026 21:17:10 +0000
Date: Sat, 18 Apr 2026 05:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <202604180530.yvwobb0w-lkp@intel.com>
References: <20260415122939.77847-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415122939.77847-1-m32285159@gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmx.us,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14193-lists,linux-mips=lfdr.de];
	SURBL_MULTI_FAIL(0.00)[download.01.org:query timed out];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org,alpha.franken.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,01.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9799241EA1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxwell,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/staging-octeon-remove-SPI-POW-PKO-and-Helper-typedef-enums/20260417-103458
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260415122939.77847-1-m32285159%40gmail.com
patch subject: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260418/202604180530.yvwobb0w-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604180530.yvwobb0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604180530.yvwobb0w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/octeon/ethernet.c:23:
   In file included from drivers/staging/octeon/octeon-ethernet.h:41:
>> drivers/staging/octeon/octeon-stubs.h:1270:49: error: incomplete result type 'struct cvmx_helper_interface_mode' in function definition
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^
   drivers/staging/octeon/octeon-stubs.h:1270:22: note: forward declaration of 'struct cvmx_helper_interface_mode'
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^
>> drivers/staging/octeon/octeon-stubs.h:1273:9: error: returning 'int' from a function with incompatible result type 'struct cvmx_helper_interface_mode'
    1273 |         return 0;
         |                ^
   2 errors generated.


vim +1270 drivers/staging/octeon/octeon-stubs.h

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

