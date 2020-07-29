Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0519523190E
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgG2FTi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:19:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgG2FTi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:19:38 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3ACC061794
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:19:38 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t6so11288370plo.3
        for <linux-mips@vger.kernel.org>; Tue, 28 Jul 2020 22:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=ewZZRdK/39FBGeOZ2tdi5SzHsAw8yPQ4ikGUHdjm5hs=;
        b=qHpWviH9HPFswtRVxclGSvtvOrc6xoZxCcAr+u7ZrCbUyYya31xDpWaAZBv2kvzS91
         qWxxgy/9jLQIKQoPMgIB8dg73zqBv08flkULGIyzobt3jErpA4rVkVQjwnqQw1S0UZjY
         FNroOeQXz+5UfOlH+jadnDH2P1KEQpN4JAAQm7oM+cnB3sNEvKt7qlJvw+C86uJHVtKC
         cB3xIGrCH7Gy2kHSRU4S6ceji1mHcWIy4IteOrNIcmWTLayNJFftMhJUzZJTkASmqU3k
         XdpIOdKN4S0i+2d+FykkZ7IBht/DREnKDo+rHDpu3QQbgUgTsON+qsqwyILeXpU8Wuqd
         Tx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=ewZZRdK/39FBGeOZ2tdi5SzHsAw8yPQ4ikGUHdjm5hs=;
        b=gFEMoahxJjvyr+q9HWJ/a8AsFXE/HhP1g6mZV8YtfwzgSk/FxNudQtkWQoewZxz2t2
         zo5ORmvNRwxgxFR90dWA35Yy4ByCY049s9SS2BuhLh9Op/u18uobuXgdbMtrkMTQlJtc
         Fwr/ZCKWqrFmJTis3Hd5VjA4OZKVUBLrCt2CyDom3/jSbrrxy+g9PUa1CWuiINVHm8QC
         eaHKGNG4eQiyd9HYQBCy9Ti2D+aqzyhSb47DTncDzw48Usa1nEbjosknhxRsdaET9moy
         uwxOns1Ebaqg6bWCV/4d5cwut1Resyy9BtZ9gGOx3IKkwxuso9ZYHrTS3+kbhL8Mjh8V
         DIww==
X-Gm-Message-State: AOAM533PIAtgu0QycHZQp0LrVrg8Knx/v6rlZmM39FTNLfhTsnd6b+Vi
        zUpZi9JipJhw3GWZdflLnXU=
X-Google-Smtp-Source: ABdhPJz3o0TsfQB/3LKddJMtFU+H2muKyWveQX3Skfj2pXYMyqZ1vdm/yZt4u69mCp4bRFoo1RXcAA==
X-Received: by 2002:a17:90a:ea8e:: with SMTP id h14mr7873159pjz.105.1595999977737;
        Tue, 28 Jul 2020 22:19:37 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id l4sm739539pjr.46.2020.07.28.22.19.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 22:19:37 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/5] dt-bindings: interrupt-controller: Update Loongson HTVEC description
Date:   Wed, 29 Jul 2020 13:22:06 +0800
Message-Id: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson HTVEC support 8 parents interrupts in maximum, so update the
maxItems description.

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

