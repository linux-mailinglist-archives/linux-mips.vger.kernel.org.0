Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29F6F2F1193
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 12:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729380AbhAKLhD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 06:37:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbhAKLhC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 06:37:02 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7404FC061786;
        Mon, 11 Jan 2021 03:36:22 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id d2so10781847pfq.5;
        Mon, 11 Jan 2021 03:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=u4zCRiO4TFY3Cd502e/7E3igZAqf0yWD6hiEeS0tq/Q=;
        b=VGHWQlZrUzym90xYdJpd1KIhCZW/kvkNaRxr8RDC4g9V2ryg5jehOMXZMrTxelfBaO
         67r+42qBM+CiRz5+dB6sfG5oippbhP0R3rGqOLKN9HrxxiUgkbpz4gGJEb/dJajI8+mW
         p03WIBEJIMSNHIHX77YYZH8HrvDEMHwmxHpnV6/P7aqONrJ0jazJtE+ClzZoRZVpf/rJ
         IuXMS6+yGxX6Hgd+Lj1dH0WymXc1lv9N0uUCydG6r1cMx2qz8/QPKNCD7GybJrInAWeD
         C5zD78pgxABlkW5YcNrkBe1d+y4UfXaGlSTS2B2T3TCl8c/+g0HpfbYjVoou+0Y6w4ox
         8A4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=u4zCRiO4TFY3Cd502e/7E3igZAqf0yWD6hiEeS0tq/Q=;
        b=f6IZhaGMCrRx5VCohlDm+6VCGVgeSSKD3o5X6vjBivHg9MSMQisjpbFsd4Ev0v+8Gw
         Wk187jw/KaYmxS7bVmtjwPBYr9Vi4Cn5DTCwrlIgRXtZN/YKyODbs/RfrC6m+L7FLB7I
         8yqNPDEwpkiZwxUfQlyCcZXyty+nd9tOtTJ7dHxyM5GHewkPf9QQHjCwPUNIXWB5vgON
         ocP7kPH2VoW6oDwIkA+NXl3gFy6l1iNkAVTye2wkaYw6pND1hGFCDn192c/9HdQL+4MK
         A/PfRU9hOmsTrGcB0NdpvISU/OfRE3rT0wEjfSp4UPlT74vUXpU8AXqz9lcwDciUw7Yn
         f9AQ==
X-Gm-Message-State: AOAM533TT5bSf7/6VPASGs8qbXrlzdTUVLDmYLp/4l06/LeeUb8zSQcv
        6hgEjCQK6fTv9rqpfQOdmVU=
X-Google-Smtp-Source: ABdhPJynbSCybCgvKLCWksVtvnUrv4NNOp764XCoRj8IVpwHxdxY36hS930nZHSbYxh0+LI+FuwdUQ==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr19016658pgc.359.1610364981363;
        Mon, 11 Jan 2021 03:36:21 -0800 (PST)
Received: from localhost.localdomain ([178.236.46.205])
        by smtp.gmail.com with ESMTPSA id u12sm19757927pgi.91.2021.01.11.03.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 03:36:20 -0800 (PST)
From:   menglong8.dong@gmail.com
X-Google-Original-From: dong.menglong@zte.com.cn
To:     paulburton@kernel.org
Cc:     tsbogend@alpha.franken.de, dong.menglong@zte.com.cn,
        colin.king@canonical.com, alexander.sverdlin@nokia.com,
        gustavo@embeddedor.com, ralf@linux-mips.org,
        peter.swain@cavium.com, aleksey.makarov@auriga.com,
        lrosenboim@caviumnetworks.com, david.daney@cavium.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: OCTEON: fix unreachable code in octeon_irq_init_ciu
Date:   Mon, 11 Jan 2021 03:36:05 -0800
Message-Id: <20210111113605.3863-1-dong.menglong@zte.com.cn>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Menglong Dong <dong.menglong@zte.com.cn>

The type of 'r' in octeon_irq_init_ciu is 'unsigned int', so 'r < 0'
can't be true.

Fix this by change the type of 'r' and 'i' from 'unsigned int'
to 'int'. As 'i' won't be negative, this change works.

Fixes: 64b139f97c01("MIPS: OCTEON: irq: add CIB and other fixes")
Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
---
 arch/mips/cavium-octeon/octeon-irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index bd47e15d02c7..be5d4afcd30f 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -1444,7 +1444,7 @@ static void octeon_irq_setup_secondary_ciu2(void)
 static int __init octeon_irq_init_ciu(
 	struct device_node *ciu_node, struct device_node *parent)
 {
-	unsigned int i, r;
+	int i, r;
 	struct irq_chip *chip;
 	struct irq_chip *chip_edge;
 	struct irq_chip *chip_mbox;
-- 
2.17.1

