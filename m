Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80B3262627
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 06:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgIIEWP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 00:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgIIEWO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Sep 2020 00:22:14 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603C2C061573
        for <linux-mips@vger.kernel.org>; Tue,  8 Sep 2020 21:22:14 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l191so1125567pgd.5
        for <linux-mips@vger.kernel.org>; Tue, 08 Sep 2020 21:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=1G9PTO00jnlOb0OdBNoipBU+IjJp1bIlfQXTQBpTt3o=;
        b=Aiv55DC0gwqi743HDBtkSdzo6Ie5FMqGIkAYl4qSX2VdJIxFpfJbqNQu57w+Q1O1GI
         Xv4B6k7L8xb1V1EWrradvqmyOsWGSJoMPUbcW6hXtt5loIzojOmasf0T8FCCuVH+k6gI
         Uq4dwHLasXABoCvhcrVH3eVRJ1Wjdw1ubktUb024Dwtl236XdZApIm7fqZkZvpOWo82I
         3m36Im2f1/qkZjsAYMX8qYbDoClC7JPBPeYEXq7yODiThB4FwckOZcIb3PBJnZsz3vuN
         p8Uk/UiPu/iJ63D6ecOxXp2YRqOyc5/FoEbn0fJhRkggC+xdfHhrh+GocW7+GSLHe7/9
         m8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=1G9PTO00jnlOb0OdBNoipBU+IjJp1bIlfQXTQBpTt3o=;
        b=YSr2LjO1l2sj86cmHAFfEHS0FTQdRNyzD45KyGA464WZwK1TPBBIPYWICJbuOiIYGT
         jKAsX2q0AfOJ7wTnxz1nCCx/KrGzi+d4+VlOrGrcdPtROfnS4PH7POss/H2oSinPP5Je
         EFkVufydjrTLPf3udB8P404SzBwWd5NxzS3r6+3QCP5T+uvBN9mcTK9sYYw90UG8oa1b
         DZTJ1dwYi9aKVSl9DNr6xyYe83xOzvdluYaZrBh/UkR/L5RUdFKvkOFqDDORlRFxCIUO
         WBttzKLXLs4GRlhqv8GItjga1v6RgFeKPBub+ufG5/3Z38AIsmqSmZhikGGac27fIqBx
         C4eg==
X-Gm-Message-State: AOAM530bDXwJnXvLmdZoR5jT/D5Jji2hayGKYjrEnvhV9cHJtr60p4uQ
        QI7Y94uwCCn2afN8fzd/Sro=
X-Google-Smtp-Source: ABdhPJyyt27dTIbQzsBdJ3xreIalb0LWI0ycSLdwFvsT4e340uqhXCA5m6iqlB6wUcFVEv5oIDlxBg==
X-Received: by 2002:a17:902:a701:b029:d0:89f3:28d5 with SMTP id w1-20020a170902a701b02900d089f328d5mr2270747plq.17.1599625333885;
        Tue, 08 Sep 2020 21:22:13 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id mh8sm582507pjb.32.2020.09.08.21.22.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 21:22:13 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 1/2] drm/radeon: Don't use WC for VRAM if !RADEON_GEM_GTT_WC
Date:   Wed,  9 Sep 2020 12:21:59 +0800
Message-Id: <1599625320-17637-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Though RADEON_GEM_GTT_WC is initially used for GTT, but this flag is
bound to drm_arch_can_wc_memory(), and if arch doesn't support WC, then
VRAM should not use WC.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/gpu/drm/radeon/radeon_object.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index f3dee01..07b82d9 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -117,10 +117,16 @@ void radeon_ttm_placement_from_domain(struct radeon_bo *rbo, u32 domain)
 						     TTM_PL_FLAG_VRAM;
 		}
 
-		rbo->placements[c].fpfn = 0;
-		rbo->placements[c++].flags = TTM_PL_FLAG_WC |
-					     TTM_PL_FLAG_UNCACHED |
-					     TTM_PL_FLAG_VRAM;
+		if (rbo->flags & RADEON_GEM_GTT_WC) {
+			rbo->placements[c].fpfn = 0;
+			rbo->placements[c++].flags = TTM_PL_FLAG_WC |
+						     TTM_PL_FLAG_UNCACHED |
+						     TTM_PL_FLAG_VRAM;
+		} else {
+			rbo->placements[c].fpfn = 0;
+			rbo->placements[c++].flags = TTM_PL_FLAG_UNCACHED |
+						     TTM_PL_FLAG_VRAM;
+		}
 	}
 
 	if (domain & RADEON_GEM_DOMAIN_GTT) {
-- 
2.7.0

