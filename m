Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 679FE1B5AB1
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 13:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727122AbgDWLp0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 07:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727088AbgDWLpZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Apr 2020 07:45:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ECCC035494
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2020 04:45:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id t40so2390307pjb.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Apr 2020 04:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FfKfDBS3E7O8+6weeyCOGB77mjSuhzvIHDondzmM7AE=;
        b=caVDZ0HvxmyvmnuVbBENJMWBXz8S1/DGSCWPsRXLQwTzFWtxz1pA2c7NOkRkIV8CRN
         k0RGr2ghXYmJi7mqC9UuihpLlVLSDcN+cla4v4KmyeY4nPQUjnqIy33flS6tiLURmn5g
         ygWVBjeLgmgsnT3U50zojZ0R+6C4srWGurAD1seUOp0IhtK0REHIpGNVKBMd9+laF/sx
         7xnYZQ3c3P5rvC/znlpGkRjkl9RE+Df5A8D+DJw4qkszkTtdgRdD5yoq0SLLBzkCnBu3
         nunm7UQoE9SnzVimyBQ+UUXkScTr6Ekl3vDfr3rpbPgzqyEQ0/zFASa5lU+I7SLealXn
         vMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FfKfDBS3E7O8+6weeyCOGB77mjSuhzvIHDondzmM7AE=;
        b=qIaXdjvuxHGkOxvzcyfdza85Qrn/f75CofV5kJNkbVM4uYU2BF7mUTPv84hA2ENoIL
         FG3K4xYGxvEFLifonV58Ok/BG8MLbjH3M7AJjG7JxWQP5LHdfUkKmDGYRUI6XHgMN4tJ
         hpzZesgBmpb1UeIqXbWsqIsMIA587HsZd5gJ/nG61YrSykDGo3ldvLjKzEa1ww7JR1GA
         rXMC4lpYLjtBp8MTWxTb0aGh6/mewP1YD2IJE1fugj+Ity5/vDRg99FEzkhNvJKXBykU
         /FztNgs9ijuur9MJfGUzIZcxCbilaT/Rmge2Odi9Av5EF9i5L5jY4/Sj1wDVNxh/Zjz9
         2veA==
X-Gm-Message-State: AGi0PuagdScQEL1ppLssyGCQit230tOEpbCgvqf05OaHCOQlcoldK06k
        kxUeuJsAobgPlj05YVyfK+g=
X-Google-Smtp-Source: APiQypKmSltNn/m3xT+76CSs5WizHmPRw2vuxIfzhx8szOQhDBPGdP9ZuIZf2THBzbbrejICjuH8TQ==
X-Received: by 2002:a17:90a:aa0e:: with SMTP id k14mr157650pjq.74.1587642325030;
        Thu, 23 Apr 2020 04:45:25 -0700 (PDT)
Received: from huangll.lan ([47.74.51.72])
        by smtp.gmail.com with ESMTPSA id u2sm2121327pjn.20.2020.04.23.04.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 04:45:24 -0700 (PDT)
From:   Liangliang Huang <huanglllzu@gmail.com>
X-Google-Original-From: Liangliang Huang <huangll@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Liangliang Huang <huangll@lemote.com>
Subject: [PATCH] MIPS: arch_send_call_function_single_ipi() calling conventions change
Date:   Thu, 23 Apr 2020 19:44:21 -0400
Message-Id: <20200423234421.13805-1-huangll@lemote.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use mp_ops->send_ipi_single() instead of mp_ops->send_ipi_mask() in
arch_send_call_function_single_ipi(). send_ipi_single() can send
IPI signal to a special cpu more efficiently.

Signed-off-by: Liangliang Huang <huangll@lemote.com>
---
 arch/mips/include/asm/smp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/smp.h b/arch/mips/include/asm/smp.h
index 7990c1c..5d9ff61 100644
--- a/arch/mips/include/asm/smp.h
+++ b/arch/mips/include/asm/smp.h
@@ -125,7 +125,7 @@ static inline void arch_send_call_function_single_ipi(int cpu)
 {
 	extern const struct plat_smp_ops *mp_ops;	/* private */
 
-	mp_ops->send_ipi_mask(cpumask_of(cpu), SMP_CALL_FUNCTION);
+	mp_ops->send_ipi_single(cpu, SMP_CALL_FUNCTION);
 }
 
 static inline void arch_send_call_function_ipi_mask(const struct cpumask *mask)
-- 
2.7.0

