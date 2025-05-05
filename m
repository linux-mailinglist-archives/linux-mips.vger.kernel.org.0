Return-Path: <linux-mips+bounces-8920-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4253AAA510
	for <lists+linux-mips@lfdr.de>; Tue,  6 May 2025 01:41:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F3124614DB
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 23:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9974227A104;
	Mon,  5 May 2025 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjvXSeYf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4CE275117;
	Mon,  5 May 2025 22:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484130; cv=none; b=ficWsgxoNVJI+xjHYD72RhQvJZEMkbbA16sjmorXNQPXDmmouPWD/ASDS4KqSb76xjTTDMAp3RhpuxIO3hnTkeaYs9GHjVgSblVYkchTcC0AH3yOqo0qds0LNLLGJtCq11moWJxAUvMCVoNBEIj2+gTTu0b1vwtJPvNc7FfZYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484130; c=relaxed/simple;
	bh=6KNfdkq7+nJJc4z50yRL6RTsMFhOWiSBa+VXh12w1x8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n6Wobu4pYhy2gGAvTi3ZPzMYYhyg9zEoj25XUnMZ2PxKTK9tNubLsAg9fpCVsrhcviLEOQPpUxqQMWHLOwN5x9q3LFk6tTJgPKPu+3/Er6bdAHGm3anH4lOclPs20pyAGdTalZ4PiTuj8k1jM+PRTVTN88Y+yUbQAceysz+TbXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjvXSeYf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74AF1C4CEEF;
	Mon,  5 May 2025 22:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484129;
	bh=6KNfdkq7+nJJc4z50yRL6RTsMFhOWiSBa+VXh12w1x8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cjvXSeYfxcI85/u7yf/liythLyLTK6yAr3Q4eyd7MPEYOsDsXBs96nAmGUL4rvvOC
	 WxoJcjKWQp1+SxKdMObvHD+u+DOaW5Q8L6pUnFHZIeXzWdKotCgPyfOtGUr9yCYclK
	 6nkWHW+6qYYknuVYEbZMApLxtrY3puW6lsVPga88neLywuHVUCB8Bw23Fi8R8bM0d6
	 viTU+l05Qj21dPAbckaG6rV/bGOpqQdddvs4NTjxv9GM8XCOgnG4RxkJIF7U0Hi8Hh
	 jlTPhJV93ejJtD2nbTIg/ZHlWpzqdXm4zKd4wrRdw9na149kv51XE3o27LvB4BzjrI
	 ZVrXXs7Z1QtKA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Paul Burton <paulburton@kernel.org>,
	Chao-ying Fu <cfu@wavecomp.com>,
	Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	tglx@linutronix.de,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 361/642] clocksource: mips-gic-timer: Enable counter when CPUs start
Date: Mon,  5 May 2025 18:09:37 -0400
Message-Id: <20250505221419.2672473-361-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Paul Burton <paulburton@kernel.org>

[ Upstream commit 3128b0a2e0cf6e07aa78e5f8cf7dd9cd59dc8174 ]

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
Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clocksource/mips-gic-timer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 7907b740497a5..abb685a080a5b 100644
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
2.39.5


