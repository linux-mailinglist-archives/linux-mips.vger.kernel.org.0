Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F432232EDE
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 10:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728993AbgG3ItY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 04:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3ItX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jul 2020 04:49:23 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58558C061794
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:49:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t6so18573pjr.0
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=++P31NeE21DapI5PKuZBnfatNTZfMQFN1Qtq98D7WGE=;
        b=ax4JzCzOn2+Oq/cIMpVqHe3FJEeS/Jj9XNp35lFV8CYdoLLRrMg+l2w/Mr5B82jucS
         wO2+w2RP9pu1SKMPmZy832qTQHO2HIxf2/I36vUU0Vv48YQmczRRE13vt2/8mj1wvxT5
         YzVwFUp5pGDnkxDlslZw1zowWdazDeDlzltaD0TidmaG7qsnZL0RIY3PxF5Kl0WB9kDO
         Udpjxyk0oxI7xQSDpokm1IL3tyI6CPPfJgAcMKdvNJhiDNc4pq78oUPM2owXRpVEzH7/
         8Q/e05U1jPXklT3TyvGsZOGaeqRdXGl6EEmU5ecPXaGPVmY50jzqfxDdFow7HTviB07b
         3PYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=++P31NeE21DapI5PKuZBnfatNTZfMQFN1Qtq98D7WGE=;
        b=jhl2Ok4Fw2ReVK+HPRsAG2YN50ZaXPM3PsAbR3oprdW2RmR3NOcfY9uMYCgM6DjGT6
         xA7P63jbpmq9qbHKwPSjh7vux4SI7DPiBG7LskhGkkfiPrH0AMlQP6DLwvpqTDz3GcVk
         y+DMAqeXHlNLg8h+zPUeHo/1SbZmeptwJoUBdcnmyA93zttQPM75Y1VgkqeEO/FIa/sO
         YNh90GVCqO3ggq7xE0dplwnsSjLWVdu8u5Ft/Vvqk+JZLon5FOWHOPMupGx1uBAEn+/q
         XkktYPDgX+bnOMio5ZDY0Ebz267n26RcsIZQrXUlJv+lypjOnBeKizezRaaXb/bO4Tkm
         LeRg==
X-Gm-Message-State: AOAM530cB24+gG/paCzFkjPCm901BOO3u8P/G4Zi+rDowkRhqzX3e9lc
        DOn9WTPhSz1jD+cn5JysWG8=
X-Google-Smtp-Source: ABdhPJzVFPoGOkdoc/bdWgYVnynCkpQTlmOWmD1u+mHRCgosogfM1oVtA6oNKVxrle3zHvEdEpmhug==
X-Received: by 2002:a17:90a:1b42:: with SMTP id q60mr2187989pjq.78.1596098962961;
        Thu, 30 Jul 2020 01:49:22 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m26sm5235345pff.84.2020.07.30.01.49.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 01:49:22 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 1/5] dt-bindings: interrupt-controller: Update Loongson HTVEC description
Date:   Thu, 30 Jul 2020 16:51:26 +0800
Message-Id: <1596099090-23516-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
References: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson HTVEC support 8 parents interrupts in maximum, so update the
maxItems description.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 .../devicetree/bindings/interrupt-controller/loongson,htvec.yaml      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
index e865cd8..87a7455 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
@@ -22,8 +22,8 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 4
-    description: Four parent interrupts that receive chained interrupts.
+    maxItems: 8
+    description: Eight parent interrupts that receive chained interrupts.
 
   interrupt-controller: true
 
-- 
2.7.0

