Return-Path: <linux-mips+bounces-9620-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CFEAF92AE
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 14:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2518F54167D
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 12:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262EA2D8DAA;
	Fri,  4 Jul 2025 12:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="er0UaSJp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77762D7818;
	Fri,  4 Jul 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632490; cv=none; b=auY63JEWmZS5p0QSzX+L6gfI5EhlbGHrWisk7hBYhtA5vrcbvQ5wohC2KMivRfKO/y6jAeqNipOBuOOGk3lLJrB/kKmdv7/yUhJuBtM0UDQsf/qcdvheZB9oy8DJDzVPNJ4ZSQkAOv7BnC5gUM7gpKj5FLh8/0mEVl17fZMJ+qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632490; c=relaxed/simple;
	bh=+/nL9WmbLWewyqBhT49AiMPguMFXX2BVskKUVavimBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LnCh+BJzTk9Uu22zG9UAJAM5dZvNvT8YNZP85W2eBNLbscw6Na6VRFM7nCFfjXL3cnIetrE2zbjjWFR86T8Jd/tAPwbnl7Y23QS1RugfJrvl8s82LZpa5hox96rJucG/pRYPxz3JNYnaEi307dq/xeLDh/XzmNDoorzXiF6Dnl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=er0UaSJp; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id ECB375822B2;
	Fri,  4 Jul 2025 11:47:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 403761FD33;
	Fri,  4 Jul 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751629630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9cZDSchlpErWn6MyTesyhey4sE8/OzDC2hlTo20/GI=;
	b=er0UaSJpXAAC/d2yedOocvQD7J96277fOoK2Ok+K580zlQIEg8tQmPDcStJgPE6rGJPTRc
	L8xsHJBHPjgT8jy60k5g+vpXMVWZHgkt8LaOpXo/TA1x1EtpETr+uAjJHRcd0Jb9hlxTYi
	/Dvl5T2vv5n2bmOKFzA1x5+BxZarKCFnTykowhkkjRS+HRiFU52DjunifyMUKfrd5e+8Pp
	SlTCi3G/O8MNPAuNvmZfaxES+rIjFxVF1GSvHEbWbTSW9c8rMxhOJe3tlgp67SiwDg9+Ek
	AjqiXeRtDp+FTEJUDN6KJe6aMBWyxJKtWvsyCtzb0KdmoAFKO7aj4AWSgP7acg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 04 Jul 2025 13:47:06 +0200
Subject: [PATCH 1/6] MIPS: eyeq5_defconfig: Update for v6.16-rc1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-of-commits-v1-1-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
In-Reply-To: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudeingdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtt
 hhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthgrfihfihhkrdgsrgihohhukhesmhhosghilhgvhigvrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: theo.lebrun@bootlin.com

 - Sort by moving CONFIG_PAGE_SIZE_16KB=y.

 - Drop CONFIG_MACH_EYEQ5=y because it is the default:

      # arch/mips/mobileye/Kconfig
      choice
         prompt "Mobileye EyeQ SoC selection"
         default MACH_EYEQ5

 - Drop CONFIG_SPARSEMEM_MANUAL=y because:

      # mm/Kconfig
      choice
         prompt "Memory model"
         depends on SELECT_MEMORY_MODEL
         default SPARSEMEM_MANUAL if ARCH_SPARSEMEM_DEFAULT
         default FLATMEM_MANUAL

      # arch/mips/Kconfig
      config EYEQ
         select ARCH_SPARSEMEM_DEFAULT if 64BIT

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/configs/eyeq5_defconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index ff7af5dc6d9d353cd84a5532c6f1de43c6983dfd..e2d6ad7c3006b037ae370a68c09e7aacab61d083 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -19,20 +19,18 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_EYEQ=y
-CONFIG_MACH_EYEQ5=y
 CONFIG_FIT_IMAGE_FDT_EPM5=y
-CONFIG_PAGE_SIZE_16KB=y
 CONFIG_MIPS_CPS=y
 CONFIG_CPU_HAS_MSA=y
 CONFIG_NR_CPUS=16
 CONFIG_MIPS_RAW_APPENDED_DTB=y
 CONFIG_JUMP_LABEL=y
+CONFIG_PAGE_SIZE_16KB=y
 CONFIG_COMPAT_32BIT_TIME=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_TRIM_UNUSED_KSYMS=y
 # CONFIG_COMPAT_BRK is not set
-CONFIG_SPARSEMEM_MANUAL=y
 CONFIG_USERFAULTFD=y
 CONFIG_NET=y
 CONFIG_PACKET=y

-- 
2.50.0


