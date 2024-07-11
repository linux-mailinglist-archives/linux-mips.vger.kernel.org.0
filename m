Return-Path: <linux-mips+bounces-4278-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3C792E233
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C666A2843F6
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DBB158878;
	Thu, 11 Jul 2024 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjTXTT1A"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D9158851;
	Thu, 11 Jul 2024 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686437; cv=none; b=gPgPp+hAr3ADA2tp8GlZSuhnzd4+VRirQ6S8oP9K0UKWypH9Ymwlp0sIy8+97xIjpADyKhZa7fK0RGsOtDfmqp7ugga+IaXhG0MVDzz6AuvxYNUOaBNMCrQ6BFJsrPtwC/qS+N4mn40P7zOKhjO2aeUxam5zmT0xVXIdlF3sVZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686437; c=relaxed/simple;
	bh=fwpzYPPCUgCelrVVCDuVaqDelwUZQ6NMXtjgABaLPEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uAY+Lswvjp+RO8p09l6nL0uYKrzeJ+ui7Uk9YaZ3iCO7eoCo8qydIwd3D4eIxg2w4+DVJBSJjes/BxhQVesR0KLk/Z6VomENghTmbTDwXWO3knSknTYZDgsP/jnrgoH/hnKLATKDUvt6MH9KzEHzVmrvi3DolRYw74oPoSxVWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjTXTT1A; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3678f36f154so296545f8f.2;
        Thu, 11 Jul 2024 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686434; x=1721291234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Eq5L/3x6rW9mJ9PUBft1DoFSqkQM9o69ITIfWtFGDU=;
        b=TjTXTT1AJ3UVHmH9XWAkLM111IOFx/iaLVNItXRaq8duVjlmrxM0FtLp9b8MxHiRte
         gc35Mdfo91sRnCUcaQmEwJVXJrGT0+5Uka37VYlwL53dLVhGXQSGSREcgcnbYFvDaHg3
         MbO1zT3wtrB/my4cj1220zRKSSmgZ3Mlj4vygmBU8bWK/RqDOnHlKKKNNqmabiKInmfe
         Nxo4uTsIhG6c7IZZCGkDJaaf9mLTIh4HUyPlMLb4/v+io/XHgbC+jTPgUYlnz7YxGJqX
         Hp17ewiHwC/3aNaHpxLnIqBLYE/2zqadjbcf7bGJoGqGdxxDJBsUd9wuDY2MVTZS9SxX
         vehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686434; x=1721291234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Eq5L/3x6rW9mJ9PUBft1DoFSqkQM9o69ITIfWtFGDU=;
        b=djmFrJ01Z6Sqv2zHsqu0EFf3NjsLPtyefxAFWyVhrad8KFwNRma3rJJ55YR+03tS9x
         QqT2SZqoFgqdbuaHk0ptE/5MLeEG5cI3cIkjfUk453xuOKQiDG8gXMqiAv9CbvjliQbH
         tOvH+LGg+KP5Fl+pnjQM/3znXLfdnJ/Zr8F4w8yXX5eKLKbxdZO3j5rtLJqc4ih9jim/
         ZLseKI50RWcrDMoUTX9eY9v3dkIuiJWADfsAclXOAgM4RM+1kmPWYXP9F1OQ/8Sjerdc
         rr5E+BXr2alJ3ERRdEWwaC4GiI+dQU2y4Z5+/+wpOGR53W2oClNfZDCaLZiCMUKAVT7T
         VQVg==
X-Forwarded-Encrypted: i=1; AJvYcCUkNTnwMCtMZyWgy8XY3VCN1vHJ3aS8wjO4/nynslRIOX9p1rn5DCiZ2sULuiELokXYq9euA1HJlh7LLKMcsbh1BfQYjea8uZHpI7FbVj+UBU9sMUuMIn+AWlsJO/o6vmzf9Vc9NdlrnA==
X-Gm-Message-State: AOJu0YwzBSMKyjvkvd5HHq9DFIu5VvR7kqQ6X6tI5x6HmMDT6j0OOQ71
	3V8X50mZrVN4yVzX1AlkNlGX7m3mR0IwXnuTeJmoF2qYzHEMBr+O7m6mVzvt
X-Google-Smtp-Source: AGHT+IFKtYUq1wOQolR8qmRQpgxvK8oXDtrlAIQLNh8NRbYRPc10lApqKQE8h9TOYq9fNCwdb2sXqA==
X-Received: by 2002:adf:f0cb:0:b0:367:9634:f103 with SMTP id ffacd0b85a97d-367ceadc8c2mr4468334f8f.64.1720686434405;
        Thu, 11 Jul 2024 01:27:14 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:13 -0700 (PDT)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
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
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v5 07/11] clocksource: mips-gic-timer: Always use cluster 0 counter as clocksource
Date: Thu, 11 Jul 2024 10:26:52 +0200
Message-Id: <20240711082656.1889440-8-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711082656.1889440-1-arikalo@gmail.com>
References: <20240711082656.1889440-1-arikalo@gmail.com>
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
index b3ae38f36720..ebf308916fb1 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -165,6 +165,37 @@ static u64 gic_hpt_read(struct clocksource *cs)
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
@@ -199,6 +230,11 @@ static int __init __gic_clocksource_init(void)
 	/* Calculate a somewhat reasonable rating value. */
 	gic_clocksource.rating = 200 + gic_frequency / 10000000;
 
+	if (mips_cps_multicluster_cpus()) {
+		gic_clocksource.read = &gic_hpt_read_multicluster;
+		gic_clocksource.vdso_clock_mode = VDSO_CLOCKMODE_NONE;
+	}
+
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)
 		pr_warn("Unable to register clocksource\n");
@@ -257,7 +293,8 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	 * stable CPU frequency or on the platforms with CM3 and CPU frequency
 	 * change performed by the CPC core clocks divider.
 	 */
-	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+	if ((mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) &&
+	     !mips_cps_multicluster_cpus()) {
 		sched_clock_register(mips_cm_is64 ?
 				     gic_read_count_64 : gic_read_count_2x32,
 				     64, gic_frequency);
-- 
2.25.1


