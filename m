Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F02211F304
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 18:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfLNRzP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 12:55:15 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33717 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726931AbfLNRzM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 12:55:12 -0500
Received: by mail-pg1-f193.google.com with SMTP id 6so1198856pgk.0;
        Sat, 14 Dec 2019 09:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nt2pN2PNTd9g1AzNbzq97oeN58SK9gcKW9K3SpO8TF4=;
        b=Gv/VdsoRgHpB/c2yhY2FchQl8GlLj2LlyDV4SziV3wj7136aNHsMcLqaDjKfQbUYQ5
         Ldl81jRSZL58cvErn85BIIYXKzfWUj5bfw5iobZJgqKqqmNhqRE1ByUn0dqGpOHr+Rnw
         wuD3z+aSoLOmJQIgJTqLwfsPq9y1aaDENwT5ZKsDlK9a6T6/kGECY9UfcDScfSdw6M7c
         U0z6d7KxleQpb4fK+hl28q/5ksU/irT2Sm/TwLTtz3ifQDnwg8gLJbGCbseQbmcblxt2
         BYYdY6ud2OupWCJBTlY96/jwPXSOxJkm5e3elKHdaVSnBwj+rxXpCv7ev/+hyx4Lko4b
         e+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=nt2pN2PNTd9g1AzNbzq97oeN58SK9gcKW9K3SpO8TF4=;
        b=Cg8mPUTCBDt0li5WSKc+4w4WzSk6n2Bu59qRoCuwzIROqekG6VTpo2PRlFMBPkra9o
         CGD6Pa1htgcyuwDfjd1ykvIMm1csbK1yjdaLugaphJ/Bai/FrXu/3xPmLgTzfnh8hMX3
         ZLVg4aYIraHrP3KabxMsZUt7w6DNrLdk+f1OHLe/oxglclxWhF4nFVvPqQWYEhxbXPpb
         RMRuYXt3KxrIfSmL41+kN9OlFngAMiyj4Y1oaxKlAXrEqGAWWzx8LLH5s9GJJsI6GCy1
         4Jt7Zp2TIK2cvckzbyK24iWqFU3T2D1aJoj9++2etFckXy900JEJvSAhYMPBkuo1Y3qR
         yKVA==
X-Gm-Message-State: APjAAAVfhUdiY7xPIbRnaglskbkz94CZ4ouVG7wYc1U36me5aZdjqo05
        TkQfHSzHHV5pDUvqbegEdiNpAiS3eUE=
X-Google-Smtp-Source: APXvYqybjjn/TOWlA2h31OJeNnxlYt/SPwXnKosPeewYaqCCBb4gKJUgt8Nd9pDHs/jf79O1lcti/g==
X-Received: by 2002:aa7:848c:: with SMTP id u12mr6216069pfn.12.1576346111060;
        Sat, 14 Dec 2019 09:55:11 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id p5sm15841692pga.69.2019.12.14.09.55.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 14 Dec 2019 09:55:10 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
        john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
        mripard@kernel.org, wens@csie.org, ssantosh@kernel.org,
        jun.nie@linaro.org, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 07/10] soc: ti: wkup_m3_ipc: convert to devm_platform_ioremap_resource
Date:   Sat, 14 Dec 2019 17:54:44 +0000
Message-Id: <20191214175447.25482-7-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/ti/wkup_m3_ipc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/ti/wkup_m3_ipc.c b/drivers/soc/ti/wkup_m3_ipc.c
index 378369d9364a..e058f67e6333 100644
--- a/drivers/soc/ti/wkup_m3_ipc.c
+++ b/drivers/soc/ti/wkup_m3_ipc.c
@@ -429,7 +429,6 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	int irq, ret;
 	phandle rproc_phandle;
 	struct rproc *m3_rproc;
-	struct resource *res;
 	struct task_struct *task;
 	struct wkup_m3_ipc *m3_ipc;
 
@@ -437,8 +436,7 @@ static int wkup_m3_ipc_probe(struct platform_device *pdev)
 	if (!m3_ipc)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	m3_ipc->ipc_mem_base = devm_ioremap_resource(dev, res);
+	m3_ipc->ipc_mem_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(m3_ipc->ipc_mem_base)) {
 		dev_err(dev, "could not ioremap ipc_mem\n");
 		return PTR_ERR(m3_ipc->ipc_mem_base);
-- 
2.17.1

