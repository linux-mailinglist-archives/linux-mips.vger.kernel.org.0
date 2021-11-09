Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB9E44A682
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 07:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240727AbhKIGDE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 01:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240251AbhKIGDA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 01:03:00 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7466C061764;
        Mon,  8 Nov 2021 22:00:14 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id y5so8177184pfb.4;
        Mon, 08 Nov 2021 22:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5gHzMheW2cBOJlJSsKIh4i/zI9xMB2DCmdP1eTUrjhE=;
        b=iwqsIwicIIN1QgDcDi+VbpROPn1UMZi1wtQIT0ae74KsIgkdYWfks6B1uN1NLX+2YM
         Yr8D4eoswgHrZZPLruQhcY7cekwOdpNNQlq+3VyKkUj0lP20uNzTRtu+wlQmQ8P9BTG2
         5DJWJCdPjNfvmwMKobrUsP+X77f2MFynQR4mHrbLSeF62b/uUb6pgZxLULHkbA5zf92q
         Ij8KTZ2nXZR5dag5jhKJ9AV9+vozBQv/3NJzVQAxtJwj1rtdnjbeuR3wdyPaXsgLI72B
         wCf9TlTGQUGE/D2y28U86dKy/Cgqc3GqrBUfjIFSmbjVxH5iUA4KGLJFBl+3/ySEW+1N
         UhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5gHzMheW2cBOJlJSsKIh4i/zI9xMB2DCmdP1eTUrjhE=;
        b=5qpJJxUHAmeaxQvBwyB2HsZOEQqCS7TVH9EfXfnVZeCWJ1GcTNrCDMlU7rYrEe8buL
         iLb5QuCY+BWShzDbPdT752ovSFz1kN93ryu4MOZ/Ss3HIF4INXq16Qrw7921MrRPZUs+
         ZQkdDw9lIh3SoyMOdEFkBz0I8g4/YlCL7AMyp4ujm/qCEzblcYRHBDP+T2NN344fww8r
         CurF5BO4u0T8YHCNAhrkcWWIfA47yGupfdSWFEXY818sTFIWgazQtAANbToppX6uWOxy
         1gEiw49jWiUqKxYObAIPL9MZHs41LmTL01It3/YLt8yh3no2nhjxfx33m0yHjt8syf0V
         SJZA==
X-Gm-Message-State: AOAM5307yedzicJyosuSHj19QisWEkkFh9xT9XLRnLUhVAXnJFPoOLyN
        DaIMZ0YPety1whrAe8PY2Ko=
X-Google-Smtp-Source: ABdhPJz4k6PugH5yU567C5yQVMVx+hFjLzp7HO29M4PzLu1OGmPxaSRzoC5p0alrIiZD+h880oWk7Q==
X-Received: by 2002:a62:8f93:0:b0:49f:ed44:54ac with SMTP id n141-20020a628f93000000b0049fed4454acmr5342735pfd.72.1636437614205;
        Mon, 08 Nov 2021 22:00:14 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id f15sm5200093pfe.171.2021.11.08.22.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 22:00:13 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To:     f.fainelli@gmail.com
Cc:     bcm-kernel-feedback-list@broadcom.com, cgel.zte@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, maz@kernel.org, tglx@linutronix.de,
        ye.guojin@zte.com.cn, zealci@zte.com.cn
Subject: [PATCH v2] irqchip/irq-bcm7120-l2: add put_device() after of_find_device_by_node()
Date:   Tue,  9 Nov 2021 05:59:58 +0000
Message-Id: <20211109055958.130287-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <04935513-dea8-ab98-ed97-8ef778e44318@gmail.com>
References: <04935513-dea8-ab98-ed97-8ef778e44318@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./drivers/irqchip/irq-bcm7120-l2.c,328,1-7,ERROR  missing put_device;
call of_find_device_by_node on line 234, but without a corresponding
object release within this function.
./drivers/irqchip/irq-bcm7120-l2.c,341,1-7,ERROR  missing put_device;
call of_find_device_by_node on line 234, but without a corresponding
object release within this function.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
v2:
- Restore the code at line 329.
- Do put_device() when we stop making use of the platform_device, which
is at line 241.
---
 drivers/irqchip/irq-bcm7120-l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index d80e67a6aad2..bb6609cebdbc 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -238,6 +238,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 	}
 
 	data->num_parent_irqs = platform_irq_count(pdev);
+	put_device(&pdev->dev);
 	if (data->num_parent_irqs <= 0) {
 		pr_err("invalid number of parent interrupts\n");
 		ret = -ENOMEM;
-- 
2.25.1

