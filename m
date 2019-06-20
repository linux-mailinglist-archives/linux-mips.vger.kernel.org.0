Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 841424DCD3
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2019 23:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfFTVj3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jun 2019 17:39:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35966 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbfFTVj2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jun 2019 17:39:28 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so3298651wrs.3
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2019 14:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=acjgtnfZM5+ljClU7KhpnoMYZUUlOHiWM5nNWs1Eo98=;
        b=VGQ4w5Go605TQmCEYTXdnEQDLuDjBy/4JC4cTBrBAgCQUaxEahj8OY/ca+bYkEhRb1
         5vG+vdbpFZWXSKBiMT9o5Zh9pgpCALb/NX2DRTif6PIR//2N1lVt68IftTKHmtmznsLd
         Hq+hB+eS2BGdyfSMm2D7xEO/V4pPxazNFsklE8qPwElNFwL3iFs81us4qlRAF0wCvAkg
         afebjHELKRfpKk+TLtiiX7jZ3DMqYKdvP//GQ7jUKEht4ncUKcBMmzMZW3u9OYqWquLW
         OL2NHqalQqYN6X5pF6p63LcR1eNmiZ/iTnaIjft/kUgV1RM75kYb8sFugqOpUfBggzYJ
         hfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=acjgtnfZM5+ljClU7KhpnoMYZUUlOHiWM5nNWs1Eo98=;
        b=rJc5gPQLIsqzuepc3Z2efYw6eNgNhYPdXcVylTzIp0FeG+sY1PyhLBUMTxuvqFnLt5
         qRlLG+FEJxyak5BxbNWDeKC+28mKYVxHs27lEp1lCGYn/72MsAFQEVtEAhXVA14ng4It
         OaQKO1jwxcK/SDgXE26oZRM/iHE3plbz71Bw3gCveYVP5s7A82WET/L+5RyZcEJ8Q/uN
         eCaWF77ecTavnH3AA+eVO2qthZOyOEh5PH8oMYlzaEoRh5l4heABrAwY6mzZFSWzj6x9
         ZXQ2+7Nic2x94knOv6vOqiLVELtxm3eAM9LenHzMF0XpsZ3SuGNy4VlV9Q0FcnH8mg0M
         E0Sw==
X-Gm-Message-State: APjAAAVK0iSDu86W95hXqu+oVyoIcna1Uy84wl9ZXCHe1XeaMGErH2HT
        48updezmC0eO0u0ENDgzT3s=
X-Google-Smtp-Source: APXvYqyPH8F2fDKmvqu44PVP/pItOJUWglqn49sM52ko+RQL8xu4mDYvtnmW5Y985xINnlkXV8PDxg==
X-Received: by 2002:adf:eacd:: with SMTP id o13mr21094872wrn.91.1561066767148;
        Thu, 20 Jun 2019 14:39:27 -0700 (PDT)
Received: from kontron.lan (2001-1ae9-0ff1-f191-ecaa-d74f-d492-3738.ip6.tmcz.cz. [2001:1ae9:ff1:f191:ecaa:d74f:d492:3738])
        by smtp.gmail.com with ESMTPSA id j4sm575426wrx.57.2019.06.20.14.39.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 14:39:26 -0700 (PDT)
From:   petrcvekcz@gmail.com
X-Google-Original-From: petrcvekcz.gmail.com
To:     hauke@hauke-m.de, john@phrozen.org
Cc:     Petr Cvek <petrcvekcz@gmail.com>, linux-mips@vger.kernel.org,
        openwrt-devel@lists.openwrt.org, pakahmar@hotmail.com
Subject: [PATCH v2 4/7] MIPS: lantiq: Remove unused macros
Date:   Thu, 20 Jun 2019 23:39:36 +0200
Message-Id: <4b59c74cb4dcf89ae034c4cfe71d942d7588ad7f.1561065843.git.petrcvekcz@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561065843.git.petrcvekcz@gmail.com>
References: <cover.1561065843.git.petrcvekcz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Petr Cvek <petrcvekcz@gmail.com>

The last use of both macros was in 4.11.

Signed-off-by: Petr Cvek <petrcvekcz@gmail.com>
---
 arch/mips/lantiq/irq.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index 2df5d37d0a7b..21ccd580f8f5 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -54,10 +54,6 @@
 #define ltq_eiu_w32(x, y)	ltq_w32((x), ltq_eiu_membase + (y))
 #define ltq_eiu_r32(x)		ltq_r32(ltq_eiu_membase + (x))
 
-/* our 2 ipi interrupts for VSMP */
-#define MIPS_CPU_IPI_RESCHED_IRQ	0
-#define MIPS_CPU_IPI_CALL_IRQ		1
-
 /* we have a cascade of 8 irqs */
 #define MIPS_CPU_IRQ_CASCADE		8
 
-- 
2.21.0

