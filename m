Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0DA688B0
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jul 2019 14:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729966AbfGOMLk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jul 2019 08:11:40 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25430 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbfGOMLj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jul 2019 08:11:39 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563192640; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=CJYj50WbOQeJSTK+kOVScq8xLzPTILaphLSxosr/JadYp6JiYT+hdVipCK7n/L4zbybAYU22dfPVU9gkVBsmN5ODlGRmE/oL76k+iBx54xtRIcPsvnsOhknX+QSF36t9RyFzxmXwpBT5WDjLcJySGUB1c5qGWdgkauznPOnXl20=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563192640; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=mQYoITJ6V4Kg8DJpzjIb7wX0ODs1dETarJKxAj7MTEE=; 
        b=iPENtIwwSUfonmD92Fk2MNv/iA51YsKLHjWqvzfzy8YrxWlyl6dGPKiJ+Kae+eOdjB7UxHOjC7aIj44fLQsYtX9vxyyF9CDUBwPFogffK9hslxU2zUT9a8G44xDQvPerVbXukhXfwl0qWzfOaFy/+lgWibW+pRC8xTE3qQn+gEg=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=SKWNO6Me69/c93h3TSU202Iv2y+WFPG83f+5UBcy/HmW6r6Wcj0fwWXLcQCzxtTzx5br52diXP9C
    7aswllRQad0gbL3ncM17/W+XoZqPPwG9dlfIzXfqYnm9mwMz4yjc  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563192640;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=892;
        bh=mQYoITJ6V4Kg8DJpzjIb7wX0ODs1dETarJKxAj7MTEE=;
        b=ATuH8fCLZHIJ+jNGukP3pbQ/01jmCKXEchTFwqBbT3wsZP9HPOv9DE4+kik7ncau
        yURlrn8EC4l97raqoQgtJfdx8Dg/Kbb/VOoe62Zgz1ETTJybpoMVgh9TA8cHq+WKY7q
        dgfYcG9jSnb86XXt9ma3UiBkJB3X6bKh+IrmvrTQ=
Received: from zhouyanjie-virtual-machine.localdomain (117.136.70.36 [117.136.70.36]) by mx.zohomail.com
        with SMTPS id 1563192639756461.797413665397; Mon, 15 Jul 2019 05:10:39 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul.burton@mips.com, tglx@linutronix.de, robh+dt@kernel.org,
        mark.rutland@arm.com, jason@lakedaemon.net, marc.zyngier@arm.com
Subject: [PATCH v3 6/8] irqchip: Ingenic: Add support for X1000 and X1000E.
Date:   Mon, 15 Jul 2019 20:09:53 +0800
Message-Id: <1563192595-53546-7-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
References: <1548517123-60058-1-git-send-email-zhouyanjie@zoho.com>
 <1563192595-53546-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the irq-ingenic driver on the X1000 Soc
and the X1000E Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/irqchip/irq-ingenic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-ingenic.c b/drivers/irqchip/irq-ingenic.c
index e9e959c..e8f7ae7 100644
--- a/drivers/irqchip/irq-ingenic.c
+++ b/drivers/irqchip/irq-ingenic.c
@@ -178,3 +178,5 @@ IRQCHIP_DECLARE(jz4760b_intc, "ingenic,jz4760b-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4770_intc, "ingenic,jz4770-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4775_intc, "ingenic,jz4775-intc", intc_2chip_of_init);
 IRQCHIP_DECLARE(jz4780_intc, "ingenic,jz4780-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000_intc, "ingenic,x1000-intc", intc_2chip_of_init);
+IRQCHIP_DECLARE(x1000e_intc, "ingenic,x1000e-intc", intc_2chip_of_init);
-- 
2.7.4


