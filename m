Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73F38E0C8A
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 21:26:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732929AbfJVT0G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 15:26:06 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41591 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbfJVT0G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Oct 2019 15:26:06 -0400
Received: by mail-lj1-f195.google.com with SMTP id f5so18443789ljg.8
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tIrsfH/mLfuQrVmbo22yaYNOxIWUY7aFE6XG7/giK/s=;
        b=SVJLkEKSsXLiZm82VdNp2yINij5+pkg4VXkdBRPWOuBvBQVvZwvFs8bmWH6FFrpQqW
         VqaJLoWnWvOodAaAt4z/puyO6cUX7ivGc/q+eHRIfNDX1zKpfaG52SooKCyOvYBtGcGw
         FkxKW7bSrcgwjKTgrR4EPVBV7xmDAH6HXKUPHJ4ADZeIl6p8jbR1wh8hzzeA0RxGbPBM
         skLbBQTmrKUg8iIDcnipHQ+bWkrxea7HmdO/6lqaWhDkoz31OuObsGh1dCNUvimrYnGV
         V0gjSsUZETSg2KkjZqM3lcxihwzcCUuPlcaz4Wb+vV/Fh1sR6kK8B1UGv9Mdzq9GbbA1
         o1QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tIrsfH/mLfuQrVmbo22yaYNOxIWUY7aFE6XG7/giK/s=;
        b=mod8Zz/80H5XLN2rpqKpVydbls3Q7jlLrhAKctqflyfuDqasTJDo2aZAHh6yUpVYsW
         oq//j5ob/pCJZ7/DlkoCFh2XwVgNF0Y2dLcEorPZGPpnW0pFtjq6CfdOAhIeoVYrmHA3
         7Po2IYEi0s/9bP91309EJGr2eWLo5B3ozMjA+vXFlLd4LlUoxQOewUdTMYSYOe+lgvOg
         IcwwY3vclLIAGNPRqWynQhmd9jDAgXExb3xQG/74TpJk+XloFOBvDB4Vaz7Wo/8A+xtH
         83SMHeJ72damN+yN0RAySuhSupw0h/huEUAJtl2GHvDgUdatAcinddXHukWIuAIbaTrv
         0M1w==
X-Gm-Message-State: APjAAAW0phEhbcLK3jGF/u3/7RFVC6DM/2Xcpf7VAEu0zxPaoqs1HnU9
        ZdYdZMInjbrjTgNhCk2Mljo=
X-Google-Smtp-Source: APXvYqyGHZRWzMKobMvWlrc7oQiNW3GC3Y8dEF20KNH+NlAkaDzOesALCvA8rRZ29CPCgDvgBh8wOg==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr19300268ljj.43.1571772364823;
        Tue, 22 Oct 2019 12:26:04 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-153.NA.cust.bahnhof.se. [98.128.228.153])
        by smtp.gmail.com with ESMTPSA id f22sm8152854lfk.56.2019.10.22.12.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 12:26:03 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     chenhc@lemote.com
Cc:     chenhuacai@gmail.com, jhogan@kernel.org, jiaxun.yang@flygoat.com,
        linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        paul.burton@mips.com, ralf@linux-mips.org, wuzhangjin@gmail.com,
        zhangfx@lemote.com, Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] MIPS: Loongson: Fix GENMASK misuse
Date:   Tue, 22 Oct 2019 21:25:47 +0200
Message-Id: <20191022192547.480095-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
References: <1569073828-13019-1-git-send-email-chenhc@lemote.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Arguments are supposed to be ordered high then low.

Fixes: 6a6f9b7dafd50efc1b2 ("MIPS: Loongson: Add CFUCFG&CSR support")
Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 arch/mips/include/asm/mach-loongson64/loongson_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs.h b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
index 6e3569ab8936..363a47a5d26e 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson_regs.h
+++ b/arch/mips/include/asm/mach-loongson64/loongson_regs.h
@@ -86,7 +86,7 @@ static inline u32 read_cpucfg(u32 reg)
 #define LOONGSON_CFG2_LGFTP	BIT(19)
 #define LOONGSON_CFG2_LGFTPREV	GENMASK(22, 20)
 #define LOONGSON_CFG2_LLFTP	BIT(23)
-#define LOONGSON_CFG2_LLFTPREV	GENMASK(24, 26)
+#define LOONGSON_CFG2_LLFTPREV	GENMASK(26, 24)
 #define LOONGSON_CFG2_LCSRP	BIT(27)
 #define LOONGSON_CFG2_LDISBLIKELY	BIT(28)
 
-- 
2.23.0

