Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BD6A2343F2
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 12:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732305AbgGaKKj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 06:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGaKKi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 06:10:38 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2959C061574
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 03:10:38 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b9so16953603plx.6
        for <linux-mips@vger.kernel.org>; Fri, 31 Jul 2020 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BjALlrNXEo/OcNWKugTiXlaqD1WGrYLS8CPlcbmef5M=;
        b=ihYKKhGjad68ofaSc4cMgr5woGRcGHPF2HUwv59xBUJk1sikizziYHrN9mIs76yh/c
         EcQztM7L1d6/O5vmolJ8g+CG7aHWXZhWwVzP65/4ajgKs3GN/34mGYnIGaZlPZlnEdTh
         zFWl/9GQ2jn7dghke5HYczh4VdkYDvmOxRZ0A/lDRMfWlWqM8mEJuO1hKa+1Q9KIcuD8
         DHAV/kWqN7N/jtGDDBrQnSj4Gq4hlcSbJS9Pl9ErjAb2jgbhQ0erfzIwTOqkdtgks1a5
         qHo+JDRhWFNFy9DpxUJCSaSqTicncID8f42s/EnEScdak3qPnxIHRWB4Gajsaeql0YRU
         3w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=BjALlrNXEo/OcNWKugTiXlaqD1WGrYLS8CPlcbmef5M=;
        b=XrN4KYzKuuv0hyC8+GwNwB+e0ckAzf+h1QxLby/WmotRaAF9L2N9RP1oKdH9E0NH8f
         FXOXg8338BZBW/rE3E+0D+CryIp4KBBSSRbkWHaFJircJF4Jv1J6DHgcwoma/poP24BX
         a8f2kT0zvb33ZSyloa6kesisM6ja+N+ZABMhKrbNT5HVslh/ym1uAKD3ps58TVH5HNYT
         CbtmLY4DpaICUuBVCY7oJpVmZ6CxzR1bVvZ9+6QxLL3AQ0wFZ1n45Ek0eLAm4245F8uO
         1PxNXyHqM+/JbDUTRtQDAzd5WtFtOE3TbVR+uV6Gmn/30u0Xgt+kiaTYo2g53evEUuWK
         anSg==
X-Gm-Message-State: AOAM532qSdpnGC3ha2HJID5gR0Ubn/ERboquSklhtuhAmn/ZjPU+XzEt
        70ydRbUfix66M/8B4tdV3FA=
X-Google-Smtp-Source: ABdhPJwjoNOC3IsIIv9P9Y3KoZdHeKG/vh/RJSt1yErEVJiNvPbcw7gnUIn5NRqsbUPed4JcXFl62g==
X-Received: by 2002:a17:902:9a0a:: with SMTP id v10mr3028905plp.134.1596190238488;
        Fri, 31 Jul 2020 03:10:38 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id m19sm3313385pjv.34.2020.07.31.03.10.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2020 03:10:37 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/3] mips/mm: include _PAGE_SPECIAL in _PAGE_CHG_MASK
Date:   Fri, 31 Jul 2020 18:12:50 +0800
Message-Id: <1596190371-17405-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
References: <1596190371-17405-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
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

