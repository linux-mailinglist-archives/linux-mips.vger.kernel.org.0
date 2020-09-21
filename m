Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CAE271EA4
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 11:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgIUJMr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 05:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIUJMr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 05:12:47 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CF8EC061755
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 02:12:47 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k133so3718324pgc.7
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 02:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=G5IfRmqPuMpaOCcxbL+BlkKGKTuCTWSjkTLclXpS/yY=;
        b=vVm9XH6YgerSfOUcNMpWCMM69d2IcKounq6YuvZFNSHgliuk2hhDatDAIBRQgu1YZS
         4vD1/eIyCqGqa9yNNlupH1cCEs67xJhOwjxnGdvhjoWYZOt1wkgqklb5ssr1F0NS4F9u
         S/5EpC9xnTaWxyxibyBZXS3jcyIUDcyOYVD3CrSM6tPgHYOeyblQTf06ONOCu1QHk7ti
         vopThNIqDjXWG0T6OpmIw8f1EIaV6L7RlBbyT/pdZm3GDJkjIjuwa6QMqgWVstJBs0m4
         +k7BQkOwN86qpNaBscmZ7KyS5ZmuHYarSkcz91LLdcgkH2i86zpUhu4ccYPOrcC/urGQ
         hY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=G5IfRmqPuMpaOCcxbL+BlkKGKTuCTWSjkTLclXpS/yY=;
        b=G+iO7kMgktxZaIx/mHqbJ297648OBvWNQ+SZ6owmMSx+sOuEpl/ihjTSWOcPAZSviN
         2GcNx5zMM2y00CUEEQfG3sSR+S2CO0C/2lETFXnXQSrQS7yVf28XqcjNL33+AURPNQZ+
         rFBilxuYzj4wi9WZwAjBAZumW34ybRcooAE0NMeDXqZZeO2LZaw32BJzWTX+uodsOEgW
         lGeiowT4JQXqWfv+wiHVMvHT0WtWj05jcde9b3HDJYMSqNkaTf2N0UcyLAAL9XOor+o4
         RjSoZI6A+rHUdfLAfLNwlKZk+kgzMmo8OH6vKt1cJHV3Q48BOZPY2so2/XIG7fv7ncoJ
         5XjA==
X-Gm-Message-State: AOAM531J660m1nYcbyYEFhtPZQpMGUVVx/9LlchC1XvIcSFcD5oDqLvB
        xx4njfksVZDrBdW7xTrP5wg=
X-Google-Smtp-Source: ABdhPJyI0pNzC9AthVmpVsgy5y4nefaneiXb05XR7lbyW5Ugb1SV9DRUoR7b1n8//U3Tq5xGjhHYkw==
X-Received: by 2002:a17:902:d88e:b029:d0:89f4:6222 with SMTP id b14-20020a170902d88eb02900d089f46222mr44280447plz.10.1600679566942;
        Mon, 21 Sep 2020 02:12:46 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 134sm11723885pfa.93.2020.09.21.02.12.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:12:46 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 1/3] MIPS: context switch: Use save/restore instead of set/clear for Status.CU2
Date:   Mon, 21 Sep 2020 17:12:26 +0800
Message-Id: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some processors (such as Loongson-3) need to enable CU2 in kernel mode,
current set/clear method will lose Status.CU2 during context switching,
so use save/restore method instead.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/switch_to.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index 0b0a93b..a4374b4 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -117,6 +117,8 @@ do {									\
 		__restore_dsp(next);					\
 	}								\
 	if (cop2_present) {						\
+		u32 status = read_c0_status();				\
+									\
 		set_c0_status(ST0_CU2);					\
 		if ((KSTK_STATUS(prev) & ST0_CU2)) {			\
 			if (cop2_lazy_restore)				\
@@ -127,7 +129,7 @@ do {									\
 		    !cop2_lazy_restore) {				\
 			cop2_restore(next);				\
 		}							\
-		clear_c0_status(ST0_CU2);				\
+		write_c0_status(status);				\
 	}								\
 	__clear_r5_hw_ll_bit();						\
 	__clear_software_ll_bit();					\
-- 
2.7.0

