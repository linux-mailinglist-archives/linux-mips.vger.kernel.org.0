Return-Path: <linux-mips+bounces-9094-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB977AC1E13
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 09:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BE59160310
	for <lists+linux-mips@lfdr.de>; Fri, 23 May 2025 07:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FAD1D54F7;
	Fri, 23 May 2025 07:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="extPZGgM"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A77F2DCBED;
	Fri, 23 May 2025 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987105; cv=none; b=rIAlezlmH6aekmc46eh/j8x7nCsHYP66EoqR/E02eb+ku/+rw/9ld7H+9ipyehQ8kGDdi0J7nGmJIEzJsr4xl3KDb2RuxiqYzwUc4COLM4fTT2JkFaC8ZVhnjKPkVFyZIjx5dxw7QAmIDtOUA+E3zqqtKYx04H8P++6yMorR+Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987105; c=relaxed/simple;
	bh=hc/ZEJUpZIM7Kp61qjmy8Q6sFDNCRKW/ZMjLsf22VZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KWYiza+CxZD8BhCgJy/0ylwihcXuNdr+RI8T4Zmu625mLkfQhKzPWlP3LwqmGwZS/vBe5MN3s5Eoaxmlw2RE2WxOdjo6FsaSnbL96D8R6MKwZQ/Ny9VziW4EFsyelmE7qEUlxdbYu2V5MaW+QGnd+8bsnPZg+vxBPK9aPVjlwM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=extPZGgM; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2349439C9;
	Fri, 23 May 2025 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747987101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=f4jg6TJM9rfnd81xJwrBimjVOQPPhbLnaiJRLysszsA=;
	b=extPZGgM8PhcDiuh42PxWIDf5nlOx6CcJsqIGigOsobNYzs8jMJ1z27J9yOwX/GwLHy5Dv
	wNX/kbaYBtOd4HK0xPjvIepuhZtJX9hj1rt8eHOYnAKcYTQHMMvscRAMswlgZ+Ec1g1B9V
	R1Il3bQBjotseGgXN3Nl0fusD0o4/5W4NmP4hninYKoT3pvdJeOKwitEBUP4EYrBmUwkEY
	xbF1yxEiglKYryBxXQdr6h0iWNHm9PkGS/PVfwMTaaXjE1XLwxkPesMwgf3Zbt3xgMV3EI
	orqERXz1rvc9HPpTulXxuSW4meuyz80zetTDS2KGGcrEj/6NpAPl/FwAZD2/UQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 23 May 2025 09:58:15 +0200
Subject: [PATCH] MIPS: SMP: Move the AP sync point before the calibration
 delay
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250523-hotplug-paralell-fix2-v1-1-45a9f84587fd@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAJYqMGgC/x2MQQqAMAzAviI9W5iFHfQr4qFqtxWGjk1FEP/u8
 JhA8kCRrFJgaB7IcmnRfavQtQ0sgTcvqGtlIEPWWCIM+5Hi6TFx5igxotObsJudY0PcW+qhtil
 L9f93nN73A1u43CZnAAAA
X-Change-ID: 20250522-hotplug-paralell-fix2-1bffa02a9529
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekfeduucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthekredtredtjeenucfhrhhomhepifhrvghgohhrhicuvefngffogffpvfcuoehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetleefudeikeetjeejkeeuleeuvefhhfduudehjeefudfgtdeufeegheeggfevteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemjeguvddumeduvdeileemvggtughfmegtjeeijeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemjeguvddumeduvdeileemvggtughfmegtjeeijedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddtpdhrtghpthhtohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhts
 egsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdrohhrgh
X-GND-Sasl: gregory.clement@bootlin.com

In the calibration delay process, some resources are shared, so it's
better to move it after the parallel execution part. Thanks to the
patch optimizing CPU delay calibration, this change has no impact on
the boot time improvements gained from CPU parallel boot.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
Hello,

After a thorough review, as reported in [1], the CPU delay calibration
is the last potential issue area. However, I believe that with this
patch [2] applied, the source of concurrency will disappear.

Gregory

[1]: https://lore.kernel.org/linux-mips/87frgvokga.fsf@BLaptop.bootlin.com/
[2] :https://lore.kernel.org/linux-mips/20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com/
---
 arch/mips/kernel/smp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
index 7901b59d8f60eddefc020cf2a137716af963f09e..4868e79f3b30e9d80fe6390785b297c35d8c02a3 100644
--- a/arch/mips/kernel/smp.c
+++ b/arch/mips/kernel/smp.c
@@ -371,12 +371,12 @@ asmlinkage void start_secondary(void)
 	 * to an option instead of something based on .cputype
 	 */
 
-	calibrate_delay();
-	cpu_data[cpu].udelay_val = loops_per_jiffy;
-
 #ifdef CONFIG_HOTPLUG_PARALLEL
 	cpuhp_ap_sync_alive();
 #endif
+	calibrate_delay();
+	cpu_data[cpu].udelay_val = loops_per_jiffy;
+
 	set_cpu_sibling_map(cpu);
 	set_cpu_core_map(cpu);
 

---
base-commit: faefb0a59c5914b7b8f737e2ec5c82822e5bc4c7
change-id: 20250522-hotplug-paralell-fix2-1bffa02a9529

Best regards,
-- 
Grégory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


