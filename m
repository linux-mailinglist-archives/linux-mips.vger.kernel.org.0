Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7096127A00B
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 11:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgI0JUx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 05:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgI0JUx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Sep 2020 05:20:53 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A4CDC0613CE;
        Sun, 27 Sep 2020 02:20:53 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b124so6685370pfg.13;
        Sun, 27 Sep 2020 02:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=49O4zHPx1PVwGbq+z1yRkKckf3sNv0jnpUzWYqsF8Ug=;
        b=SIBHc8S1kVbejxLpkvkbAnmaMKtpEDgXAUTVYm7bTQrxeyEd68dqoh6aC6uWS7+b9o
         CR7/Rag/PwVQImFjW8jOSYcUevO2p3YEEb4sMtSh+eINHTUDbVEc2MjmlLsDeNNhbH1M
         V9SqIUm4DcGsJoDutnrn+ieu+PAxol1B/a6UAs0d+xRE24Rm+oqdEUNUjEqpi1FDcg7R
         xX9BA0Zx/Yw7PdxkjE7EnOLIE6PcBgnBs1xcI4K/VLctyULi00fBOM5Kxx4A8TPVKmKa
         eEwQ4GUCb/+EQeyzeuSLsQoRMG/LEc5qzPGkttMDa5bHJIs1wxC2oe6SVzSGnO9Ibsjc
         kydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=49O4zHPx1PVwGbq+z1yRkKckf3sNv0jnpUzWYqsF8Ug=;
        b=Lw1XEnFb8uJilg77x2GGpTzcy4pe/wa9dORB7nqz5Wh18Bq8fWmgmK+1qxM/1RoQVA
         q/l08OTMUKIr+GOOY/VVqx/JBxVae2XJy88posTg75vHNpdieerx4qQ7x1gbyKTCohTH
         YZ3QvxoBQHkklPB6ARi8wrmxHcJcwacP6tDTI3oY3nZK/RuaRplRAjfNvDN9XWDwm7dP
         mbxqDDZiA94wNDdU/e0pH4/5YF+J4URYm0sLiRphhVjYWSNTFl2oM+4YOVn+0VHfrZFL
         899g5+vLgjZoj7Mf5zMJjj6Oslj/STWQrzob6J5jwoPsHnEWDTJj+8giAaxQAUPwb7pa
         1xtA==
X-Gm-Message-State: AOAM5333ASueyVNFsYZImteyUcHloE7PNSOhWsoy2GD9G3sSZIjPko6X
        nQS23FPjZG30AABmqrzGgA==
X-Google-Smtp-Source: ABdhPJxw54EShzs5KlINfZfjyTxxpk0MdCpSC7i0fIKaDsJd36PnNgvmSS3Xlyqn5MSjudlvrNkLXg==
X-Received: by 2002:aa7:9583:0:b029:142:2501:396a with SMTP id z3-20020aa795830000b02901422501396amr6459109pfj.47.1601198453059;
        Sun, 27 Sep 2020 02:20:53 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id j19sm7780904pfe.108.2020.09.27.02.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 02:20:52 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        shipujin.t@gmail.com, Pujin Shi <shipujin.t@lemote.com>
Subject: [PATCH v2] MIPS: idle: Add prototype for function check_wait
Date:   Sun, 27 Sep 2020 17:20:41 +0800
Message-Id: <20200927092041.1187-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds a prototype to fix warning at W=1:

  arch/mips/kernel/idle.c:126:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipujin.t@lemote.com>
---
 arch/mips/include/asm/idle.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/idle.h b/arch/mips/include/asm/idle.h
index 655a6dbc861a..0992cad9c632 100644
--- a/arch/mips/include/asm/idle.h
+++ b/arch/mips/include/asm/idle.h
@@ -15,6 +15,8 @@ static inline int using_rollback_handler(void)
 	return cpu_wait == r4k_wait;
 }
 
+extern void __init check_wait(void);
+
 extern int mips_cpuidle_wait_enter(struct cpuidle_device *dev,
 				   struct cpuidle_driver *drv, int index);
 
-- 
2.18.1

