Return-Path: <linux-mips+bounces-4171-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9C492910C
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C327D1F2313C
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96A5C134B1;
	Sat,  6 Jul 2024 05:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="AzRDpwsr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZSAxjBOD"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CDF1C6B4;
	Sat,  6 Jul 2024 05:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242500; cv=none; b=u0HyxjxkmGrCYKWX9dm2s2DVbA9/RDm3k5aZeuFRHhvBYmY+AbmOkMZEOlRgcniRIJcBHWHDMKt7tPvHe1lr/YeMK+FmD6K8MxAw7FdDZTNVNCf8Wa+5sBFpuigs8ttcyZfZKczP+5MYhjkEd+6fjQVt9ScB6UkeN6LEZW0ZxuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242500; c=relaxed/simple;
	bh=KlG0Vj2AFM95CNMxky8X5ftkACwun3YwOt82GeoC2rY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=adj1m+X9Qb26E4CflFBB/OqP2MrVWuOhl4A2b5l14ZvtYlofSt+m7xGyeHslc4qb2ypE+mnVWujrTePkJSj6b5UBxWpErbc6MsRvm9/wfHg+Yvdu6KKXS9Frnap8tf80UwyuKSxdFYdyHx7tGj15/UGQ/RkcDJUGcVIJq9xawtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=AzRDpwsr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZSAxjBOD; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 2F45F1380597;
	Sat,  6 Jul 2024 01:08:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 06 Jul 2024 01:08:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720242498;
	 x=1720328898; bh=X5NZ+Z32WoLdkpp294XqkIltG9BK9UJKdewzPzHLrnE=; b=
	AzRDpwsrA7f0RObStx4OEPEJYgJwua6VqkyCB8B95LJ2cSLJr+s/rNryICccd3Ae
	WH2466e76dM1eMKjcR1bZNZOKQwq51FAxY3aE9XIVZW+Oahl/mjgCi2M1ftsoq+p
	Vekn0S+rRSA14sgKq+uXooWKbPJD31rIs6MBTEjZCPK+pRiMoD60f8GkHBjX6pkQ
	dm5ZLILnAnCkjAk7kiys8UVR95nnNkAgFYkhRbYSQ5gE0x3ZJ3M28i9NxWX4zZSe
	StUavENnLJhQvwYdJldiT35P+2KTQ20SNmfE/WKsSHeo0LXWdTb9Rh0iflWqmlIf
	hLIPk5kURRyRM6Eol3VOBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720242498; x=
	1720328898; bh=X5NZ+Z32WoLdkpp294XqkIltG9BK9UJKdewzPzHLrnE=; b=Z
	SAxjBOD8M6+DLk8FXfF89TWXhRLxBSR/gcVyIheImBemJ9eslIE4JNVNFQWs6Xzp
	xuyqF0NgBryZT80RUNrCmmQ6ZZVAyrxo4AL0CxpcgJQP+kpNAGYc6fZFcM2WBSgR
	SjMhAccljST+jVcO8FSHEu84NRJSPptT1X/STcnK6Qlqie+xsYJjcKyEn4tvdHvp
	adUXzR0TqQw44jbW6ohs1EF+4NKyqyBnOS7akmal6botqgIubyPeLdv8KJ6VtVev
	4VOd+z7uRcTC3kcw25BWe9UDdxzxLpjz+/jFq/7EL8GE4A6DGEWMEKkjJ3AruQUW
	vZ9s0XkINQ3LnDPI2C82w==
X-ME-Sender: <xms:QdGIZmr6o9koBQVzWPaZRsk3R4hB8TcOwNRH9VDeqVWboj-812VD7Q>
    <xme:QdGIZkr3egvh5dVDNU7j-kKOeUYORB1ypETu-RXE4He5VVHSVX4ivcAz_nD-4XrWY
    G1pcJyuRrbVvmTo38M>
X-ME-Received: <xmr:QdGIZrMeIHna9lKp5DPqSDSuwCVHEx3wk0lqFkMzbi5jziEVnXTN_f9lQqXwOdrtLdc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedvkeeihfefveekueevteefleffkeegudeghfdtuddugefhueev
    geffgedukeejleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:QdGIZl5QKToGsDKZ1ExOCPHWUFd-eLsQkgh5Qfa0hCGAoedrof5plA>
    <xmx:QtGIZl5wt7hbK1GfUEqD8FnL9IqSePHKiNcQ_UErNkxsE6h4OQA_AQ>
    <xmx:QtGIZljonRARNGWKmBgHR_93RNQk9xQI1jbAhTyLdMsuSzzX0FBcQg>
    <xmx:QtGIZv6OuOWBLujfSr3gj2cpPY74ldPdQhYYf5DsASXE2I1jxDRF5g>
    <xmx:QtGIZo2_Qf9Am1KDRJR0B52Hy2m0bfD07AcXerDWYunT8nDsefFCcXxY>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Jul 2024 01:08:15 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 06 Jul 2024 13:08:00 +0800
Subject: [PATCH 3/4] MIPS: config: lemote2f: Regenerate defconfig
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240706-config-refresh-v1-3-5dba0064cf08@flygoat.com>
References: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
In-Reply-To: <20240706-config-refresh-v1-0-5dba0064cf08@flygoat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4122;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=KlG0Vj2AFM95CNMxky8X5ftkACwun3YwOt82GeoC2rY=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSOixatKVy7/1YnprN2t39myvu3NsJFdb4ok9Psac1uH
 ysnLl3SUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABMJe8zIsCLv78NihxXdHoxa
 6/+1xbeJy7wO7F0QY698N2pto8HCq4wMCx97mi44/vG56CutXqNpqh1PTx1Wc67Y3rRZc+OHBU3
 /+QA=
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


