Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5130A232EE9
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 10:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729008AbgG3It4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 04:49:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729182AbgG3Itw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jul 2020 04:49:52 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CE5C061794
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:49:51 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id q17so13417200pls.9
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EZ3vo3o4fkwi2u3isWcrvkspCsvOHO2HUcyzQaTNXYo=;
        b=cMxM2kQNFprtJ4h21PG46HIM7yxmcNQdJP2nW0IYAPZWKSCG+F8PNu96JZ5KHbHjiy
         olHWlyVRuBJqm7oHIGqrHECe0jZG9A3+VLjq0y7hHf6N3u2CtHHnM+NJgHny3JIOETM9
         b4xIxfkT0f4cVnp+wi9UbbZa9e9R2AGeWbRJ57kGn6t6RpEeIOCbWU1gH3yVMWnSAPbN
         3t2sCOvi+VfyWRbxTrWPqeE79Igy53hOuxqfgLQSMFJxTiHZ6Lr0xOUdIFITLSao9Ybn
         PMUT222ufETlg2f/mA2VEa56JymuA8cSHdggEPfZD0eqYwHtxGEl8/i67EgNn3w00+Fn
         jEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=EZ3vo3o4fkwi2u3isWcrvkspCsvOHO2HUcyzQaTNXYo=;
        b=OkD4TdY0Yd7yh6oaqbD6454zHO/4YdfMQzHExdc8wyF3sXFrHXi6ubpX/vuBJHCtGR
         eoeFbvlwSP5R6Na3ua9HhoSV+Ve0GQfhNsXRgR26m2FCs+7ej2EnistHu7OkiKjpckmV
         5idsn0umAHB+lEJGKxTZC8Qp+a4Fn88HVgtIOPsEG+YvGWTJm79R4DW7snjZgjiDJ955
         zSRV9cN/Fylzi3Qbf0ncOKj1DL0D4AjR1OXRfzQbvnh8A6q6XZLFH2dSZccb+tYeUGY3
         GxvWdeLFBavD+BhcCFnesMophjZr+JDohtsGGkMQMtwYMx3Js85FPNnWTLvVauuYx0AE
         +L8A==
X-Gm-Message-State: AOAM531Sgsnlb0B/1LWYER49GjKAAoqlgMa+aVmNerajBSPxogRZTJEd
        Mker5HGaLKTSqqb1iKfZUqc=
X-Google-Smtp-Source: ABdhPJz44ds3TWDy8oNgDPVMjk8mTkt+EwNzmVU3qDApE9CE42+yjGYRPay+oSD83xvAlu+ERN+kbA==
X-Received: by 2002:a17:90a:eac9:: with SMTP id ev9mr2147016pjb.106.1596098991234;
        Thu, 30 Jul 2020 01:49:51 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m26sm5235345pff.84.2020.07.30.01.49.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 01:49:50 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 2/5] MIPS: DTS: Fix number of msi vectors for Loongson64G
Date:   Thu, 30 Jul 2020 16:51:27 +0800
Message-Id: <1596099090-23516-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

HT irqs vectors are 8 groups, each group has 32 irqs, Loongson64C CPUs
can use only 4 groups and Loongson64G CPUs can use all 8 groups. So the
number of msi vectors of Loongson64G is 192 (32*8 - 64 = 192).

Fixes: 24af105962c8004edb9f5bf84 ("MIPS: Loongson64: DeviceTree for LS7A PCH")
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

