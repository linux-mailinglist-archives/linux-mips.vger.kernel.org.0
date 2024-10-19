Return-Path: <linux-mips+bounces-6150-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143E9A4BAB
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 09:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1B6284AB4
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2024 07:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1071DEFED;
	Sat, 19 Oct 2024 07:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZvymqrMD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478991DEFD6;
	Sat, 19 Oct 2024 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729321856; cv=none; b=bgnyC/TAFShSV9nPWC92pXo8sVPaIBMNoN1NUa2CpQ5SfMu76ZTt/DRAp7R+eZZENzcaSdYyTlB/x+iuW1x/7lEgZgcD5abTfs6o+HVvXohfpzLjvLwEeil63Ac9k0Gn5x5cBWzyebsLDul7QKGHScyk1xgmuQAxTrVFoLssuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729321856; c=relaxed/simple;
	bh=KyjNq/4JWqFWorsEqD2UphoVO/zOCfofXlli3znYEhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s32E6gNtRjqbwrPT2Wbq/+HFS/AKMlrYBSrHwMWMliA7CWOAac/D+uLi9/TBa2YHhAfzfKymcT2g3TnhmsatHgE8B1Ah+z1pGse+feE+VqQ2rQYLE0W+ooAQxyzZT7WTlCyiW96O7+7r25FBaZGQXx4WnF69AxDlqYWeUTcL9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZvymqrMD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a0472306cso355056666b.3;
        Sat, 19 Oct 2024 00:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729321852; x=1729926652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4c0vwBBm2GJGPzUzcwaUmJw/5o8B/sn9ihY/AAAuUE=;
        b=ZvymqrMDLtlJyrrTfaZAerKs3RFBJkfMDtQujZMK5qTM48rFNuM5AhSiRkuJFQQQ8J
         X6iiCpDHJHW7Hsz2Nku1rRNwpZqDoYTROvQ17ADLD7HOFUisYdxbPdnRX5j/ao3V6CTL
         dnh4ACUGgOW5/gXHeIXd0Onr3yppnoMuz8UQ0rRVeIhoFN3vfzGIF8ndDMO380S41My7
         DAgTq+qStzTLHBG2mENCPFtlStQnKouiPAHNHiLzfksCpWMCxTK4wRhDXgkMOfzH4kCa
         ZyoP6ml/NiSjZfdOlkr5QvtnTy7HZZnGJBIqmZmXne1uZ5bMDJlCetoZgdv8bq3Sb6IM
         7XRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729321852; x=1729926652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4c0vwBBm2GJGPzUzcwaUmJw/5o8B/sn9ihY/AAAuUE=;
        b=AeDaE+ffO6bRaky27yhv90U4Vqb0jpQt6iUpJIUgcsZQNmvz1uBrHefLZaCWl8RTnL
         +oXm4BXfslynPdFbrXwGVSyYpOhQM+B0q2Xme6FlMrmt3MBVCB+EWq96X6wksqTWtFg7
         yx621gOUKl2IiaC6mctL5+R+kFM45tNGAwf6c7Eu1LuXFlmaiwcD9FMw5iP/qSyz/wcp
         nF1hZ8SFkA+idGbFSLeNG6VPQYjCrTO0aTKNPk90p3lU+4l+9Sz5SBHzRQAHl2ToOqgo
         DpDs/urkoxv4CxHGvac9InarHBwGJltD4EHt2wbjraHKqFChVP5/r8b60bS+MLKaNyyS
         PAhg==
X-Forwarded-Encrypted: i=1; AJvYcCV5xUFnlfxLxHFHBUxoK0vw49EKdoB2f7+HTq47RzPPLixw64iGS5nASAg6n2PsZUcZEfsgtIDSIqYFz+c=@vger.kernel.org, AJvYcCXXcvtDs8SY1+mQYUKX1VaqclxTkb4nY/qCKVR2mLLs0XqVyy5gv0AuY9BMMgUNkb4fNJ7zKiVxFDhU4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QRBWh64A8j+iZ6J8ZO1I+1r2wNBfW1kq49SqetEiSEnI3JWG
	HRCZXRbdtwo7QzNYxvbpfMBp6DMsQJ0Nl9jEeosck6X5SJNCann6
X-Google-Smtp-Source: AGHT+IGBsE1ie/NzpB0I+jNKNxByt2QsmGK+fuU9kdO3H9XaNqgLWxr9+6R+eP5xQzgkmv6fMJTtKQ==
X-Received: by 2002:a17:906:4fca:b0:a9a:1bb4:800c with SMTP id a640c23a62f3a-a9a6996979amr477071566b.4.1729321852334;
        Sat, 19 Oct 2024 00:10:52 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c27841sm180566666b.192.2024.10.19.00.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 00:10:51 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <arikalo@gmail.com>,
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
	Thomas Gleixner <tglx@linutronix.de>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v7 05/12] clocksource: mips-gic-timer: Always use cluster 0 counter as clocksource
Date: Sat, 19 Oct 2024 09:10:30 +0200
Message-Id: <20241019071037.145314-6-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241019071037.145314-1-arikalo@gmail.com>
References: <20241019071037.145314-1-arikalo@gmail.com>
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


