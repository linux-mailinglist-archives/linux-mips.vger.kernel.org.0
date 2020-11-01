Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6DAF2A1BC6
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 04:33:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgKADds (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Oct 2020 23:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgKADds (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Oct 2020 23:33:48 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE43C0617A6
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2020 20:33:47 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b12so5051970plr.4
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2020 20:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BjALlrNXEo/OcNWKugTiXlaqD1WGrYLS8CPlcbmef5M=;
        b=qAdQpzsGqXYh9MTmTzNwtjOYioya8GZyiDDblvgB4tIRT10D/M7BAiWejaRx11GHgE
         LugSoT4W1LVr6g8l/SgNa5FLAuNdW4+RyYfV8FHpjdtRJcC2Re0Ge3KFRK5iKYb+kSLm
         2BHhZ8AvhFqI/NtLwinIg0klLTrkuezeTGiste/ONGklUnsUiVWX5PR3wgxglozQ+ALG
         9jTdkoTJbz0Eo/CZ2Rp1Xn12AJNorLextjNSUUNQmNjr0l90Yc2SoF+nNNk4wUeFnIgA
         NBETFRdVDRSLyGCeu6ZvSmAnAbbgBXAjrmeLOTaAIQVsEOl1QbNfEly/bBKt3VW1/JJ9
         ffXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=BjALlrNXEo/OcNWKugTiXlaqD1WGrYLS8CPlcbmef5M=;
        b=V8+X2lRatAVX0cnCqkMQAhFXRVVcRhzqfChMUfJyAtVBoXmXO/yU/4UGz+KIvnUS9X
         nmMSkSZAWO5ySHQK57RL+bYqjEMdkoK+9+bUO6ZNL1fqlB8woft7EiFxMh2dahmn1lAh
         EYpZVPhwcS4VVXE3Ok5v9Jxa/Xktxamn9OYqWSZ9QfkxM+EmlYw2rkPi8D2UeH6JBH9i
         WVQhC6MI72Yb2D5VGAUffbRLrpI1TueMB7fd6+vRFN91Q4ehhpxHZXdahqrYS8abDuwV
         0QtQHGexzXirprV7ldS+CEujxxb7TyLKpNjV0oh6Dph2wsYFG3N2k+GbmTIztW1SYnta
         g//Q==
X-Gm-Message-State: AOAM530sn861xS64UItbFJs4nhmjyMirw1+xMHKJ8Y4UXVgvd0uAwU43
        5/e8MsGbq/U5J0ER/4u7uJs=
X-Google-Smtp-Source: ABdhPJy2Z81i2ysFdM64+isdcqVCTh/gx8xM0dO+hfM0kSLSLBDryTfD2mu8emebh+a1w9/tPOM5Jg==
X-Received: by 2002:a17:902:c403:b029:d6:4021:28dc with SMTP id k3-20020a170902c403b02900d6402128dcmr15865676plk.36.1604201627441;
        Sat, 31 Oct 2020 20:33:47 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id k8sm9038447pgi.39.2020.10.31.20.33.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Oct 2020 20:33:47 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mel Gorman <mgorman@suse.de>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mips@vger.kernel.org, linux-mm@kvack.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH Resend 2/3] mips/mm: include _PAGE_SPECIAL in _PAGE_CHG_MASK
Date:   Sun,  1 Nov 2020 11:33:57 +0800
Message-Id: <1604201638-4001-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1604201638-4001-1-git-send-email-chenhc@lemote.com>
References: <1604201638-4001-1-git-send-email-chenhc@lemote.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

_PAGE_CHG_MASK contains the unchanged bits during pte_modify() and
pmd_modify(). All other architectures include the _PAGE_SPECIAL bit in
_PAGE_CHG_MASK, there is no reason that MIPS needn't.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/pgtable-bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/pgtable-bits.h b/arch/mips/include/asm/pgtable-bits.h
index f697c32..50b3978 100644
--- a/arch/mips/include/asm/pgtable-bits.h
+++ b/arch/mips/include/asm/pgtable-bits.h
@@ -301,7 +301,7 @@ static inline uint64_t pte_to_entrylo(unsigned long pte_val)
 #define __READABLE	(_PAGE_SILENT_READ | _PAGE_ACCESSED)
 #define __WRITEABLE	(_PAGE_SILENT_WRITE | _PAGE_WRITE | _PAGE_MODIFIED)
 
-#define _PAGE_CHG_MASK	(_PAGE_ACCESSED | _PAGE_MODIFIED |	\
+#define _PAGE_CHG_MASK	(_PAGE_ACCESSED | _PAGE_MODIFIED | _PAGE_SPECIAL | \
 			 _PAGE_SOFT_DIRTY | _PFN_MASK | _CACHE_MASK)
 
 #endif /* _ASM_PGTABLE_BITS_H */
-- 
2.7.0

