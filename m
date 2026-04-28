Return-Path: <linux-mips+bounces-14384-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EADTEiza8GkLaQEAu9opvQ
	(envelope-from <linux-mips+bounces-14384-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 18:02:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B484886B7
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 18:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10AD43076EC5
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2026 15:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D2C3DA7CA;
	Tue, 28 Apr 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqR1kfeJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1143CA4A3;
	Tue, 28 Apr 2026 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777391816; cv=none; b=Wgs8sJ2FJQv37GPgAIcihKV69E2YQOEYQnkGBLMGaxuAXRtE/98GszKIXryGx+CjT1UHpVbqR2d1vK6+++izNcOJD3v2UsOtEBIkqY9G8ZEt12PFS5XNgHDzr3H1T1EOFuIQbmaYu90nVgjiA6IQ4NeaYplWGea/NXXvc4Vw+2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777391816; c=relaxed/simple;
	bh=IbUu3EsP9Li+cuVWPlIVW0Aqv6ymhM5gFfl2nsie23c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c1vSBQKSpN8Dhf29OrF37dE8eFyt7njnY0+6qslTJBoFFygBFTCBkDakmI/HZ+tGzTXEGUOf3ZjgOXvs9gHKGru+E4g8fE43v9VE6tPW4+jEHeXQ5qVHMvjhQihozSt8/WON+Wez22pJRSlhK1OSDMGU/3ZNoROCgQZzOBaNAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqR1kfeJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794C3C32782;
	Tue, 28 Apr 2026 15:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777391816;
	bh=IbUu3EsP9Li+cuVWPlIVW0Aqv6ymhM5gFfl2nsie23c=;
	h=From:To:Cc:Subject:Date:From;
	b=dqR1kfeJNpBCfQ0FYEA8s+Ze3sNIJqXCLxVgGE/vFKZLtY+wFLzKgLXdzkHI5M0r2
	 nrtJ1vqhoFbvhOvll64yQgwv83D3k84Ar2kRbL+JK8/Z0KD4FEi2S6MrT3q4E6tRTl
	 QhTw1PKPsfdLh4uR0Qg2jvFpwikHkiONf6Ard2+4RWvoxrhxXKhSRAR7h4b4gU+k8d
	 1bRPHUPzNTi1OAYboGQRmZkzyY0Ur7XjPNdufZgSWSeGsw5fg9HC4NRfXevrCDjQ8K
	 VRW4vTfh667c1Pp1UlkpB2iN7j2ZFm1MQ8P9MBG0FwnDl8rciBnft26CDYM0P4Jh5f
	 UtT5HSdXXI7SQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH] mips: select legacy gpiolib interfaces where used
Date: Tue, 28 Apr 2026 17:56:19 +0200
Message-Id: <20260428155651.3252500-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 73B484886B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14384-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arndb.de:email]

From: Arnd Bergmann <arnd@arndb.de>

A few old machines have not been converted away from the old-style
gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
symbol so the code still works where it is needed but can be left
out otherwise.

This is the list of all gpio_request() calls in mips:

  arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_cd");
  arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_cd");
  arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
  arch/mips/bcm47xx/workarounds.c:        err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
  arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_one(board.ephy_reset_gpio,
  arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");

Most of these should be easy enough to change to modern gpio descriptors
or remove if they are no longer in use.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/mips/Kconfig         | 5 +++++
 arch/mips/alchemy/Kconfig | 1 -
 arch/mips/txx9/Kconfig    | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4364f3dba688..b91e62d69a5d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -206,6 +206,8 @@ config MIPS_ALCHEMY
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
 	select DMA_NONCOHERENT		# Au1000,1500,1100 aren't, rest is
+	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
@@ -307,6 +309,7 @@ config BCM47XX
 	select SYS_HAS_EARLY_PRINTK
 	select USE_GENERIC_EARLY_PRINTK_8250
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select LEDS_GPIO_REGISTER
 	select BCM47XX_NVRAM
 	select BCM47XX_SPROM
@@ -330,6 +333,7 @@ config BCM63XX
 	select SYS_HAS_CPU_BMIPS4380
 	select SWAP_IO_SPACE
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_L1_CACHE_SHIFT_4
 	select HAVE_LEGACY_CLK
 	help
@@ -999,6 +1003,7 @@ config MIKROTIK_RB532
 	select SWAP_IO_SPACE
 	select BOOT_RAW
 	select GPIOLIB
+	select GPIOLIB_LEGACY
 	select MIPS_L1_CACHE_SHIFT_4
 	help
 	  Support the Mikrotik(tm) RouterBoard 532 series,
diff --git a/arch/mips/alchemy/Kconfig b/arch/mips/alchemy/Kconfig
index 6ca81e1bd35c..cf5ad52c0a0f 100644
--- a/arch/mips/alchemy/Kconfig
+++ b/arch/mips/alchemy/Kconfig
@@ -12,7 +12,6 @@ config MIPS_MTX1
 
 config MIPS_DB1XXX
 	bool "Alchemy DB1XXX / PB1XXX boards"
-	select GPIOLIB
 	select HAVE_PCI
 	select HAVE_PATA_PLATFORM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
diff --git a/arch/mips/txx9/Kconfig b/arch/mips/txx9/Kconfig
index 7335efa4d528..92b759a434c0 100644
--- a/arch/mips/txx9/Kconfig
+++ b/arch/mips/txx9/Kconfig
@@ -37,6 +37,7 @@ config SOC_TX4927
 	select IRQ_TXX9
 	select PCI_TX4927
 	select GPIO_TXX9
+	select GPIOLIB_LEGACY
 
 config SOC_TX4938
 	bool
-- 
2.39.5


