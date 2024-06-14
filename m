Return-Path: <linux-mips+bounces-3685-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86980908F1F
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A8F3284057
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7475519E7FF;
	Fri, 14 Jun 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ozQ9dArk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nbKjRnAS"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFFA19E7F8;
	Fri, 14 Jun 2024 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379648; cv=none; b=ZNhHs0Vcbohv2B6LVqsEFnMfbDGleUYqV5vbND9P0AfuaCWpYKbIZ76Ba266PiZIX21WNzmMp95R0qSjKhgGpNBFWnyV+T8GfNURHAnnq+vpJHw+6KnLrvi8udIST7mGShWed8JNK7YO4UWi8ltwWsWzD2h1rIVODAY8O/nrYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379648; c=relaxed/simple;
	bh=GQCdvEn4YfCfOHLIw71p0Jk/dC8Z1CY2lE20BDArrLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8EkBSt/gQqzxt1FliTIzjV6L1+/h/nlkrW14IzQYkkMrJv1PUZwDVxq8EKH4C3RwNTUd/BWKkFN0IwdirDZTrtcSqspLCuKJILsMfsRUPAgbXHZfyhTtY9gSW22Da/Msjrq+rpaPUVKogClfY9cdlmBrdrmpvGMzOKeB9i90lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ozQ9dArk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nbKjRnAS; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 219BF1C00137;
	Fri, 14 Jun 2024 11:40:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 14 Jun 2024 11:40:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379644;
	 x=1718466044; bh=g6maYbzQ8hVd/yK0MzkgRf1OxJs0dBSVkIv1O4fSZ5s=; b=
	ozQ9dArkZO4JxfMsgeSusloZ7xJxguN1PBjlvNHTvUPY0JuaBQT+oCNb6HrSzGcl
	hqVuX6XasQPBCyrbrm0v/c1Y9E3ECPEqtUuor6WaAVQXF9VrdnpXs+a3DCSV3XKU
	xaoir82D0ODg7JSmfgyJyvutNWvViYCExa/MLEMfxSwxtmUDT4VK4Zky5/87j00A
	ZieLwJVyLZcaJU2efcOhDAEbTohu/z7HbPIzg0pW+96uCRK2bYazD6U1xIJO5vTn
	zBlphlVfDPE6WIpf2tUlyqeipX5nL7i+7qbLpqYA5FGKKXH+s3+GlFhMdEjJibgs
	YzrkEpuSA2CeHNMEyWzY8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379644; x=
	1718466044; bh=g6maYbzQ8hVd/yK0MzkgRf1OxJs0dBSVkIv1O4fSZ5s=; b=n
	bKjRnASGpF8jf2tatGqqvqv2wUWLTiEfQGTN/kIfkx1pd9A9bzEd62MwHpuY5ATP
	6opn5efdfGQmYvFc+c/zBUkkZbJs5AAsQw769Z9PqGUJXNP/mpSCSteDi73/hfjZ
	ZHurEcLfBJYZpBGbGpfyFR+G6hY34w+0I6nnYwdLf951HLe+5GjUNCFB/Xvr99Yd
	WIqGftDh3a4cQWKJSIjwwlusfCDyUw9p8pfkddfxWZxgDr9XnJuA4ShuW0pXkLHZ
	Dsi3kmnzp1ssOoJMCJ89HjH7JlE0Kea3/OUZbUcrfuHfxnDLVyD6RAiuNudV0DK0
	r1PApP8XT2oop+f7UJfZA==
X-ME-Sender: <xms:fGRsZk-CW-NR8y0Mlbdke4NvyAuFLNP7L2q8Ty9NlW4VMDamXs9DbA>
    <xme:fGRsZsuR0-896Hjl4yNz1ckblqGX9it6Fs9RW1JGKee4DIdBIcmXAleHal3mlosCI
    Yv24J5Xx6DFZNNNOtc>
X-ME-Received: <xmr:fGRsZqDNlZo8iJ-UX0sIHOWgsfuzyR1CBk0_qqHDEgwSrj8Y5F6G20w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:fGRsZke56fwvlrGkk0zjvR869XHIup06RE3xPtABWiP04siDT4tt2A>
    <xmx:fGRsZpNxsUetcS7yk2PV6LGXrooRtDeMFzGTSYvT4OTYqxAzvoX6bg>
    <xmx:fGRsZukJAqGyLInejtUxHKVfuEwH5Zz1i62cQQl1wlEi-gAvNzOBhQ>
    <xmx:fGRsZrsfLwb2foPeK6OH473LNx4voVXN9ZlOi7StfsDahAfHkdM5Gw>
    <xmx:fGRsZtmEnhfBl60uaDK6pgnZFHoeBk5hiChSo_iq4lbvX3QidkQjt6nn>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:42 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:16 +0100
Subject: [PATCH 08/10] MIPS: Loongson64: reset: Prioritise firmware service
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-8-7614340ace7d@flygoat.com>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=GQCdvEn4YfCfOHLIw71p0Jk/dC8Z1CY2lE20BDArrLc=;
 b=kA0DAAoWQ3EMfdd3KcMByyZiAGZsZF6jOu2K1+JJ5OUN/8MZCwn99NSTLRsXQFQnQC3go6jWz
 oh1BAAWCgAdFiEEVBAijrCB0aDX4Gr8Q3EMfdd3KcMFAmZsZF4ACgkQQ3EMfdd3KcPwvQEAwpBc
 HF1hve01Rvh+mW9on+v1gDu1BISFA/aXE4MPnawBANztcBz4nOCwf4UucJmUY/37+d+FYxhSX0T
 H8wvl2N8K
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

We should always use firmware's poweroff & reboot service
if it's available as firmware may need to perform more task
than platform's syscon etc.

However _machine_restart & poweroff hooks are registered at
low priority, which means platform reboot driver can override
them.

Register firmware based reboot/poweroff implementation with
register_sys_off_handler with appropriate priority so that
they will be prioritised. Remove _machine_halt hook as it's
deemed to be unnecessary.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/loongson64/reset.c | 38 ++++++++++++++++----------------------
 1 file changed, 16 insertions(+), 22 deletions(-)

diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
index e01c8d4a805a..3e20ade0503a 100644
--- a/arch/mips/loongson64/reset.c
+++ b/arch/mips/loongson64/reset.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/kexec.h>
 #include <linux/pm.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 
 #include <asm/bootinfo.h>
@@ -21,36 +22,21 @@
 #include <loongson.h>
 #include <boot_param.h>
 
-static void loongson_restart(char *command)
+static int firmware_restart(struct sys_off_data *unusedd)
 {
 
 	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
 
 	fw_restart();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
+	return NOTIFY_DONE;
 }
 
-static void loongson_poweroff(void)
+static int firmware_poweroff(struct sys_off_data *unused)
 {
 	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
 
 	fw_poweroff();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
-}
-
-static void loongson_halt(void)
-{
-	pr_notice("\n\n** You can safely turn off the power now **\n\n");
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
+	return NOTIFY_DONE;
 }
 
 #ifdef CONFIG_KEXEC_CORE
@@ -154,9 +140,17 @@ static void loongson_crash_shutdown(struct pt_regs *regs)
 
 static int __init mips_reboot_setup(void)
 {
-	_machine_restart = loongson_restart;
-	_machine_halt = loongson_halt;
-	pm_power_off = loongson_poweroff;
+	if (loongson_sysconf.restart_addr) {
+		register_sys_off_handler(SYS_OFF_MODE_RESTART,
+				 SYS_OFF_PRIO_FIRMWARE,
+				 firmware_restart, NULL);
+	}
+
+	if (loongson_sysconf.poweroff_addr) {
+		register_sys_off_handler(SYS_OFF_MODE_POWER_OFF,
+				 SYS_OFF_PRIO_FIRMWARE,
+				 firmware_poweroff, NULL);
+	}
 
 #ifdef CONFIG_KEXEC_CORE
 	kexec_argv = kmalloc(KEXEC_ARGV_SIZE, GFP_KERNEL);

-- 
2.43.0


