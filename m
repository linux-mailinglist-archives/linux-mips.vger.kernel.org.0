Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9384D24A5F6
	for <lists+linux-mips@lfdr.de>; Wed, 19 Aug 2020 20:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgHSS1D (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Aug 2020 14:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726862AbgHSS0z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Aug 2020 14:26:55 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98856C061342;
        Wed, 19 Aug 2020 11:26:54 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id e4so1499892pjd.0;
        Wed, 19 Aug 2020 11:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bJRIu4AKXa9o6BirWluUiYhtcb7eVkTRiaHn64Lt67A=;
        b=A5s2kMYYEMQBYDn6wv+r02A1jmwG3l4a/IGeihq1wRmt1DhLX21RW8W35ONRjviVOV
         jSkYPCJbJryj2V9YuatJeCJvWQpvBRBCnVwGFCcnsy7CLUirDG4ZsGTCQOw0eYF8GbAx
         wV+vUTyJPZs8jZRP3cLxLOp2qLKQJAEV70ZaZa08yRcIqahOdBq7IgOce+rM8WsZ0BFc
         ilVz9aDaVQxk1FYp2PKkBnqtQBZOo35wlWXdcTxkydG3dtnSWOVikHAqNCTxLE57eME/
         8HKUCZ3x5of9TbEAzN66xeNY4LHV7ad+nBkSmKqpBW2U8TAVuLtKGA3zKUq0DEyN0i0r
         KG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bJRIu4AKXa9o6BirWluUiYhtcb7eVkTRiaHn64Lt67A=;
        b=bVy+OaMQpvimB9jR24TY1+TwOO/C1OtaNWo0CQJWDVQnhjO3vPOpO9eJtL95Td4VUb
         VYPtLRXq4IrBtX18e8m0p4FpshL5ShBCh1xKHF5OWVfQ8uusiU5xIb9zh8vMvs1T28he
         bm2dSDBHUuwbMCYWdlWGfYKC9luZeo058qLClEtd9slreCdhFN3xgnIIVqIscSewcFwi
         tJYnQojPdH/W4l3RmK/k0GpxR8ezreHMvF/OKErZe6ndGFNXnEgixU5+9oyW7tR0LQyb
         kS3akEuDQYZgckIG/Imjhncsm9ejUMdThYoIs3DmjRwyHIVU9FRSast84VTBWtkYvs7w
         dZ9w==
X-Gm-Message-State: AOAM53112Dko0WEpPZvqDFkCqRa4RGzVfpOLefw+dsjA0U981+93HypC
        Ek1qfTmD68WDQXre1QwL/Xg=
X-Google-Smtp-Source: ABdhPJy1X+nX5eyvmZ5gcfbh8dE7g5MajewTIuS7k22bWzoCv7cWfFyRyh6+WmGJJ78bhHaF3n4uXw==
X-Received: by 2002:a17:90b:684:: with SMTP id m4mr5139519pjz.4.1597861614160;
        Wed, 19 Aug 2020 11:26:54 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l78sm29448483pfd.130.2020.08.19.11.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:26:53 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-mips@linux-mips.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Mike Rapoport <rppt@kernel.org>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        bcm-kernel-feedback-list@broadcom.com (open list:BROADCOM BMIPS MIPS
        ARCHITECTURE),
        linux-mips@vger.kernel.org (open list:BROADCOM BMIPS MIPS ARCHITECTURE),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH mips-fixes 2/2] MIPS: BMIPS: Also call bmips_cpu_setup() for secondary cores
Date:   Wed, 19 Aug 2020 11:26:45 -0700
Message-Id: <20200819182645.30132-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819182645.30132-1-f.fainelli@gmail.com>
References: <20200819182645.30132-1-f.fainelli@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The initialization done by bmips_cpu_setup() typically affects both
threads of a given core, on 7435 which supports 2 cores and 2 threads,
logical CPU number 2 and 3 would not run this initialization.

Fixes: 738a3f79027b ("MIPS: BMIPS: Add early CPU initialization code")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/kernel/smp-bmips.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/smp-bmips.c b/arch/mips/kernel/smp-bmips.c
index 2f513506a3d5..1dbfb5aadffd 100644
--- a/arch/mips/kernel/smp-bmips.c
+++ b/arch/mips/kernel/smp-bmips.c
@@ -239,6 +239,8 @@ static int bmips_boot_secondary(int cpu, struct task_struct *idle)
  */
 static void bmips_init_secondary(void)
 {
+	bmips_cpu_setup();
+
 	switch (current_cpu_type()) {
 	case CPU_BMIPS4350:
 	case CPU_BMIPS4380:
-- 
2.17.1

