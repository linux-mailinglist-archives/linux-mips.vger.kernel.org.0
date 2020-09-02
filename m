Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F27D25A6D6
	for <lists+linux-mips@lfdr.de>; Wed,  2 Sep 2020 09:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgIBHcu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Sep 2020 03:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726654AbgIBHct (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Sep 2020 03:32:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5791C061244
        for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2020 00:32:48 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gf14so1895180pjb.5
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2020 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0sZaz/VyycuoChmF6tm3frTdEvnNpUVNY3yIXV61ue8=;
        b=exLnh+o+DzCYIjzWI/O2LK7U7++fhbquhl7FhLGAX1Rxcsq36jcESeTVzg4BmLfamx
         MF1jayPioR6hvIgM6zWRPVWaTdm81B5JuLwSQqXoXqI//uPJXu0Z3pG8Ncn3CHwx1kcb
         MHnxhAVo7IH3XT3+QIkAD7cXhjCqnHQHGxrpLZuCq9VUkJOm+1/5wur/O7EnhFqRh6hr
         VarXEa80Ks9wsvvfUMDFs9yYU8Ln4259LL/oimRMOOeORg32E1OhrFK0czbMtriHU4kj
         MPFj8BBgAIEs77kGIIs0xOvWSQ4xQInecOKj3f2cL8c1rJC/L4HG/L9IG0gWIHIYixEE
         LVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=0sZaz/VyycuoChmF6tm3frTdEvnNpUVNY3yIXV61ue8=;
        b=iIN0yCRpp48BpCaOsjETjGkMpWD53dV4ItKpaSd7TaqGoHCxsQOHZrY+u8fMB1tFkS
         6PnsMWQUfaangTE+CcgxcgPZDVylxnms1xObp+7uTfnq/3juTkhBp5q4j2DvemxCwLWG
         LYEmuU88xTsNeqpBoodxC6GIbRjNczmRN0rHnB50N3H6l2RyIWGHTRAQjC4v9bwKnswu
         3ohYkuhYbPZVQsNn6oJ1P54+Eo5qzAb9LQwHI8/AO9CMpmuLtB44AI9atWcEp1YAFQlO
         zSEbj/4NmNX7qw40yEZ4fV4T3vVXETzprTX3J3GLJF/8tyF/XaG+rqU+yc7CqCxHNoT+
         7KEQ==
X-Gm-Message-State: AOAM533+9QW66MdNyNMeResJSn0cNfC/dd8L08U56ZvIFtef2lnmrOwr
        z5ld3rGvyXOOZdF0B+EjkkNj6LHWRfDZVQ==
X-Google-Smtp-Source: ABdhPJxJ62FiB6nKYtirbwUEJYtSLJTvE0MYCwt5yFS6i6Dbtmb8PvmUEQGlwFlTBJee+uh1lhq9Fg==
X-Received: by 2002:a17:90b:1487:: with SMTP id js7mr1087527pjb.187.1599031968355;
        Wed, 02 Sep 2020 00:32:48 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id r10sm3518082pjp.49.2020.09.02.00.32.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Sep 2020 00:32:47 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V5 2/2] MIPS: Loongson-3: Calculate ra properly when unwinding the stack
Date:   Wed,  2 Sep 2020 15:32:04 +0800
Message-Id: <1599031924-31659-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1599031924-31659-1-git-send-email-chenhc@lemote.com>
References: <1599031924-31659-1-git-send-email-chenhc@lemote.com>
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
index 9412314..c4e9fd8 100644
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

