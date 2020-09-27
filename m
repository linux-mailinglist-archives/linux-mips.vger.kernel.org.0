Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6DC27A015
	for <lists+linux-mips@lfdr.de>; Sun, 27 Sep 2020 11:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgI0JWX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Sep 2020 05:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgI0JWX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 27 Sep 2020 05:22:23 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073FDC0613CE;
        Sun, 27 Sep 2020 02:22:23 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id e4so1734508pln.10;
        Sun, 27 Sep 2020 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=B++in0lGoc/BjWUNEMvXxicCP336IVWkHPCZlvacCRI=;
        b=qSKDydicDEFVRjiWX4O3TYCNIG/PaAAh6MuaL1K9OqlFrF5JfPQPp8eWzah4pAI1r3
         nEiBvwYMK396XejcL8GGAgZBq8TrtlfjXKwyF/aFEgU0zl7sNS6xrTk1QtVzCsSUOk1M
         sDX9N6YUPHOz7aG0hvwW78K4hMWdcWvSSsz38dG6rJMZDV+3+LTYYQeRt52ZA8YySZ9F
         KJGQ6XZi2g28X4fLmwOW36lsO0R8IwMWSA1dC3xAN1JLhDFBOnaWmYqoY769EdbI1V0/
         v7UP3gOtE2f9CGAuze+ea9kNoVAlAxzdpsi8R6a/v7ARUP8sZ1ZmJV9+Mf6BjkmHQh9H
         Lpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=B++in0lGoc/BjWUNEMvXxicCP336IVWkHPCZlvacCRI=;
        b=t4XPCN2Z1xvfOGMns6UicU6fHeBC3iIvxuUEXl4upX+/mIu6OIa7U9xHsENwtjqvxu
         gfZtUp784BRdMJgFiXQfzLNkTgQHX4h1h5ziOEWI4uO2KWrvNvSOXFjTmfkgGBo1ZOHt
         BtLQPt5QPHhfRcLQkajp31YknKi/J300vAAIl21yEjAm/4Xglxw2rgxKZ9damq0iN6+C
         rocjslplVSERl9FgXvLDAw1CXPAqtHo9G8TH3XrH/rreRvXNjMcIDCqd/EmfBFAleapp
         CwrwClBIfePI7U2H09cJDPZPTu1knLEIVqnoQrKWUW4Agj4Zrgt+nMurGcT32IFRcpvh
         OLgg==
X-Gm-Message-State: AOAM533jZ5ssqR+wG2e/9Kkp+ngOmegg9nupQSHo/RdvR0KcA9LR0l6q
        SWhiOIQHipffhNbSLrw5nOfzz4GjLTMg
X-Google-Smtp-Source: ABdhPJwg61Y0+y0uAfjYVkjFRoVvu2BXXqVXWD4GS1Jl7c6P7N9w6CdYsE/2ZqyJoWLAZ8Bs4LPn4A==
X-Received: by 2002:a17:902:aa8e:b029:d2:62fd:a2f9 with SMTP id d14-20020a170902aa8eb02900d262fda2f9mr6764820plr.49.1601198542627;
        Sun, 27 Sep 2020 02:22:22 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id s16sm6554592pgl.78.2020.09.27.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 02:22:21 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        shipujin.t@gmail.com
Subject: [PATCH v3] MIPS: idle: Add prototype for function check_wait
Date:   Sun, 27 Sep 2020 17:22:05 +0800
Message-Id: <20200927092205.1252-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds a prototype to fix warning at W=1:

  arch/mips/kernel/idle.c:126:13: error: no previous prototype for 'check_wait' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
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

