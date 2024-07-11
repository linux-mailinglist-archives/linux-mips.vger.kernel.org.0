Return-Path: <linux-mips+bounces-4279-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B492E235
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 10:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA6E01F247BE
	for <lists+linux-mips@lfdr.de>; Thu, 11 Jul 2024 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DB3158D79;
	Thu, 11 Jul 2024 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLyZzj+Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232561534E1;
	Thu, 11 Jul 2024 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720686439; cv=none; b=P6bHBGQFMsLcPHmLuf2Qe9IydNNtfhoGDSmX1TYtQbpPGIfmyGwjodrW92CHzeeTX/9Jsd3TZB98wjVdd6BCqloVZOgQoqObOKpaV9MJ1O+XL/H4YI2InZF22FP/hxm+PHt9qb1Nn1hmQeOD0xTuvb9EkLWdW0gyDLpwGrhGaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720686439; c=relaxed/simple;
	bh=BWru3gbDwB+xSMlpt5VLhdUAAVAvJvSrq4mELPxfulU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k+hZxbGtHqrMja+qwlz2pLm4da2N+JXaLCdKjo38wJBVGHEP9S4fBugH/y4MwqYoWHbTD4vmSo7JEmEoK2XbQ76KwOSE8CD/lrFbzI+3MBAejnUfdjOZ/M2xU4I7TaIzKtKPiF1RYlNMoKJaLBqlPExbEXJbkkb8BR3BHnwWH5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLyZzj+Q; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3678aa359b7so1048532f8f.1;
        Thu, 11 Jul 2024 01:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720686436; x=1721291236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCY8yakOgFx6ixafaMq4NF6KqoNRvoG64yc9U8LV1IM=;
        b=ZLyZzj+QGam2kYwwTxi2dkSaMTHQY7nHWMDRSxyTzJ/Wb/Y58vCWS8IePByspDzqsC
         xyWJkLuGq7qY7hVFz3PJ4yN906eA1HQz5Rx/xT3v4dI8IOEoqgkZkNODghp3Yv6mWCdh
         tffCTYlGBvhv6HVmIrgR6dTby5IcvMX5aa9mZq6WW2z1CKga3qXlKMF9pLYp0/uhLBI1
         kU4kZeY/R8rpPrkxKJii30Zund+iGmarKUiKcGehPkW7XUvjPiucXPoaFwHsV3oNSEFg
         Njswls/bgvg6Nxp+Bg3aVP9/VXEp+eiEn2zAf0uIMZJLAdFN3WSbtyukiBo4WUGHp1AH
         7sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720686436; x=1721291236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCY8yakOgFx6ixafaMq4NF6KqoNRvoG64yc9U8LV1IM=;
        b=rLzumfULtfqq6NHt9gCdqBAoGjC46MBRHyevhB1gsmRUCfCuJzJdag3mUxjFvSt0iG
         9xZdPEeJuUndemR/EMcx3KJrI9cEb9sT6Ze/mr+05yh25lc+J4p5emKA3z4ei5KFNRad
         rhap/qR6r8WLpf+6MX503lvkaIpzo+6LZu9rVPH7KKyN8QydWAQo6W9FzZKiPfPAgUXF
         h7j7P1diBwFRKXqAlWEMFe5hErGOa7ZGKrrqSELRtrpARn7qL9jZAD/PP6Lu1TF2btzW
         t2rGufhvt5s7fNtkWbhXzLOMCh6hSZkr2wJxL1nAVXbeFFm/LcorYbxBB/JGgmoQGRi3
         6slg==
X-Forwarded-Encrypted: i=1; AJvYcCXsgHz54TAEuFbYdLCNOEw8Go15pW+dIQ9m8TI/rm8lhM2HRhMlQvXfDOg5Qy9WL1psYspSf55Daj8sAAiudBQPWVWZFL+53kDNihOFQ0DMNiEMjrxMfpEqxSmcUlFROQ6An1AZo0g7Kw==
X-Gm-Message-State: AOJu0Yz5HGNNIt/NCrv1Lrey0xkwSeRuKAV/I/UAAUIvtmOH31srhPRe
	FHcyxoIKB0dywzwH9ipCHpXQnfz8bF6ENi6Q7cMNQSfkdaGznT//
X-Google-Smtp-Source: AGHT+IEjSYEEaX48FshcXj6CxYudxam3VGcC/uxrHOKGP4C6F0fyeI+wv5B6A6KMEDqcGR/KY0ulgw==
X-Received: by 2002:a5d:42c9:0:b0:367:3282:a258 with SMTP id ffacd0b85a97d-367f717057emr704191f8f.18.1720686436374;
        Thu, 11 Jul 2024 01:27:16 -0700 (PDT)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84712sm7134283f8f.33.2024.07.11.01.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 01:27:15 -0700 (PDT)
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
Subject: [PATCH v5 08/11] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Thu, 11 Jul 2024 10:26:53 +0200
Message-Id: <20240711082656.1889440-9-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240711082656.1889440-1-arikalo@gmail.com>
References: <20240711082656.1889440-1-arikalo@gmail.com>
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
index ebf308916fb1..4d7659c119e1 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -114,6 +114,9 @@ static void gic_update_frequency(void *data)
 
 static int gic_starting_cpu(unsigned int cpu)
 {
+	/* Ensure the GIC counter is running */
+	clear_gic_config(GIC_CONFIG_COUNTSTOP);
+
 	gic_clockevent_cpu_init(cpu, this_cpu_ptr(&gic_clockevent_device));
 	return 0;
 }
@@ -284,9 +287,6 @@ static int __init gic_clocksource_of_init(struct device_node *node)
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


