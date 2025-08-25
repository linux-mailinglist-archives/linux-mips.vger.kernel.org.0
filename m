Return-Path: <linux-mips+bounces-10583-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7114BB34788
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 18:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D3182A5675
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 16:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D68301029;
	Mon, 25 Aug 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ipibPTaq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9062FF642;
	Mon, 25 Aug 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139759; cv=none; b=emROIBBzP3i8//1ROchM70GJ84rAiWTncsZkJW0v22XrfFPRc/L393DOM5HSxOZP9P+6Zpz6XGUcbAitqbjkEmNCAyaunped3SvYJfOluLJlFvkPm0tNkqOWlPfKMVi/WKI1aU53Xa2JjSLSX9R+EavI2+ZWMaVudESHmyiOL44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139759; c=relaxed/simple;
	bh=WzmZWMms4bv8taptRv7sWNE6UwWdfM4GmVI+cXRz004=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THcoNSdqtOE6EjE8UN5Mom/ChVXJEklmdAdO5CcUJVzmvgAq4BqqQ0h0gLt3pE7OggBZjeEHLW9gJ/SQ9wyowNpTs5QIMUqM9RjxQgmnjOXw9ltHh7iDou6QJdYbWupulcG0cLDxLnqJ2iSsyjNLd94vP/uVbGHfW5ajBy2Cs5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ipibPTaq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139758; x=1787675758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WzmZWMms4bv8taptRv7sWNE6UwWdfM4GmVI+cXRz004=;
  b=ipibPTaqJsmv1n03Q4LncnYb7c0DDOBwLJlGwq7qljABi+oGsfrS2tam
   o3Cv9DX0AEjTGCz025YlnfjNVi3XpGQpEgTQcbw4gksk/77ThfK57fNYt
   LBwirHwZxL4B4EPZNPWTAi8JUcwcrnpYDCNlzSdmFyoBUnod+lBuTf8zT
   6Sk6gWnznftwmN31hJDFoqUZXgTIMWT4WkFEdv+aQQWWfi/+ddOpSCbR2
   gTHiLI69BWT7AXRw78w3b0kmWdcgVAxkqCKKILZ1p2B3FRkXuBN1zXzie
   FO/IkydxazcS4Auq+aqpqIO2ojb7+PTwZgBq3Zphj+B0Ew3EQusZ393tj
   A==;
X-CSE-ConnectionGUID: OUsYezKoTd+bA/fwzHNvug==
X-CSE-MsgGUID: nOVMlrz7TpqxuzDrwWU5aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459553"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459553"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: wGy2mzdEQBu6ep/2AqbnXQ==
X-CSE-MsgGUID: NAapVdSxTk+ZacKhIWFZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241086"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E1D6697; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 3/3] floppy: Sort headers alphabetically
Date: Mon, 25 Aug 2025 18:32:57 +0200
Message-ID: <20250825163545.39303-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/block/floppy.c | 54 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index d769a223fcc8..61d62019a38d 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -163,35 +163,35 @@
 
 /* do print messages for unexpected interrupts */
 static int print_unex = 1;
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/fs.h>
-#include <linux/kernel.h>
-#include <linux/timer.h>
-#include <linux/workqueue.h>
-#include <linux/fdreg.h>
-#include <linux/fd.h>
-#include <linux/hdreg.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/bio.h>
-#include <linux/string.h>
-#include <linux/jiffies.h>
-#include <linux/fcntl.h>
-#include <linux/delay.h>
-#include <linux/mc146818rtc.h>	/* CMOS defines */
-#include <linux/ioport.h>
-#include <linux/interrupt.h>
-#include <linux/init.h>
-#include <linux/major.h>
-#include <linux/platform_device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/mutex.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
 #include <linux/async.h>
+#include <linux/bio.h>
 #include <linux/compat.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/fcntl.h>
+#include <linux/fd.h>
+#include <linux/fdreg.h>
+#include <linux/fs.h>
+#include <linux/hdreg.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/major.h>
+#include <linux/mc146818rtc.h>	/* CMOS defines */
+#include <linux/mm.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/timer.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
 
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
-- 
2.50.1


