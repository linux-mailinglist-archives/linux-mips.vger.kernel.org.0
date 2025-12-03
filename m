Return-Path: <linux-mips+bounces-12394-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85363CA1D57
	for <lists+linux-mips@lfdr.de>; Wed, 03 Dec 2025 23:35:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0844A3024365
	for <lists+linux-mips@lfdr.de>; Wed,  3 Dec 2025 22:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5802D8774;
	Wed,  3 Dec 2025 22:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHeJo8wH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF12E9EAD;
	Wed,  3 Dec 2025 22:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764801275; cv=none; b=LUIyMhEegeqxdDRHsN5mbD3EFc7uN9Vs20KeanmA4sx5LKlSOtKkAXC9GxK7Q2RyyKklMf8ukCQWHK/k6t+ychdBdJASwWymOMsxeZ+LSqZuvXJ5yp3LyDZGhD4mUdFG4lcRX+YERsKAQSOgt5G0eGWXqSRpXPzEq9C0evI20ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764801275; c=relaxed/simple;
	bh=KJmUZ24nnbwERWZJG1Y6zF6gaML1oCL/l0B4Mz3x+9Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E5cVRs4wp2Zv79yG0aUmL+eA55y/9T0N9mB5F96wakEmmkuQS/GxU5oBNqiNsHs7TkvMjJVp7U60S/dw7qS8ZuuxIKLPI0GHwQYeXSh8i4gHX2g9WvGiLF8Lqgaqj5yovo4ud9TEWgPZgXk32whs7lkVYCBAICNgV6JboQOm1b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHeJo8wH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 539BAC4CEFB;
	Wed,  3 Dec 2025 22:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764801274;
	bh=KJmUZ24nnbwERWZJG1Y6zF6gaML1oCL/l0B4Mz3x+9Y=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=cHeJo8wHZ/n24vLkFZiEvuXEl4rzESwj5U6mwtUwgPXG8G83aPbshok65K9FoKkbV
	 08ocsea4uWV5tkOLQSOQnOG9BTyBzdK9yu2cjd1UnTVpMbVgT8BAR5qA7uL+1RJ7OX
	 rnaYoZSCGhZEg0oGtP+ZuM56r7TMZXPf3478tEkqxqg0MmKQB7zlCIIV/lAknccgM0
	 p6KntHuJFutCQzYeC9ANo9AGGMhdmAUtWKWkxcxJNgwpQWRX9zMePu1m1rC257pCPo
	 I7ptBYUr2hmTJNHK/1yksK9k0ct3rFseN+FU/zNBcCDJGUT1Vy/GRk6vChFQ611tFx
	 3EHftwt3O0oTA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEC9D15DB6;
	Wed,  3 Dec 2025 22:34:34 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 03 Dec 2025 23:34:10 +0100
Subject: [PATCH] ALSA: Do not build obsolete API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-old-alsa-v1-1-ac80704f52c3@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAOG6MGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwNj3fycFN3EnOJE3bREo2Sj5CQDY4tUQyWg8oKi1LTMCrBR0bG1tQA
 h8dfkWgAAAA==
X-Change-ID: 20251203-old-alsa-fa2c2cb038e1
To: Russell King <linux@armlinux.org.uk>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sh@vger.kernel.org, linux-sound@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8871; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=iI36/zucaZGMAuHjbpHexqSrh35fgY0PI2Hy+1NmdLI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpMLr4dZLJefPCvCqy7I+f17rkRcl5hpkhPdmWn
 TUxQ0hMVpqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTC6+AAKCRBgAj/E00kg
 cjJDEACVB5l/R30FCxRxuw1tVSQNh1XBjAM/u0mWR8xtGuOwua2EGN2BnCS2P63uuTvKDaQLHDM
 nI6uK3wK3LSfSV8llwL09HmaTKe8EHkJhIY4XXnSnt3Xf+YzEwpFtqZdouJRXshNZcOwv9YCaVB
 BkF3f87Iu6iAbtuEWJhmiD0EZfrMzLbPBxnIiCUOb+xFB3yRoHocuAtB+PqwT5GjEupogYxlWFE
 vAIlFc4xSMtxdH7wJk6K/D76PwbwXY9dHJHEasuP6KD5sFMjibjf+eP8VAqZMFcFzvsjorfTgtK
 /tldmJUfctc6nx/IyiGPrx4WT1qMpUjfWymzmtbELTsKwLuH9bnmmmxdZXiW5VUPRVXTmSwWSDf
 V2OlpxnZL7eJayWWzTyMMt2M6lNWiblwgxYXnFOnxNmr3dunhKVjEX2bpF2fR4LQYjoSdb0VHy2
 +Sfcs0xEfeGUtbL5tFU6X17UrOoT5VkmPq2R4T1zg7ucI7Om4tnGV5lhj/HUE4PEzODr9mEoDgD
 oqQKtCrAUTp+XO0o/E4+XjE0NjjNnfhwBhx9WMWAUPOYI52HcPdS+dkXgSRmdphZao3dawJK7wu
 GeqGmaGEqHl8wJvmrx7wSIu1GGPYHL3yY7CKUq9lRUUcktu0JJ4kGp/Giuj/YqxFNdKhXFerthu
 bsqXeLACDYQX51g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

ALSA 0.9.0-rc3 is from 2002, 23 years old.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Maybe I could drop also the code and Kconfig option?

David
---
 arch/arm/configs/am200epdkit_defconfig    | 1 -
 arch/arm/configs/lpc32xx_defconfig        | 1 -
 arch/arm/configs/omap1_defconfig          | 1 -
 arch/arm/configs/tegra_defconfig          | 1 -
 arch/mips/configs/gcw0_defconfig          | 1 -
 arch/mips/configs/loongson1_defconfig     | 1 -
 arch/mips/configs/qi_lb60_defconfig       | 1 -
 arch/mips/configs/rbtx49xx_defconfig      | 1 -
 arch/mips/configs/rs90_defconfig          | 1 -
 arch/powerpc/configs/85xx-hw.config       | 1 -
 arch/powerpc/configs/86xx-hw.config       | 1 -
 arch/powerpc/configs/mpc5200_defconfig    | 1 -
 arch/powerpc/configs/ppc6xx_defconfig     | 1 -
 arch/sh/configs/edosk7760_defconfig       | 1 -
 arch/sh/configs/se7724_defconfig          | 1 -
 arch/sh/configs/sh7785lcr_32bit_defconfig | 1 -
 sound/core/Kconfig                        | 2 +-
 17 files changed, 1 insertion(+), 17 deletions(-)

diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index 134a559aba3dd..2367b1685c1cf 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -68,7 +68,6 @@ CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_MIXER_OSS=m
 CONFIG_SND_PCM_OSS=m
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 CONFIG_SND_PXA2XX_AC97=m
 CONFIG_USB_GADGET=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index 2bddb0924a8c0..b9e2e603cd95e 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -113,7 +113,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 CONFIG_SND_DEBUG=y
 CONFIG_SND_DEBUG_VERBOSE=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index dee820474f444..df88763fc7c3d 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -148,7 +148,6 @@ CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_MIXER_OSS=y
 CONFIG_SND_PCM_OSS=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 CONFIG_SND_DUMMY=y
 CONFIG_SND_USB_AUDIO=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index ce70ff07c978a..68aedaf92667a 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -219,7 +219,6 @@ CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_DRIVERS is not set
 CONFIG_SND_HDA_TEGRA=y
 CONFIG_SND_HDA_INPUT_BEEP=y
diff --git a/arch/mips/configs/gcw0_defconfig b/arch/mips/configs/gcw0_defconfig
index fda9971bdd8d9..adb9fd62ddb0d 100644
--- a/arch/mips/configs/gcw0_defconfig
+++ b/arch/mips/configs/gcw0_defconfig
@@ -79,7 +79,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_PROC_FS is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_SPI is not set
diff --git a/arch/mips/configs/loongson1_defconfig b/arch/mips/configs/loongson1_defconfig
index 02d29110f7024..1d9781ff96986 100644
--- a/arch/mips/configs/loongson1_defconfig
+++ b/arch/mips/configs/loongson1_defconfig
@@ -119,7 +119,6 @@ CONFIG_WATCHDOG_SYSFS=y
 CONFIG_LOONGSON1_WDT=y
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_MIPS is not set
 # CONFIG_SND_USB is not set
diff --git a/arch/mips/configs/qi_lb60_defconfig b/arch/mips/configs/qi_lb60_defconfig
index 5f5b0254d75e7..a1bb0792f6eb1 100644
--- a/arch/mips/configs/qi_lb60_defconfig
+++ b/arch/mips/configs/qi_lb60_defconfig
@@ -81,7 +81,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_CLUT224 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_SPI is not set
diff --git a/arch/mips/configs/rbtx49xx_defconfig b/arch/mips/configs/rbtx49xx_defconfig
index 03a7bbe28a532..49c709d663beb 100644
--- a/arch/mips/configs/rbtx49xx_defconfig
+++ b/arch/mips/configs/rbtx49xx_defconfig
@@ -53,7 +53,6 @@ CONFIG_TXX9_WDT=m
 # CONFIG_VGA_ARB is not set
 CONFIG_SOUND=m
 CONFIG_SND=m
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_PCI is not set
diff --git a/arch/mips/configs/rs90_defconfig b/arch/mips/configs/rs90_defconfig
index a53dd66e9b864..8382d535e6dc1 100644
--- a/arch/mips/configs/rs90_defconfig
+++ b/arch/mips/configs/rs90_defconfig
@@ -105,7 +105,6 @@ CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_PCM_TIMER is not set
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_PROC_FS is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_MIPS is not set
diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index 8aff832173977..2b19c20a9a2c4 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -117,7 +117,6 @@ CONFIG_SND_INTEL8X0=y
 CONFIG_SND_POWERPC_SOC=y
 # CONFIG_SND_PPC is not set
 CONFIG_SND_SOC=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_USB is not set
 CONFIG_SND=y
 CONFIG_SOUND=y
diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
index e7bd265fae5a4..07f30ab881e59 100644
--- a/arch/powerpc/configs/86xx-hw.config
+++ b/arch/powerpc/configs/86xx-hw.config
@@ -80,7 +80,6 @@ CONFIG_SERIO_LIBPS2=y
 CONFIG_SND_INTEL8X0=y
 CONFIG_SND_MIXER_OSS=y
 CONFIG_SND_PCM_OSS=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 CONFIG_SND=y
 CONFIG_SOUND=y
 CONFIG_ULI526X=y
diff --git a/arch/powerpc/configs/mpc5200_defconfig b/arch/powerpc/configs/mpc5200_defconfig
index c0fe5e76604a0..617650cea56a9 100644
--- a/arch/powerpc/configs/mpc5200_defconfig
+++ b/arch/powerpc/configs/mpc5200_defconfig
@@ -75,7 +75,6 @@ CONFIG_FB_SM501=m
 CONFIG_LOGO=y
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_PCI is not set
 # CONFIG_SND_PPC is not set
diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index b082c1fae13c9..787d707f64a42 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -726,7 +726,6 @@ CONFIG_SND_OSSEMUL=y
 CONFIG_SND_MIXER_OSS=m
 CONFIG_SND_PCM_OSS=m
 CONFIG_SND_DYNAMIC_MINORS=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 CONFIG_SND_VERBOSE_PRINTK=y
 CONFIG_SND_DEBUG=y
 CONFIG_SND_DEBUG_VERBOSE=y
diff --git a/arch/sh/configs/edosk7760_defconfig b/arch/sh/configs/edosk7760_defconfig
index abeae220606a3..905fac1072845 100644
--- a/arch/sh/configs/edosk7760_defconfig
+++ b/arch/sh/configs/edosk7760_defconfig
@@ -79,7 +79,6 @@ CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_SH_MOBILE_LCDC=m
 CONFIG_SOUND=y
 CONFIG_SND=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 CONFIG_SND_VERBOSE_PRINTK=y
 CONFIG_SND_SOC=y
diff --git a/arch/sh/configs/se7724_defconfig b/arch/sh/configs/se7724_defconfig
index 9e3a54936f76f..8ca46d704c8ba 100644
--- a/arch/sh/configs/se7724_defconfig
+++ b/arch/sh/configs/se7724_defconfig
@@ -83,7 +83,6 @@ CONFIG_LOGO=y
 # CONFIG_LOGO_SUPERH_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=m
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_DRIVERS is not set
 # CONFIG_SND_SPI is not set
 # CONFIG_SND_SUPERH is not set
diff --git a/arch/sh/configs/sh7785lcr_32bit_defconfig b/arch/sh/configs/sh7785lcr_32bit_defconfig
index eb63aa61b0465..5468cc53cddb4 100644
--- a/arch/sh/configs/sh7785lcr_32bit_defconfig
+++ b/arch/sh/configs/sh7785lcr_32bit_defconfig
@@ -93,7 +93,6 @@ CONFIG_SND_PCM_OSS=y
 CONFIG_SND_SEQUENCER_OSS=y
 CONFIG_SND_HRTIMER=y
 CONFIG_SND_DYNAMIC_MINORS=y
-# CONFIG_SND_SUPPORT_OLD_API is not set
 # CONFIG_SND_VERBOSE_PROCFS is not set
 CONFIG_SND_VERBOSE_PRINTK=y
 CONFIG_SND_DEBUG=y
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index 48db44fa56feb..4e7bc370ffd7f 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -155,7 +155,7 @@ config SND_MAX_CARDS
 
 config SND_SUPPORT_OLD_API
 	bool "Support old ALSA API"
-	default y
+	default n
 	help
 	  Say Y here to support the obsolete ALSA PCM API (ver.0.9.0 rc3
 	  or older).

---
base-commit: b2c27842ba853508b0da00187a7508eb3a96c8f7
change-id: 20251203-old-alsa-fa2c2cb038e1

Best regards,
-- 
David Heidelberg <david@ixit.cz>



