Return-Path: <linux-mips+bounces-9865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05926B0C928
	for <lists+linux-mips@lfdr.de>; Mon, 21 Jul 2025 18:58:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29A79545BA0
	for <lists+linux-mips@lfdr.de>; Mon, 21 Jul 2025 16:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F032918C8;
	Mon, 21 Jul 2025 16:57:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA461D540
	for <linux-mips@vger.kernel.org>; Mon, 21 Jul 2025 16:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117078; cv=none; b=HMbdTzfqjuPeyzWNXf0NrI9OaEC9W9SG34UAFYlQnQIYbahlCfQoG+adc9yXxzpAfXXgg5bxsehuzmy9Nigp2m7YgNsbir5oEEzyw8i/3VhwpWM+JnjDLDpuvaxz9bfhRxDEjEeSV7fiyC9rZyOnsCnF4t0HUZMhtde5TvJeMnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117078; c=relaxed/simple;
	bh=k+1wCmJZwoTZemfIdGikHAoh0FlWCpXxI43xBF3R5K8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uE+gU9Y+prlMHJ8qCyJkLWgQTwzr5O0/6IChs5X6b+ws6Me73a/UATAjOXkkKe0QKCfMaZQKqUdFQnd6VdicJuEwlbwOsS3CymE4x+Gc3pg9n4+0hpBG2yN/pUbVAO1nkJjlVg2rwWTTkYORIZBrJ2KnQwA4RXJjTlbMMNhOZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from caradhras.arda (pool-96-241-31-235.washdc.fios.verizon.net [96.241.31.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kumba)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 35B8F340D23;
	Mon, 21 Jul 2025 16:57:53 +0000 (UTC)
From: Joshua Kinard <kumba@gentoo.org>
To: linux-mips@vger.kernel.org
Cc: Joshua Kinard <linux@kumba.dev>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH] MIPS: Update Joshua Kinard's e-mail address
Date: Mon, 21 Jul 2025 12:57:15 -0400
Message-ID: <20250721165715.20478-1-kumba@gentoo.org>
X-Mailer: git-send-email 2.50.0
Reply-To: Joshua Kinard <linux@kumba.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I am switching my address to a personal domain, so some files in the
SGI IP30 and IOC3 files need to be updated.  I will send updates for
the MAINTAINERS file and rtc-ds1685 separately to linux-rtc.

Signed-off-by: Joshua Kinard <kumba@gentoo.org>
---
 arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h | 2 +-
 arch/mips/include/asm/mach-ip30/spaces.h                | 2 +-
 arch/mips/include/asm/sgi/heart.h                       | 2 +-
 arch/mips/sgi-ip30/ip30-power.c                         | 2 +-
 arch/mips/sgi-ip30/ip30-setup.c                         | 2 +-
 arch/mips/sgi-ip30/ip30-smp.c                           | 2 +-
 arch/mips/sgi-ip30/ip30-timer.c                         | 2 +-
 arch/mips/sgi-ip30/ip30-xtalk.c                         | 2 +-
 drivers/mfd/ioc3.c                                      | 2 +-
 drivers/tty/serial/8250/8250_ioc3.c                     | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h b/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
index ce4e4c6e09e2..50d487a4c95e 100644
--- a/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h
@@ -5,7 +5,7 @@
  * Copyright (C) 2003 Ralf Baechle <ralf@linux-mips.org>
  *		 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
  *		 2009 Johannes Dickgreber <tanzy@gmx.de>
- *		 2015 Joshua Kinard <kumba@gentoo.org>
+ *		 2015 Joshua Kinard <linux@kumba.dev>
  *
  */
 #ifndef __ASM_MACH_IP30_CPU_FEATURE_OVERRIDES_H
diff --git a/arch/mips/include/asm/mach-ip30/spaces.h b/arch/mips/include/asm/mach-ip30/spaces.h
index c8a302dfbe05..d381b93d6ad3 100644
--- a/arch/mips/include/asm/mach-ip30/spaces.h
+++ b/arch/mips/include/asm/mach-ip30/spaces.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (C) 2016 Joshua Kinard <kumba@gentoo.org>
+ * Copyright (C) 2016 Joshua Kinard <linux@kumba.dev>
  *
  */
 #ifndef _ASM_MACH_IP30_SPACES_H
diff --git a/arch/mips/include/asm/sgi/heart.h b/arch/mips/include/asm/sgi/heart.h
index 0d03751955c4..c224c2e3575a 100644
--- a/arch/mips/include/asm/sgi/heart.h
+++ b/arch/mips/include/asm/sgi/heart.h
@@ -4,7 +4,7 @@
  *
  * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
  *		 2009 Johannes Dickgreber <tanzy@gmx.de>
- *		 2007-2015 Joshua Kinard <kumba@gentoo.org>
+ *		 2007-2015 Joshua Kinard <linux@kumba.dev>
  */
 #ifndef __ASM_SGI_HEART_H
 #define __ASM_SGI_HEART_H
diff --git a/arch/mips/sgi-ip30/ip30-power.c b/arch/mips/sgi-ip30/ip30-power.c
index 120b3f3d5108..66851e17c5a7 100644
--- a/arch/mips/sgi-ip30/ip30-power.c
+++ b/arch/mips/sgi-ip30/ip30-power.c
@@ -3,7 +3,7 @@
  * ip30-power.c: Software powerdown and reset handling for IP30 architecture.
  *
  * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
- *               2014 Joshua Kinard <kumba@gentoo.org>
+ *               2014 Joshua Kinard <linux@kumba.dev>
  *               2009 Johannes Dickgreber <tanzy@gmx.de>
  */
 
diff --git a/arch/mips/sgi-ip30/ip30-setup.c b/arch/mips/sgi-ip30/ip30-setup.c
index e8547636a748..3fcb3ec9f802 100644
--- a/arch/mips/sgi-ip30/ip30-setup.c
+++ b/arch/mips/sgi-ip30/ip30-setup.c
@@ -3,7 +3,7 @@
  * SGI IP30 miscellaneous setup bits.
  *
  * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
- *               2007 Joshua Kinard <kumba@gentoo.org>
+ *               2007 Joshua Kinard <linux@kumba.dev>
  *               2009 Johannes Dickgreber <tanzy@gmx.de>
  */
 
diff --git a/arch/mips/sgi-ip30/ip30-smp.c b/arch/mips/sgi-ip30/ip30-smp.c
index 4bfe654602b1..1e8210f2a9f8 100644
--- a/arch/mips/sgi-ip30/ip30-smp.c
+++ b/arch/mips/sgi-ip30/ip30-smp.c
@@ -5,7 +5,7 @@
  * and smp-bmips.c.
  *
  * Copyright (C) 2005-2007 Stanislaw Skowronek <skylark@unaligned.org>
- *               2006-2007, 2014-2015 Joshua Kinard <kumba@gentoo.org>
+ *               2006-2007, 2014-2015 Joshua Kinard <linux@kumba.dev>
  *               2009 Johannes Dickgreber <tanzy@gmx.de>
  */
 
diff --git a/arch/mips/sgi-ip30/ip30-timer.c b/arch/mips/sgi-ip30/ip30-timer.c
index d13e105478ae..7652f72f0daf 100644
--- a/arch/mips/sgi-ip30/ip30-timer.c
+++ b/arch/mips/sgi-ip30/ip30-timer.c
@@ -5,7 +5,7 @@
  *
  * Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
  * Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
- * Copyright (C) 2011 Joshua Kinard <kumba@gentoo.org>
+ * Copyright (C) 2011 Joshua Kinard <linux@kumba.dev>
  */
 
 #include <linux/clocksource.h>
diff --git a/arch/mips/sgi-ip30/ip30-xtalk.c b/arch/mips/sgi-ip30/ip30-xtalk.c
index 7ceb2b23ea1c..d798ee8c998c 100644
--- a/arch/mips/sgi-ip30/ip30-xtalk.c
+++ b/arch/mips/sgi-ip30/ip30-xtalk.c
@@ -3,7 +3,7 @@
  * ip30-xtalk.c - Very basic Crosstalk (XIO) detection support.
  *   Copyright (C) 2004-2007 Stanislaw Skowronek <skylark@unaligned.org>
  *   Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
- *   Copyright (C) 2007, 2014-2016 Joshua Kinard <kumba@gentoo.org>
+ *   Copyright (C) 2007, 2014-2016 Joshua Kinard <linux@kumba.dev>
  */
 
 #include <linux/init.h>
diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
index 58656837b7c6..5f8ac364b610 100644
--- a/drivers/mfd/ioc3.c
+++ b/drivers/mfd/ioc3.c
@@ -6,7 +6,7 @@
  *
  * Based on work by:
  *   Stanislaw Skowronek <skylark@unaligned.org>
- *   Joshua Kinard <kumba@gentoo.org>
+ *   Joshua Kinard <linux@kumba.dev>
  *   Brent Casavant <bcasavan@sgi.com> - IOC4 master driver
  *   Pat Gefre <pfg@sgi.com> - IOC3 serial port IRQ demuxer
  */
diff --git a/drivers/tty/serial/8250/8250_ioc3.c b/drivers/tty/serial/8250/8250_ioc3.c
index 499e80aa4cf9..eea543f97a84 100644
--- a/drivers/tty/serial/8250/8250_ioc3.c
+++ b/drivers/tty/serial/8250/8250_ioc3.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2019 Thomas Bogendoerfer <tbogendoerfer@suse.de>
  *
  * based on code Copyright (C) 2005 Stanislaw Skowronek <skylark@unaligned.org>
- *               Copyright (C) 2014 Joshua Kinard <kumba@gentoo.org>
+ *               Copyright (C) 2014 Joshua Kinard <linux@kumba.dev>
  */
 
 #include <linux/module.h>
-- 
2.50.0


