Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9CB41BF473
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 11:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3Jr1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 05:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgD3Jr0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 05:47:26 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5EF0C035494
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:47:26 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id y6so483766pjc.4
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=XgJB8DtSdMC3UFhuj/Sd0LnnrydeAX5jTMtlOK8/DpU=;
        b=KeDKz8xFDccmUUOjk7Qpq7J6gjrFrlJEN4pB7zg4tYpuF5v+PJygHFOuoV/6GKtHkk
         6VbsnIZ7KIK3Hxo437sAanFM5wa4Uy68vNtLl+SkQ0ejv9ZcA9ffhE3q9W5wtyeynfNa
         Rlrf+bn38HZAamENWlS6I1AJwUpyNEW0zFZWTKWV1HRMvU2wFbjm4Rvs6rAzN64ZPx4G
         qWzdKnp+OUS7z2vcQSb2/nQuYMpddcI0E1+oN0d2yQf1cDLS8Rrz7GJNmcRaleIn+YSb
         /GkpQwechM6GNMJa9vFyHtMOIT0xm18omZIcWejoZVGLz8X9naIckeSPxkFTrtFYw64r
         POAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=XgJB8DtSdMC3UFhuj/Sd0LnnrydeAX5jTMtlOK8/DpU=;
        b=grEjDlviO8yAvK6ztp0u65mNV2gYomKe84yrmdbelv0vS7MoFIK9TQcmS2jOQnmwvl
         M7m8w0U3+yamXDaEwFHpCb6D2kNWd9ZfXUHmhBf/695KICh9Bx/aZcxu3BXoA+QkXprq
         XlPIhQIZMcnK2LonEsEXOpb9nEFiJNsvm1JXt3Z0/XNiZEb80xyt8QsIO1+eClKdgFM6
         AVr8WL9RSuYZgDgDdhljgkxWRrcgQ0m4NbXyZEQA31GfQTVcncHVvE58/Z+AUnPY7Wpl
         RVHrgeOnJHOiO1vpxRV6KYyVkJ7WR49mQbzSEeW1inEqG8MdsX8s6hkaiTCB4x8X7JwN
         VZ2A==
X-Gm-Message-State: AGi0PuZNJS4FqtH4yajcsg1TXiKf4/+EEe2zrkV7Ea298/M/UXqA7sFH
        wca1/4Kb48SbmN0TDWJ27OCIHPRiQaU=
X-Google-Smtp-Source: APiQypL/9z2gbZaGfKAS2rTN9IgzZyeHF4JvVA3cbF3lsSd9EO7yJiqW5vHiYW7WTVDLSqZTUy5BLg==
X-Received: by 2002:a17:902:7444:: with SMTP id e4mr3022067plt.130.1588240046483;
        Thu, 30 Apr 2020 02:47:26 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id y186sm3031729pfy.66.2020.04.30.02.47.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 02:47:25 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 2/2] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Thu, 30 Apr 2020 17:46:35 +0800
Message-Id: <1588239995-23104-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1588239995-23104-1-git-send-email-chenhc@lemote.com>
References: <1588239995-23104-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-3 has 16-bytes load/store instructions: gslq and gssq. This
patch calculate ra properly when unwinding the stack, if ra is saved
by gssq and restored by gslq.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/process.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index b2a7975..3993554 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -279,7 +279,21 @@ static inline int is_ra_save_ins(union mips_instruction *ip, int *poff)
 		*poff = ip->i_format.simmediate / sizeof(ulong);
 		return 1;
 	}
-
+#ifdef CONFIG_CPU_LOONGSON64
+	if ((ip->loongson3_lswc2_format.opcode == swc2_op) &&
+		      (ip->loongson3_lswc2_format.ls == 1) &&
+		      (ip->loongson3_lswc2_format.fr == 0) &&
+		      (ip->loongson3_lswc2_format.base == 29)) {
+		if (ip->loongson3_lswc2_format.rt == 31) {
+			*poff = ip->loongson3_lswc2_format.offset << 1;
+			return 1;
+		}
+		if (ip->loongson3_lswc2_format.rq == 31) {
+			*poff = (ip->loongson3_lswc2_format.offset << 1) + 1;
+			return 1;
+		}
+	}
+#endif
 	return 0;
 #endif
 }
-- 
2.7.0

