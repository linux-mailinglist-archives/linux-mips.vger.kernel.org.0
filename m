Return-Path: <linux-mips+bounces-3506-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E7D8FF349
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 19:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A784EB2738A
	for <lists+linux-mips@lfdr.de>; Thu,  6 Jun 2024 16:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B03B19753A;
	Thu,  6 Jun 2024 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITJ/Qkzh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEB643ACB;
	Thu,  6 Jun 2024 16:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692712; cv=none; b=fVXCbE6EL7tIklCAhd0L5xZIoe6IHDX3XyZm2peeBhTtUVjDhW2zkepLRl0GCo88GVucvJ9oi6+zcytbFsXHQ+4V+QYpq+UIAqmKxlP5dszrml1Q+d2n3Zx6Mux+FiIRyw5l/7VrvB9U438GZRfHIYbnE+w/Q0eDOzEZIWVW75w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692712; c=relaxed/simple;
	bh=I8dquLN5hvE2pwuU1vwCK30dpXdrWCpnXc3dm4r2+ho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cRQm0zT1OFMTL0mVp37TEM7SJP+ZPu2dPDiUqUliOtVZ/NRd1zoJA3/oIrDd2Fjrc/F1R6w6FJGjQ4+HxuQ8EbylKDlVmPOybGDkvo5VAHfDs7aT2CQLMWWMZGsGuxU8lj3iL8hrWvuMQVleRXVlu8pPQVWcHV+CtIfJPCV/2ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITJ/Qkzh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717692710; x=1749228710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I8dquLN5hvE2pwuU1vwCK30dpXdrWCpnXc3dm4r2+ho=;
  b=ITJ/QkzhbczUSwHhLT9nG2M9IyADFYw22TF/XF9laYRsj394fRXBgLLw
   xHrUqGHnGDP1Ttsu1zy4cbMS+qB1xy/TsC0uZQe5Rz8gmWAXrRgZphDtl
   9YkfyoZLWjMi0nZXpakI3wIuIdj/NnR0dh9YH3Xhv9uwDFRcckgrys8Ff
   ZtSmVIFf6HjoQQ9Yj9U9SJVKu143K1pYREPjpJYFLLbcknfY6El96F2mN
   yl2+h/A/NL1zo432j45sqTMgZSzeZy5YWGNeIRetI2DFCQHnbZTG40Zav
   uQPAie4mYF9XSmmxbKgya1XVjhJT00IB6MZ0hgVyhXKyfoHbEuGWbHHnW
   Q==;
X-CSE-ConnectionGUID: anwfelL7R8q+Db6uxDZd7w==
X-CSE-MsgGUID: gfkqSIbkRgi9cCcXe9m1Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18227506"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18227506"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:51:49 -0700
X-CSE-ConnectionGUID: 3xllAxwjRrOKOX7WUS4meA==
X-CSE-MsgGUID: pzpSIp7+THOwEsPo+EPw1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="68822547"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 06 Jun 2024 09:51:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6AEFC2A4; Thu, 06 Jun 2024 19:51:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v1 1/1] MIPS: Alchemy: Switch to use kmemdup_array()
Date: Thu,  6 Jun 2024 19:51:45 +0300
Message-ID: <20240606165145.3032150-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let the kememdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/alchemy/common/platform.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/alchemy/common/platform.c b/arch/mips/alchemy/common/platform.c
index d4ab34b3b404..da74cae6b43a 100644
--- a/arch/mips/alchemy/common/platform.c
+++ b/arch/mips/alchemy/common/platform.c
@@ -409,8 +409,8 @@ static void __init alchemy_setup_macs(int ctype)
 	if (alchemy_get_macs(ctype) < 1)
 		return;
 
-	macres = kmemdup(au1xxx_eth0_resources[ctype],
-			 sizeof(struct resource) * MAC_RES_COUNT, GFP_KERNEL);
+	macres = kmemdup_array(au1xxx_eth0_resources[ctype], MAC_RES_COUNT,
+			       sizeof(*macres), GFP_KERNEL);
 	if (!macres) {
 		printk(KERN_INFO "Alchemy: no memory for MAC0 resources\n");
 		return;
@@ -430,8 +430,8 @@ static void __init alchemy_setup_macs(int ctype)
 	if (alchemy_get_macs(ctype) < 2)
 		return;
 
-	macres = kmemdup(au1xxx_eth1_resources[ctype],
-			 sizeof(struct resource) * MAC_RES_COUNT, GFP_KERNEL);
+	macres = kmemdup_array(au1xxx_eth1_resources[ctype], MAC_RES_COUNT,
+			       sizeof(*macres), GFP_KERNEL);
 	if (!macres) {
 		printk(KERN_INFO "Alchemy: no memory for MAC1 resources\n");
 		return;
-- 
2.43.0.rc1.1336.g36b5255a03ac


