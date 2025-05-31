Return-Path: <linux-mips+bounces-9132-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8800BAC9C92
	for <lists+linux-mips@lfdr.de>; Sat, 31 May 2025 21:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4684817E947
	for <lists+linux-mips@lfdr.de>; Sat, 31 May 2025 19:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5A3219DF4C;
	Sat, 31 May 2025 19:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PJIex7rP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D093330100;
	Sat, 31 May 2025 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748720633; cv=none; b=bgRpOHDnnjJdA4O43yujpeSCDieDvws9O0FA0SyOrTd81SZWJ8Bjx8yWn9iZXUZlIKo/fn4Kq95zUrnv1z1lRErcX/xsW58wXzvJIoogo7nEV8LqVYCSADwSMZPwz953rpG6RDnHUXABb8FGZZYa/kijSnqt/6Kj9EUOwfbC/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748720633; c=relaxed/simple;
	bh=APbQsHtpAO52N+9EAYQ5CjVtJKDJ7Y0OLBaB8LX6Ekg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A91JsMaZZcXkc+Sbpjsy56WR1H3Uv7FpRmUzzAuo0TPVXrCDaRx+Srnh24kRrIxuhAbY3pB+b4M9EfMTuOYObT/iRjCEnZcB4WgvGujLSoKZzPzV2q+ZJCyJNfSVJi0jiHE3HjfhUaMfEzy3pcy1ZmVCqHJyheGq39WGs+GboVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PJIex7rP; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748720631; x=1780256631;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=APbQsHtpAO52N+9EAYQ5CjVtJKDJ7Y0OLBaB8LX6Ekg=;
  b=PJIex7rPcxBm0k/svwAW51r7xFzCf7vAx1qetN/zCuXa/+bmJAdpMhyS
   +XqEQ8LhDtOrGYFM8cRNJmUzQJZ4SzO1Jo1UA2I5P2VaQXB3Ca4V085Ko
   xMqGIrw4XAD89w27uKg0h9zKotFqrcNrd1nK4hqJJSVXTx1YAgUopT3/Z
   p+aDxMa0IEafPdlnJskpisQncKHL6XkRfBciBWKqe/yjt40x25kLtjoil
   mXO4kTjw6T92BPdAjgmAEZThPpj1FA3pQN5rqo6hcvIiVYFEzis1o5Mt1
   geNEGHmTfhq9oK6ZNDUXxaMwf9ehvHMKiI/sxfHfTwk0sy0gfre9jWEU+
   w==;
X-CSE-ConnectionGUID: zxWjsVj1SLOreKiy0u70PQ==
X-CSE-MsgGUID: 7e/wK2dfQx+D5DBfD5FkGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="61454936"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="61454936"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 12:43:50 -0700
X-CSE-ConnectionGUID: MsZ6rt5IR6qrn4wAx3/vuQ==
X-CSE-MsgGUID: St/jKMHiSK2+RIjtAgcf0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144030014"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 31 May 2025 12:43:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9161514B; Sat, 31 May 2025 22:43:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v1 1/1] MIPS: Alchemy: Remove unused forward declaration
Date: Sat, 31 May 2025 22:43:46 +0300
Message-ID: <20250531194346.3630898-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'struct gpio' is not used in the code, remove unneeded forward declaration.
This seems to be a leftover for a 5 years.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/mips/include/asm/mach-au1x00/gpio-au1000.h | 2 --
 arch/mips/include/asm/mach-au1x00/gpio-au1300.h | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
index d820b481ac56..e6306f6820e6 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1000.h
@@ -40,8 +40,6 @@
 #define AU1000_GPIO2_INTENABLE	0x10
 #define AU1000_GPIO2_ENABLE	0x14
 
-struct gpio;
-
 static inline int au1000_gpio1_to_irq(int gpio)
 {
 	return MAKE_IRQ(1, gpio - ALCHEMY_GPIO1_BASE);
diff --git a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
index 43d44f384f97..b12f37262cfa 100644
--- a/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
+++ b/arch/mips/include/asm/mach-au1x00/gpio-au1300.h
@@ -12,7 +12,6 @@
 #include <asm/io.h>
 #include <asm/mach-au1x00/au1000.h>
 
-struct gpio;
 struct gpio_chip;
 
 /* with the current GPIC design, up to 128 GPIOs are possible.
-- 
2.47.2


