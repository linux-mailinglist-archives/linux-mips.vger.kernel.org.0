Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF0F780B9
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2019 19:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfG1Rfl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Jul 2019 13:35:41 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25554 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbfG1Rfl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Jul 2019 13:35:41 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564335301; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=CQPKLgoNNgn13oHB8qjgxhVwiVlr1Nu9BmhfO4J1E0zVZyyMhvu4LmjvBa19UCujoeOsGkP4TsAGyexvHKCeAOFbuRyGD8tel8veVFRf0hnNEyCaYce7LgaUUepr+/ptvipYLvyT2q5Z0P5NliNa2s7jktcrrB952h20FZvri30=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564335301; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=3CvKS/H8g2Jlg6NBAPjVHVx9G8RKBMCrmsSG6pfSt8E=; 
        b=QPqbHxaT91SwGP+7wPNv/Y7IEpwwrGzTfsXoirYSxuD9cae8xxGJ/0kfN9Lfd53q/gJa20D2ybjxSj0ymefUsyW5Fa+M5+cbXzd0V7E8mUDczLug9zEfLkZ1yfrMDfa1iTQFc0cuJe8AcxEBLNBgpgGq4XNO42qUz9OH89L9iUc=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=u8xjmfuNDa+fnCoOK4V0Q7KctO0/8yQxz5RAMlLanwBdJmCwWYmMNKLxTFIkM6vbTmpk2MPu/B5D
    jGEeGc4I6T6Br4atfrYJQT2esaBsQaHUkKk94DJ4A/0n/p66MVaW  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564335301;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1183; bh=3CvKS/H8g2Jlg6NBAPjVHVx9G8RKBMCrmsSG6pfSt8E=;
        b=fmid9nFT16RQZtkkJQxAFwtaw39JwX7kn59qVNv1tTOgTtMEpYFRW2Ax3JdVlEsU
        0rz+bDzEcA5EA8IzFRWTXY3OeqT3mMRIquze0SmFFqqZ8po4vckZAI/NBZb3plQTp1j
        eWmvdAir4qaWCA9Ui/8yO4UVvp6ohl+lrdDZudgw=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564335300084683.3522199792209; Sun, 28 Jul 2019 10:35:00 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, tglx@linutronix.de,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH 4/4 v4] irqchip: Ingenic: Add support for new Ingenic Socs.
Date:   Mon, 29 Jul 2019 01:34:33 +0800
Message-Id: <1564335273-22931-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1564335273-22931-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the irq-ingenic driver on the JZ4760/JZ4760B
and the X1000/X1000E and the X1500 Socs from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index 8430f5a..b72430c 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -173,6 +173,11 @@ static int __init intc_2chip_of_init(struct device_node *node,
 {
 	return ingenic_intc_of_init(node, 2);
 }
+IRQCHIP_DECLARE(jz4760_intc, "ingenic,jz4760-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(jz4760b_intc, "ingenic,jz4760b-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1500_intc, "ingenic,x1500-intc", intc_2chip_of_init);
-- 
2.7.4


