Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C6A232EDC
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jul 2020 10:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgG3ItE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jul 2020 04:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3ItD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 30 Jul 2020 04:49:03 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC2EC061794
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:49:03 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ha11so3861687pjb.1
        for <linux-mips@vger.kernel.org>; Thu, 30 Jul 2020 01:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=qo4qJkkZijodV9ycIz7cYi4ledm+dhapr58GzUikPmA=;
        b=a+4drS9/MV70i8QOVVg7lijNCQ8vNkfyl5EOVtebg6Xld4b1eKg5FkYgZ9UrG/pRKp
         CyiRTCJ011uD9vsYjs6z1/Hp4wmaUvKyEjPIA3UVDXxgzU3PQOb4Dt5Qq+JX32j+j/VA
         asjiT445uacn/W3m7UOHrkPcn4Wbm4/H5oOljWOPLkY4fRHP+YSHhmtq0yte4Nf3yJgY
         XVkYpnZ5Vfv7x+A9ySbltRA+Uv8kLpRvFPAl7nMHl6DTxr42BzHS+mbFRprTsLo5lDem
         BMkSD7TkXMYP809pMbk4xEnLu2ZQ5CvPBtOdmuBtqdFtMHts8OVf9ihXbHQsSJrsZ5xx
         8bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=qo4qJkkZijodV9ycIz7cYi4ledm+dhapr58GzUikPmA=;
        b=T+SgmpqbbqeGQcvzxdUT/X3+14aSt3v+VpQdW8tVkqRQFDsLYXoX55WZ1WLEPIIB7g
         fQZSsnmtQIcWJrJJoLx2WxgU89jyz8k/vf1YGxtg5QR7GlgedJNqnOXHe5Ao11LTkA1W
         z8sWP01+tZne6dSp3gTx9+cJT6FwdDZu/AEZdC5bQuCRLEdQl5jVPLEGuhOznHHSvqlP
         cWJolV7J4ZyuFVo+n5Sssv2vo21bD299XSslNQAxRJqqO3lAZe+C4J6hWb4fh7Kzll1O
         cMhUI2umxULwRS2Fq5t8cpqhVXoGgsN5mj1QnwgCSBppg6beWc/yjf80d4d1ugpCHEH4
         bkLw==
X-Gm-Message-State: AOAM532jVC01HMp8BgVg8foevPxFuBicaBcEQhD4T2WLTSpr7bPxwWQz
        camumX0HCqCSOH7UAG59Hk4=
X-Google-Smtp-Source: ABdhPJxfMsrX6bRO8puwvHf5oE5H1ewNRN70d5pVzuHzeRv4G8JbVAPY1paMNbODWJj2qA+TpOuqhQ==
X-Received: by 2002:a65:64c7:: with SMTP id t7mr32047317pgv.89.1596098942418;
        Thu, 30 Jul 2020 01:49:02 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m26sm5235345pff.84.2020.07.30.01.48.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jul 2020 01:49:01 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 0/5] MIPS: Loongson64: Fix and improve irqchip drivers
Date:   Thu, 30 Jul 2020 16:51:25 +0800
Message-Id: <1596099090-23516-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modernized Loongson64 platforms use a hierarchical interrupt controller
architecture. For LS7A PCH, the hierarchy (from inside to outside) is
CPUINTC --> LIOINTC --> HTVEC --> PCHPIC/PCHMSI. However, the current
status is that there are several bugs in the LIOINTC and PCHPIC drivers,
and the HTVEC driver should be improved to support 8 groups of vectors.
Loonson64C support only 4 groups of HT vectors, and Loongson64G support
as many as 8 groups, so the .dts file and dt-bindings description should
also be updated.

V1 -> V2:
1, Add a cover letter.
2, Add Reviewed-by and Tested-by tags.
3, Improve commit messages by adding Fixes: tags.

Huacai Chen(5):
 dt-bindings: interrupt-controller: Update Loongson HTVEC description
 MIPS: DTS: Fix number of msi vectors for Loongson64G
 irqchip: loongson-liointc: Fix misuse of gc->mask_cache
 irqchip: loongson-htvec: Support 8 groups of HT vectors
 irqchip: loongson-pch-pic: Fix the misused irq flow handler

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 .../interrupt-controller/loongson,htvec.yaml       |  4 ++--
 .../boot/dts/loongson/loongson64g_4core_ls7a.dts   |  8 ++++++--
 drivers/irqchip/irq-loongson-htvec.c               | 22 ++++++++++------------
 drivers/irqchip/irq-loongson-liointc.c             | 10 +++++-----
 drivers/irqchip/irq-loongson-pch-pic.c             | 15 ++++-----------
 5 files changed, 27 insertions(+), 32 deletions(-)
--
2.7.0
