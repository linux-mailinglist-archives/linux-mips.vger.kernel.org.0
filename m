Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74DE8241CD5
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 17:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgHKPB1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 11:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgHKPB0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 11:01:26 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315D7C06174A;
        Tue, 11 Aug 2020 08:01:26 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f7so11810214wrw.1;
        Tue, 11 Aug 2020 08:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Omhf4JBO1kZHIgbP4gDHiaQBVFEO7TFQZk4NOsjloA=;
        b=ri7njzHPSdK+1vvpXER+6XhtZxEPcPjHNADeBwkSVNGZazFv+ojx2xY49M9VbK6QO5
         u/0Jb/xaoLBFO1V9acq0xegoa8z9x/ebFpODSdvHbPE8csJpxQ2ZtFF7plMoCnsLcdUp
         c9SwAbuerYK/Z1gT0k12/UJe5MKb7YCAm1fwU5mJgIISEhj+CweDkG+Edz3MNLihZ60r
         qN/ba3yXsQ7X5mZ0eCi2OZRDbkwC0VVZMHU9K/P6Usb81XOBh/c3Ce5xltOXaQ3hK3WJ
         YIgCo0dOoDDqeNRP80zcXuUqeF29sGjbGdQAzmn+csIE2MyhSiO+FfHuCNv+HWnEAnwX
         I6cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Omhf4JBO1kZHIgbP4gDHiaQBVFEO7TFQZk4NOsjloA=;
        b=gj+nZHdrS//f37F5eZRD3Ce4ZbXgfFzeZTJqRwT11zrGdk6R4kEyYeLQo/jvqwcuOb
         Kg0VB98+e9GBtQCNlaabCubAu6Z/qChCEx21C5aeDtSIGeSZovuMC6s8yIVn9sVn3PkE
         JF/m5N6hf+bui81Bb+rV7h/fuhRsNjKIyf9UZTwXIGCxxSiME2oZATkUcfpb78YsqZzw
         04TW2Fpl98YbTD3f2AIRD5NamCiF2AjtUTK6KvOcp6VWdXAw/3l+ZMYIVqGhk3TiC+ct
         NqfEVaZWtR5sUQc61/nSP3CwzE7VG209IOOtrziYCPiGbtgw71pPOOBNB34VCZl+UCpL
         HBgg==
X-Gm-Message-State: AOAM532S7H2Njzddklci3Ejhq+l17q0VRQGNlkNGYiSz3iVftbmzMZTi
        bUTJ3k44gPZj583QlC4grgA=
X-Google-Smtp-Source: ABdhPJw89nJhwhRxpiAc7wtxhctP0JeXOUosd+DiR3bD4tyvj8F6bG+jdppW163PAWiolKNckTx2RQ==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr29054420wrq.407.1597158084729;
        Tue, 11 Aug 2020 08:01:24 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 15sm5350494wmo.33.2020.08.11.08.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 08:01:24 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 1/4] MIPS: BCM63xx: remove duplicated new lines
Date:   Tue, 11 Aug 2020 17:01:14 +0200
Message-Id: <20200811150117.254620-2-noltari@gmail.com>
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

There are 3 duplicated new lines, let's remove them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 v3: no changes.
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
2.28.0

