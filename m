Return-Path: <linux-mips+bounces-10584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0FBB3478D
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 18:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7E571621BA
	for <lists+linux-mips@lfdr.de>; Mon, 25 Aug 2025 16:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B57EE301038;
	Mon, 25 Aug 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IddtJ7b6"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D812FE58F;
	Mon, 25 Aug 2025 16:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756139759; cv=none; b=IbX1ik4YgTkB6noV/GoZiSzeATHzQnq/LB17HoDL3wrLWewbpQW8s/9SFyjmTEYnvLc8sjic1zR+3f7s6FMJgcBpnXI1o30M1rH6KIv3KRvboNGaijwUBSZh2zfzdNeey+sWNW1Iy27G55qDmbn/l2qnbymGHu6EK/NYKWwumS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756139759; c=relaxed/simple;
	bh=4BgR1C08p0drss5NDxXSek6A+9jO5AXL54CNKL2STq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=azHTwOriUAxo53WmyenlR2dbWkQJu5fXAAuf4KE8vL2OrgjMkJU+nSfsfFK27SDrxNGB/Cs5rqBWcowT2NlIQLf7G3G/BI2EHK4gHWxaLuHk2rvtvtnf0y0eYdVwIHFu4sOCO8+Kt+1n1Akcth839f8WOv9zjt6OYGPwWDeZEuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IddtJ7b6; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139758; x=1787675758;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4BgR1C08p0drss5NDxXSek6A+9jO5AXL54CNKL2STq4=;
  b=IddtJ7b67kNvKBVHp5j6dx/9utGLPI6omcP0MXi3JBQXf/SuufKQCWzS
   53WSywoxJ18LbwzUcc1O3CUlii4AyCTJ+f2qNUdDo/LHwP8ZX0XLhtHiU
   CqDC5ummM+sx41j/57aMvLnF/QZofBzSKGwPj9r5WrscA+i107L6vKbE0
   e0A+zuEItfyK9B4CgwTElyrgl0yBxDDymNaEPkB1jdTqEeTCOjFQsAJAe
   PJByDOXqXlJ9fW4p/0+tra7dH4u3HdebhwtTa63n2bG6SJ0vdhrP4DcVo
   AIdIQJd5NxloBlbqufi9V3ebouhq5buhVjnPKIuc5vpd+WnEquui3kRj9
   g==;
X-CSE-ConnectionGUID: D6bcEH8CQpiSRr19qOfJ3Q==
X-CSE-MsgGUID: D+b5XW7xQ3u9L5wy6c5PrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58288822"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="58288822"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:56 -0700
X-CSE-ConnectionGUID: RQaCu0IOQPuihHdwgc5pQg==
X-CSE-MsgGUID: snlOI4+aRY2/4OBMeyrQuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="168588221"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id DD7AF96; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
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
Subject: [PATCH v2 2/3] floppy: Replace custom SZ_64K constant
Date: Mon, 25 Aug 2025 18:32:56 +0200
Message-ID: <20250825163545.39303-3-andriy.shevchenko@linux.intel.com>
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

There are only two headers using the K_64 custom constant. Moreover,
its usage tangles a code because the constant is defined in the C
file, while users are in the headers. Replace it with well defined
SZ_64K from sizes.h.

Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/parisc/include/asm/floppy.h | 5 +++--
 arch/x86/include/asm/floppy.h    | 3 ++-
 drivers/block/floppy.c           | 2 --
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/parisc/include/asm/floppy.h b/arch/parisc/include/asm/floppy.h
index df20dbef3ada..f15b69fea901 100644
--- a/arch/parisc/include/asm/floppy.h
+++ b/arch/parisc/include/asm/floppy.h
@@ -8,9 +8,9 @@
 #ifndef __ASM_PARISC_FLOPPY_H
 #define __ASM_PARISC_FLOPPY_H
 
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
-
 /*
  * The DMA channel used by the floppy controller cannot access data at
  * addresses >= 16MB
@@ -20,7 +20,8 @@
  * floppy accesses go through the track buffer.
  */
 #define _CROSS_64KB(a,s,vdma) \
-(!(vdma) && ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+	(!(vdma) && \
+	 ((unsigned long)(a) / SZ_64K != ((unsigned long)(a) + (s) - 1) / SZ_64K))
 
 #define SW fd_routine[use_virtual_dma&1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
diff --git a/arch/x86/include/asm/floppy.h b/arch/x86/include/asm/floppy.h
index e76cb74bbed2..e7a244051c62 100644
--- a/arch/x86/include/asm/floppy.h
+++ b/arch/x86/include/asm/floppy.h
@@ -10,6 +10,7 @@
 #ifndef _ASM_X86_FLOPPY_H
 #define _ASM_X86_FLOPPY_H
 
+#include <linux/sizes.h>
 #include <linux/vmalloc.h>
 
 /*
@@ -22,7 +23,7 @@
  */
 #define _CROSS_64KB(a, s, vdma)						\
 	(!(vdma) &&							\
-	 ((unsigned long)(a)/K_64 != ((unsigned long)(a) + (s) - 1) / K_64))
+	 ((unsigned long)(a) / SZ_64K != ((unsigned long)(a) + (s) - 1) / SZ_64K))
 
 #define SW fd_routine[use_virtual_dma & 1]
 #define CSW fd_routine[can_use_virtual_dma & 1]
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 24be0c2c4075..d769a223fcc8 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -233,8 +233,6 @@ static unsigned short virtual_dma_port = 0x3f0;
 irqreturn_t floppy_interrupt(int irq, void *dev_id);
 static int set_dor(int fdc, char mask, char data);
 
-#define K_64	0x10000		/* 64KB */
-
 /* the following is the mask of allowed drives. By default units 2 and
  * 3 of both floppy controllers are disabled, because switching on the
  * motor of these drives causes system hangs on some PCI computers. drive
-- 
2.50.1


