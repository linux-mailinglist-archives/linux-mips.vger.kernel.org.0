Return-Path: <linux-mips+bounces-5544-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F529765AC
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 387B5B23268
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6BD1A0BEF;
	Thu, 12 Sep 2024 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdWFrpiC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC00F1A0BDA;
	Thu, 12 Sep 2024 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133468; cv=none; b=fnb8PbU/RZubHCZbcYGTkK0vDu7mXo/RXunpGJvR86Kuu6PvfsBMnLToEB0B4scx/f63WPdEI0qJsM6jdafXchBAfj0V3lj5wBS9/HUDqYxKzHOHxHLTwNm8hBNtPttxbUdoh39Qfb5Ev/qDzkmi52f3ghcNE9ZS29vvYenMiN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133468; c=relaxed/simple;
	bh=KyjNq/4JWqFWorsEqD2UphoVO/zOCfofXlli3znYEhs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RQlQ/CQuga1DAKelGjph8e/yr6O+cGgyEyhIFjyMVZgAI+pBxVk8Sw+wY9xoCPl+ddvyFHzWFkH0kPhKPAwtVHOyOSEmcRc+UpPTJNfRFUq19EYwvwhJFfGXi9QyVDmmQR8Fx2K1sCzysvalwQWpecCzvzsNc0pS3+1QiWN7ZsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdWFrpiC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso6572695e9.2;
        Thu, 12 Sep 2024 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133465; x=1726738265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4c0vwBBm2GJGPzUzcwaUmJw/5o8B/sn9ihY/AAAuUE=;
        b=TdWFrpiC40y2mEVCdbNUJ2C7nmwkhORQdv3wd3/9t7yqFQl/v2D47aSiWGLrBBKj5K
         GasFQm6BKj+2iRWYBY60LfSGahFlYJku9qRBUe6eVm551l9eDO2Kth53MElMOsy0Ua8A
         dXHh62yhT9KpbHnsxNKZegTG3aCIBTUvNOuMpcQF/mNHChud1MZIXWsH2+uCmMukcesy
         3aexF06tWT3nkv2Wia0G7PWiJZbTJGjFkRE+GL8mYf7lBT40C6fvQEJnOti3u8k/A7LA
         mMjS0fEQfOGs2cWM0TrBsW8Jjm3ztLKj/pBK7c0kaVpgKfM0wkt/kUAZYIoczIz4fEbB
         wKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133465; x=1726738265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F4c0vwBBm2GJGPzUzcwaUmJw/5o8B/sn9ihY/AAAuUE=;
        b=uuCLxz3z3NWlydtw9QK/m2ptZGkPcR7f1Gw57VYXwCDUe4v1etm4Pn4qS29tOnSMsw
         k46H9go/YFtSWfNbiYcumbeAWeDYE+vRH+9V185MBT32Kuy+QSMyZ7UlUhHFzaI8pYjx
         aywGmNTMFABY0X4IFVVcldTUUKj4BYqEOQ6C6ccWkt9uj+MHJV+u2TepVxQLwFWbr0EB
         cmMfPzrRQxk0tHBOJN4UPwDZ9mnGGO4DlYOPvPcxW6MFLFK/9LGTelJihkjZNZ5nqQR9
         BKok0mRUYdIdhvWD79QCOMCUdUfPzfSjk8dmME7qphgCj8X69FJn76mLdMTKf2xbJ77X
         fvKA==
X-Forwarded-Encrypted: i=1; AJvYcCVQNAh4TNXaoxllog/eQcTTzmjVk1KxO0T7v/ULuYSrbbGZTZ0yt+L90T+9qq1J6reZB7ndK+A00tPcHRY=@vger.kernel.org, AJvYcCX0nb/io019T2Mrz8j1AV13jUWrq7JC/U4Q0Pf2DLbYxFSN6QL5PPGHN1KcuQQ7RDBJtWDxd97tmHaEeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwivrD9Z1a5MnZLsANEP87+w+X3zf8DUzpZ/h968IhHeLZgaBO6
	U6rwe2wR96Kk82T/8TLDXW4YzVbex50QjWBO1oppknPWe0XWi6aT
X-Google-Smtp-Source: AGHT+IETxzB6XSkf03aqTR6MKpcJw3H5lcYHSpTvlgNQRQGSeEtIMbH3IuLg90T5YLsmvSfxPCGrkA==
X-Received: by 2002:a05:600c:190d:b0:42c:ae4e:a990 with SMTP id 5b1f17b1804b1-42cdb5928f1mr14721225e9.35.1726133464911;
        Thu, 12 Sep 2024 02:31:04 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:31:04 -0700 (PDT)
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
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v6 5/9] clocksource: mips-gic-timer: Always use cluster 0 counter as clocksource
Date: Thu, 12 Sep 2024 11:30:47 +0200
Message-Id: <20240912093051.452172-6-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912093051.452172-1-arikalo@gmail.com>
References: <20240912093051.452172-1-arikalo@gmail.com>
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


