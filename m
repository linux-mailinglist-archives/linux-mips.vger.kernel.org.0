Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236CE23EB2D
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 12:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgHGKEd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 06:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbgHGKET (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 06:04:19 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85087C061574;
        Fri,  7 Aug 2020 03:04:18 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id l2so1130851wrc.7;
        Fri, 07 Aug 2020 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bM0J9BY9hlOlDTgPTiPt5xBvQpjZw14N68GXCLytLh4=;
        b=Xl0TlF2AYXjOHrVUx3YRahWREU4rysTrZ4BuKECvPifKYVXDA7YSVKfNCANZ3YzxlF
         VzJdIY/mJsVbWZra2g9kwz+/MCZWZlAl9kJ0d+oLp22g/I7KRfSWwA+QuxV3C7PtXL5q
         4tvK0SHfw98g8y5HIjnBV/KVb82PQTT7OFkAKEQRhqgo9ah/HGLFDg3atZ32zjdrsazg
         lnz8l/RQY5PHo/zj7uO84lFx0R1Bwr3tra9kfDROSH25N2e4+LwobRG3Z9TIsVbebVby
         sIjk1Gu9xXYah1OvPjmpI/+PitufsypuRk2+6f3kvHQq8HnaatHRisRCTZM5AkcdWQbh
         pHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bM0J9BY9hlOlDTgPTiPt5xBvQpjZw14N68GXCLytLh4=;
        b=md62QrS8yjxgvOHjINGzWhiDaw4tiZP5mS5TS9GtPEp5/pJ+PwK8rQrDDckgTAfja+
         yEz2f7kOk/Dbewi+wqf/WvMWmAFQwN1VZoBvV+tQOcI0hfFJx7o6OsncsY4aKQO/+duV
         u4X69nGOPaKS8lKKJBqVaxWjGXA3QdcP/Gg1iZzpYqBqquwuSFfTzXj51T5mUDl9SXKc
         qFhmW+3Tfu8gQ0HqZwXCaVZV6p3dnu2O7zDEK39rIRf9t8HDT0c2jqUUxfEPCr1xsrtU
         ypCoGLXzagggk8rYKhTQKzhszlUUTFj7EYxOBfNfMgMIbP28bcCSXX9cH14TMlqrfa5L
         9t4w==
X-Gm-Message-State: AOAM533dpJBwoZ4Yg1qXsUnksvEzUiXyaRhSiB6w5MJ+Zn7huCDHheYr
        X+UL5bexA6LUer9Sgs76J8s=
X-Google-Smtp-Source: ABdhPJzQQ5m7RJXYM/fsF2n4GtMY7QgYPk0mQlXywjojMe2jEY6jLshpvF+6+/2Buf0VdjS2SZTrwg==
X-Received: by 2002:a5d:6744:: with SMTP id l4mr12424824wrw.105.1596794656617;
        Fri, 07 Aug 2020 03:04:16 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id k1sm9875402wrw.91.2020.08.07.03.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 03:04:16 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 2/4] MIPS: BCM63xx: remove EHCI from BCM6348 boards
Date:   Fri,  7 Aug 2020 12:04:09 +0200
Message-Id: <20200807100411.2904279-3-noltari@gmail.com>
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

There's no EHCI controller on BCM6348.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: no changes.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 744aa16bab12..45f1bc437245 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -285,7 +285,6 @@ static struct board_info __initdata board_96348gw_10 = {
 
 	.has_ohci0			= 1,
 	.has_pccard			= 1,
-	.has_ehci0			= 1,
 
 	.leds = {
 		{
@@ -338,7 +337,6 @@ static struct board_info __initdata board_96348gw_11 = {
 
 	.has_ohci0 = 1,
 	.has_pccard = 1,
-	.has_ehci0 = 1,
 
 	.leds = {
 		{
@@ -441,7 +439,6 @@ static struct board_info __initdata board_FAST2404 = {
 
 	.has_ohci0			= 1,
 	.has_pccard			= 1,
-	.has_ehci0			= 1,
 };
 
 static struct board_info __initdata board_rta1025w_16 = {
-- 
2.27.0

