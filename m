Return-Path: <linux-mips+bounces-7812-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CEA3965A
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 10:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F87B1886F5E
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7459122DF8A;
	Tue, 18 Feb 2025 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E1pWsDW2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE65228CA5
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 09:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739869341; cv=none; b=sY7NMjOeH2PuwZIjzSgbGralk5naOF3bH4oorb15Wco7E+Lmf7AJLOrPMgGwzPcXxKAz4uVoP/U/Cfde8wvBYhMeHmGw5ksc4YUYu4emrSPQheYWAiC90JdFHDL1+FIkP5eJImeogsbDLgUZmrHSLoK1OSTLm93vgqiyTViJ+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739869341; c=relaxed/simple;
	bh=Toj4I6NC5ptab4sOdsBMncNyFTi9IkwbkiD1DeRYZtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7PmKHZdtFznetU/fi6hryOB4FMFknCWyzowsOEtLCpghCGiGibYa8gJa43BVlHvNrVHhoC1vjMxYChgcNRpF+AaR/N2UjEijzdOkJmDqCVrwSrdu3YVVwFSjMYmgTBoBWsSM2gI+zLPycXUqU4kOf3ENCzshJFmqIMpQ+YHnk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E1pWsDW2; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abb8d63b447so269239766b.0
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 01:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739869337; x=1740474137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttk4YP8xSl/O/+/qQANH1g5R8r3FoMRWMrYgr2MYIQU=;
        b=E1pWsDW2qf8RzCBJM0hePsW5wwc+F1ua0eQexEcvn530hmzhh0HuVpZrEN2qBCXUvQ
         0LtpiphpsU2+9Us0e4dQ0SeJppX8sqxmv4eI3Ac4OKFxucoPLP7vjNFrBuLdzSbv/5xb
         LUlDWQNzpRKnE8tx7z6IlIDEvD61yLM1jhJ3pxqe1AKi7YNlBpsu4TerpRu6qy5IkwwF
         WgaUWNq7oD7FmXThnpz3pvzFAUnHo1Ob1LSXc7jjEftdrD3rWAn5wgh5jLV8/QiUHWzr
         OpCvMTNmkOK8PN+MhCdqR2HGd4rqpkeS5ngnKMtNNwWr44tOIBpy2J32HXdPszvH8US9
         +ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739869337; x=1740474137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttk4YP8xSl/O/+/qQANH1g5R8r3FoMRWMrYgr2MYIQU=;
        b=J56K7As2ROO8u/rbJjg0PjeOLUL9l+6rz3VixCAT2SfdSGxzX8lNBqF+u7JA7IZqhY
         ldSJJa2tJs8usLSP5yPQEhE0aGkBH+iXDkTvJUsndYlRiKFi2KIgQeIjHW289uar0Ov8
         yz7HsnJvv8n/0/YCWDd2G+T2iyNC5xRMmqDZYkVWfMc7iBFds8Xf5uHCjobmj4AZuuL6
         xf0uslUGL78zAKF4RRU36SKIVP6fkM5ccRGXZYybFihcI1AK/UpD+smdYOn4ewlkCT6N
         azodhxqCPnv0xAdYqrwZrgm9eoCQX0J/v99zI9wGaFb9YGhGnxkDnvIgmxgJmcIFm/RS
         rZzg==
X-Gm-Message-State: AOJu0Ywbk5d4W4fNrMVzetLBNRPe11r68/pToof3T6OAWkORGoG003kB
	KMk6N9z7AJTQt3nyd/Fatn/9X0ATFsBZ+uLzDsJkG0lXTJtPAt59pQeBi7Y85d2Uzczqqrb8Ky6
	rj3s=
X-Gm-Gg: ASbGnctMhNNTA+M3hwimC/tUzVBToQjxcbHDFLy9YtSrmQnON01ulxuY/MOK6OzCF09
	KjNO7J/Y7wIqZCjMuofV4NqEm41rrO5Im8dwQtOwjGqKfgRpm5pZuX3CAH/LefSzHMzpBKGTjGB
	QzbrtTmYansHOZ8XLlK7hBgUnQC08Q9ZngIPjN7rV4or3pfLCbfiuv8T4ShYS1nP2zEYOejk7xa
	xPKeJPpppYZFpzvBHiagDSkMBFNLCfX3bQn9da9t/1BhovWCATV7fV20tAs17tSAOJjTfboGau9
	YoOjZG1N8j1Pe7bRlKbI1DXvhP1nIDUqokcJMkg=
X-Google-Smtp-Source: AGHT+IEB18NezBAHpLOszPR7ZDRgDeDCo9SoFwSzOoZiQ+7tTjhHHgGdsHdnmldp/nJwW0VLEkJU0Q==
X-Received: by 2002:a17:906:318f:b0:ab6:eecb:41f0 with SMTP id a640c23a62f3a-abb70dda6c1mr1221775366b.35.1739869337342;
        Tue, 18 Feb 2025 01:02:17 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb89ac2e27sm477482966b.80.2025.02.18.01.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 01:02:17 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: [PATCH v2 1/1] MIPS: Fix idle VS timer enqueue
Date: Tue, 18 Feb 2025 10:02:03 +0100
Message-ID: <20250218090203.43137-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218090203.43137-1-marco.crivellari@suse.com>
References: <20250218090203.43137-1-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIPS re-enables interrupts on its idle routine and performs
a TIF_NEED_RESCHED check afterwards before putting the CPU to sleep.

The IRQs firing between the check and the 'wait' instruction may set the
TIF_NEED_RESCHED flag. In order to deal with this possible race, IRQs
interrupting __r4k_wait() rollback their return address to the
beginning of __r4k_wait() so that TIF_NEED_RESCHED is checked
again before going back to sleep.

However idle IRQs can also queue timers that may require a tick
reprogramming through a new generic idle loop iteration but those timers
would go unnoticed here because __r4k_wait() only checks
TIF_NEED_RESCHED. It doesn't check for pending timers.

Fix this with fast-forwarding idle IRQs return address to the end of the
idle routine instead of the beginning, so that the generic idle loop
handles both TIF_NEED_RESCHED and pending timers.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 arch/mips/kernel/genex.S | 39 +++++++++++++++++++++------------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 21 insertions(+), 19 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index a572ce36a24f..9747b216648f 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -104,25 +104,27 @@ handle_vcei:
 
 	__FINIT
 
-	.align	5	/* 32 byte rollback region */
+	.align	5
 LEAF(__r4k_wait)
 	.set	push
 	.set	noreorder
-	/* start of rollback region */
-	LONG_L	t0, TI_FLAGS($28)
-	nop
-	andi	t0, _TIF_NEED_RESCHED
-	bnez	t0, 1f
-	 nop
-	nop
-	nop
-#ifdef CONFIG_CPU_MICROMIPS
-	nop
-	nop
-	nop
-	nop
-#endif
+	/* start of idle interrupt region */
+	MFC0	t0, CP0_STATUS
+	/* Enable Interrput */
+	ori 	t0, 0x1f
+	xori	t0, 0x1e
+	MTC0	t0, CP0_STATUS
+	_ssnop
+	_ssnop
+	_ssnop
 	.set	MIPS_ISA_ARCH_LEVEL_RAW
+	/*
+	 * If an interrupt lands here, between enabling interrupts above and
+	 * going idle on the next instruction, we must *NOT* go idle since the
+	 * interrupt could have set TIF_NEED_RESCHED or caused a timer to need
+	 * resched. Fall through -- see rollback_handler below -- and have
+	 * the idle loop take care of things.
+	 */
 	wait
 	/* end of rollback region (the region size must be power of two) */
 1:
@@ -136,9 +138,10 @@ LEAF(__r4k_wait)
 	.set	push
 	.set	noat
 	MFC0	k0, CP0_EPC
-	PTR_LA	k1, __r4k_wait
-	ori	k0, 0x1f	/* 32 byte rollback region */
-	xori	k0, 0x1f
+	PTR_LA	k1, 1b
+	/* 32 byte idle interrupt region */
+	ori 	k0, 0x1f
+	daddiu	k0, 1
 	bne	k0, k1, \handler
 	MTC0	k0, CP0_EPC
 	.set pop
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 5abc8b7340f8..1f74c0589f7e 100644
--- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -37,7 +37,6 @@ static void __cpuidle r3081_wait(void)
 
 void __cpuidle r4k_wait(void)
 {
-	raw_local_irq_enable();
 	__r4k_wait();
 	raw_local_irq_disable();
 }
-- 
2.48.1


