Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0845D23190F
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgG2FUP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726319AbgG2FUP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:20:15 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ECADC061794
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:20:15 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id w17so11271291ply.11
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wgl47zlXLMmHZ6eEnoQJBs9qSoBOoLqIxj7epSy1h8w=;
        b=iDeSfvGC71I9U3K2ZCwFkvEJkzM/d6d5nYOnxa+1KsD6ljTlTMnZrhdZbeVx6IOVhF
         b1jS6dBnpo9VEp1i/O5mMj3y9Ajlr2zupP/KNnCXEo2viOZR1PWZ9LMmdSFscwYb1a89
         a48SjCUZTJ8xvOXmJG8YNrm8lHT/gsw2b+lOpUnGiZIuOwMHnCZCJk6PaDCZro7Bv0Ok
         NtttaUjkLp0iCgs8LTurgj4KloKAaeKhYLgbRQHJhfHRMlqWxrEwPi9G/MOHoNfVSTQD
         BotbEfqbpY15i7nsUlCDB6Byd5/8tFxZSUobdcrUbaeoZRYB6bsKSTneVDcA/yV2kIkd
         a1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=wgl47zlXLMmHZ6eEnoQJBs9qSoBOoLqIxj7epSy1h8w=;
        b=mXXatSBlwRYfK2LD10A02HYtJSbjZVNNwhcgLWiYoKlm2lLIveauzBhv+JDYufsVEA
         +/T5tFUCX2t9NlJHfL6jCXCuuFsd88VKCgsNcDE7uiqAu9h3owwA2vD5yRm0XSHpgYUU
         M843UsChVccoH/MgLk6tEnNLfyyKmEsrTrzkDmOx0dM8nTUgMOUsp9ADiF0kUTYHaLKQ
         XIDXA3bVCJcfJ93wnubrlFYMUYXiZCVe3nOLpgrXtGhimL8qrkB8zhgycf5B2woh2aMi
         NYIU/w8S+XkKrcbMIoqvreFWsYd9ZZiKLknGiyPU8VlVRkjh/WdsYR7bM+U8zlQJDdAw
         yulA==
X-Gm-Message-State: AOAM533aednRiNrAtCGU6Ez4DPo8+p3wTIgXUmp2BKZL4LcrUI6HAifG
        sEWX9WkP6ulkv8wodyC8kl0=
X-Google-Smtp-Source: ABdhPJzXURjIVyqhfHtWZngMUHMAV1b3NqT9VBPtTJDD/rsFVyopdHF0NVo+7i24WfL/YHIFgo3PVQ==
X-Received: by 2002:a17:90b:1116:: with SMTP id gi22mr8323651pjb.8.1596000014822;
        Tue, 28 Jul 2020 22:20:14 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id l4sm739539pjr.46.2020.07.28.22.20.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 22:20:14 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/5] MIPS: DTS: Fix number of msi vectors for Loongson64G
Date:   Wed, 29 Jul 2020 13:22:07 +0800
Message-Id: <1596000130-8689-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

HT irqs vectors are 8 groups, each group has 32 irqs, Loongson64C CPUs
can use only 4 groups and Loongson64G CPUs can use all 8 groups. So the
number of msi vectors of Loongson64G is 192 (32*8 - 64 = 192).

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
index bdc911e..c945f85 100644
--- a/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
+++ b/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
@@ -20,7 +20,11 @@
 		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
 			     <25 IRQ_TYPE_LEVEL_HIGH>,
 			     <26 IRQ_TYPE_LEVEL_HIGH>,
-			     <27 IRQ_TYPE_LEVEL_HIGH>;
+			     <27 IRQ_TYPE_LEVEL_HIGH>,
+			     <28 IRQ_TYPE_LEVEL_HIGH>,
+			     <29 IRQ_TYPE_LEVEL_HIGH>,
+			     <30 IRQ_TYPE_LEVEL_HIGH>,
+			     <31 IRQ_TYPE_LEVEL_HIGH>;
 	};
 };
 
@@ -31,7 +35,7 @@
 		interrupt-controller;
 		msi-controller;
 		loongson,msi-base-vec = <64>;
-		loongson,msi-num-vecs = <128>;
+		loongson,msi-num-vecs = <192>;
 		interrupt-parent = <&htvec>;
 	};
 };
-- 
2.7.0

