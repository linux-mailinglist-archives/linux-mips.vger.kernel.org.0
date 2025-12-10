Return-Path: <linux-mips+bounces-12431-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 74611CB2641
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 09:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FC38302A952
	for <lists+linux-mips@lfdr.de>; Wed, 10 Dec 2025 08:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960B22FFFAC;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuwBnLMw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA0C2FE566;
	Wed, 10 Dec 2025 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355001; cv=none; b=glXTIYOKsuooOniRRM9MYXKI3ibjEhZ14gn/LAdIqp/va9iIGojXy5I5trydDaO71+qFaJ4EOZHV52Lludtbu5rrqYHfqyLu/Igu53kOpgpxIqa/V8TCj70HCJJN1tsupA2hc8QLc0kqfFeK0jXUcBQPxLn6x2X5GBji4o0qMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355001; c=relaxed/simple;
	bh=ta7Rj04LqynwKRB55oqJL23eDlqkUxKemCp332ah8yQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PI5wmC0iTbf4J3H94wTORleVrwG8ze65/uqKDHrBm6itqINk6w1xWq1AL2hIqn1cYPeTF0tQj8fjrxcZdrTj+5JLMlBGgYyOWDnQpCeDEuG+SX/2TnvVW+dlNbD1GeH34dMJmSqBhs7l3wqTTqBXoSpVLHEZwZvnLrY55va4BVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuwBnLMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E457EC4CEF1;
	Wed, 10 Dec 2025 08:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765355000;
	bh=ta7Rj04LqynwKRB55oqJL23eDlqkUxKemCp332ah8yQ=;
	h=From:To:Cc:Subject:Date:From;
	b=EuwBnLMwtx3iUwJeXGV06zVOXAm4ZDcxsgYW6gVRvQd75jK6y0TTM8ud0pEOq169H
	 7l7PVn6Y946SQRwNsSbMsxumVgPJZAbKIPemqudbQjjlqBu2i7bZzW/es01AjZim2h
	 egBq+eXwGFLYdANdD1YTI3eWEN790uXbcRH54uFemlw9psbLD8gm+hYOV6qLiyXPuO
	 xdu4NAsKrtEVSf52UJRWnquAenxAP+5qR4qbjY4ARZ0yYWtXTKMnvsI9HHPsGYCF5X
	 AiSPO4H52SxHCZtCvZ/eIyYGN44IcLWx5TReEhqFeuG8ESVqFP4VO6x6isRKJ4Smyf
	 6w+uO1yRC0oCQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTFTi-0000000BhIm-2wuv;
	Wed, 10 Dec 2025 08:23:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Joshua Kinard <kumba@gentoo.org>
Subject: [PATCH 0/6] genirq: Post 6.19-rc1 API cleanup
Date: Wed, 10 Dec 2025 08:22:36 +0000
Message-ID: <20251210082242.360936-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, tsbogend@alpha.franken.de, kumba@gentoo.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false

Fixing the issue reported at [1] pushed me to look into some of the
ugly corners of the percpu IRQ configuration, and to notice that:

- we only have 3 users left of setup_percpu_irq(), all MIPS timers

- none of the timer drivers using request_percpu_irq() are passing the
  IRQF_TIMER flag (this function doesn't take a flag argument)

- the IRQ_TIMINGS subsystem therefore cannot identify that it should
  consider these interrupts as timer interrupts, and would mistakenly
  take them into account

- but as it turns out, nobody can enable IRQ_TIMINGS the first place

- so passing flags at percpu IRQ request time is not required

The cumulative effects of the above is that we can:

- drop the IRQ_TIMINGS stuff -- it was never used, and Daniel
  indicates[2] that there is no immediate path to finishing it

- replace __request_percpu_irq() with request_percpu_irq_affinity()

- convert all three MIPS timers to request_percpu_irq()

- finally kill setup_percpu_irq() for good

Note that when it comes to MIPS, I have only tested the GIC timer
change, as I don't have any SGI HW anymore. And even that was on
QEMU. I'd appreciate someone with the necessary zoo to give it a go on
actual metal.

Patches on top of [3].

[1] https://lore.kernel.org/r/aTFozefMQRg7lYxh@aspen.lan
[2] https://lore.kernel.org/r/3f3d42d2-13e3-43ef-b839-f77424769add@linaro.org
[3] https://patch.msgid.link/20251205091814.3944205-1-maz@kernel.org

Marc Zyngier (6):
  genirq: Remove IRQ timing tracking infrastructure
  genirq: Remove __request_percpu_irq() helper
  mips: Move IP30 timer to request_percpu_irq()
  mips: Move IP27 timer to request_percpu_irq()
  clocksource: mips-gic-timer: Move GIC timer to request_percpu_irq()
  genirq: Kill setup_percpu_irq()

 arch/mips/include/asm/cevt-r4k.h     |   1 -
 arch/mips/kernel/cevt-r4k.c          |  11 -
 arch/mips/sgi-ip27/ip27-timer.c      |  10 +-
 arch/mips/sgi-ip30/ip30-timer.c      |   5 +-
 drivers/clocksource/mips-gic-timer.c |  10 +-
 include/linux/interrupt.h            |  24 +-
 include/linux/irq.h                  |   3 -
 kernel/irq/Kconfig                   |   3 -
 kernel/irq/Makefile                  |   4 -
 kernel/irq/handle.c                  |   2 -
 kernel/irq/internals.h               | 110 ---
 kernel/irq/manage.c                  |  49 +-
 kernel/irq/timings.c                 | 959 ---------------------------
 lib/Kconfig.debug                    |   8 -
 14 files changed, 16 insertions(+), 1183 deletions(-)
 delete mode 100644 kernel/irq/timings.c

-- 
2.47.3


