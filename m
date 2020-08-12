Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565DC24265D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 09:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgHLHwm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 03:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgHLHwl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 03:52:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091A0C061787;
        Wed, 12 Aug 2020 00:52:41 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id a14so1110510wra.5;
        Wed, 12 Aug 2020 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iijOtQzTjbRe4mA/CexBHb97gOz/Z+OsVx/AQcwvDAw=;
        b=DiNNOJXJXaTW+ABRQmtR1th2MX9U94NA6zd3KZZS+jgtVznDR6sZ7FxP6OoK2AqFyM
         o+tw2IhhEbm7R95pmPGRi4yNgWQWgJ2X6+sIFVVMF95iB47u3AAtx2eSyPRcsq1+T+8t
         9gE6NyWxXRwzxqwmf2VQt+E+1LjIsQ1V2Ukz8DzcjypadrsDxnDwUAEfQxPEkRgCcyGn
         gy2kiY64kFfX8YsOBFTxFJ4WV5WUZOKV0sua5b2MU+32VKgtdaVqwVgQjPz0qzhjrLSu
         1oS8vuy80tWNJ31PFbmSU+dbFpMliOTH0nkAReV4w8ZowVFUxQ6gxfDfuHjma9LMjQiK
         4F2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iijOtQzTjbRe4mA/CexBHb97gOz/Z+OsVx/AQcwvDAw=;
        b=R2V0deCqaWrX4SY6D6B8mYOa7+9mu/aVf82HH2L3IFhqGbQCD4uAMEcOvBT1mIe4DM
         +UStdWXhJMdOYipYjCPYjqhNUkKGgjGpNTznLCwwH2c4yAfsX/aklHk6kyWcNSFEoADl
         yjewxtVn5sH3pXYFNFIEw2tSIjMfhDuLNiIQR2N78+voWsp8WjJZL/2h3274bih95MiC
         aXWyTID6mazHwv8QMWl7u6SMvUo6mwCG7Uwr7qSdAUE8XL3Bv4BQJb+dNqXcN1MrZzRL
         FgT1PKQuJMgyH3O1XwUvS4cjZCuhkmcuslukHkCQEJwgU/73e48NDzHC1YXXDKERIndO
         mtzg==
X-Gm-Message-State: AOAM531ZyhByTltldSP06mk38gDN4Dz54CDavq9rUFhgOPWtBDk65oJH
        8D2fcjyJmRrK6xjAbf68ChQR3tzx
X-Google-Smtp-Source: ABdhPJw/MzqLC1sVpBef84svRDLlMFkn3GHlyJmGdB8sKvQN8gX9ME9E7j+Rd6s6Z4hDGSlClHRUsg==
X-Received: by 2002:adf:dd4f:: with SMTP id u15mr9434220wrm.275.1597218759671;
        Wed, 12 Aug 2020 00:52:39 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 6sm2470984wmf.4.2020.08.12.00.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:52:39 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 2/5] MIPS: BCM63xx: remove EHCI from BCM6348 boards
Date:   Wed, 12 Aug 2020 09:52:32 +0200
Message-Id: <20200812075235.366864-3-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812075235.366864-1-noltari@gmail.com>
References: <20200812075235.366864-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There's no EHCI controller on BCM6348.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: no changes.
 v3: no changes.
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
2.28.0

