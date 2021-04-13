Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6E635D7EB
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344992AbhDMGWa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344971AbhDMGW1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:27 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84055C06138C;
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k21so1660569pll.10;
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyKCHbVUuM78DLJQ6iKYbE/8/YHUHid6Z5P0PEZg9RQ=;
        b=OnyASyqlXj5JoEtAtMMWp3ygvJkTrM+vB+fhRJ3dLFRfRLEo/5C9uBElHhxyXB/SRm
         q0iY93YjS6GVoookFk/cR1yyux4ogAr13UsQeRt8kVvKAmFiOv4xVg1p4uXnWUk0IcUc
         zcjLZL6FxDM6X6u5V8UIuU2uxsBv5hqlkSDLBuUwpjG+RmsET+o98JDFefix91eY29rs
         GvYwSdIiq16iwk55bsLHaRSuyHSFVvOubpsZ49uWztJsZRloiEXsSx12jwNqgj+SJaVv
         vFaSamUCbRbAckppBtD5LuTX0m+rWB0+9k4rUGzmDCn0mOncIaMojWYHhEJmlyYHH2mQ
         VQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyKCHbVUuM78DLJQ6iKYbE/8/YHUHid6Z5P0PEZg9RQ=;
        b=WYA5In8yaLsdM5kncVlmrJ3JO1W5AbXKvtrUJ00uUeubPi4gwRorCVHujo2IhC3BSu
         4KUCV7t+VZMTJSvqSMzYfQUAOxAIJ/B6KbnJMLLE+L728tm1VLcptEvxSGrWBMUkYWdk
         ykdQsoe+vnKPq8CeIiSEWfIhOmpEr7iWGpEPjipLZ7W1S8o6msCXyx28CIX19ae1Cd87
         tybBbjzgcMObPeS+e6ZOuiBPj8dMGBXklHpIqQ8/3vQqXeKwVQHG+KZXpPFsobncyNlC
         ciWYcrlJk+xVU40zdHaIgymrj7iy27d+3j5dJCwyvyGzBGoBeYRs+5aS4nUbvAdETuSc
         Ie/g==
X-Gm-Message-State: AOAM531LQC8PA86toEWjEtq9e7tSMj0879hhBynzvCe1bQTzK1wsZoKV
        VcRj2iYbL4WS/mjXG3prNgX80rUPROuz1MZM
X-Google-Smtp-Source: ABdhPJznGbxDWXgiJiBVvrPXvfOrv8pyrJ2BlI6zvpf7Gv8WFvjxqzMAWdrkzl5fnsDX5olzjFSQbQ==
X-Received: by 2002:a17:902:db01:b029:eb:36ed:36f4 with SMTP id m1-20020a170902db01b02900eb36ed36f4mr202799plx.61.1618294927960;
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH 4/8] MIPS: pci-rt3883: more accurate DT error messages
Date:   Mon, 12 Apr 2021 23:21:42 -0700
Message-Id: <20210413062146.389690-5-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
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

