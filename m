Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980CF3220AE
	for <lists+linux-mips@lfdr.de>; Mon, 22 Feb 2021 21:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbhBVUOV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Feb 2021 15:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhBVUOV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Feb 2021 15:14:21 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3E2C06174A;
        Mon, 22 Feb 2021 12:13:40 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id o82so423927wme.1;
        Mon, 22 Feb 2021 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1THKtV2zIVCWufgt+M4ifL17ZkPeASTyRAQBJ1PEQ0=;
        b=FX7g0fWoAMMAkmGyFCW1xGtTYun5JQPB38Y+u9Sd6XsJfdWoDykhWWYVYjYZXffG27
         j3o2IGFqg01a4BgRnLAd+jZCQ+liCm/2K7RgCJus7nvTXmUmNZkXz5EM6JhJoqVnz7oY
         FJTsK2/dtz6Md9M50HoC6I1Tz3AwEJNuWCja1CtsCfm2hiMe8Z6wTTzJXzC89AlJq3OB
         smdQwvXqc8tsqgU5iSQku9AF5ROZMWhOaEnFOf33jd80F+kdSXlTZIeEcZFgIesQrqDf
         gHXZYKjLopM9hC+RliHPnyiShxY0KyNkXgZIL/5Xl3R40fmJGKbb0dfr+tjXjBia5CVa
         vn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N1THKtV2zIVCWufgt+M4ifL17ZkPeASTyRAQBJ1PEQ0=;
        b=sYlViScmRk+kkb3DyRf0rMPJFSjlPZvCu6u7SqidbmvygND41PmecLV0B71RSFzmRs
         2epsEWuey5l3qqaN1qLwggZyJRF4SVsPwPn3VEi26u9MftNk7DyLrrsJtOLGl9d3TFXP
         X74CdV31gGIchk/ylh2B2Fu9oCRXslyzy7nd3cm9RXcFPHFrv/A6pQsGyzaRBk6qnTqp
         nYOgX1cKTccgFbmfDWfKaXE4u/QcfGwnzPFPO0vGt+7z9lwMRz5yhOBRdUdsXlYjjtll
         qVFZXE7TyayaEsn7o7X7OiwT9qHq+feugNtJpu+wg7Z6Knvm1R5zPpF7afOv3fc4i2+E
         qRvA==
X-Gm-Message-State: AOAM532/dghCguPSpO6/4odmg2ULdYF7d3zkZUK+mWV0D08z6mm6nRrb
        6S2w1KIlAclxUGq/Yc3MzCo=
X-Google-Smtp-Source: ABdhPJzUCA8dbqs8IfAZLg4/4SON/yBBC8O27c8wPEJ5lNmMdpzg3g17Z13vFDpk6N/hhQT2FrzbnA==
X-Received: by 2002:a05:600c:4fd5:: with SMTP id o21mr21217669wmq.20.1614024818782;
        Mon, 22 Feb 2021 12:13:38 -0800 (PST)
Received: from skynet.lan (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
        by smtp.gmail.com with ESMTPSA id h17sm21619818wrw.74.2021.02.22.12.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 12:13:38 -0800 (PST)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] irqchip/bcm-6345-l1: fix SMP support
Date:   Mon, 22 Feb 2021 21:13:32 +0100
Message-Id: <20210222201332.30253-1-noltari@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some BCM6358 devices start with Core #1 instead of Core #0.
Apart from that, SMP is restricted to 1 CPU since BCM6358 has a shared TLB,
which makes it impossible for the current SMP support to start both CPUs.

The problem is that smp_processor_id() returns 0 and then cpu_logical_map()
converts that to 1, which accesses an uninitialized position of intc->cpus[],
resulting in a kernel panic.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 drivers/irqchip/irq-bcm6345-l1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
index e3483789f4df..b2173ce4743d 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -121,7 +121,7 @@ static void bcm6345_l1_irq_handle(struct irq_desc *desc)
 	unsigned int idx;
 
 #ifdef CONFIG_SMP
-	cpu = intc->cpus[cpu_logical_map(smp_processor_id())];
+	cpu = intc->cpus[smp_processor_id()];
 #else
 	cpu = intc->cpus[0];
 #endif
-- 
2.20.1

