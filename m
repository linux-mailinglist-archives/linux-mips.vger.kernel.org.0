Return-Path: <linux-mips+bounces-13715-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLpDOVIcuWkyrAEAu9opvQ
	(envelope-from <linux-mips+bounces-13715-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:18:10 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4451E2A66DC
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 10:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBC8D3029883
	for <lists+linux-mips@lfdr.de>; Tue, 17 Mar 2026 09:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75B235E921;
	Tue, 17 Mar 2026 09:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8Qqa056"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EE235837B;
	Tue, 17 Mar 2026 09:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738999; cv=none; b=XJK1XyPW0n+GywaIcUa1vHkfiMDXCPkdChl8egQaPoDpEoF1F9xQP77qpJsyj0S8xiVQPAk04b901QJDVWO2CdiHwOE2242DW5OlI4O32ocL6liHSvmxk6eAFUQbh1YyX0iMOdiljZDJ1FKU1zH6GwQTVJ6oKmfzghW2+ElE9ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738999; c=relaxed/simple;
	bh=BAMWxZ2OsIU1U9Jszn8uWbpr4W6JPsqvaL0hEo+gcx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KISgJ5hZ0DZkCl/TU/ShaKpYx2P/AUm4OwX8e1obgJN4TRIEaH7wZjmIt2Jw3bJn5FeMoGFIzEtMGgabH3Nqh9e83H/lxE2sHdaEcKEjXYdGPa1HOAbKVwhJud9QgRkvVbJeLqG+lf6idSxhOZGPIxl3s1Bo2O4DHk0hdF4JybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S8Qqa056; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37072C19425;
	Tue, 17 Mar 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773738998;
	bh=BAMWxZ2OsIU1U9Jszn8uWbpr4W6JPsqvaL0hEo+gcx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S8Qqa056BHTdg+bMoGtWiQ6ASRhHQKlLJgznwKUr7FsRPJ3GR3s74vwL7h4rjansQ
	 sujpBm4V9Vqy9AjV0C191Fco4Ek9okUfTfP2GXBeBMCUTT5oPSt9iLEc3stnojO/5O
	 ro+JsqEpUyJVtnHB1lDk8+Y3k/2Jhm3w3vnPzE914eHTzqzJX10c56QLzMAGFxSiwu
	 kJDt/tqdx0EDsUbjOKi7SMfi11rpfQnXADOHbASIm2ViSFPM0G2E6vYEUouviBv655
	 IO70RbmggYj/3/gm2TO88i/FQMpDmFK58UHDPzOQgXejZMD2sSdH6i+99oYMV8uOpW
	 eNarAu+VcfOKQ==
From: "Vincent Mailhol (Arm)" <mailhol@kernel.org>
Date: Tue, 17 Mar 2026 10:13:40 +0100
Subject: [PATCH 4/9] configs: remove implicit assignments to
 FB_MODE_HELPERS
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-arm_defconf_cleanup-v1-4-8eecb7fdd24d@kernel.org>
References: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
In-Reply-To: <20260317-arm_defconf_cleanup-v1-0-8eecb7fdd24d@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Mikko Rapeli <mikko.rapeli@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Pablo Neira Ayuso <pablo@netfilter.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mark Brown <broonie@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Anna Schumaker <anna.schumaker@oracle.com>
Cc: Alexandre Gonzalo <alexandre.gonzalo@arm.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-parisc@vger.kernel.org, 
 openbmc@lists.ozlabs.org, "Vincent Mailhol (Arm)" <mailhol@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6693; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=BAMWxZ2OsIU1U9Jszn8uWbpr4W6JPsqvaL0hEo+gcx8=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDJk7pft8z0x6lWu7PSfzouHxQPu4e+cCE1cFaV19Man+x
 3qJ7NrkjlIWBjEuBlkxRZZl5ZzcCh2F3mGH/lrCzGFlAhnCwMUpABP5XsTwv0jR+//Z7OOHMq94
 bV/D07Hort2Vw1Iyh4/0S1uJuEcf02Fk2P7B0c1Gf1Jz+23X9QdepnItUJ14Yu9Fn81Pfr5WYV9
 iyQQA
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13715-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,armlinux.org.uk,iki.fi,kemnade.info,baylibre.com,atomide.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,redhat.com,alien8.de,linux.intel.com,zytor.com,linutronix.de,goodmis.org,netfilter.org,samsung.com,nxp.com,pengutronix.de,mleia.com,timesys.com,arm.com,glider.be,mobileye.com,bootlin.com,HansenPartnership.com,gmx.de,gmx.net,zankel.net,suse.de,arndb.de,sntech.de,renesas.com,quicinc.com,roeck-us.net,oss.qualcomm.com,linuxfoundation.org,oracle.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[98];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailhol@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4451E2A66DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that CONFIG_FB_MODE_HELPERS is an hidden configuration, there is
no need to manually select it anymore.

Remove any references to FB_MODE_HELPERS in the defconfigs.

FYI, the suppression was done using:

  git ls-files -z 'arch/*/configs/*defconfig' |\
    xargs -0 sed -i -E '/^CONFIG_FB_MODE_HELPERS/d'

Fixes: c031bffabaf7 ("fbdev: Turn FB_MODE_HELPERS into an internal config option")
Signed-off-by: Vincent Mailhol (Arm) <mailhol@kernel.org>
---
 arch/arm/configs/am200epdkit_defconfig | 1 -
 arch/arm/configs/collie_defconfig      | 1 -
 arch/arm/configs/ep93xx_defconfig      | 1 -
 arch/arm/configs/imx_v6_v7_defconfig   | 1 -
 arch/arm/configs/lpc18xx_defconfig     | 1 -
 arch/arm/configs/lpc32xx_defconfig     | 1 -
 arch/arm/configs/mxs_defconfig         | 1 -
 arch/arm/configs/omap1_defconfig       | 1 -
 arch/arm/configs/omap2plus_defconfig   | 1 -
 arch/arm/configs/wpcm450_defconfig     | 1 -
 arch/arm64/configs/defconfig           | 1 -
 arch/mips/configs/lemote2f_defconfig   | 1 -
 arch/xtensa/configs/virt_defconfig     | 1 -
 13 files changed, 13 deletions(-)

diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index 2367b1685c1c..1051a61e2f80 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -57,7 +57,6 @@ CONFIG_SERIAL_PXA_CONSOLE=y
 CONFIG_WATCHDOG=y
 CONFIG_SA1100_WATCHDOG=m
 CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_PXA=y
 CONFIG_FB_PXA_PARAMETERS=y
diff --git a/arch/arm/configs/collie_defconfig b/arch/arm/configs/collie_defconfig
index 578c6a4af620..56c4b8d537f8 100644
--- a/arch/arm/configs/collie_defconfig
+++ b/arch/arm/configs/collie_defconfig
@@ -61,7 +61,6 @@ CONFIG_MCP_UCB1200_TS=y
 CONFIG_FB=y
 CONFIG_FB_SA1100=y
 # CONFIG_VGA_CONSOLE is not set
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_NEW_LEDS=y
diff --git a/arch/arm/configs/ep93xx_defconfig b/arch/arm/configs/ep93xx_defconfig
index 9f3c7324d1cf..4fc0b14a6a4f 100644
--- a/arch/arm/configs/ep93xx_defconfig
+++ b/arch/arm/configs/ep93xx_defconfig
@@ -79,7 +79,6 @@ CONFIG_WATCHDOG=y
 CONFIG_EP93XX_WATCHDOG=y
 CONFIG_FB=y
 CONFIG_FB_EP93XX=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_LOGO=y
 CONFIG_USB=y
 CONFIG_USB_DYNAMIC_MINORS=y
diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index fadca597a944..3e227c5b7487 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -295,7 +295,6 @@ CONFIG_DRM_IMX_HDMI=y
 CONFIG_DRM_ETNAVIV=y
 CONFIG_DRM_MXSFB=y
 CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_L4F00242T03=y
 CONFIG_LCD_PLATFORM=y
diff --git a/arch/arm/configs/lpc18xx_defconfig b/arch/arm/configs/lpc18xx_defconfig
index f142a6637ede..98a0b0c3736d 100644
--- a/arch/arm/configs/lpc18xx_defconfig
+++ b/arch/arm/configs/lpc18xx_defconfig
@@ -109,7 +109,6 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_DRM=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
diff --git a/arch/arm/configs/lpc32xx_defconfig b/arch/arm/configs/lpc32xx_defconfig
index c0d4bc141a12..4c81b5fefd2c 100644
--- a/arch/arm/configs/lpc32xx_defconfig
+++ b/arch/arm/configs/lpc32xx_defconfig
@@ -105,7 +105,6 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PL111=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 603fb003b223..1717e364e21c 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -90,7 +90,6 @@ CONFIG_DRM=y
 CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
 CONFIG_DRM_MXSFB=y
 CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
index df88763fc7c3..fc2150b347b6 100644
--- a/arch/arm/configs/omap1_defconfig
+++ b/arch/arm/configs/omap1_defconfig
@@ -137,7 +137,6 @@ CONFIG_FB_OMAP_LCDC_HWA742=y
 CONFIG_FB_OMAP_MANUAL_UPDATE=y
 CONFIG_FB_OMAP_LCD_MIPID=y
 CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 0464f6552169..810c0cace407 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -506,7 +506,6 @@ CONFIG_DRM_TI_TFP410=m
 CONFIG_DRM_TI_TPD12S015=m
 CONFIG_FB=y
 CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=y
diff --git a/arch/arm/configs/wpcm450_defconfig b/arch/arm/configs/wpcm450_defconfig
index cd4b3e70ff68..d28aea17480d 100644
--- a/arch/arm/configs/wpcm450_defconfig
+++ b/arch/arm/configs/wpcm450_defconfig
@@ -133,7 +133,6 @@ CONFIG_MFD_SYSCON=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_FB=y
-CONFIG_FB_MODE_HELPERS=y
 # CONFIG_HID is not set
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f6ce04c0b4b..baff2cd34721 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1037,7 +1037,6 @@ CONFIG_DRM_ZYNQMP_DPSUB_AUDIO=y
 CONFIG_DRM_POWERVR=m
 CONFIG_FB=y
 CONFIG_FB_EFI=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m
diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index 8d3f20ed19b5..9ea6ffa83c7f 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -137,7 +137,6 @@ CONFIG_FB_SIS_315=y
 CONFIG_FB_SIMPLE=y
 CONFIG_FB_SM712=y
 CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
index 982dd67ed174..b86135b0ea84 100644
--- a/arch/xtensa/configs/virt_defconfig
+++ b/arch/xtensa/configs/virt_defconfig
@@ -68,7 +68,6 @@ CONFIG_HW_RANDOM_VIRTIO=y
 CONFIG_DRM=y
 CONFIG_DRM_VGEM=y
 CONFIG_DRM_VIRTIO_GPU=y
-CONFIG_FB_MODE_HELPERS=y
 # CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y

-- 
2.43.0


