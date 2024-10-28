Return-Path: <linux-mips+bounces-6516-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B229B3889
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 19:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0955428463F
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 18:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D211E0090;
	Mon, 28 Oct 2024 17:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnm8sjtT"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5B81DF98E;
	Mon, 28 Oct 2024 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138393; cv=none; b=qKF4Y4IxqUHn6HN1x3bieNm8ZxJxPEUio0KaAtdeLwPCZ/S77ws8NGFG8oOPxJ50fRHEzY6qEGDbf5jTVly/dIqeM+mhy/g9YVco2y9fFKCxsqU9XTs/28R4B69ak/BFl/Fy2K+NOfprtetesaxwtqARus6j9roJhYwhVqOZbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138393; c=relaxed/simple;
	bh=p2Tp/HcuSBEX14Tfk4llfvH2YxkZR1LNd5lRMCyquIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qfHgJis/OK9zH3RlKh/8XhInfZtF/PxaiaQNcgU2s8qNJ/Suh4Ntli/htC0vCFaGl/SPqlKgXm6PSvxwxbaZr6cln+pMiyVAf+bKS9mB0mm7JWV7fPLuqitPgla/Ly1RLJHCoMkykuA09Cd9IqslsYoI4tJMgyPddmIa1Pw6YTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnm8sjtT; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a0ef5179dso670335566b.1;
        Mon, 28 Oct 2024 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138389; x=1730743189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeLRARWoyg8Va94Z6ay+CauVKyiZ38OKRS9Vk7LJXu0=;
        b=gnm8sjtTPqCKEP3DPRLqQ4VSz1ABLCBde87RPy5whqbkDP43I6uWs6yi+t7tCtu/uR
         LlthCCpkDblcVGsbHLgkZnT5zXWfbhnLgsLM2H6azhm0AgDH98rVp7lsCswfKahAlGk4
         naTxXnqOb9rM7mSxG3gZfDxekU97oDbpizcNR+6ZLTejJMD0a2l1ipz3tlYr+c/OlL0a
         GLAS61jvFYL0omQauEB0UnepQLERrXgT6C2/LwjWmRHQVP5XTgz5X+J8DRbjfkpRXaQb
         9USYME4bdYg4w0kvPE5RLkzf9iA5OSBR/WoEBBDzFaAxUkZwWGMChd3m4AqklTYHdm4f
         ZKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138389; x=1730743189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeLRARWoyg8Va94Z6ay+CauVKyiZ38OKRS9Vk7LJXu0=;
        b=ovqtWQgakTlmHLAjr9pE1TxF0446f5IBmYek+UlpjwVTwIz7CvQoajVzciRatU2QYP
         3R+n2xIFCjDgTcQmBoqvlgDjMY4js4Rbo2EpHbPFaKx0yqjvU3zzOhYWa7axOaiaCmj1
         Yp40TBFi8Ght7AzgEdNLTlZBlK6t441GsiCOB+OsnD/xcBSpiATJcibIbc7RyFknRUTa
         N2UlN0rwN4AkFQo8fQLZuk5LQTjt3B1LGc+JkoRqe3cvewSasu6Jv6XbytxrvgJ3rD3a
         npAgrTsW5k/aBFNFAOzm+BVO4D23A1TuADw+GeOXIM3912w49TPH14ZYxmCD1O6wfUhK
         0SLg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ht6XZAQIp+3fQvJJW9Wg2TZIc4TdYdr/HmOskHPOpt8IMkhU3xPnPWuLZq3A51L/ZcxVI3RrZmqt@vger.kernel.org, AJvYcCVD7gxjCoiG/P0s50R9X/AX25tpA6s+NdI6w1g5jwD22ou+wyTjCO6vk2rHejCNNyliIfGLtTLuUr3lVw93@vger.kernel.org, AJvYcCX2Uoq514azb78WJLFDdn3vThqUFJ0NK3cNsr269vKyDaxn2FJYcWKf7vsYudrAjadQ/u2l3EzVIsfdvw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ogHDYNOaAtHR/fMhhNAxAjfxFvy5f018SBcwnLpc9emObRGb
	cyVK+ZmS+15dUbA+9l8IWq/LFSt+16u5nJT7xV8fJtwvEGdPKEzk
X-Google-Smtp-Source: AGHT+IFqysuG3AXUKoxFaw5qrYiIo8V/qjCFFeXyI/1B97ZSodG1BX51263mSjk6qGH57Ms5vz5GhA==
X-Received: by 2002:a17:907:eaa:b0:a99:f496:794c with SMTP id a640c23a62f3a-a9de632bf9bmr736810966b.52.1730138389055;
        Mon, 28 Oct 2024 10:59:49 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1dfbdfe2sm396990766b.36.2024.10.28.10.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:59:48 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Theo Lebrun <theo.lebrun@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	devicetree@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>,
	Paul Burton <paulburton@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Aleksandar Rikalo <arikalo@gmail.com>
Subject: [PATCH v8 05/13] clocksource: mips-gic-timer: Always use cluster 0 counter as clocksource
Date: Mon, 28 Oct 2024 18:59:27 +0100
Message-Id: <20241028175935.51250-6-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028175935.51250-1-arikalo@gmail.com>
References: <20241028175935.51250-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

In a multi-cluster MIPS system, there are multiple GICs - one in each
cluster - each of which has its independent counter. The counters in
each GIC are not synchronized in any way, so they can drift relative
to one another through the lifetime of the system. This is problematic
for a clock source which ought to be global.

Avoid problems by always accessing cluster 0's counter, using
cross-cluster register access. This adds overhead so it is applied only
on multi-cluster systems.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/clocksource/mips-gic-timer.c | 39 +++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 110347707ff9..7907b740497a 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -166,6 +166,37 @@ static u64 gic_hpt_read(struct clocksource *cs)
 	return gic_read_count();
 }
 
+static u64 gic_hpt_read_multicluster(struct clocksource *cs)
+{
+	unsigned int hi, hi2, lo;
+	u64 count;
+
+	mips_cm_lock_other(0, 0, 0, CM_GCR_Cx_OTHER_BLOCK_GLOBAL);
+
+	if (mips_cm_is64) {
+		count = read_gic_redir_counter();
+		goto out;
+	}
+
+	hi = read_gic_redir_counter_32h();
+	while (true) {
+		lo = read_gic_redir_counter_32l();
+
+		/* If hi didn't change then lo didn't wrap & we're done */
+		hi2 = read_gic_redir_counter_32h();
+		if (hi2 == hi)
+			break;
+
+		/* Otherwise, repeat with the latest hi value */
+		hi = hi2;
+	}
+
+	count = (((u64)hi) << 32) + lo;
+out:
+	mips_cm_unlock_other();
+	return count;
+}
+
 static struct clocksource gic_clocksource = {
 	.name			= "GIC",
 	.read			= gic_hpt_read,
@@ -203,6 +234,11 @@ static int __init __gic_clocksource_init(void)
 		gic_clocksource.rating = 200;
 	gic_clocksource.rating += clamp(gic_frequency / 10000000, 0, 99);
 
+	if (mips_cps_multicluster_cpus()) {
+		gic_clocksource.read = &gic_hpt_read_multicluster;
+		gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
+	}
+
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)
 		pr_warn("Unable to register clocksource\n");
@@ -261,7 +297,8 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	 * stable CPU frequency or on the platforms with CM3 and CPU frequency
 	 * change performed by the CPC core clocks divider.
 	 */
-	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+	if ((mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
+	     !mips_cps_multicluster_cpus()) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     gic_count_width, gic_frequency);
-- 
2.25.1


