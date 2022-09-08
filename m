Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9573E5B1465
	for <lists+linux-mips@lfdr.de>; Thu,  8 Sep 2022 08:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiIHGIJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Sep 2022 02:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbiIHGIJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Sep 2022 02:08:09 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A040A7217
        for <linux-mips@vger.kernel.org>; Wed,  7 Sep 2022 23:08:07 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id b5so24223109wrr.5
        for <linux-mips@vger.kernel.org>; Wed, 07 Sep 2022 23:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HwH/FTzchXWl/4JbZxTD025TqDcYP4ndvH7sj4x0kJI=;
        b=LqEOnaNhQnVH9zVRTvgMd59/wZOO7o/i/0vtc9CXjdw9SUYEhfsRQyvlfdHCtGiiHb
         XWIuLfVSOSFjBfAs9F9CAtTgL938eQGr8ycgVY1QCzVhhENW5k3sCnvE33/G8BmC+IUy
         PjQKnqIFSV2t15zhtQh8k+MkqIuF8U1WbjsrUbmKU4pj5gA7DoT2MtxIdBmz5m2Zm1X3
         AUawuG3RXUiqcI+qDtax1eGriHfIIiHGun9u3wKYt4GjGYOXmTBW0fyNNzmMJpkGuYSi
         rwHWI102FyJMSCBBbeNbOv8EF/2vs2uMrMD3pJjACK9iaxsvNMw4tqr7X+/JJjKGJB1V
         mSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=HwH/FTzchXWl/4JbZxTD025TqDcYP4ndvH7sj4x0kJI=;
        b=2nk4hxixe/SJgVGyZMT24L6cSfqLdf/XpeV6K352zO2qpxPWIQKUjg5ZkmpFYHFFjP
         ukfqC17LCMH0EHFnnuC2k90PwKxVSqEZDjIaQPdu4Rwokn81uA+i/JDSKOAPGI13VLQf
         6KsR2rr0Vnxw7OPmtE9N+yI0qBJlahhErL0DvBDWuLjZj8/Su0rcA2pHBG/foHjPYHAF
         qJQHVT+3WWE4P6rg6BpWjCcvXe/T9DNPB3YWIzRUCwFnE78W/1GzajAHUh1w+07DZke3
         lNEgHm8RAGWhBBcrPwruvNzfrn6UcTDTXP/4kjzEpgKWrDVAovzA7AHebR3oYXwDNMo8
         lsNw==
X-Gm-Message-State: ACgBeo1ChDJT3LO8XWdRceyTpXhU4VMcmiQFqdB/xszI61gyvZxvrxkC
        hwW0F0088TQ4c+cNWit38BvkelT+2uWGVA==
X-Google-Smtp-Source: AA6agR7rHLUWxZukPL8ZweC4xISPeDQx0+aRezeyZOrWkfxm0hdu3Zu5uIsBIQZWWru4M0n/VUtjsg==
X-Received: by 2002:a05:6000:1d81:b0:226:fa3a:8721 with SMTP id bk1-20020a0560001d8100b00226fa3a8721mr3970401wrb.475.1662617285566;
        Wed, 07 Sep 2022 23:08:05 -0700 (PDT)
Received: from localhost.localdomain (188.red-88-10-59.dynamicip.rima-tde.net. [88.10.59.188])
        by smtp.gmail.com with ESMTPSA id v11-20020adfe4cb000000b00228a17f92fesm13113004wrm.51.2022.09.07.23.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 23:08:05 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, john@phrozen.org
Subject: [PATCH] mips: ralink: mt7621: add device tree into the kernel
Date:   Thu,  8 Sep 2022 08:08:04 +0200
Message-Id: <20220908060804.1531428-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Device tree blobs for ralink mt7621 SoCs depends on configuration
CONFIG_SOC_MT7621 kernel option. This blobs needs to be properly
builtin into the kernel in order to be able to properly boot the
Gnubee boards. Hence, select CONFIG_BUILTIN_DTB for mt7621 Socs.
This option was a miss when this related device tree files were
moved from staging into the real 'arch/mips/boot/dts/ralink'
folder in kernel.

Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index f9fe15630abb..f3b14bfc8066 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -54,6 +54,7 @@ choice
 		select HAVE_PCI
 		select PCI_DRIVERS_GENERIC
 		select SOC_BUS
+		select BUILTIN_DTB
 
 		help
 		  The MT7621 system-on-a-chip includes an 880 MHz MIPS1004Kc dual-core CPU,
-- 
2.25.1

