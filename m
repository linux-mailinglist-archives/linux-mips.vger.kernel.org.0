Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554F2273B44
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 08:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729499AbgIVGzu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 02:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727710AbgIVGzu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 02:55:50 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 474FDC061755;
        Mon, 21 Sep 2020 23:55:50 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z18so11581270pfg.0;
        Mon, 21 Sep 2020 23:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=l0lVrflkphRizXCe1PVGD3ndOPWr+Uw8f1/K7e/54jQ=;
        b=Z9G4J5FNAEIn7m+FP3pWtSHjRivCphThOixT5spWoLXh7n7p8oeQKoZ+E3U3Aqzh/b
         3yOhLyO+fyghm1wtnIPDqLLAK7M9O+2DkxLulOh4iFWkHBAZPWpV9egh8tlG7GNig56A
         8CaPf+IlyDH0T7rE5PoX+UOcVMSkzjUtoo6NANU9FQte5Mk2dtRwswHB3t/tWZe+0/Rk
         zu96rSdCG3TVYMJL3Vn3fYb6F6ckfbSLCLIUFJuiyaxWS3DATEBXLqSDzUVKgjaPJUIb
         G4/yKbHOZkO1NkYBfM0v1Q12KLb9L49dA1ldI8MkFzd1dK+eqZdPDXVveneUloLcNn+7
         LIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l0lVrflkphRizXCe1PVGD3ndOPWr+Uw8f1/K7e/54jQ=;
        b=FNJ6GM5sAMvQsyGjBvJjeDys8mF9g/SC6FAJYZbg2CHNjLHjuRYeQAmTGqDWskF5XV
         Rhmyzr7jgMw7OxB+pRScDM3cxaqF9pGxudA4wxq2r7O5doDH2IqUW+WRgXRuB906qXaH
         q03F2GFZAykqbHwRTJJb3yjB8QztGBOileBQd+/a/Z7eP/YZvdXAkfT8fNMCDo+8pgaC
         5hUtz2BaISoHRKCGntmGilR4kbVJ2emIdFdVp+ZPBaxOdFmDMiZMfX+y6IE9S2kMafli
         SWgRuNzomeAcprilzXOG+D4jWawV86UWuaVrJ23BzJWkUE3hcV+VZPe48WbonkOEviJy
         xFgg==
X-Gm-Message-State: AOAM530xHzuMtjgVow8nBxkoiQMIIcaLSdvioLkm10vKktWX9yv+HViV
        ugZsU3hKMXWi72haC6wmXKzy5O4e5yFCJS0=
X-Google-Smtp-Source: ABdhPJzkFtP7MFDzgwrIyEP53M0B6vR7ccW098Kp+yfLAd4kuUNPV7TW6tSIlzERNs4pai/yL7ImKg==
X-Received: by 2002:a17:902:b90b:b029:d1:cbf4:bcd1 with SMTP id bf11-20020a170902b90bb02900d1cbf4bcd1mr3259277plb.29.1600757749851;
        Mon, 21 Sep 2020 23:55:49 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id m14sm13381878pfo.202.2020.09.21.23.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 23:55:49 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        shipujin.t@gmail.com, Pujin Shi <shipj@lemote.com>
Subject: [PATCH] MIPS: idle: Add prototype for function check_wait
Date:   Tue, 22 Sep 2020 14:54:39 +0800
Message-Id: <20200922065439.3760-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds a prototype to fix warning at W=1:

  arch/mips/kernel/idle.c:126:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipj@lemote.com>
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

