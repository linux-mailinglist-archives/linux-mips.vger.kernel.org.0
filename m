Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE2CE2343F3
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 12:10:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732383AbgGaKKp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 06:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGaKKo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 06:10:44 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A330EC061574
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 03:10:44 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id p1so16955206pls.4
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 03:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/18yX+QhpCHQL7uLlUv4BeS0wQVLShfX8b0wqPUJf8s=;
        b=pN+r8Y/SDIdTXPhOIgmGR1LWkJGw9a6RGZYJP07hFqnBUNfHj2IoTqrxv6ThlfAypZ
         bfu569z2GFEBprYdWWIc4PZ6nFRnpUmr3GYJl+7GSeArm0RLtVhLRqvoNTXKZatyl3o8
         58Fbh26seTwQeN4QPVUo+9n1uB7IxxhDwELmff2tkHNQXfnCURYYbDT1TAwx2ANRDRbI
         d9k5c7hejiqUysOZ+dQO49zgfmT4HiKjjWvvbLAHLL2snxhsAftax/AxAU7RdcUS+Mau
         huXDq7sMwze7zMWTFsvAOrQoJ7/F7uf/EAJ3fBzU8R6YjGOtGybW0C1nGZO2VtLHRbT3
         d9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=/18yX+QhpCHQL7uLlUv4BeS0wQVLShfX8b0wqPUJf8s=;
        b=jkXtSixbfBJGR3JRh2uTjqSODP4ZWvBfG5IcSVPIqmta9jWNn3R7i3ofHFzlYRGQEH
         7EBgTDaa9vwnqrIuPbyDe/BtBUry5pshgUacH/UZdMaui1u9dz7T3Tvf8ZbXXITP8Vec
         dR12HbxmFpTphedFP3n9gpKV7DuCZxxB/AsmES/ydk3XurdkF0YcwnVJiGP83oz/QPHK
         pqQo/C9HYD0DhKhyO+iWLm5wKKPXhmY6tN6DD3a3kkdgTilvlmBjSuCOdQrmMpArUu3/
         TVpe8AbUtp2KDKYZmSMCPwLz7Wf0T0NHxm9xcUXN00MG+DNcUlB4BsUUBvmaguNlci4K
         FIBA==
X-Gm-Message-State: AOAM532abf6JwvKlY4nJnLA3WGsdn2+po9SyCzqnV17xgTkmvJiB8v+N
        DqM6fSNChsD04UWbWBpCwOM=
X-Google-Smtp-Source: ABdhPJysNokpztz7xgwSpKSjmrSRfLvS7myEOcfcUUZphX8eJpJ7y2eMWycs395RBJ7wRGFJL0aFOw==
X-Received: by 2002:a17:90a:ab96:: with SMTP id n22mr3416901pjq.52.1596190244286;
        Fri, 31 Jul 2020 03:10:44 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m19sm3313385pjv.34.2020.07.31.03.10.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2020 03:10:43 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 3/3] MIPS: Loongson64: Enlarge cross-package node distance
Date:   Fri, 31 Jul 2020 18:12:51 +0800
Message-Id: <1596190371-17405-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
References: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

NUMA node distances affect the NUMA balancing behaviors. The cost of
cross-package memory access is very high, and our benchmarks show that
200 is a more appropriate value than 100 (for cross-package numa node
distance) on Loongson64 platforms, so enlarge it.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/loongson64/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 901f5be..ee4fedb 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -79,7 +79,7 @@ static int __init compute_node_distance(int row, int col)
 	else if (package_row == package_col)
 		return 40;
 	else
-		return 100;
+		return 200;
 }
 
 static void __init init_topology_matrix(void)
-- 
2.7.0

