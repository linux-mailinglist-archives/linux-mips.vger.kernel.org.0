Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452DE271EAC
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 11:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbgIUJNy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 05:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgIUJNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 05:13:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3291C061755
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 02:13:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a9so7125891pjg.1
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VairmXzYfCn1dnkA9xHTGhcEUlhFriElxDnD3N6Npyk=;
        b=rrgZr11Hv8ky9SeNV2+fSdSM4bwfDS5HPPTELoI7cUWvthQ9xnzAL99SNyyvLo8NiC
         G0yIepumSUOj2bBMDTvM8qb4RZCVin1fQ5KYqjwSKE8BIW+ku2i5x3ISinRlAbFgro8b
         4AAHoVofzP/rggzAxc6VCKmfVXW8Dxgo8zOSw2ND2XpdAinw33kYoI7xSJBUQvfVkY1N
         gmYv1SvJVOA7LRsmDJq487Iq2qZbgdGlDAE32aYqpYDwW2wxMreGppNEdyrhv4+jObL0
         XrBaP6iAYwTI5nwRbQ3ZFVh8m/ExasiXFAHw8Mb5KhZKO1GHK44hl3uRBgBupeTOnY+Y
         QAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=VairmXzYfCn1dnkA9xHTGhcEUlhFriElxDnD3N6Npyk=;
        b=fpYc/PrCXWCs34Vl3aYGiovhDInoHRq3vfrMfYeems2JR1SDhyWI3HJNvp2U5NCjgX
         PmWbsFW2wcWwrFQbHCAgHN3dqsmntRWaQ2uNB/W4WJiJLrg5DV1Rsl06tB2TLiSdgubj
         DLfCC0773THw4Ztnvamgh3XMDZmBGlM/rg5zXHo+p0bccEdAfXNt8JU4WiFFUFzYDFtN
         peBBe4i2KNEOUR1Rw0psRn9viX1IIw+sQEl8RKllEoCCeLov2BKr9EcmF/u4pNgzIzQ2
         mQRukkLT5ilfoz6LuOxHQQFuqtHLPaspJUHo3CEKN4qu7Gm1AHbSVX7iaJWNyhOGJDtJ
         N5Qw==
X-Gm-Message-State: AOAM533m1ioiJX6P0QRqR178CMy/aSsFsFmUbPXGPTkdppec6U9HuqC1
        o+x8rFk3vwzBvB5gP7dLddo=
X-Google-Smtp-Source: ABdhPJzo1rIhmuVt5jZAIWHTgwGLV0aAkoaqgONPslkxsdYNw07XJuWPi+d3PmDXDfeaJKY5C55JHQ==
X-Received: by 2002:a17:90b:c90:: with SMTP id o16mr24671691pjz.86.1600679633492;
        Mon, 21 Sep 2020 02:13:53 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 134sm11723885pfa.93.2020.09.21.02.13.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:13:53 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 3/3] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Mon, 21 Sep 2020 17:12:28 +0800
Message-Id: <1600679548-29154-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
References: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
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
index b36297e..37f05c8 100644
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

