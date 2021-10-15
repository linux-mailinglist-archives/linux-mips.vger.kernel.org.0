Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8F5842E9FF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Oct 2021 09:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235895AbhJOH1p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Oct 2021 03:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234392AbhJOH1p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Oct 2021 03:27:45 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ED5CC061570;
        Fri, 15 Oct 2021 00:25:39 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id r2so7801611pgl.10;
        Fri, 15 Oct 2021 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QkztVd7RJfuqxUOBKk+YDRUaI0H2x7WbBGD/f7b+t1w=;
        b=Z9cR3eVlFmeG4xxsSQyvxeCSBmGkP/+c9AW3bTIFUjh+PDzXyfxC8vQF06xQk+7TT/
         7H6GL2GDZxVQLvrf8i+hUA3m/Y1aUo1wRl43sJEoghojBGOq2XYJjmjPVRr4xodYpTA7
         dN2PBHkMtUJbQc2F1YA5BWfb3oZpL39IkyNYauqW50sPAVEYN1IDrCu5cVfrEJbnMbMt
         nzhCjigqVtFZ3NjoMq6ouhnVGKMp/V2eIXDiG4uQUend+1RZMRyxnOhxocc8lplB7V9U
         hCdpD6Qa44g35mn+l/p8/v+pHAnMaWE088y1UbhzXgWtlhPapUE/OGmqdpAPT3CjJ57i
         RJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QkztVd7RJfuqxUOBKk+YDRUaI0H2x7WbBGD/f7b+t1w=;
        b=r3WxbFu2qGNTEudxcjzGu94QWEkCo36nRIcx8Rcti4erd6MfwAvYa3dvMk48nIBV/q
         gg9FerjzGwsg09syt9gHGCT8ONPOzy9+SYGy1ZgOR1qHjPLrgi+n/6+nYnkNler5TXzb
         NNojirGl5KvpOVbDaLOkic4TDrnI2aXwTv2DWBoHjMSWcW5pqh7iADRCrqRukN5OFIpL
         +O79eG4C0awvWvsiq9O4Ml9lTm1SHq6TfptEvBJEDKhm+qNVFY3Uf2RfA4vHbN/GdrUM
         W9kO08sPhYHf4V8uXJu72htiRjczJYW6Ty4nyPJsLH/+1IM/hUTleTj6JmZKTMwsiTbO
         VJSw==
X-Gm-Message-State: AOAM531PQFpFeep2Z3m/uErZEM8j33+ZtRUvM4eMjVBZ22eXRu53Gk61
        eKrM4T87wTtnr0I6GK04tZg=
X-Google-Smtp-Source: ABdhPJwziKbw9/4jfsU9dHOu2/83LgZYuNj2I+PuWLIEaggouAFkjP2Fygjt7bVm7p3sRcXMS773ag==
X-Received: by 2002:aa7:9523:0:b0:44c:c171:9ae with SMTP id c3-20020aa79523000000b0044cc17109aemr10250669pfp.75.1634282738721;
        Fri, 15 Oct 2021 00:25:38 -0700 (PDT)
Received: from localhost.localdomain ([124.126.19.250])
        by smtp.gmail.com with ESMTPSA id a12sm10547856pjq.16.2021.10.15.00.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 00:25:38 -0700 (PDT)
From:   zhaoxiao <long870912@gmail.com>
To:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com, tglx@linutronix.de,
        maz@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] irqchip/loongson-htvec:- Handle return value of ioremap.
Date:   Fri, 15 Oct 2021 15:25:23 +0800
Message-Id: <20211015072523.30615-1-long870912@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: zhaoxiao <zhaoxiao@uniontech.com>

Here, If ioremap will fail. It will return NULL.Kernel can run into
a NULL-pointer dereference. This error check will avoid NULL pointer
dereference.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/irqchip/irq-loongson-htvec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 1cc0bceb4472..a36c20f44ec4 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -267,6 +267,8 @@ struct fwnode_handle *htvec_acpi_init(struct fwnode_handle *parent,
 
 	priv->num_parents = HTVEC_MAX_PARENT_IRQ;
 	priv->base = ioremap(acpi_htvec->address, acpi_htvec->size);
+	if (!priv->base)
+		goto free_priv;
 
 	/* Interrupt may come from any of the 8 interrupt lines */
 	for (i = 0; i < priv->num_parents; i++)
@@ -307,6 +309,7 @@ struct fwnode_handle *htvec_acpi_init(struct fwnode_handle *parent,
 iounmap_base:
 	iounmap(priv->base);
 	priv->domain_handle = NULL;
+free_priv:
 	kfree(priv);
 
 	return NULL;
-- 
2.20.1

