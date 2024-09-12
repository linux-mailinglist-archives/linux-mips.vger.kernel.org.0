Return-Path: <linux-mips+bounces-5545-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BE9765AE
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 11:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 391DB1C21A9C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2024 09:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3171A2567;
	Thu, 12 Sep 2024 09:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoMJ9zrh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A43C1A0BF0;
	Thu, 12 Sep 2024 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133470; cv=none; b=ar8ZREvu6UnwexjhscJ+uL6oUpKdtBQrkrn5GYHVWmiEOhqWnnm3nBATrpAqsySvB6JNLiY4MigUASm2D7a/r5cApDhHMkd/O8xnFVNwUG24XSkQDMQ6HcYz2o9iNV7mx3/BUpBaxmdyR0lB0ZtllGYpBOR0N3htnxte5xgdQLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133470; c=relaxed/simple;
	bh=V5rAjTu+pU2fpi74fQ5x5suB+2X7eoYvm+lLjy+3z2o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MHCkOAG/FDYVWyZ12S1xVKz1/z365pxv5Bjb3dlgFPool5bTkH+cY4SCPloGtnqH5hSLMUzY+TVeFytkOC9nyBUsGZ/lSo0UDjxVkwgSk+tE/aMJ0eeqi7JW02qJ6/oG5b9hcYsXPRsTEHvoNK/kSEHx+Pb+7gtGmb+WjyZGm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoMJ9zrh; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso6573115e9.2;
        Thu, 12 Sep 2024 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726133467; x=1726738267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TY2C2Lxi2lZ2EXUmAkUJgOoy7I3aUdzu6U8J4ynR6M=;
        b=SoMJ9zrh7s2GkZt96BmtxihxH8fSEu8QhoIWR9HnpHP5olvketDLezWTo9avjpm2Kd
         iFwxfhSQ5dINYMlftI2Ez0d6N36RkPIzNMnsrS1BYcuDHXjjkMzjKfJRpTFGuSirdzw8
         CjxpNIfccyVZkfuz1l/D9DzpSm2yrfLnvmjV0/vrwO7Ar6h9Q8+vD/egKM2oyFtef3rm
         IjBLTGSxRI+if1C34u5StD3vL1QzfPVY2+3A62H2jWS8E4x7pz86eQKqUgD/HpPanPaD
         6UP7+8yRtdxemMMtu9n0OELeRFHbbqDv6bHrPbothpzFMbep3VJCqkb49ca+//0U2jgt
         38oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133467; x=1726738267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TY2C2Lxi2lZ2EXUmAkUJgOoy7I3aUdzu6U8J4ynR6M=;
        b=HqYWBYZFU2ZfghpCwYeK1n9JRNr+q0vPvweOpXgNDHiH8iB5NUWXb2jJ4cJApT5/wR
         5ACNwNhnM00xHwZs4njVh8YAYWr7lILuyI7+bJ1tQMXNOa0Qt78LHRIy0Em4UTIgW0pm
         Kv7ScpmxhtrxcNAljXbIWG9TsBXSvmeydl6+yg9FERPSyWl95kxsKlpVhjYXtwP6IV+F
         9Hq3484D+LsTSLz3yXf2SLrGN1NjC3T1x7C3kpeiekaSn81BUliG4XdqSpKnY8dHHkMs
         nkBVyCsVKjG+QTx6HV4VRGju53zcwdiX8cCbn4M6iGSqj642BIkEtYhUwA9FIje8B0k+
         vAOg==
X-Forwarded-Encrypted: i=1; AJvYcCVMxwqloJcGtpaMlNOGqkDXtsoVfOjK5akz74Sq9dpeMPgtr4Op/X56QfbTouhgjoFLY5RDa6ssZxTBHg==@vger.kernel.org, AJvYcCVdp9z5WoLCN/r6R/o7Xxp/Lr2aRDhEH0/U1jv+WO4TczUhqSD1H1Nsf0bXI3O8JAbSPowR4M5QMB6M++A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxiqmdf2iFGrS6gwQU5H/dShjj9mF1iyhzgv7ol/QSJmAOegbpt
	A7i6cZ0Mb8kPmHq/8Bv+LCqaUicsLYrsTLN3V174hpGxu9ldgkZ3
X-Google-Smtp-Source: AGHT+IFcfu6FeILuRdzD5gxxJGCrEZBwvLP8LJ8bhXKkKveZtbZBTGuRwuN3Pp5UbaIt6IZlxErncA==
X-Received: by 2002:a05:600c:3505:b0:42c:a8d5:2df5 with SMTP id 5b1f17b1804b1-42cdb586ee0mr16540935e9.24.1726133466823;
        Thu, 12 Sep 2024 02:31:06 -0700 (PDT)
Received: from localhost.localdomain ([212.200.182.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cc137556esm76688225e9.1.2024.09.12.02.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:31:06 -0700 (PDT)
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
Subject: [PATCH v6 6/9] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Thu, 12 Sep 2024 11:30:48 +0200
Message-Id: <20240912093051.452172-7-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912093051.452172-1-arikalo@gmail.com>
References: <20240912093051.452172-1-arikalo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

In multi-cluster MIPS I6500 systems there is a GIC in each cluster,
each with its own counter. When a cluster powers up the counter will
be stopped, with the COUNTSTOP bit set in the GIC_CONFIG register.

In single cluster systems, it has been fine to clear COUNTSTOP once
in gic_clocksource_of_init() to start the counter. In multi-cluster
systems, this will only have started the counter in the boot cluster,
and any CPUs in other clusters will find their counter stopped which
will break the GIC clock_event_device.

Resolve this by having CPUs clear the COUNTSTOP bit when they come
online, using the existing gic_starting_cpu() CPU hotplug callback. This
will allow CPUs in secondary clusters to ensure that the cluster's GIC
counter is running as expected.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Signed-off-by: Chao-ying Fu <cfu@wavecomp.com>
Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/clocksource/mips-gic-timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 7907b740497a..abb685a080a5 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -115,6 +115,9 @@ static void gic_update_frequency(void *data)
 
 static int gic_starting_cpu(unsigned int cpu)
 {
+	/* Ensure the GIC counter is running */
+	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
 }
@@ -288,9 +291,6 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 			pr_warn("Unable to register clock notifier\n");
 	}
 
-	/* And finally start the counter */
-	clear_gic_config(GIC_CONFIG_COUNTSTOP);
-
 	/*
 	 * It's safe to use the MIPS GIC timer as a sched clock source only if
 	 * its ticks are stable, which is true on either the platforms with
-- 
2.25.1


