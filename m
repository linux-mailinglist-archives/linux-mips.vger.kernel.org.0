Return-Path: <linux-mips+bounces-7767-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFCBA35BD9
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 11:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3C0716D655
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2025 10:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D25262179;
	Fri, 14 Feb 2025 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TcZb+12+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DF25EF86
	for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 10:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739530267; cv=none; b=iKijeRL6mru/du89FCwgZKJHpUCiM/pQ28jVU+p6uLBoX3y4PD8TKvvc4GUTnS0tdTK4t5TweqhbWbec8mGWQmuPSA8tEfzdKUK9ySjaZARLuGhwA6bOoZCmf3GDA0imrO01fytMA/XRz11SXt8sfu4cRaajBfN1ptU/ep0HmBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739530267; c=relaxed/simple;
	bh=gwYxyreEN3pGOV3NrZRLVqoH/zKH2QbOCm/J1S5JV60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdCE5sbhBAlQhysk7kujMphXWZpvzXiCC5ka2QjOhdgpucb1a1J3o/7AFkZjBYKwQsLHXGwN3K6/uW23YhtkndjB904M7LEqeoQHsJyw5Y8D5Iz0O9kkJFxKtKwoRhP5oYp/N1VL4Xr6f9540ZgljB+340WBdnJVdOM6eJvAYvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TcZb+12+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7483b9bf7so245511366b.3
        for <linux-mips@vger.kernel.org>; Fri, 14 Feb 2025 02:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739530263; x=1740135063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxL2FaBUrpOAWNCMVoBQvC23Dop5UA6QRVM0Rz3a32k=;
        b=TcZb+12+YHL6HVU1QBoHdytCpOa+4g22pygSU0DtUnVJoAuzYx51swlW0vYp4EwBAr
         mHvFw0jiELgefMlBErcsFUxwVqd8Vf1G3wU5Mxk6XPxRHTi7J0G9PUwiG7cOEMM1JdsJ
         yu7ny3v95/tAyCNU0zcreSymb3ZhxkUKpq3Osgvd2nDlMJ32Q5bSUzMDkQgouIZhj0ZQ
         aNxIjqAUmexjFMS+XRoMbFfoEJFzV24rGayiPXa5M19SzBey/iCICabrI+kR5zihBsXQ
         KLyDCuHhr4ylAJaBtyIV81IokPmRC71Cp3RqrzymksjjDYmbzmgzQpV5Vi2cWwbNcVTH
         /EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739530263; x=1740135063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxL2FaBUrpOAWNCMVoBQvC23Dop5UA6QRVM0Rz3a32k=;
        b=nSSoTH/FXMCJL11Gs7B0VDCaP1dm6BOSmtk1zVB5GP3oWOd5vdnK12gQfo4rZfI2bL
         x08jO4prlovAA06wRUw8y8PImvuY5/GNaPvcGSESJwURWQePa+mZZ4LM+ZaAHCAP6LB5
         lEkuMG0f7Y+rZaGEFCdK2hwwi0WrXFBrvpagK5UjkQW1NBv9JgIDqhcAlSpqb34BWoVm
         LdAyBWs6hvbRqDLHDlpwTQy0i/U5VMSRJhH5dDXOWaU/GYohJ35LddLagzDZP3Zz6KZg
         MrVUBlR2v8DqnuEUdyiMKJFaxS7cfNXmlsRIU3p6yImtq5CSlONKl6lwPrAYw/9guWUz
         xLcA==
X-Gm-Message-State: AOJu0Yy930v5KDqsBAcMIwxoeaxrLg3I6rTOTSc3aPD5iMO36+DPHi7s
	U9YIHUndErhKdXQuY9YWcTD9ORgas3ddQ2dnZZ5X9yQNp8x+JVHh1vJwsGfvLZTq5YTrIsyQEV9
	f
X-Gm-Gg: ASbGnctAZ3589pBoW13+O7hLt2TGWWbn3Ei3OCjMBsy2vwlovxr9fWxMFRZZFa8mRWd
	vg/kfFW4K49HZsUjw1B2Qg5t/bizbj/kk8PjP3VF74Q3Ue9w078YWdp5i8P3lMNB9mr1c4+KRCY
	Ld4MFcs+oeoEo5H7mWOw+Ys9oES0GHTw2MKEyXUl2MovyVL+SD4n09dr821wWSMAsfXubEr+MWx
	6Q5uapQj0LLcCVOukYmdaqmQkA5S5L06V31DfQ71sz7j15zHJ5fFDJFa4KCk/GxF0UR32XknrbH
	zcSjhDgcGbEZTAs9nWXGFCj/3v4D5/lFLteJgKE=
X-Google-Smtp-Source: AGHT+IGsMMAb1DDvFmjMtF+aaP2n5k0vlIMg1XaFkk+rftooF0Uyis0c2tb4Y9A+t/xlLE92MIu12A==
X-Received: by 2002:a17:907:962a:b0:aa6:9624:78f7 with SMTP id a640c23a62f3a-ab7f3391b09mr1072096766b.17.1739530263251;
        Fri, 14 Feb 2025 02:51:03 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532575b8sm314551266b.44.2025.02.14.02.51.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 02:51:03 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH] MIPS: Fix idle VS timer enqueue
Date: Fri, 14 Feb 2025 11:50:47 +0100
Message-ID: <20250214105047.150835-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214105047.150835-1-marco.crivellari@suse.com>
References: <20250214105047.150835-1-marco.crivellari@suse.com>
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
 arch/mips/kernel/genex.S | 36 ++++++++++++++++++++----------------
 arch/mips/kernel/idle.c  |  1 -
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index a572ce36a24f..a78d5132c940 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -104,18 +104,16 @@ handle_vcei:
 
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
+	/* start of idle interrupt region */
+	MFC0	k0, CP0_STATUS
+	/* Enable Interrupt */
+	ori 	k0, 0x1f
+	xori	k0, 0x1e
+	MTC0	k0, CP0_STATUS
 #ifdef CONFIG_CPU_MICROMIPS
 	nop
 	nop
@@ -123,11 +121,17 @@ LEAF(__r4k_wait)
 	nop
 #endif
 	.set	MIPS_ISA_ARCH_LEVEL_RAW
+	/*
+	 * If an interrupt lands here, between enabling interrupts above and
+	 * going idle on the next instruction, we must *NOT* go idle since the
+	 * interrupt could have set TIF_NEED_RESCHED or caused a timer to need
+	 * resched. Fall through -- see rollback_handler below -- and have
+	 * the idle loop take care of things.
+	 */
 	wait
-	/* end of rollback region (the region size must be power of two) */
-1:
+	/* end of idle interrupt region (the region size must be power of two) */
+SYM_INNER_LABEL(__r4k_wait_exit, SYM_L_LOCAL)
 	jr	ra
-	 nop
 	.set	pop
 	END(__r4k_wait)
 
@@ -136,10 +140,10 @@ LEAF(__r4k_wait)
 	.set	push
 	.set	noat
 	MFC0	k0, CP0_EPC
-	PTR_LA	k1, __r4k_wait
-	ori	k0, 0x1f	/* 32 byte rollback region */
-	xori	k0, 0x1f
-	bne	k0, k1, \handler
+	PTR_LA	k1, __r4k_wait_exit
+	/* 3 instructions rollback region */
+	ori 	k0, k0, 0x0c
+	bne 	k0, k1, \handler
 	MTC0	k0, CP0_EPC
 	.set pop
 	.endm
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


