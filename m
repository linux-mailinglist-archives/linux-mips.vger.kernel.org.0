Return-Path: <linux-mips+bounces-9033-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1EAABD525
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 12:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEAAA1BA34E8
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 10:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E23B2701CB;
	Tue, 20 May 2025 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWeS7GNS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32E52701D4;
	Tue, 20 May 2025 10:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737326; cv=none; b=YT10HW/b/ALbSk1AmmkeBcgdY/1RcRklxDdhMNgC+Dzy6av7AbTFrUsWypOF8Zdvsd7BTC568KqKApgtv7MhHvWgF+i9yRXu5RHFk4x2ADL8R27PuwHwe9Fwfhv8+xgtt/5IdiZzXmBn8sSTucyNa9Nw/rNr6DfMeDfgCLIzcvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737326; c=relaxed/simple;
	bh=dXo6SGuXbAF9WMc+a1rAec7JrIlHarRG0aqXbcVpfTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Axpomvn5mDbtx9S/o4zNpYzxQn55DlkCoWSi0ns+2D2YVAlK99f6qrgRI1oeT45yI03GcbhP2Q+nBjmjN2hdOVHc+rHKyAMY9w7r2fJW1AuStavqhrdIfo5YTIgrZmIUgpYnE9QJvoYxj37Ed/8CXw2pib6Yhx+v3HmmF1SKFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWeS7GNS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737325; x=1779273325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dXo6SGuXbAF9WMc+a1rAec7JrIlHarRG0aqXbcVpfTA=;
  b=HWeS7GNSVoRpd00omO4XCeG+aF4KHj0qsy8OUIexNw3878DsQnxVAQwU
   T5/pyOY2QFPWxh1eXKHVSmK49HV1MenQc8CO1sVXG3A8jbIKYflfcvIKa
   AInRaxxpQpZDqkXqqpJPflR+Xg22UikpmWWUvpblLijrHTxeKF6U4F+6t
   DIuNKHoBXveB/5lpS3FAp2xgkrShqvzOuWTNp+Umcago4GY6RaoOFrnhm
   OqUV/oqu2xopCKXGTaWQp6gL8p9htQJ9LItMZ8c/alqwPinnqIkhjqtw/
   MRozkbXnJa993me24jqc4ST0lvGMlVi12O1Vf2FS4nrbpRxJonCLbUgQp
   A==;
X-CSE-ConnectionGUID: Demv7WB2RMSS3m0ENNFDjg==
X-CSE-MsgGUID: rJ+cVMOIROiZJVdeo3qBIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49567335"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49567335"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:35:25 -0700
X-CSE-ConnectionGUID: RRSV9netQiGtdhWTfUcTcw==
X-CSE-MsgGUID: MM8iGlnhTT+9CJk6qzb7mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144776602"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 May 2025 03:35:22 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHKJc-000MSO-0m;
	Tue, 20 May 2025 10:35:20 +0000
Date: Tue, 20 May 2025 18:35:12 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev, linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	linux-doc@vger.kernel.org
Subject: [mips-linux:mips-next 19/19] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
Message-ID: <202505201832.NNOJ4E78-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git mips-next
head:   faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
commit: faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7 [19/19] MAINTAINERS: Add entry for newly added EcoNet platform.
reproduce: (https://download.01.org/0day-ci/archive/20250520/202505201832.NNOJ4E78-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505201832.NNOJ4E78-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
   Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
   Warning: Documentation/userspace-api/netlink/index.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
   Warning: Documentation/userspace-api/netlink/specs.rst references a file that doesn't exist: Documentation/networking/netlink_spec/index.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
   Can't build as 1 mandatory dependency is missing at ./scripts/sphinx-pre-install line 984.
   make[2]: *** [Documentation/Makefile:121: htmldocs] Error 255
   make[1]: *** [Makefile:1801: htmldocs] Error 2
   make: *** [Makefile:248: __sub-make] Error 2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

