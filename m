Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82123EA80
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 11:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbgHGJib (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 05:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbgHGJia (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 05:38:30 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E4DC061574;
        Fri,  7 Aug 2020 02:38:29 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id q76so1218654wme.4;
        Fri, 07 Aug 2020 02:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oVHDxpk0dQpmXVQrDhF0SiIAm1xo4mNG/B7mphM+NZQ=;
        b=CzN/UkWw0VhI60//D7uZxUzr0PpitsWbLoZZXhV0dJUtM04KSC06BNrRL171NvaP0b
         g9Uhr28I0px57C59Q9Akxfji9j0QKqWK8s2dPkSDugAeNGVfUVGbs9UDP1LBUFQwAsHa
         FIOC1zRz8VknDrEuARt5arVbNIXnEg+G/WbAmuEsK1pdvDyu/7El+lUC7jwlb6nKQ5bF
         dd7Mxc+cS69q9U6GMeuxgFqd/cUmhrrbay1ozffK/4CatT/T3vTXZsbGhRC3eg2dfKU8
         aIijmoOCYHD4DtRZkaIj7fJ9EylC62jNkIah1chN7fL9YMAqDRC4QtWX0uLOdw8crol9
         xfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oVHDxpk0dQpmXVQrDhF0SiIAm1xo4mNG/B7mphM+NZQ=;
        b=aXccOjgyF7LhUt5RMIoqgo4wBFe2WackbugQIFj+lIBBRrafPlCM/UX4i0yvC1NOW3
         bhFcmDGju+p+hEwYJ1TkO1a4uF8CFpjDb7g/JM8dn+9duANeJr1UHNDnthS+3RWFx2TS
         XbMzC2I+FpeI0D4GA+B2Anqk9b+HkwJO+fcdqW25Pv8Wxkp2aVJN70U8RDNJcaqLAemV
         SMGYNqqWmNeRC4f9f7AKhkd9297s57zqgnh9+0ng0ZpXPzssl5Wh+dOaBxCU4gXFFa9/
         CtIRtb5eRi73PxmZSH7CRuOuCr5rYGiviCIF8qIV6Ut/4MnjW3T5U+FkdK5RXUjXb9Iu
         8zLQ==
X-Gm-Message-State: AOAM531SFFhHZqxUFH6JL5XF4lguUeyrVXAdxYHfjS6CapINODO/MNtL
        DEU4eiiZQq80NFQiLCKfIdw=
X-Google-Smtp-Source: ABdhPJxwm+ds9QvbbRqyHXI9+AkTNPu6xQFkvvAiZjSVGwitqMW1Ma7rz/x/s5xX0d5svGGRZaCcWw==
X-Received: by 2002:a7b:cd97:: with SMTP id y23mr12434274wmj.21.1596793108473;
        Fri, 07 Aug 2020 02:38:28 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id q19sm9460529wrf.48.2020.08.07.02.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 02:38:27 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 1/4] MIPS: BCM63xx: remove duplicated new lines
Date:   Fri,  7 Aug 2020 11:38:22 +0200
Message-Id: <20200807093825.2902474-2-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807093825.2902474-1-noltari@gmail.com>
References: <20200807093825.2902474-1-noltari@gmail.com>
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

