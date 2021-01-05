Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 564FA2EB3FE
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jan 2021 21:17:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbhAEUQr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jan 2021 15:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbhAEUQr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jan 2021 15:16:47 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A52BC061574;
        Tue,  5 Jan 2021 12:16:07 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id u21so611270qtw.11;
        Tue, 05 Jan 2021 12:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HK9s/29ASBwdsRk66LeB+PVLzLRMTM0MqUqNfbGHfA=;
        b=NjUIqFehwQf/ZlLfMbBBhKZ9+FcC2BojJtfi4sGTgXPD0SiT3o1ofDdGtMdHhAR8Vm
         zUBfQkDrVaYTJaah+0zy/sSCzzhVhfitcGEdRNdM/ibc/sZkBBOQlRKBqM5Ect4QE+uh
         Wv371jDuwQ0L1rUN6x+4JGGAbfnvchwJcZ9SyelsABhTqPoF6Xd8xkAfPqccxKnAQIm4
         x3CUYXrMv0Fq0S4oWINxo/roKfQpx3x9yAszzhLZtrw/J+VAwiuGTLGPARWQ0S0G01aU
         6TdPbUeK1EtNdeHnHLUcWckkoUoVytl5Hu9JmUVELeOEmCdUIZW14ZoRwEB72MdfFUm+
         rn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HK9s/29ASBwdsRk66LeB+PVLzLRMTM0MqUqNfbGHfA=;
        b=V7Yj4drA8cYhysBpXKDp8f83fwVK/1FMlncJ4cqntLC/lxWJHelwB3GYuAUks8ooM0
         f+fKI4NoqHlp62SanptQ88009sqRSm0JFWb7NWe8jWTCuSRi2i/du5tlkBCv+jws0bP8
         DlwXS4Huzwy/U9PqmDg+Cx/QEyGYv2hfSYb/Lei1k3D0vZB742Wuq1Zu+9Dr2VVxxtkz
         ihbo5GO/K4FRBgbA/f0ipVmI2dD8MB3FHQ+Dkgf78yalVjI9DnNbAZ5TIVGz0RhGMZ8G
         1nNsV5HBGRyMqG+Z4GGzkeEGI1EtkAE+hIncjQZyrvB1S1Jo5TxqdNYxEzwdpX7LXTDq
         2LEg==
X-Gm-Message-State: AOAM533nEeNuJ23x6rcuk3EadTFqUm/Vs+NsiRq25OZfjCjusYfxn+GF
        v09lYOv+lj2AdIX4dSiYAH8=
X-Google-Smtp-Source: ABdhPJxZ5R0q8axVeGrqJqrhs/4PmYUK6To1x4gtw6IbjXZt5465sXKC/ZeM1393otNKxUtCfy4YfQ==
X-Received: by 2002:ac8:5ed5:: with SMTP id s21mr1207318qtx.114.1609877766236;
        Tue, 05 Jan 2021 12:16:06 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id y22sm186640qkj.129.2021.01.05.12.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 12:16:05 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Dmitry Golovin <dima@golovin.in>
Subject: [PATCH] MIPS: lantiq: Explicitly compare LTQ_EBU_PCC_ISTAT against 0
Date:   Tue,  5 Jan 2021 13:15:48 -0700
Message-Id: <20210105201548.50920-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building xway_defconfig with clang:

arch/mips/lantiq/irq.c:305:48: error: use of logical '&&' with constant
operand [-Werror,-Wconstant-logical-operand]
        if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
                                                      ^ ~~~~~~~~~~~~~~~~~
arch/mips/lantiq/irq.c:305:48: note: use '&' for a bitwise operation
        if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
                                                      ^~
                                                      &
arch/mips/lantiq/irq.c:305:48: note: remove constant to silence this
warning
        if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
                                                     ~^~~~~~~~~~~~~~~~~~~~
1 error generated.

Explicitly compare the constant LTQ_EBU_PCC_ISTAT against 0 to fix the
warning. Additionally, remove the unnecessary parentheses as this is a
simple conditional statement and shorthand '== 0' to '!'.

Fixes: 3645da0276ae ("OF: MIPS: lantiq: implement irq_domain support")
Link: https://github.com/ClangBuiltLinux/linux/issues/807
Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/lantiq/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index df8eed3875f6..43c2f271e6ab 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -302,7 +302,7 @@ static void ltq_hw_irq_handler(struct irq_desc *desc)
 	generic_handle_irq(irq_linear_revmap(ltq_domain, hwirq));
 
 	/* if this is a EBU irq, we need to ack it or get a deadlock */
-	if ((irq == LTQ_ICU_EBU_IRQ) && (module == 0) && LTQ_EBU_PCC_ISTAT)
+	if (irq == LTQ_ICU_EBU_IRQ && !module && LTQ_EBU_PCC_ISTAT != 0)
 		ltq_ebu_w32(ltq_ebu_r32(LTQ_EBU_PCC_ISTAT) | 0x10,
 			LTQ_EBU_PCC_ISTAT);
 }

base-commit: 36bbbd0e234d817938bdc52121a0f5473b3e58f5
-- 
2.30.0

