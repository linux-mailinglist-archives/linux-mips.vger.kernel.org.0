Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD4A843DE3C
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 11:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJ1J7y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 05:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhJ1J7x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Oct 2021 05:59:53 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F995C061570
        for <linux-mips@vger.kernel.org>; Thu, 28 Oct 2021 02:57:25 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id m11so2735416oif.13
        for <linux-mips@vger.kernel.org>; Thu, 28 Oct 2021 02:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=skVFEMOey3c9E4at7b7FVQSYZauKfLlM2hQLr2HIp8M=;
        b=Y/5306iGJ25b1n+/kLS91Yk/aJ3qg/MUy9B57mWlWYG+q3b8hzX9Hii7p9GaJ/pI7m
         RLwH8SwwcXj9Zs3ICRzbezPYOcP9uBhmjFJMqrkeTjihUKaWrSFFhi1+tNEiSh7LiQh3
         O3VWyOcjRTlv4OKG36UHgH/u/9o349VJkJs4wWwko5SEv8L5ns/+h1VKUR0xm68Fki0q
         5jmIo3HzCthxEXpdk1WUW2H0Lr0w3r8xHDsmRIafnsJwvJzly/9vGngxgMaOlmNVxPpo
         VcoBgvwtSXbKt3UE+X8/D+EyoOINqSCQQKwoA9fY1MYsznZsMjqZHc2Lt5aZwp8+7rWz
         PcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=skVFEMOey3c9E4at7b7FVQSYZauKfLlM2hQLr2HIp8M=;
        b=Rh58tT4qMll41H4iiWrmrWmnk/G27mkBPhD0cinFdxfe2gIen9GFZpCw3bGU2stlT1
         6ncNWFpQ2sKtteZZxAwcgCpD9r/7HMmMRl0hbT8WwIOJLZ5F8mlKNlMFj11eYpyPyso7
         GH3pErCl0oohr8OZ6h/muzkgQyU4JGTvDp5OB3NY1NwKsN00b+ZnvdABZQkuZ33xJlZc
         oCwbmyhyj074OJ4s7KaJT5AYfrXz+b4LraUsrY1p4WCDefso/aPS7Bk7CWRRo8C3yT0W
         OF7TyetsGpms+DqfPLV73IlkleG1WEe0YnYY/imj3tNswVw8ft5Z9TdVpE7fBnhu+W4V
         J2mw==
X-Gm-Message-State: AOAM533rCXOH14dDqtE6SU3FkdMG39qhkVAR/2CnzfSfpmgbsBc7fVYy
        Q5ddiHr4YDmKEkgQXSLi8hk=
X-Google-Smtp-Source: ABdhPJw4Ulj/HQLO1VnzkxGKoLib3lEvxzwteMsebyqTi6ft3r1YfeKb6ejgNF1NXBU21yIMisP7xg==
X-Received: by 2002:aca:c156:: with SMTP id r83mr7684434oif.78.1635415045072;
        Thu, 28 Oct 2021 02:57:25 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id y10sm931444oti.40.2021.10.28.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 02:57:24 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     tsbogend@alpha.franken.de
Cc:     Yanteng Si <siyanteng@loongson.cn>, maz@kernel.org,
        mark.rutland@arm.com, linux-mips@vger.kernel.org,
        chenhuacai@kernel.org
Subject: [PATCH] MIPS: irq: avoid an unused-variable error
Date:   Thu, 28 Oct 2021 17:56:52 +0800
Message-Id: <20211028095652.3503790-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When CONFIG_IRQ_DOMAIN is set, there is a build error:
arch/mips/kernel/irq.c:114:19: error: unused variable 'desc' [-Werror=unused-variable]
  114 |  struct irq_desc *desc;
      |                   ^~~~

This variable is alone at here, let's remove it.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/kernel/irq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/irq.c b/arch/mips/kernel/irq.c
index 1fee96ef8059..5e11582fe308 100644
--- a/arch/mips/kernel/irq.c
+++ b/arch/mips/kernel/irq.c
@@ -111,8 +111,6 @@ void __irq_entry do_IRQ(unsigned int irq)
 #ifdef CONFIG_IRQ_DOMAIN
 void __irq_entry do_domain_IRQ(struct irq_domain *domain, unsigned int hwirq)
 {
-	struct irq_desc *desc;
-
 	irq_enter();
 	check_stack_overflow();
 	generic_handle_domain_irq(domain, hwirq);
-- 
2.27.0

