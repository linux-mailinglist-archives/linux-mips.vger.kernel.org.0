Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6056E688B4
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbfGOMME (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:12:04 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25447 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOMME (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:12:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192650; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=goKJQRfuPDqRNnw3ypaZD1J+WJgGJIWCnvOH5BLsdulOBJUmO1JnT/rz1IUPrAyaZ1TPfLD8TYwo5/BBUIBohhMW9xBFbOK2AUiHkYZrLS6yBVxklpYe0R6vVB+BdJn/2U17cJ1zplysxFy4z6zQM0wqHHOyNhgdd6nq3Z64CEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192650; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=N3Mb6pa93EPIEsYJUUP42DrdJg40ruU+HSgxWly/kLU=; 
        b=dBQvFYverYpt7UK4FOUYkwgQQYWxBgL7SQQOUhcCsnb6XcPwEMWYozWYDBhEdeQqX82EkPauljQ0EM7psl9yNHaj9Z6MTNO+l8w/P40ayxhINyga/eo/vmftkcix7OBCZL4KF2uPkNAzwn7E3EU49tl7m5aZnss1YTaG0F1H1ZI=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=pIvL8AhP6hPJ0Y8bReRi+5GwpufqBJMliPkzIbv+mzzCenRv+8RRNJHNK2Xx3iG/rQQKlZdRb4Xj
    D5kLUnfi0Hs5aRwiAhLcVDBfeHzhCdl76diH37fGpvmigp1MBC71  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192650;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=792;
        bh=N3Mb6pa93EPIEsYJUUP42DrdJg40ruU+HSgxWly/kLU=;
        b=J5qf+ihutLCGJxVFunXGLzW6P6S08EQieyLpUOJqr3CJy7xQuiLjtqCv/XOxULKY
        CG87tiQEopU+gpOEwuFfThgLPQeSmYjTlojJJwjCri+PMEpRrXJ/xZtvLtrDLeNmOCN
        aLw6hJgGyjSH6cc+o1UQXVluGjbD8DXY5N9BlhoY=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 1563192648716898.2755467319391; Mon, 15 Jul 2019 05:10:48 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH v3 8/8] irqchip: Ingenic: Add support for X1500.
Date:   Mon, 15 Jul 2019 20:09:55 +0800
Message-Id: <1563192595-53546-9-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the irq-ingenic driver on the
X1500 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index e8f7ae7..b72430c 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -180,3 +180,4 @@ IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1500_intc, "ingenic,x1500-intc", intc_2chip_of_init);
-- 
2.7.4


