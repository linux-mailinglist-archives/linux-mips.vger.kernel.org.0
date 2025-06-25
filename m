Return-Path: <linux-mips+bounces-9498-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C7AE84BB
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 15:31:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E11218849BF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 13:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C1B263F27;
	Wed, 25 Jun 2025 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="p1NGoeSn"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0858925EF9F;
	Wed, 25 Jun 2025 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858039; cv=none; b=VuSFUjELSFk9PKQ675yGcW7NeGLHTY4qybC4KQDqsrHKo4olY+WYog2LluhvY3TQGAdNCt4gJLkLwR1rWjUJ8gW6GoZrGzrn8hfKDiJJyH9BYXck3Atg8RP2Y5ATb00m2hCseLUasvntIIUxdZq/VHXXHWjdgDdtT3BISxUzuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858039; c=relaxed/simple;
	bh=7lc6PL/esVmnAjKv42ZkpEX3uq/hzV7pjfyrio9p1xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QmBUOCCnGeq3j7G7S+5jp+fOn+aSmyi29AcJ97hxqs+FvgLpILIjdbd6x52OqSz88gRNfnBsxf8C3EohLfaWH0mEWFdzc+uc8AIQfoC4JWKj5ribgC0da9lg3W1+jSJr0dnL0lEYuPQ1HBJHkVle3fBHEdXcqtNM6FUfoNZImhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=p1NGoeSn; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6DD47439E9;
	Wed, 25 Jun 2025 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750858027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ouPAPbx09eWxp7PUk92hOFewj65V3U8yVItAwraE/Fg=;
	b=p1NGoeSnvfoAYcZ0MgCeo+TOWfCjmrESkgv3TNO63lDkJJl0cBsD9Yo+pV4pBtqw/Sn7ri
	X5/PvpQFIKXqoQWGdblsSZq2oDmQFmdKYSjYXJNCQb0n/0rzurNAft6o1T2IT6vylKwdZc
	RxNPm4fb6KFAzhwSkpBuF/D1kY+tSbBzgKJi4psyBEek1Gm3BGOO4eO4PhKp1F/+Cmhzlj
	nerWLJj1jU0b04e7afTMtvYzPMrfQuItE6NYPGlzja9Q7XEp+3ZvytCWkGdhTxXQw4BLab
	80Rjb9BbkLF8oKbUm06rs2sLaK7tMKyrJSJG1cesK1vnVGYbdJX5NckxlndXHA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Wed, 25 Jun 2025 15:27:02 +0200
Subject: [PATCH] MIPS: disable MMID if GINVT is not usable
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250625-mmid_disable_no_ginv_on_noc-v1-1-38a3902607a7@bootlin.com>
X-B4-Tracking: v=1; b=H4sIACX5W2gC/x3MTQqAIBBA4avErBNK0n6uEiGWUw3UGAoSRHdP2
 r1v8x6IGAgjDMUDARNF8pxRlwUsu+UNBblskJVUlZZKnCc54yja+UDD3mzEyXjOuQjd6BZl3yn
 rOsiHK+BK938fp/f9ACpvVYxtAAAA
X-Change-ID: 20250625-mmid_disable_no_ginv_on_noc-6467e2985ad8
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkffvvefosehtkeertdertdejnecuhfhrohhmpefirhgvghhorhihucevnffgoffgpffvuceoghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdehheejveelgefgleffgfejudfgudeludeutdfhleeiudevffegueelkeffudfhnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemkedvvdgtmehfiehfmedvlegsvgemvgduuddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeekvddvtgemfheifhemvdelsggvmegvudduuddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhssghoghgvn
 hgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhlrgguihhmihhrrdhkohhnughrrghtihgvvhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: gregory.clement@bootlin.com

If System-level Interconnect (aka Network on Chip) does not support
the global invalidation, then MMID feature is not usable. Indeed the
current implementation of MMID relies on the GINV* instruction.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/Kconfig                    | 6 ++++++
 arch/mips/include/asm/cpu-features.h | 5 ++++-
 arch/mips/mobileye/Kconfig           | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1e48184ecf1ec8e29c0a25de6452ece5da835e30..05ce008459b89f03fa71d94429607feb9d06526f 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2575,6 +2575,12 @@ config WAR_R10000_LLSC
 config WAR_MIPS34K_MISSED_ITLB
 	bool
 
+# Some I6500 based SoC do not support the global invalidation on their
+# System-level Interconnect (aka Network on Chip), this have an
+# influence on the MMID support.
+config GINVT_UNSUPPORTED_NOC
+	bool
+
 #
 # - Highmem only makes sense for the 32-bit kernel.
 # - The current highmem code will only work properly on physically indexed
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index 404390bb87eaf5b3391b3d38be7cd3e43849dde2..03cf5f8e8371afe553a40739fd64909d68427764 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -642,9 +642,12 @@
  * We only enable MMID support for configurations which natively support 64 bit
  * atomics because getting good performance from the allocator relies upon
  * efficient atomic64_*() functions.
+ * If System-level Interconnect (aka Network on Chip) does not support
+ * the global invalidation, then we also disable MMID support which
+ * needs to use GINV*
  */
 #ifndef cpu_has_mmid
-# ifdef CONFIG_GENERIC_ATOMIC64
+# if defined(CONFIG_GENERIC_ATOMIC64) || defined(CONFIG_GINVT_UNSUPPORTED_NOC)
 #  define cpu_has_mmid		0
 # else
 #  define cpu_has_mmid		__isa_ge_and_opt(6, MIPS_CPU_MMID)
diff --git a/arch/mips/mobileye/Kconfig b/arch/mips/mobileye/Kconfig
index f9abb2d6e1787dbc5a173db48606ed5a02088e41..06ae5327ff657e0c86e2eb9c7fbd760be8ae0d99 100644
--- a/arch/mips/mobileye/Kconfig
+++ b/arch/mips/mobileye/Kconfig
@@ -12,6 +12,8 @@ choice
 
 	config MACH_EYEQ6H
 		bool "Mobileye EyeQ6H SoC"
+		select GINVT_UNSUPPORTED_NOC
+
 endchoice
 
 config FIT_IMAGE_FDT_EPM5

---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-mmid_disable_no_ginv_on_noc-6467e2985ad8

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


