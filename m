Return-Path: <linux-mips+bounces-4272-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F83F92E227
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:27:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D48D1C22C08
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2819E1552E7;
	Thu, 11 Jul 2024 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GsowhUB0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4224F1514D1;
	Thu, 11 Jul 2024 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686426; cv=none; b=FtttdWHqbc/HUuQ1YoypOGAI2jN7uW9e18VGuLVeW0zgHaPSzRuYzQBYt3BvkUviQsIUmGTnKIXxybYH/mXhhAyvtdHAAWJxnivOx8tkpYHA8Xux9vvvfdzfzJ4U7AtTAh6ZYPfp735I6Fez+CcXCjfUG8Qmrzj+VC/43Hq8J/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686426; c=relaxed/simple;
	bh=UjTUvT0oPIWScfHNdgXV79JFsNdQ0sqOip6ZjRaNG8w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jkyCC7fx5zIpyiuFeYqDQwvZbhI1qX+N6Ki5FYamBkJsmqFhiCe2PYa5tm6uBkE07SVlX/S4UjDvxdDRZfcV+dzF5qvkClFyWeB19NcEjeJCktum0nQM6fKx5yMIKA4M6fO8M7x8XTTWLoeoThfP+v9/lfzFvYV4si2h9JA1Ufc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GsowhUB0; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36796bbf687so272545f8f.0;
        Thu, 11 Jul 2024 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686422; x=1721291222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbtJeURzuXzMSUVq6dwyLPsKk+tyXx3nczbjfITmnRo=;
        b=GsowhUB0foHrtkIF3DhjYblkGCtB4d2fBOHPERaH0ibxGnXDyu2VcIIe2jAx3jPtFM
         WOXMoTXyVtTjXoc0A3WTh00jAoupQB3TCLqbNOG6pKJ70XThbktNJLeBasPGCIrlcZmR
         VwqdvGvLh0IHxBlRy7fldqasSMypvYrYHpOpUGpAqhcH3TAMxXZKjGTGaW92pulMUcm+
         tVaT4SF0xcoItkDK0zRl1OeXipyXHy5rNMou77QM31fFm0psUMk+R1OBJOzBa1cnyDfY
         QFX/sTWq5DIeMg7t0MsFG+SgqZ1B33gCF8x5XWEvN908AOaeh4jJSz+xjwqk292kdQP2
         YyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686422; x=1721291222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbtJeURzuXzMSUVq6dwyLPsKk+tyXx3nczbjfITmnRo=;
        b=V+afthasqWJgjKD8wWN0LhzWbG0B8U4TFJar9nzGrgWkUIyJyKwQtpM35GEEHGaQnH
         SxZBLxTrq5AB9mifDoA+1MrXfrLawUBvFh6ANPnfwEEyrDRSzOcLzamAZyBrk1/9Uw5z
         i++gvaxz5ZIO5R3nI9Tp/IJ0gJXX8poMg6vFg34ZQYPE/ijbo0iPEgMePAYBb56u9cT0
         KcXMBxpsabV5FJpo+0fhcmA3yUWriwfI/CzOWdYywB6YPOErq7Q56HwubCpvOgJ5pX/L
         JfavW6KOzzzoNBoy4rnzCOpPP+nqD6fGuJ5fUpf19soS39rS6VjZmiqLwjsKIgYNQhB2
         e21g==
X-Forwarded-Encrypted: i=1; AJvYcCW5xx3dxxN1YrQh36NIc+LeKG2Yli0NuvR2rKnY34luzqf0AyG9O88tf9oW16Zwrs0OYp2oqFfNT9SJucuHQMntPX2Jcl1wSpfta9gcHIRD+NJGDi/oruI1DIaMfNJQi254GS1VGQ/++g==
X-Gm-Message-State: AOJu0YzVYOxAS3NSWOm1Dtn5UrFSUEAr3cQ9S95aYBPsjIfBMzUYL1h6
	JQ7SKNTGp0RRWx+0vsQ+JcS9cLmzKy6OfRwuKIkKKY9ydIRKVygM
X-Google-Smtp-Source: AGHT+IGRg+Owi/W3sasP/VODbkqgQBx34vKrV1FtkjaI5HVpD7Y+fzuRtSgGnCAui9tmXD6iY31ylw==
X-Received: by 2002:adf:f204:0:b0:367:8a3a:3fd7 with SMTP id ffacd0b85a97d-367cea8fa23mr5750432f8f.33.1720686422183;
        Thu, 11 Jul 2024 01:27:02 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:01 -0700 (PDT)
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
Subject: [PATCH v5 01/11] MIPS: CPS: Add a couple of multi-cluster utility functions
Date: Thu, 11 Jul 2024 10:26:46 +0200
Message-Id: <20240711082656.1889440-2-arikalo@gmail.com>
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

This patch introduces a couple of utility functions which help later
patches with introducing support for multi-cluster systems.

 - mips_cps_multicluster_cpus() allows its caller to determine whether
   the system includes CPUs spread across multiple clusters. This is
   useful because in some cases behaviour can be more optimal taking
   this knowledge into account. The means by which we check this is
   dependent upon the way we probe CPUs & assign their numbers, so
   keeping this knowledge confined here in arch/mips/ seems appropriate.

 - mips_cps_first_online_in_cluster() allows its caller to determine
   whether it is running upon the first CPU online within its cluster.
   This information is useful in cases where some cluster-wide
   configuration may need to occur, but should not be repeated if
   another CPU in the cluster is already online. Similarly to the above
   this is determined based upon knowledge of CPU numbering so it makes
   sense to keep that knowledge in arch/mips/. The function is defined
   in mips-cm.c rather than in asm/mips-cps.h in order to allow us to
   use asm/cpu-info.h & linux/smp.h without encountering an include
   nightmare.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 arch/mips/include/asm/mips-cps.h | 39 ++++++++++++++++++++++++++++++++
 arch/mips/kernel/mips-cm.c       | 37 ++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/mips/include/asm/mips-cps.h b/arch/mips/include/asm/mips-cps.h
index c077e8d100f5..917009b80e69 100644
--- a/arch/mips/include/asm/mips-cps.h
+++ b/arch/mips/include/asm/mips-cps.h
@@ -8,6 +8,7 @@
 #define __MIPS_ASM_MIPS_CPS_H__
 
 #include <linux/bitfield.h>
+#include <linux/cpumask.h>
 #include <linux/io.h>
 #include <linux/types.h>
 
@@ -228,4 +229,42 @@ static inline unsigned int mips_cps_numvps(unsigned int cluster, unsigned int co
 	return FIELD_GET(CM_GCR_Cx_CONFIG_PVPE, cfg + 1);
 }
 
+/**
+ * mips_cps_multicluster_cpus() - Detect whether CPUs are in multiple clusters
+ *
+ * Determine whether the system includes CPUs in multiple clusters - ie.
+ * whether we can treat the system as single or multi-cluster as far as CPUs
+ * are concerned. Note that this is slightly different to simply checking
+ * whether multiple clusters are present - it is possible for there to be
+ * clusters which contain no CPUs, which this function will effectively ignore.
+ *
+ * Returns true if CPUs are spread across multiple clusters, else false.
+ */
+static inline bool mips_cps_multicluster_cpus(void)
+{
+	unsigned int first_cl, last_cl;
+
+	/*
+	 * CPUs are numbered sequentially by cluster - ie. CPUs 0..X will be in
+	 * cluster 0, CPUs X+1..Y in cluster 1, CPUs Y+1..Z in cluster 2 etc.
+	 *
+	 * Thus we can detect multiple clusters trivially by checking whether
+	 * the first & last CPUs belong to the same cluster.
+	 */
+	first_cl = cpu_cluster(&boot_cpu_data);
+	last_cl = cpu_cluster(&cpu_data[nr_cpu_ids - 1]);
+	return first_cl != last_cl;
+}
+
+/**
+ * mips_cps_first_online_in_cluster() - Detect if CPU is first online in cluster
+ *
+ * Determine whether the local CPU is the first to be brought online in its
+ * cluster - that is, whether there are any other online CPUs in the local
+ * cluster.
+ *
+ * Returns true if this CPU is first online, else false.
+ */
+extern unsigned int mips_cps_first_online_in_cluster(void);
+
 #endif /* __MIPS_ASM_MIPS_CPS_H__ */
diff --git a/arch/mips/kernel/mips-cm.c b/arch/mips/kernel/mips-cm.c
index 3a115fab5573..3eb2cfb893e1 100644
--- a/arch/mips/kernel/mips-cm.c
+++ b/arch/mips/kernel/mips-cm.c
@@ -512,3 +512,40 @@ void mips_cm_error_report(void)
 	/* reprime cause register */
 	write_gcr_error_cause(cm_error);
 }
+
+unsigned int mips_cps_first_online_in_cluster(void)
+{
+	unsigned int local_cl;
+	int i;
+
+	local_cl = cpu_cluster(&current_cpu_data);
+
+	/*
+	 * We rely upon knowledge that CPUs are numbered sequentially by
+	 * cluster - ie. CPUs 0..X will be in cluster 0, CPUs X+1..Y in cluster
+	 * 1, CPUs Y+1..Z in cluster 2 etc. This means that CPUs in the same
+	 * cluster will immediately precede or follow one another.
+	 *
+	 * First we scan backwards, until we find an online CPU in the cluster
+	 * or we move on to another cluster.
+	 */
+	for (i = smp_processor_id() - 1; i >= 0; i--) {
+		if (cpu_cluster(&cpu_data[i]) != local_cl)
+			break;
+		if (!cpu_online(i))
+			continue;
+		return false;
+	}
+
+	/* Then do the same for higher numbered CPUs */
+	for (i = smp_processor_id() + 1; i < nr_cpu_ids; i++) {
+		if (cpu_cluster(&cpu_data[i]) != local_cl)
+			break;
+		if (!cpu_online(i))
+			continue;
+		return false;
+	}
+
+	/* We found no online CPUs in the local cluster */
+	return true;
+}
-- 
2.25.1


