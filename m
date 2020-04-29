Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662951BD7DE
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 11:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgD2JEX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 05:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726523AbgD2JEX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 05:04:23 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 519AFC03C1AD
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 02:04:23 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id p25so783709pfn.11
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=RBY7BaUhkGRQQTB0edgCUS5hfjW8lhC0gru0NBa0S+k=;
        b=Q/5f8OhcSRN392wjlm7fuf2f+DG/B42azISnGrNHuRH7dqbQbx8rAElxcdWuL31gpe
         jm4rM9K8KkfjQI0ze6eewcOM2RexztPBkSPtxVFlSql0rbIuR5UVRtZmX3C3r5jWpZIA
         TBiQRVY0EkUfo2MDKi8fU6VBTPPhlJviXPg/riUp/O+EYS1CkL2bB/LHk7TkCbfp869V
         BVXQL+wdUhyEYsAwpOMT9O/fqbJgfCGK1C9MAXg4cVxPHwxe/rTQH95SydDEQDIbhMXQ
         n7rnODbIo3MPcjlmHr2IIAIx4B1XBIzVptmVTwXTD7R+oAq48/gg8aMoB3pNMMfGBhNo
         NEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RBY7BaUhkGRQQTB0edgCUS5hfjW8lhC0gru0NBa0S+k=;
        b=F2+NeGbRquivzkwTk0txk0dpdE/nsJReEtGCj/tlRABKLoKsa7/pGt6wOMc9cSGneH
         ihRY65OgGu3e188dJXeZdCD+gp8/Hfl7kSoIuSeUb8mbLuTZJyJ+wH2vtsHH8jsr9BDt
         Iqhur3Ia7bzi6eojXU7ZmWq9I2gOrnJcjBha6s3+yn8ntmLMHoxWw/4s9WQGHX9C3agM
         yvBTz7O1AVjhcD6hw8pvL5kua43N+9kKUFecB1e/ebC+UQJ+2hW3qUNyUQtFMdQBz3L0
         UTe6zxSgqyMZtYGI64JZdw3dIDv4dFX6a0RpPatNQFrJgwW/yPhx1/qNDgvGmWdFXLVE
         E9cg==
X-Gm-Message-State: AGi0PuZYDx698hwHPmD9ed3kJg4jMk2i7UvE7rdWxqY92IC6zFYdBQEq
        XBZCrNj2Suj/aFX8GvrhcA0=
X-Google-Smtp-Source: APiQypIIC0HfPhRwCJlizQFCTrFWTHE5qNuFWkgb6tM0PkGWI9hLrA2LNkcTOV/p52fwUuft4FFmBQ==
X-Received: by 2002:a62:32c1:: with SMTP id y184mr32213472pfy.306.1588151062765;
        Wed, 29 Apr 2020 02:04:22 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id 4sm688513pff.18.2020.04.29.02.04.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 02:04:22 -0700 (PDT)
From:   Liangliang Huang <huanglllzu@gmail.com>
X-Google-Original-From: Liangliang Huang <huangll@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Liangliang Huang <huangll@lemote.com>
Subject: [PATCH] MIPS: Loongson64: Switch the order of RS780E and LS7A
Date:   Wed, 29 Apr 2020 17:04:17 +0800
Message-Id: <1588151057-27932-1-git-send-email-huangll@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sort the members of enum in alphabetical order is better to avoid
duplicate mistakes (because the list may be grow very large), so
fix it by exchanging the order.

Signed-off-by: Liangliang Huang <huangll@lemote.com>
---
 arch/mips/include/asm/mach-loongson64/boot_param.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson64/boot_param.h b/arch/mips/include/asm/mach-loongson64/boot_param.h
index fc9f14b..f082d87 100644
--- a/arch/mips/include/asm/mach-loongson64/boot_param.h
+++ b/arch/mips/include/asm/mach-loongson64/boot_param.h
@@ -193,8 +193,8 @@ struct boot_params {
 };
 
 enum loongson_bridge_type {
-	RS780E = 1,
-	LS7A = 2
+	LS7A = 1,
+	RS780E = 2
 };
 
 struct loongson_system_configuration {
-- 
2.7.0

