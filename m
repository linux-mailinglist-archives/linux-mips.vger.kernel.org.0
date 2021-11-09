Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4206E44A55A
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 04:29:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236434AbhKIDci (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Nov 2021 22:32:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbhKIDch (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Nov 2021 22:32:37 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9A0C061570;
        Mon,  8 Nov 2021 19:29:52 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id g184so17179888pgc.6;
        Mon, 08 Nov 2021 19:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhZqPslPlwCnqLTI/WB7O6N7RveewfK/Aqs6JCnISYU=;
        b=RqpAOosE7XNYqdqnaB8/r2gGhpjrMkQfysk/L8Ytt/ZF5vTYcWVSl1c5X8sNeB1aMP
         LjzgQQRmUQIScLyS+/EerYc5dkJi82LuuAo6p4afIojfDgduzEWiKwmOI5Jz3/jZ3CZG
         b22soZicGXWe0xkFdfSXOjyEdhs4Cfq/Qvl0yt8mmBIcUuDMAd7XEZI8+Yq+GdgmmhwD
         ZhxUhIzphP367vFxDOZElYXsPWwod2nIkJBpzjNxv4ibftMeXceKT/RYWtW1j8+zB/Rw
         qLGznQk3m7NvWiIlvNgIrt468n6Cd7QuFQpvHPkJOHcu9SLYC6ak1eDQdY12xjkq2xdq
         /NtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OhZqPslPlwCnqLTI/WB7O6N7RveewfK/Aqs6JCnISYU=;
        b=bpTT21mAp4VSWsNSQkzhLDrxlsexFumDpJG1y4x7W3/zDCP5CgNXxJb/wPWEgEzly2
         bV7DczaoqXHGw22Muw7cDZyWViC6ktvrTRwyoW+FFP2Fh4d0ITXk0KBedvaPg8/lq7dn
         0gt+QZsCYdS3wBsN5O5olGyMEGvnQeZN2EeFeTvojnSj85bolAtWhhNwmRpHVc4mvW5L
         cSyFQXzujq3CS2vuG1bQQXwmB+F6l0h25JPptF1GiNQvqzhb50EApCVuE7mIzz+3xkX/
         fdQBQfGY8svS0LkXqcH6eTUjGa0An7d7I2ddxlhVCX21R47trB8gQNB2RRM+Am2hXIZ/
         Lmvg==
X-Gm-Message-State: AOAM533kf54rROH6a4vT3Nco0JFKh2JRLh351YUv6HGbQd54izM4RMED
        vhkrSKUVM5MJfznJkf00qfPc09wmo78=
X-Google-Smtp-Source: ABdhPJyMqm9opwSeavzaK+7vIeiMXlwiPNWB+4JEFYopvyZ3+XzP5wPMtcn6G6FGVammOWS8oJFBTg==
X-Received: by 2002:aa7:82c2:0:b0:49f:9e1a:7da3 with SMTP id f2-20020aa782c2000000b0049f9e1a7da3mr4349775pfn.60.1636428591118;
        Mon, 08 Nov 2021 19:29:51 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id c8sm7857959pgh.23.2021.11.08.19.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 19:29:50 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To:     f.fainelli@gmail.com
Cc:     tglx@linutronix.de, maz@kernel.org,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Ye Guojin <ye.guojin@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] irqchip/irq-bcm7120-l2: add put_device() after of_find_device_by_node()
Date:   Tue,  9 Nov 2021 03:29:43 +0000
Message-Id: <20211109032943.129855-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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

Addtionally, fixup the potential problem that memory is not released
before return.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 drivers/irqchip/irq-bcm7120-l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index d80e67a6aad2..aaa70619f3c0 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -325,7 +325,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 	pr_info("registered %s intc (%pOF, parent IRQ(s): %d)\n",
 		intc_name, dn, data->num_parent_irqs);
 
-	return 0;
+	ret = 0;
 
 out_free_domain:
 	irq_domain_remove(data->domain);
@@ -336,6 +336,7 @@ static int __init bcm7120_l2_intc_probe(struct device_node *dn,
 		if (data->map_base[idx])
 			iounmap(data->map_base[idx]);
 	}
+	put_device(&pdev->dev);
 out_free_data:
 	kfree(data);
 	return ret;
-- 
2.25.1

