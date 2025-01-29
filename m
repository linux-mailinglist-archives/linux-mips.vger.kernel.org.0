Return-Path: <linux-mips+bounces-7633-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DB9A21D27
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 13:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AD783A61D1
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jan 2025 12:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DDA322A;
	Wed, 29 Jan 2025 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XamO8eYG"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B27010E5;
	Wed, 29 Jan 2025 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738153980; cv=none; b=ULv6LxvUNR/t5gvS+3Vd4FyQIW6EFKb3/gCD5sFUQ8u1Sm0ke87JZGOxnTLcSk+a0vqwLhZNCt2ADElCziiZKXpdEIrCGtruhgWV8x68Tt8O063Wv4oGLeQQrrWFUu3Ny0z87kD3ohXfabsgd06EDNDbjuoY6W0qEmtQXPsk9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738153980; c=relaxed/simple;
	bh=4JnwAaxzzTAViWg7ct3Xj13ZKq9MDJz4VfUrOXaNL+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ggVRLt1HuDjCTZIg4pGPDf1mpyt28GT6omIh+AeOSU59WTIeCNKCag96oFPpzgdjHhCHOPCP3tcmFuHHiOp5so6+vJ3qq5ZvuDZ+XV3AF+r2yyLYrrjXhoUsp8QeqhGNwf2eIJL6J9Lyc+tr+aweFaDq/ln6lyLafBoN2UtC5h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XamO8eYG; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5da12292b67so11028678a12.3;
        Wed, 29 Jan 2025 04:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738153976; x=1738758776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRZGYpywOr8SfCIjJp+/4G1Vc/5w1pIrXams/TeKR5k=;
        b=XamO8eYGm9QZ74mQ3Z36TYI9k5XrHLSi0PuG408XDatxncJ2symQZ1SWaU4H00T598
         uiOx9gxmn2jhz5soMoDsdFHl6chpY4rzTjeFlVcLNGkr9jy2F97qntoNhQagJ+aIutZ3
         wEwuHpZNQOJwdjKh3PxSpCOg6KQIZVAGzQ786EOAMcKcdXNV7lQb3Mii+8/68fGiDnpM
         S5sSAxPL68A6OnpxMGEit5/qawyFcsOM88As9VcXFDTjZYSEIF7wfdgoyIqdXanKEwea
         tEy55Dqn9COBxqcsdx9bOMpNLjY7MZdRjPujY6v6CHzj8qK6dePk/sM3RYjyqpEEfzWs
         TWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153976; x=1738758776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRZGYpywOr8SfCIjJp+/4G1Vc/5w1pIrXams/TeKR5k=;
        b=huiYq9mOIukkD5kII027GTfdLFSjkgSrPNaSWPr3FJnxaQDu+EVuDWDWv+QUtUG1Vr
         g/USPDeD8ITLW9Tpuj8sviyHA9PJU0HpTtUMQcR165vABzSyJ7ObBtPZ77jTAm3mRFFu
         AUyn6pMi3LmeKZqme6apKvvFg721symsLh6HFDoNjZUkYIqnM5UpXU4pjOpzn2MhdM4D
         +LcM1frUdlKCo6sJkbkic+CSvGQ6Smh0oTYGLCPFnFkJaLayblvRJBNS5DW/pWM0C2dT
         KG+nxHE4ulEhvUUqOX0YbZybn1snqUqZuNhJLoRyfeekUh0qib3O7maBVx5stN0NXOvq
         pRkQ==
X-Gm-Message-State: AOJu0YyMGKMVdD593ivsHYkOjNdRU7X6/3miVkzU3ESt344vPsYK3+dn
	RuNA1/yJb+uwwORMwxdyZPb3GAmnWX5Rd2hklr7G6PX50WYxxpFWXXIxQdnV
X-Gm-Gg: ASbGncvjUhWiUXDXckEZ3WEvkwvAx6M1km8npCw81hpWfs0nkyyeFEQ3zMVU4IQ2SaL
	Qz7wTy62PMLGv8MfIiHSUwa1D4vE/vTO3pSB3pnFCazGF9VmJKHqt5kiNyTU59yZ4WD2xxy1ads
	0nnwQC1X/gGt6YrWcALPub1gLQs9w9NErwNBHahwPiMYWvU2+otzW3/lEAaVwJHqVhqz0UR6HOA
	P53TimaOGbkyfBVPOtLuZD+B1EdrW3FgI1IBFP7YD1NlaoMsKSM4WeqNaD8+1eUUrri81FS6Wqv
	kJsmchzjwcx4DiTCAUFJRpduGbAUP/BW80w=
X-Google-Smtp-Source: AGHT+IE8Yh0fG806JI6Zpc4BUmUAg3gg85Hoi6TEqEqSyQJfl+B7oSeEefZYxLBUc05P539M6cXKrg==
X-Received: by 2002:a05:6402:42c8:b0:5d0:d3eb:a78f with SMTP id 4fb4d7f45d1cf-5dc5e6ce1cdmr7568674a12.0.1738153974583;
        Wed, 29 Jan 2025 04:32:54 -0800 (PST)
Received: from localhost.localdomain ([79.175.114.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab69051b1ddsm733540766b.180.2025.01.29.04.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 04:32:54 -0800 (PST)
From: Aleksandar Rikalo <arikalo@gmail.com>
To: linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Chao-ying Fu <cfu@mips.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: [PATCH v9 1/4] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Wed, 29 Jan 2025 13:32:47 +0100
Message-Id: <20250129123250.711910-2-arikalo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250129123250.711910-1-arikalo@gmail.com>
References: <20250129123250.711910-1-arikalo@gmail.com>
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
Tested-by: Gregory CLEMENT <gregory.clement@bootlin.com>
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


