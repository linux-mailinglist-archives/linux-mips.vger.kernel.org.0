Return-Path: <linux-mips+bounces-432-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC064800988
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 12:15:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDCAA1C20DFF
	for <lists+linux-mips@lfdr.de>; Fri,  1 Dec 2023 11:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBFC32135C;
	Fri,  1 Dec 2023 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e3EE+BeX"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1651711;
	Fri,  1 Dec 2023 03:15:30 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6377240015;
	Fri,  1 Dec 2023 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701429329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTU5KtilBzqMs1820zYNtcs9nCUHlD6780U14+z9iDM=;
	b=e3EE+BeXN7YU2s5ZiS1QbKy3b/cv+jq88mqpTzw1+1c33YVjO9VsCFUT67FjaeZ0PyZ8WM
	jCR8mRSum5fTvpcdjB0Fslp6nVh5aVaSOhKAVXuOantXrgeQpLoytVtkDQPvBsRtM1R7Qd
	78zG1RoQS4C7+r32zQbg7NsrleUDo5MBt9ZIeQz09Y+p8TllPgCQGYPsHlyI2L1I3Ur1wo
	fEx9v2DPWlmVuP4YuJzBzqGoy3vlN0eN7K963urg0Wl+iPoQ4OwgJXG0FuMQ9vyFQJNh1Z
	4+fARJeM1DAXhufOFWqpkG1HXQ4Vyb8URGWJ12glAG34qohe1sj3JJfjXWJ8yQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Paul Burton <paulburton@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir  Kondratiev <vladimir.kondratiev@mobileye.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 08/22] MIPS: Allow kernel base to be set from Kconfig for all platforms
Date: Fri,  1 Dec 2023 12:14:51 +0100
Message-ID: <20231201111512.803120-9-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231201111512.803120-1-gregory.clement@bootlin.com>
References: <20231201111512.803120-1-gregory.clement@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gregory.clement@bootlin.com

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

There are some platforms in wild that generic loading address won't
work with them due to memory layout.

Allow PHYSICAL_START to be override from Kconfig, introduce
PHYSICAL_START_BOOL symbol as powerpc did.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fad05f699efdf..11bacbd3971f6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2866,12 +2866,22 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config PHYSICAL_START_BOOL
+	bool "Set physical address where the kernel is loaded"
+	default y if CRASH_DUMP
+	help
+	  This gives the CKSEG0, KSEG0 or XKPHYS address where the kernel
+	  is loaded.
+
+	  Say N here unless you know what you are doing.
+
 config PHYSICAL_START
-	hex "Physical address where the kernel is loaded"
-	default "0xffffffff84000000"
-	depends on CRASH_DUMP
+	hex "Physical address where the kernel is loaded" if PHYSICAL_START_BOOL
+	default "0xffffffff84000000" if CRASH_DUMP
+	default "0xffffffff80100000"
 	help
-	  This gives the CKSEG0 or KSEG0 address where the kernel is loaded.
+	  This gives the CKSEG0, KSEG0 or XKPHYS address where the kernel
+	  is loaded.
 	  If you plan to use kernel for capturing the crash dump change
 	  this value to start of the reserved region (the "X" value as
 	  specified in the "crashkernel=YM@XM" command line boot parameter
-- 
2.42.0


