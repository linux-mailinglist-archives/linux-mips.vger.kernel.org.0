Return-Path: <linux-mips+bounces-11898-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0BEC0F3B6
	for <lists+linux-mips@lfdr.de>; Mon, 27 Oct 2025 17:22:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28A5D501D3A
	for <lists+linux-mips@lfdr.de>; Mon, 27 Oct 2025 16:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CB0311C2E;
	Mon, 27 Oct 2025 16:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GnE7CbsZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239CF31197B
	for <linux-mips@vger.kernel.org>; Mon, 27 Oct 2025 16:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581746; cv=none; b=iSxu2jy6q9MgtnpzrUIBj2pP/nHuKelnUs4kVYJjrYWsGnuncz2K+RCRxjVyfWMPeE+eVrUrpI0KC/HEoGQB4Nfwlk+BDunqZzXlstktEzoWMD3j/jcemYWlDim206c7ckdM+ar46Q5K7btunaO57bOENDPYE9AycGsjHwWhEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581746; c=relaxed/simple;
	bh=c3/+0slUM57/EcYztzT+r5Zikk/wyIOfFEzOQ3Lm16A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Hp3xFoDLE+ZfqWIJr9hxycbPvJsTFNqUhXHTTztlbVei0WegthS8zqtX5IcKViovhUl5cjWhpjjhA0PblbQoKswCdDlFgnQs519Zq27hri956x0gnFcdZ4cm5F5NV+NhypkR8jUef/mW2yGDYFPS3nxTXluL/ykJEeldVXMzVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GnE7CbsZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3882D4E41373;
	Mon, 27 Oct 2025 16:15:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ED0346062C;
	Mon, 27 Oct 2025 16:15:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A02E3102F00CC;
	Mon, 27 Oct 2025 17:15:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761581740; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qurVgCoEOWNMfKzqoeELfrnEOh/ndNaXvS6N4y9te4o=;
	b=GnE7CbsZefVVGYT/5MKI6YZv8JLN2VycykrHk7MXBPpEmkJlDKrbMU6dE07FFSgqR8d5Qu
	vDP2MLNvT2bbbbSHWTMFWkN51cRHr9fqwAYjrDiEY/s/UVNN1xQOYbrI9ad5IWz8k2sfwj
	whqWms733o669/GsVWYT7ohSIivWXyvV1XK+Y1XjylzpOMb/80bCV+VEAbJCG7HZqrlFNi
	+MjKoFKDy+EXt8YzUqoIhMuODyyGEB6kaoiHUl19lCAPY6k4ICpFvP/u6ocJ72LS9Tjtq2
	mzh5RnAi/+ur2FbVpgT+wAJVbehsFq1mUgHIvK9O/KyrPiEcRgCNHiZkKWquNQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 27 Oct 2025 17:15:35 +0100
Subject: [PATCH] MIPS: Fix HOTPLUG_PARALLEL dependency
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251027-mips_paralell_hotplug-v1-1-82567f3e4b85@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAKaa/2gC/x3M0QpAMBSA4VfRubayU4hXkXRwNqeGtSEl7265/
 C7+/4HIQThCmz0Q+JIo+5ag8wymhTbLSuZkwAJLXWCtVvFx8BTIsXPDsh/enVZxQ4yjNqSxgtT
 6wEbu/9v17/sBLoAc6GcAAAA=
X-Change-ID: 20251027-mips_paralell_hotplug-e9ae2b1fa126
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

With MIPS, it is possible to have SMP enabled without HOTPLUG_CPU
selected. However, in kernel/cpu.c, some code that uses
HOTPLUG_PARALLEL also requires HOTPLUG_CPU to be selected. Therefore,
we should fix the HOTPLUG_PARALLEL dependency to depend on
HOTPLUG_CPU, not just SMP.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510270120.21wA1aX1-lkp@intel.com/
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e8683f58fd3e2..b88b97139fa8e 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -658,7 +658,7 @@ config EYEQ
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
-	select HOTPLUG_PARALLEL if SMP
+	select HOTPLUG_PARALLEL if HOTPLUG_CPU
 	help
 	  Select this to build a kernel supporting EyeQ SoC from Mobileye.
 

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251027-mips_paralell_hotplug-e9ae2b1fa126

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


