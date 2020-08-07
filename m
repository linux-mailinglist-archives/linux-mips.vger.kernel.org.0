Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A878F23EB2C
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 12:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgHGKEU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 06:04:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728003AbgHGKER (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 06:04:17 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5425C061574;
        Fri,  7 Aug 2020 03:04:16 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a15so1117773wrh.10;
        Fri, 07 Aug 2020 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/QpYzkdjXDFQF5T11kmyT4QL3Fig1HN4pUMAZLqiMWA=;
        b=RHnIw8YQPiSzKgqhIn2Yfs+UojxogE2qopa7Tmdp/PvRkYdGN8AvjXs8jaOHV7NVeY
         PsaH/7ynVMeffclinbBNAKPD0AeM6Mj0Dg9mwBgMsONRKGFfrbz/6uwm/FqTVwGzk2jJ
         axCyxJlfSIQtACxRjSkAkJP3PsxbPOtGJjsVK9ZbRVYTe0jFGwFvHYoQyQGxA8ZCSuQe
         lkyiYlffJM5yWJKrkdSBJ/fUIQkXBN2h0gbxkQ64sXewurCvJV3JIqwhmRzBCXTj51IL
         mwzAsH5CtSoCwOWt9D0ewOJib88uRj0qsDz8oggih6RwtWD0uxcKdkEOkIIrhal1hhU8
         xXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/QpYzkdjXDFQF5T11kmyT4QL3Fig1HN4pUMAZLqiMWA=;
        b=iIBcvtWRkweUw9JaRfCcttD7z8m3tfmXD4v4HvRqheAqKuJ5YgYDMpiD7u237JCBOG
         KJHP0eyuKWlKYL4DqF3BoPOepyw1TZI3acs0NfDr7Qspq4MO7hHQYEP7RyDUSWu55VVd
         fIkfxgrROQSYDtVApraKQAxC8AdXneGhainwCFhPSqPDPzZgQcCPcbW962QFHCsPwceR
         P2Zl/Wl15adShEfSoPBerAoF4Bg+lzSGSP5MafCqsmImp2rZH21SnhUKuHYGVP44GPvV
         y8yDb7IlpEvhq96BdXYqUlGfWOWZ3TBV739AXOdaKr5WxjDs4rhETVhMTYSpbkPmmQ82
         YCZw==
X-Gm-Message-State: AOAM532Ccp50uHd6bzOzWku2eIvm6FojvuCYfUGqdMq6ZIUCqRFJj79Y
        zSLujz2exRcxw07vcq/mj5w=
X-Google-Smtp-Source: ABdhPJwIyuzM+yYxQhnYoYX6toplrl+CXPsi7cr7hUoaU0+MNA3ptAoecg81dhkYeJzMfzsWLFJD3Q==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr11526955wrm.269.1596794655456;
        Fri, 07 Aug 2020 03:04:15 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id k1sm9875402wrw.91.2020.08.07.03.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 03:04:14 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 1/4] MIPS: BCM63xx: remove duplicated new lines
Date:   Fri,  7 Aug 2020 12:04:08 +0200
Message-Id: <20200807100411.2904279-2-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807100411.2904279-1-noltari@gmail.com>
References: <20200807100411.2904279-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are 3 duplicated new lines, let's remove them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 230bf27c1fb8..744aa16bab12 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -32,7 +32,6 @@
 
 #include <uapi/linux/bcm933xx_hcs.h>
 
-
 #define HCS_OFFSET_128K			0x20000
 
 static struct board_info board;
@@ -337,7 +336,6 @@ static struct board_info __initdata board_96348gw_11 = {
 		.force_duplex_full	= 1,
 	},
 
-
 	.has_ohci0 = 1,
 	.has_pccard = 1,
 	.has_ehci0 = 1,
@@ -580,7 +578,6 @@ static struct board_info __initdata board_96358vw2 = {
 		.force_duplex_full	= 1,
 	},
 
-
 	.has_ohci0 = 1,
 	.has_pccard = 1,
 	.has_ehci0 = 1,
-- 
2.27.0

