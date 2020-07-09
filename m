Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAD121AA8E
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 00:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgGIWbk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 18:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgGIWbj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 18:31:39 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B392C08C5CE;
        Thu,  9 Jul 2020 15:31:39 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o11so3944276wrv.9;
        Thu, 09 Jul 2020 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=i21YO/2HZyXZNTbYkhCu9RBrriTl76O4ArhjFidKXBg=;
        b=UiJS+BDEjt5Aqe3nETuc1pmdz+lzwzHFf5lez6nC+K8xQ7m80WnQu8z/y1e9Jy560p
         EtH6mNq8Ai8BI4clC/dI1KqklTkbxdlOnzU46aTnJ5cLtyrX/kqgskma+n5lLVVdPT4F
         217KitrazPAMtff+jqc6lkd8cJfYopmBDYG0tzuVBu06V5kbbPZPJVyL1Xoq8Rsgt8fW
         Cbjr6OZNbK0ExHEQfS19bnu6jiUKVo6ZsBHkJ8el3nZgUWuULkLQlV1WUDp1ZhcdIgWm
         u1FeFuUzHB4NyxNAWSi1jcZ5ECt9EfwSIzddTCfQWJwfpJSUmA1C/nhpqFrft9/MnU4w
         Svyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=i21YO/2HZyXZNTbYkhCu9RBrriTl76O4ArhjFidKXBg=;
        b=fPALl81ZX3PRiPQCuG5hE1boczzEBMSdVpgGIvO/O8ktWJDb7M9ma9Gt7xbcOLbThY
         8PUTe4tcp98isjR1JR6Vr80IfATxpJO8t10C6e/ipFpe1zT6KMRRclqTqSEp3CcCg1Ry
         0ArS/qfuUc02qWNa9Aw8ALGUtx+WJ16t6IPmg3Q6PdUPybOHzVvJU4UUhY7XAD8pcysC
         kch9HPbcreBvBpdixYe5WNtYWDUVoVs99NtPoxuqhdL/KxfLi1gos7j2l9vsi11G870w
         bTaHt4stkCZtdDYft3VpljFbk1QvLmZytQR79KkFXajOUz1qobmRMarynUy7OnWnx9EV
         PTZw==
X-Gm-Message-State: AOAM531W8k67IM9AHlD/9+4GilItRlAp1gPvq8hFO/Pu1O+0ae1+75Ry
        G7edZxpr86r0y9Eyt9LY5WS3WztX
X-Google-Smtp-Source: ABdhPJzn17fKsArJKHCbz7Qsf6L6cMtZsu+WBTCg6l3V6F5Mv/yNgDf22xFvimMz+MM44vKkiAzYvA==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr66987742wrt.5.1594333898079;
        Thu, 09 Jul 2020 15:31:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id m10sm7375267wru.4.2020.07.09.15.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 15:31:37 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM7XXX ARM
        ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX
        ARM ARCHITECTURE)
Subject: [PATCH 5/6] dt-bindings: interrupt-controller: Document UPG auxiliary L2
Date:   Thu,  9 Jul 2020 15:30:15 -0700
Message-Id: <20200709223016.989-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709223016.989-1-f.fainelli@gmail.com>
References: <20200709223016.989-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Define the compatible string brcm,upg-aux-aon-l2-intc which is used by
the Broadcom STB UPG auxiliary always-on interrupt controller.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 .../devicetree/bindings/interrupt-controller/brcm,l2-intc.txt    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
index 98602f1d1e91..021cf822395c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/brcm,l2-intc.txt
@@ -4,6 +4,7 @@ Required properties:
 
 - compatible: should be one of:
 	      "brcm,hif-spi-l2-intc" or
+	      "brcm,upg-aux-aon-l2-intc" or
 	      "brcm,l2-intc" for latched interrupt controllers
               should be "brcm,bcm7271-l2-intc" for level interrupt controllers
 - reg: specifies the base physical address and size of the registers
-- 
2.17.1

