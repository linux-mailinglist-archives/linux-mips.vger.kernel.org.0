Return-Path: <linux-mips+bounces-14196-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RHCMFYSY42nxIwEAu9opvQ
	(envelope-from <linux-mips+bounces-14196-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 16:43:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CC42156A
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 16:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 138BE302BA54
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 14:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082DF38F645;
	Sat, 18 Apr 2026 14:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P0xMOc4V"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3AD37D11F;
	Sat, 18 Apr 2026 14:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776523391; cv=none; b=iPIavXcAoptKae5U9pA7n0295F/MAy8XhOhgf1pDKlImb32+mY5g5c7Qhs9+GGbxa/lc11mVPJrMXtkC9mv7YUtQsw0CSMsaQIz9QpL1N1L6o6M/HQdV8qP5RMJdDLt1qmHhGYrqKcL5RXdi5AVW0bOrwUvxV0XbDJrsPWzh0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776523391; c=relaxed/simple;
	bh=XxhFp5+/P5pN6VOUfaLEFlvpAi694cTffY8GiO/VoD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8LVXB8i2Rix3VU5c+i5Z+gBFCslkeES9S+dLwQ/UmQzhRng+aSgJ/ECEOE3dm/2gxuBBGKAL4Ye0m6Qtyx6kwIfudpXUfLEpbuX8bx5gHSR/zBKFdmfBVn8IK4TaO23jp63oHmOgMlgUYjSf4xn2xoHfkw8gwo0M2rjTCTT6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P0xMOc4V; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776523389; x=1808059389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XxhFp5+/P5pN6VOUfaLEFlvpAi694cTffY8GiO/VoD8=;
  b=P0xMOc4VR90WMWykiDBmwMKvDwQHg4nHEaLMJXOpHFJLGECobQk5/dOy
   lE70I/3fX9fzZYPbPXf30b3tKypPKDGbTSkDGzJZMVipNrXMVa1ihe7Re
   tyWeeNkVf6Hr5fgtN8j4D4lB9BbjskyZaIAl3AtapIJMpxCiOkFVWVRF5
   RYORSdehgY3N0dRGkviZM9kJrCO6Irz33k06IJVCmgVmkqhi0U5BCqRMF
   mMcy6cgWzR7jwZ+DVelB6uqbTGto/FZ5Lw3/Y72rPj4z0c6qNpZJK7NWY
   XgB5fYI1vg0JNgOecAwcBPK93xYF4MeqEocjQh5PO9YYv0i8VrpjyY/Rv
   Q==;
X-CSE-ConnectionGUID: YxgqHouEQKaXKdUy4w0KYw==
X-CSE-MsgGUID: Hl//FbxxQqSpr3kLUNWCtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81380409"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="81380409"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 07:43:08 -0700
X-CSE-ConnectionGUID: FIFSXmEXQmealTJq79bCIQ==
X-CSE-MsgGUID: xN46cubwSB+cZgtyp0zPJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; 
   d="scan'208";a="261684563"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Apr 2026 07:43:05 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wE6sw-000000001Hk-3TGP;
	Sat, 18 Apr 2026 14:43:02 +0000
Date: Sat, 18 Apr 2026 22:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Maxwell Doose <m32285159@gmail.com>, gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <202604182238.w0EH6tRa-lkp@intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmx.us,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-14196-lists,linux-mips=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 2B6CC42156A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Maxwell,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxwell-Doose/staging-octeon-remove-SPI-POW-PKO-and-Helper-typedef-enums/20260417-103458
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260415122939.77847-1-m32285159%40gmail.com
patch subject: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper typedef enums
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260418/202604182238.w0EH6tRa-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260418/202604182238.w0EH6tRa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604182238.w0EH6tRa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/staging/octeon/ethernet.c:23:
   In file included from drivers/staging/octeon/octeon-ethernet.h:41:
   drivers/staging/octeon/octeon-stubs.h:1270:49: error: incomplete result type 'struct cvmx_helper_interface_mode' in function definition
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^
   drivers/staging/octeon/octeon-stubs.h:1270:22: note: forward declaration of 'struct cvmx_helper_interface_mode'
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^
   drivers/staging/octeon/octeon-stubs.h:1273:9: error: returning 'int' from a function with incompatible result type 'struct cvmx_helper_interface_mode'
    1273 |         return 0;
         |                ^
   In file included from drivers/staging/octeon/ethernet.c:28:
   In file included from drivers/staging/octeon/ethernet-mdio.h:20:
   In file included from include/net/xfrm.h:20:
   In file included from include/net/sock.h:60:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:12: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                          ^~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:23: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                                     ^~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   4 warnings and 2 errors generated.
--
   In file included from ethernet.c:23:
   In file included from ./octeon-ethernet.h:41:
   ./octeon-stubs.h:1270:49: error: incomplete result type 'struct cvmx_helper_interface_mode' in function definition
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                                                 ^
   ./octeon-stubs.h:1270:22: note: forward declaration of 'struct cvmx_helper_interface_mode'
    1270 | static inline struct cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
         |                      ^
   ./octeon-stubs.h:1273:9: error: returning 'int' from a function with incompatible result type 'struct cvmx_helper_interface_mode'
    1273 |         return 0;
         |                ^
   In file included from ethernet.c:28:
   In file included from ./ethernet-mdio.h:20:
   In file included from include/net/xfrm.h:20:
   In file included from include/net/sock.h:60:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:12: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                          ^~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:23: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                                     ^~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   4 warnings and 2 errors generated.


vim +134 include/linux/poll.h

7a163b2195cda0 Al Viro 2018-02-01  129  
7a163b2195cda0 Al Viro 2018-02-01  130  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0 Al Viro 2018-02-01  131  {
7a163b2195cda0 Al Viro 2018-02-01  132  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0 Al Viro 2018-02-01  133  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0 Al Viro 2018-02-01 @134  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0 Al Viro 2018-02-01  135  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0 Al Viro 2018-02-01  136  #undef M
7a163b2195cda0 Al Viro 2018-02-01  137  }
7a163b2195cda0 Al Viro 2018-02-01  138  #undef __MAP
7a163b2195cda0 Al Viro 2018-02-01  139  
7a163b2195cda0 Al Viro 2018-02-01  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

