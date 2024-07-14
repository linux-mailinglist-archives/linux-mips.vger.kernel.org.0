Return-Path: <linux-mips+bounces-4313-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D43F930850
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 04:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6ED9BB20512
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2024 02:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1C079E5;
	Sun, 14 Jul 2024 02:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ZeZfERHz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nKKC3hVm"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F711CB8;
	Sun, 14 Jul 2024 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720923682; cv=none; b=TdDN6Od4SAZBZ8QdThQ3GF+7hZS7dHdTsTQmFGEpArTgWw4S++r0gKXHsKTMrrlEZhS6WnuGfvyDYgCH7VC8J1mhmNYRkj72TWBqgvxjTEXd9hkJW3afpuLT0QwacBj/bFotCTqFe6gZtZ13VjFLrQcgJhLugdH/gvblqfg61Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720923682; c=relaxed/simple;
	bh=KlG0Vj2AFM95CNMxky8X5ftkACwun3YwOt82GeoC2rY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ntfsl8m1Ayss2yUEEG24tCNBCvqJaeCOjR0vjFarWGkyJiRGd+mD1h4fmHedfqHooVfzxisv2iRGmVC45hdRXRoxrcoCxy8h5MyzoW3Bsk07DrunrsAXNwGE/sCvaAp123FiRv3ETMbsaxUZJHB6MbXTU+IUbr9Nv/tkkW0ay3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ZeZfERHz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nKKC3hVm; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id D8E2A1381118;
	Sat, 13 Jul 2024 22:21:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 13 Jul 2024 22:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720923679;
	 x=1721010079; bh=X5NZ+Z32WoLdkpp294XqkIltG9BK9UJKdewzPzHLrnE=; b=
	ZeZfERHzbxPp8vOMBMBUAVaaMYfyGZVu71vQ4ZtKHN+ea0XphXNpu8ziohEWQ1ej
	z3u4rpuX/UWL32Yas7C963bqZOpjovJjTuht/v+dXHL982G18ndnvWJYlISDUQC3
	m4szLXCC7qf9wI7Al20ZuZT5D5C/IdycY0s8qG3nJBx8MM4d9A0NsKu1JugKNtUM
	Ru8BCF2ecPu0LiJIcICSusloCtf3IG+CBZvKAZLarqmwJDOJt4TiE8ooNDgMAfuX
	uJnYx5pSSB3L7prm56HyXbivkrtMJL0G42+s0kGJ009vxNNJXrbJ4BFqppv6SL6a
	BwTUyTnJPk7lyGDpcnz0QA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720923679; x=
	1721010079; bh=X5NZ+Z32WoLdkpp294XqkIltG9BK9UJKdewzPzHLrnE=; b=n
	KKC3hVmuqfMX0TjG4+GHcnySA2zp/oRc6qietkp/08XKlnXA4iULOXcXlBefj9V9
	9XXgjMGFnplPVqfmRILAyxVL7uvPi5zyomJuILLMb+yIMxoMG9Cztsoz0wfX9fet
	TSZwXOTKUoW5H6KdN4LYk/XPYk5demgDGdNhTpYetkuEEWVkBOsYSm+2czOY/0gE
	gUXR1LHvCggKdsFIsPQW/XBpidWboZF99bZD0OQbDbRtxpV2LMPdxFFb1oT4g4OG
	qB8quglpJq3/N7Rq3z1ZNIApGXR+FosSe+AixhyQ/0KY1VeCUOUBx7FC0fyBsfdS
	PWakqozjf3zXwUSulljLw==
X-ME-Sender: <xms:HjaTZlsE5q4f6ysrr9J59ZP3I8p4p2xbdXEwiXzW-_g5UumbqMGBcQ>
    <xme:HjaTZue4s1XeEW7-v4kuyWvtb1cVzL_lLgj_oUuw6wqTlMjTSWNiGa45V7ZNEBbPe
    lgk6mXmdOyMmnHqnCU>
X-ME-Received: <xmr:HjaTZoyc-bM-8RxjgPj0msXRslzjI-PfZFJAduNjirMKXP1rZxTHNX3ZY3BtJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfeelgdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:HjaTZsPb4OFWjraeA6vaZQYtM99g19WTowTlVXsJwDo-X3astIWytw>
    <xmx:HjaTZl-INiC2CqwRTZ4a18EUL0tjBqbaHcXV56xF_Aj7wjInflkGYA>
    <xmx:HjaTZsUGOFAcizr0XPVZR5KS3uIllM_66J8gCwDSDK_IiNq2nQcPKg>
    <xmx:HjaTZmdxKQTjCU5kbATIgXD3ORS29sFZ-x3HZWQDlOfn9aEZqeM_gg>
    <xmx:HzaTZhYmm_j8kpH0EtUZ6-xVKpMozD3yqAM2oOTDZMYJ4m1AQE1maZnl>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Jul 2024 22:21:16 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sun, 14 Jul 2024 10:20:49 +0800
Subject: [PATCH v2 3/4] MIPS: config: lemote2f: Regenerate defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240714-config-refresh-v2-3-33f1649b2efc@flygoat.com>
References: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
In-Reply-To: <20240714-config-refresh-v2-0-33f1649b2efc@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=KlG0Vj2AFM95CNMxky8X5ftkACwun3YwOt82GeoC2rY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrTJZgKvd+oVPDis/f/LhZmZb2p+7kz58zlNan7n/Tdaa
 56s2DxLtKOUhUGMi0FWTJElRECpb0PjxQXXH2T9gZnDygQyhIGLUwAmYuTLyLDaVPHL9b0bbym+
 0lc/vil6M/9O+RXaTiWi6kse/pOaW2jDyNCoPMGBb539lJ0x/XfEd7Zt47unazehirNCoGjrKYl
 lzTwA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Regenerate defconfig to include some drivers that are used
by this platform, including sm712fb, simplefb, rtl8187.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/configs/lemote2f_defconfig | 54 +++++++++++++++---------------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/arch/mips/configs/lemote2f_defconfig b/arch/mips/configs/lemote2f_defconfig
index 3389e6e885d9..71d6340497c9 100644
--- a/arch/mips/configs/lemote2f_defconfig
+++ b/arch/mips/configs/lemote2f_defconfig
@@ -12,15 +12,14 @@ CONFIG_LOG_BUF_SHIFT=15
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PROFILING=y
+CONFIG_KEXEC=y
 CONFIG_MACH_LOONGSON2EF=y
 CONFIG_LEMOTE_MACH2F=y
-CONFIG_KEXEC=y
-# CONFIG_SECCOMP is not set
-CONFIG_PCI=y
 CONFIG_MIPS32_O32=y
 CONFIG_MIPS32_N32=y
 CONFIG_HIBERNATION=y
 CONFIG_PM_STD_PARTITION="/dev/hda3"
+# CONFIG_SECCOMP is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
 CONFIG_MODVERSIONS=y
@@ -68,10 +67,10 @@ CONFIG_BT_HIDP=m
 CONFIG_BT_HCIBTUSB=m
 CONFIG_BT_HCIBFUSB=m
 CONFIG_BT_HCIVHCI=m
-CONFIG_CFG80211=m
-CONFIG_MAC80211=m
+CONFIG_CFG80211=y
+CONFIG_MAC80211=y
 CONFIG_MAC80211_LEDS=y
-CONFIG_RFKILL=m
+CONFIG_RFKILL=y
 CONFIG_RFKILL_INPUT=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -83,13 +82,10 @@ CONFIG_ATA=y
 CONFIG_PATA_AMD=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_MD=m
-CONFIG_MD_LINEAR=m
 CONFIG_MD_RAID0=m
 CONFIG_MD_RAID1=m
 CONFIG_MD_RAID10=m
 CONFIG_MD_RAID456=m
-CONFIG_MD_MULTIPATH=m
-CONFIG_MD_FAULTY=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_DEBUG=y
 CONFIG_DM_CRYPT=m
@@ -112,6 +108,10 @@ CONFIG_8139TOO=y
 CONFIG_R8169=y
 CONFIG_USB_USBNET=m
 CONFIG_USB_NET_CDC_EEM=m
+CONFIG_RTL8180=m
+CONFIG_RTL8187=y
+CONFIG_RTL_CARDS=m
+CONFIG_RTL8XXXU=m
 CONFIG_INPUT_EVDEV=y
 # CONFIG_MOUSE_PS2_ALPS is not set
 # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
@@ -119,27 +119,27 @@ CONFIG_INPUT_EVDEV=y
 CONFIG_MOUSE_APPLETOUCH=m
 # CONFIG_SERIO_SERPORT is not set
 CONFIG_LEGACY_PTY_COUNT=16
-CONFIG_SERIAL_NONSTANDARD=y
 CONFIG_SERIAL_8250=m
 # CONFIG_SERIAL_8250_PCI is not set
 CONFIG_SERIAL_8250_NR_UARTS=16
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_MANY_PORTS=y
 CONFIG_SERIAL_8250_FOURPORT=y
+CONFIG_SERIAL_NONSTANDARD=y
 CONFIG_HW_RANDOM=y
 CONFIG_GPIO_LOONGSON=y
 CONFIG_THERMAL=y
 CONFIG_MEDIA_SUPPORT=m
 CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_TILEBLITTING=y
 CONFIG_FB_SIS=y
 CONFIG_FB_SIS_300=y
 CONFIG_FB_SIS_315=y
-# CONFIG_LCD_CLASS_DEVICE is not set
+CONFIG_FB_SIMPLE=y
+CONFIG_FB_SM712=y
+CONFIG_FIRMWARE_EDID=y
+CONFIG_FB_MODE_HELPERS=y
+CONFIG_FB_TILEBLITTING=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
-# CONFIG_VGA_CONSOLE is not set
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_LOGO=y
@@ -238,7 +238,6 @@ CONFIG_BTRFS_FS=m
 CONFIG_QUOTA=y
 CONFIG_QFMT_V2=m
 CONFIG_AUTOFS_FS=m
-CONFIG_NETFS_SUPPORT=m
 CONFIG_FSCACHE=y
 CONFIG_CACHEFILES=m
 CONFIG_ISO9660_FS=m
@@ -247,7 +246,6 @@ CONFIG_ZISOFS=y
 CONFIG_MSDOS_FS=m
 CONFIG_VFAT_FS=m
 CONFIG_NTFS_FS=m
-CONFIG_NTFS_RW=y
 CONFIG_PROC_KCORE=y
 CONFIG_TMPFS=y
 CONFIG_CRAMFS=m
@@ -299,29 +297,23 @@ CONFIG_NLS_KOI8_R=m
 CONFIG_NLS_KOI8_U=m
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_CRYPTD=m
-CONFIG_CRYPTO_AUTHENC=m
 CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_LRW=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_XTS=m
-CONFIG_CRYPTO_XCBC=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_RMD160=m
-CONFIG_CRYPTO_SHA1=m
-CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
 CONFIG_CRYPTO_CAMELLIA=m
 CONFIG_CRYPTO_CAST5=m
 CONFIG_CRYPTO_CAST6=m
 CONFIG_CRYPTO_FCRYPT=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SEED=m
 CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_TWOFISH=m
+CONFIG_CRYPTO_LRW=m
+CONFIG_CRYPTO_PCBC=m
+CONFIG_CRYPTO_XTS=m
+CONFIG_CRYPTO_MICHAEL_MIC=m
+CONFIG_CRYPTO_RMD160=m
+CONFIG_CRYPTO_SHA1=m
+CONFIG_CRYPTO_WP512=m
+CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_DEFLATE=m
-CONFIG_CRYPTO_LZO=m
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_6x11=y

-- 
2.45.2


