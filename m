Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FB535EB45
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233075AbhDNDNo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232943AbhDNDNh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:37 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CBF3C06138D;
        Tue, 13 Apr 2021 20:12:53 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id w10so13408073pgh.5;
        Tue, 13 Apr 2021 20:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyKCHbVUuM78DLJQ6iKYbE/8/YHUHid6Z5P0PEZg9RQ=;
        b=NAvH4TmqSeGm98xrtWJRUm6UZo4ZvRLXQaMtG2RW+EykdYihgB+RCLHvu4sNiil1qr
         lQlHUtBTBHzvnxu1ArOPxvXsKJnvdFFbnfqTKBpnvLTQfBxBMKIPRkF/fF0P1tdmq7O0
         5nw603ZGRB+jmnorM0hEwLv4j9AqfcGWGt7i6UTja4IUyGNaT27N4dsnbAAcxGwkOj/P
         mt2ds2DhK48KBRrkclktwmWRMQjwCqC9zj9M5hqDXXfK56FoOvADrDgKMMsIayLjKdJY
         n/svZ4fTI/NHFbi1vepRMeM/d6G/GQwSz2CPGt0kDv+PMFi9lPf6Egf+BpQRRGol7cBh
         VVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyKCHbVUuM78DLJQ6iKYbE/8/YHUHid6Z5P0PEZg9RQ=;
        b=TPrSLVGc8UJlb3b639JNlR04xsWNIO8qFKLPy74W/IlJzVreJJ2h/7yCtmWsQc6fno
         LRkftzyjmjrMQq80ImeCeHdt+ZcixR2Sg5Z2griUie1v5LX3tbclFa0Be0g+FcbrSpHI
         E8A1jXi5vXejWF9nAaizm1Pe6ASLDNPMKmRFkSeBF7lWRSpafeQ7k1+7U1NuRMvuHN2J
         nb5oEk944ItMnz3p+njORizLETJyicjnh+11kG8BfGvN8kAXUQbV58EyrKbdxMNBN/zz
         S52AfjiLVDemBHlCahGlaiYNiRO51i/cFM1ZBu9WFrdGnHqRLO1tMZwfBfMSXJWHKM07
         Osig==
X-Gm-Message-State: AOAM532hrdLMqxojGY25WclvTSXo4idsJwwG5u/iClkIhel1HsO4iBBy
        2h/73VWsLkMF9uQRIBGluE0=
X-Google-Smtp-Source: ABdhPJyXtbiA38TQC4u9VoGMx2W05l+/EbEFz1ZPyQWp7g7rALrdYnfcrN0chDS3KRZlVi6dmlc/jQ==
X-Received: by 2002:a63:c66:: with SMTP id 38mr35659580pgm.69.1618369972830;
        Tue, 13 Apr 2021 20:12:52 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:52 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH v2 4/8] MIPS: pci-rt3883: more accurate DT error messages
Date:   Tue, 13 Apr 2021 20:12:36 -0700
Message-Id: <20210414031240.313852-5-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Existing strings do not make sense: one is always NULL and the other
refers to the wrong parent node.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 arch/mips/pci/pci-rt3883.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index e422f78db5bc..aebd4964ea34 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -431,8 +431,7 @@ static int rt3883_pci_probe(struct platform_device *pdev)
 
 	if (!rpc->intc_of_node) {
 		dev_err(dev, "%pOF has no %s child node",
-			rpc->intc_of_node,
-			"interrupt controller");
+			np, "interrupt controller");
 		return -EINVAL;
 	}
 
@@ -446,8 +445,7 @@ static int rt3883_pci_probe(struct platform_device *pdev)
 
 	if (!rpc->pci_controller.of_node) {
 		dev_err(dev, "%pOF has no %s child node",
-			rpc->intc_of_node,
-			"PCI host bridge");
+			np, "PCI host bridge");
 		err = -EINVAL;
 		goto err_put_intc_node;
 	}
-- 
2.31.1

