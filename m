Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1525F241CD9
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 17:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbgHKPBf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 11:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728879AbgHKPB2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 11:01:28 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888BAC06174A;
        Tue, 11 Aug 2020 08:01:28 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id c19so2295394wmd.1;
        Tue, 11 Aug 2020 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G6V/OqOvjtGyfeK4VfmVQNJE3fnNa+RlZtfmz9pCWl8=;
        b=igix8vnto1Sx5HkGVypyCf6MUAS2BULEalfhuivAYFfIVX40Yiv4kZFPAurZ2Gtpkb
         NcnkmfaDL/WhnqA2210ude14/JXZy1LcYQyUkfS1UVKgtDzflhpPtHuBHZRP6ggzyMPr
         VGWcPk5DhJTru1Z8fyegbuaDap+boweD1BMWebu6l7arKzdRXpMb7ybAJlVs8QRNPTW6
         V8dLZVe5lSA0bmF875ndoF9uznO7xFbeSe9bq9ZwVRHsKaM4KqWGZ3El76Jl8iORtFAa
         P8rYTLVMADg2EWaitC7r9jeqiigo9JEC0a93ZfjNzmuGATJksKmZLKJdgGJucr7K2FmL
         HCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G6V/OqOvjtGyfeK4VfmVQNJE3fnNa+RlZtfmz9pCWl8=;
        b=deyv8C9FkPPaHjxEt5XmrLeVhDX5QOpHnE1C69VtCBdUWSppY6EIeelg0Xkf5++FTr
         uaTltqD47J1bf7gS1yiWuR+TGjvM2lXXrzaeLccONrTblJulPQYUPYuQNVCaSaTlpYmG
         FRaZa/J5uostCHAD31S9efzgI8uedInceLjkfAmmI/WK97/LrNN4vIDAAwhZ58UoQuGz
         E5n9xZmtyc6DfGooG/qaHDMgopQCzDGC83JF5ytUuCHxKgCo61A5GvBxrXtG9y30nzlT
         ywXjmOECMuFN61LDuk4oeGKpaN4NaHUOheLoA2uZ/1yWdYLqpDSZAGaqKy3SD3JlSKBt
         2csQ==
X-Gm-Message-State: AOAM530rDLanOwMDFhE1p9xAV3UYsp/PgQeCNJAjBoZnj4ozkHqrAt8T
        mGLG0IwOgx8Fh0XmKC5pnzY=
X-Google-Smtp-Source: ABdhPJzPdhjMD0Lx53CAXhkpNaKyQ099EdsF6At8pBPi6eXUCFu2H1D9brDvbtCWIci6CUhwboliRg==
X-Received: by 2002:a7b:ca4b:: with SMTP id m11mr4251892wml.120.1597158086825;
        Tue, 11 Aug 2020 08:01:26 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 15sm5350494wmo.33.2020.08.11.08.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 08:01:26 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 3/4] MIPS: BCM63xx: enable EHCI for DWV-S0 board
Date:   Tue, 11 Aug 2020 17:01:16 +0200
Message-Id: <20200811150117.254620-4-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811150117.254620-1-noltari@gmail.com>
References: <20200811150117.254620-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

BCM6358 SoCs have OHCI and EHCI controllers that share the same USB ports.
Therefore, the board should also have EHCI enabled.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: Reword commit description to avoid possible confusions.
 v2: no changes.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 45f1bc437245..ac9570b66f37 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -645,6 +645,7 @@ static struct board_info __initdata board_DWVS0 = {
 	},
 
 	.has_ohci0			= 1,
+	.has_ehci0			= 1,
 };
 #endif /* CONFIG_BCM63XX_CPU_6358 */
 
-- 
2.28.0

