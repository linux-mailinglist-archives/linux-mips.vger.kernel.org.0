Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2343627C12D
	for <lists+linux-mips@lfdr.de>; Tue, 29 Sep 2020 11:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgI2JbB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Sep 2020 05:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgI2JbB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Sep 2020 05:31:01 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A0A6C061755;
        Tue, 29 Sep 2020 02:31:00 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id t14so3373254pgl.10;
        Tue, 29 Sep 2020 02:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=hSwJslaiY7gG5qeB+GpcgMpsjHBVemB3hcRhwqdoyIE=;
        b=TevtkU14EEU9v4x2TjhpA32KpPjD4lpdqbwrVpGhWJRx3CTto97Ao4fzjpPe68cOay
         29uiROXJHik0jMhMOSE1PoSrn3cloyDjol9YDDjj9oS1YovEFeDr+61Dbl+7VO6UXm2+
         5Puu9BkjuID4Q6858+cV3oOHptItHJSdXGSvkiEMNI6Vq0JkYjZV2Q8eogGFFiVhQwDF
         axaQ8r8SHtPDAqdxi0XYW87LkUApeepZb11s2WpPwbUrhf+O/7zbrnOeRwa5j3tLs9pO
         yV6s9Y9cIGOdAH4jWT9k/WDnIte54NL5UnGYjl2ip4xInA+W+BFwuvJy+NlkbRH9W2KA
         z/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hSwJslaiY7gG5qeB+GpcgMpsjHBVemB3hcRhwqdoyIE=;
        b=GJvsmLd5S+7MzDxQlVCXlj0aqnvwzHR5pSWJxjye5T2Nftf0oJZkC/gH85aM19D/68
         8na9TiJ9IRswmWnGrAp7lhFgV1DJb6qA/7BBNJFdT2lh0WOf5Cl/NPZtuNHRNn+gDAnA
         ZEnfvzVoM70P5u+tj8RmtK3CvMvBd31t94s+rrk553XzEcSTvgAZHv3kF+oP5vfUXB/5
         kMJ7WAkAgtdtL+YdAj/vH5t4+tYYEHxdCNo1ys5HOG09gmvJ5JzxkkIRah2UgsCIUuwk
         X9y1IZN5YvAYLLYWjPy1LOfyqkO+ydVwOfX5iELZh7f7DEbHUjymbs1fV1z8ZGkGVdlB
         H/2Q==
X-Gm-Message-State: AOAM532a8EUDGwuADiM1U5aE/+55wOeZZ5PzIAD5Je+ZiBu3ZwbnDi2r
        Ju+UafgIx4yIAY6CntrwUQ==
X-Google-Smtp-Source: ABdhPJwPRP8KgvbJlrlU5TlRkURTL+DtxS6OFXEZwxTFkoLOlVMmvcByHqPH4nyTKPxvRRIsnuAtxQ==
X-Received: by 2002:a62:545:0:b029:142:2501:35db with SMTP id 66-20020a6205450000b0290142250135dbmr3150198pff.59.1601371859649;
        Tue, 29 Sep 2020 02:30:59 -0700 (PDT)
Received: from localhost.localdomain ([47.242.140.181])
        by smtp.gmail.com with ESMTPSA id e11sm1966179pjr.2.2020.09.29.02.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 02:30:59 -0700 (PDT)
From:   Pujin Shi <shipujin.t@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Yousong Zhou <yszhou4tech@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pujin Shi <shipujin.t@gmail.com>
Subject: [PATCH 1/2] MIPS: process: Add prototype for function arch_dup_task_struct
Date:   Tue, 29 Sep 2020 17:30:46 +0800
Message-Id: <20200929093047.1425-1-shipujin.t@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds a prototype to fix warning at W=1:

  arch/mips/kernel/process.c:95:5: error: no previous prototype for 'arch_dup_task_struct' [-Werror=missing-prototypes]

Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
---
 arch/mips/include/asm/processor.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 856e12f6063d..7834e7c0c78a 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -29,6 +29,7 @@
  */
 
 extern unsigned int vced_count, vcei_count;
+extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 #ifdef CONFIG_32BIT
 #ifdef CONFIG_KVM_GUEST
-- 
2.18.1

