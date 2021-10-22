Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EB24375F9
	for <lists+linux-mips@lfdr.de>; Fri, 22 Oct 2021 13:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232730AbhJVL3p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Oct 2021 07:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232714AbhJVL3o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Oct 2021 07:29:44 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E21AC061764
        for <linux-mips@vger.kernel.org>; Fri, 22 Oct 2021 04:27:27 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id s61-20020a17090a69c300b0019f663cfcd1so5485929pjj.1
        for <linux-mips@vger.kernel.org>; Fri, 22 Oct 2021 04:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDKqhv9ocG3L7qKrJtNRGbwSOUYIWVGDE3gMazO/xeo=;
        b=FXAawuuq2ZlGwPeCD+yCgw5qOixWaXG0uv3hu20SWSBrUvS2Yi47PvBpDZwlgARFZg
         20trQ4HqxJKkCUgKqeZedmySXtxgNYk2BsRY2XqdX5/xlRksZQ0wlJFTXF4HWST7CYBl
         G4f+yvlb9+TkWw5XVjLOuohY574GIdymt9LSVHU0E9wMDYmZY1RHUPp4Atk4pbUyo4xn
         nikWRTIhGeeYhJhUxHRY8CEiojp5OlBla0Pg18wbMWO3XPiZjmyqlqgG0EeWMlcnlHxq
         MVp4PpkX4V2USJ/A4dt2nFBrWcieKCsW8nwBHrJ4aBClbCC41365l+9H/1cvH0mDPMOx
         qhqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pDKqhv9ocG3L7qKrJtNRGbwSOUYIWVGDE3gMazO/xeo=;
        b=FCjWJweIFrzZjZo+8XJn4UpYbe17QIrZEl5OBl2oMk6AciBOy50ca3r93g7QhB9UCQ
         9SsNg2A/AcBQcIv/0CYyskHHzWynBE0y4zoygjKtp7vSl4i6taaFBDDX6cUUJL88qxDK
         X0bIC4KtLoPyA5qpsHYuQigXInnHqs330CI3+FWdgXAMjG6/AfU7iYdM0uAZb6bR8+NC
         sbu6Xfr61N4LSuReTHHedN5C46vvqAAGJi4Lwq0FYV90870scEB3b1FVAN66LOZRs4W7
         lNygM89B8bk5IED+89lcigUPu+vIdkwkRMeso7O5OZO1jaNQ89w3/Yd43G+RXsel/WWv
         707g==
X-Gm-Message-State: AOAM533/BvuQ20fcj/1vHFhU0C4PukXJKalfQx6VdQ9DdoRkgbHhrN89
        DXwcgHA9T67LQB65i7Hv9Ww=
X-Google-Smtp-Source: ABdhPJy3R31B8AZL55DV2+gGgUxKEZM5agMK/igSyjR8OOJP1+MvkGFaacXWVye8fLNGYBGcMv49Eg==
X-Received: by 2002:a17:902:8bc3:b0:13e:9d00:a8f5 with SMTP id r3-20020a1709028bc300b0013e9d00a8f5mr10795720plo.79.1634902047063;
        Fri, 22 Oct 2021 04:27:27 -0700 (PDT)
Received: from localhost.localdomain ([112.20.112.18])
        by smtp.gmail.com with ESMTPSA id r13sm8109779pgv.21.2021.10.22.04.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 04:27:26 -0700 (PDT)
From:   Wang Haojun <jiangliuer01@gmail.com>
X-Google-Original-From: Wang Haojun <wanghaojun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Wang Haojun <wanghaojun@loongson.cn>,
        Li Xuefeng <lixuefeng@loongson.cn>
Cc:     linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: Fix build error for brcmstb_gisb
Date:   Fri, 22 Oct 2021 19:27:08 +0800
Message-Id: <20211022112708.962338-1-wanghaojun@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The GISB bus error handler need board_be_handler, but this
code cannot used it when BRCMSTB_GISB_ARB is a module.

ERROR: modpost: "board_be_handler" [drivers/bus/brcmstb_gisb.ko] undefined!

Signed-off-by: Wang Haojun <wanghaojun@loongson.cn>
---
 arch/mips/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 6f07362de5ce..409bcc755b89 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -104,6 +104,7 @@ extern void tlb_do_page_fault_0(void);
 
 void (*board_be_init)(void);
 int (*board_be_handler)(struct pt_regs *regs, int is_fixup);
+EXPORT_SYMBOL_GPL(board_be_handler);
 void (*board_nmi_handler_setup)(void);
 void (*board_ejtag_handler_setup)(void);
 void (*board_bind_eic_interrupt)(int irq, int regset);
-- 
2.27.0

