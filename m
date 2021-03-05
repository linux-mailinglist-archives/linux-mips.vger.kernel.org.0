Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A943532DF6C
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 03:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCECFu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Mar 2021 21:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCECFu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 4 Mar 2021 21:05:50 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 481B9C061574;
        Thu,  4 Mar 2021 18:05:49 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id g185so558943qkf.6;
        Thu, 04 Mar 2021 18:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSUjjb3HsS8cD5GxX1FQLqtqNzgpMXQmde2Ym1EhNkk=;
        b=RmsACRpMIdO7wzoRbRr09xLM3R5cdv9FrY1m1CNl14b+U1IolHKKgrKf5t+SY2yXZQ
         S/iAk3rgV8rXzrwD0CFTdYRi+xCj3+LGDcYvcDEMGOfIJhL1F5DGH2ltI24rX5fzQF7M
         XtSlb1/EuPsp+rjKeb6i4wakd31aSilJTk0LfqOa5ulL08w9MmRWClKiNxQe8kogGR1W
         rnVob5VEChCPm7KQwWjBBUrPAUJ0Yj7jsau0k4OpnvRsoxZMrrW87mlmmTZoptFyBjmI
         qNEVJwMFKDPRiaW9CxCxaKirytbIW0m3uKOumhVFYfqlvx8HAWlqcTSsI9/fJyy9ol/n
         Pjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bSUjjb3HsS8cD5GxX1FQLqtqNzgpMXQmde2Ym1EhNkk=;
        b=CCFTVL7QHg2kUmLrdzwNnIxM/HkgHhP00/zExLVoNltwg92bYL1Ms+6in1Iuy2ouUu
         pfvyrL+Xg9h53KjBHwGqE49k6vNDEk3A1tgxMeiGLwBZC34h6Jee+6FLCAEvYrv359sP
         2BMBGUI+j5wnbnqm7g5KqSsoRvHL5VLbfZGvK/tXmTFDBcpYJMl+Ikk+Jmuwar6k60G3
         8bg6YGcgJAYENYrz2bPDKNyaRqKjdjens+3AX2d5uUbVSqgc6PwNe/YvjkZuP5zhTaCf
         pUKy95Ou7WoGTy6KTNYLfLQautIfdxolxVdp2Q1fda/O/sp0OG4GOezz/GVU/+OsnWNm
         22EQ==
X-Gm-Message-State: AOAM532EeHcHrBX5d6lL78zRUCgKbMsTYCgTHMuq4cFQGnOq4ySoX+DL
        IykPzDUi5I2v+Rzdn3f001QTtz9gqdRHLxBv
X-Google-Smtp-Source: ABdhPJygElhfPp4fpfZhuhowkBi490xFvhG62ABtyc8ckHc6/zVWpfhWpAqC/ZZERhJnQkBm+3+gpw==
X-Received: by 2002:a05:620a:218e:: with SMTP id g14mr7029864qka.111.1614909948472;
        Thu, 04 Mar 2021 18:05:48 -0800 (PST)
Received: from localhost.localdomain ([156.146.54.138])
        by smtp.gmail.com with ESMTPSA id g11sm872928qkk.5.2021.03.04.18.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 18:05:47 -0800 (PST)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] arch: mips: bcm63xx: Spello fix in the file clk.c
Date:   Fri,  5 Mar 2021 07:35:35 +0530
Message-Id: <20210305020535.25006-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



s/revelant/relevant/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/mips/bcm63xx/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm63xx/clk.c b/arch/mips/bcm63xx/clk.c
index 164115944a7f..5a3e325275d0 100644
--- a/arch/mips/bcm63xx/clk.c
+++ b/arch/mips/bcm63xx/clk.c
@@ -76,7 +76,7 @@ static struct clk clk_enet_misc = {
 };

 /*
- * Ethernet MAC clocks: only revelant on 6358, silently enable misc
+ * Ethernet MAC clocks: only relevant on 6358, silently enable misc
  * clocks
  */
 static void enetx_set(struct clk *clk, int enable)
--
2.30.1

