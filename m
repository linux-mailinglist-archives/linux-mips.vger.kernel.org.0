Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2CA1F8ECF
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2020 08:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728436AbgFOGzi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Jun 2020 02:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgFOGzh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Jun 2020 02:55:37 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D03C061A0E;
        Sun, 14 Jun 2020 23:55:37 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id i12so6375472pju.3;
        Sun, 14 Jun 2020 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=Mp3XO3Na1QTIvxdf9SelVMciyJHSxvV4qQlUSTKYIto=;
        b=MG2ddZSzOuekSNoUjlMPvQvWY+r4kHTFqYbtyeHlMNtDb+6OD16d5LgjKdHGlXJuhl
         NobjgGxUHoMZMaGiZ3rU66m1fD/PWnm8HVBkmQ2TWaLJY10qQdvUr5QRP+mSGjZUIp4b
         IltN74+zPN60an6dWoocAnv7XNGPOrceMJF3TsfqQNbqCSjCVJjkHlwnAU7e6yn7xgr1
         qOZBtdhzOaHFsF4nfB3p6Gv726gF6FXMZEq5UTh1QvGTxZE7IAL5suNd5NRFZDC0Exll
         XlBbvC18oJkOfLJu+cxSzOVmoeB7a+ovEhL45yI8aK3BiqiQknNbztmY5RZlMN00PWHs
         PKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=Mp3XO3Na1QTIvxdf9SelVMciyJHSxvV4qQlUSTKYIto=;
        b=Q0gEzzvUpfWEdx9tklh1wjUEcwNUIQSasfsCblapYZkJ9/O0bc8MXFzvotehKIx6u6
         wCpnSGXrd99ym63MAgrYlONfr43JB9CB0eGQs5YLpdCD4bPZTyVwtvADJVly+fX1CQ47
         GI8pcRIT3yzJth2G7uIyXWpxYkzEckixNMe6+swtIPapXLOHLwfkUZQRus24S3oqEPBr
         dk5aDCaIpqfxzpthkHzGZ8004vQqPZ+S990Jw0a/uNMMgM1LI6yv0xVFYo/9ukLMPj8F
         P97USr4iCGLpAeAXsUdjrteZy/r3UKqTlfqM0PKq0hNlajw6AafariFKp9MISosdpU2O
         8lLg==
X-Gm-Message-State: AOAM531a2p21xFcH8lv0G0DQtkTz/oQi0sxGI3Kq15liX+fYsa+1ibjm
        QvzphgqbBDbV2nwvDj28lZrFhExP20FKiQ==
X-Google-Smtp-Source: ABdhPJzYOysVmo0LJNGKXOWn7wSz1H3h3OB0X6nkDA+Qh5Qcx9wQTKdRLmdfmnYJy++R2kUQTOHC9Q==
X-Received: by 2002:a17:90a:36aa:: with SMTP id t39mr9934780pjb.185.1592204136968;
        Sun, 14 Jun 2020 23:55:36 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id c8sm11453123pjn.16.2020.06.14.23.55.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jun 2020 23:55:36 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Paolo Bonzini <pbonzini@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc:     kvm@vger.kernel.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH] KVM: MIPS: Fix a build error for !CPU_LOONGSON64
Date:   Mon, 15 Jun 2020 14:56:55 +0800
Message-Id: <1592204215-28704-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

During the KVM merging progress, a CONFIG_CPU_LOONGSON64 guard in commit
7f2a83f1c2a941ebfee53 ("KVM: MIPS: Add CPUCFG emulation for Loongson-3")
is missing by accident. So add it to avoid building error.

Fixes: 7f2a83f1c2a941ebfee53 ("KVM: MIPS: Add CPUCFG emulation for Loongson-3")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kvm/mips.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 521bd58..666d335 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -67,8 +67,10 @@ struct kvm_stats_debugfs_item debugfs_entries[] = {
 	VCPU_STAT("vz_ghfc", vz_ghfc_exits),
 	VCPU_STAT("vz_gpa", vz_gpa_exits),
 	VCPU_STAT("vz_resvd", vz_resvd_exits),
+#ifdef CONFIG_CPU_LOONGSON64
 	VCPU_STAT("vz_cpucfg", vz_cpucfg_exits),
 #endif
+#endif
 	VCPU_STAT("halt_successful_poll", halt_successful_poll),
 	VCPU_STAT("halt_attempted_poll", halt_attempted_poll),
 	VCPU_STAT("halt_poll_invalid", halt_poll_invalid),
-- 
2.7.0

