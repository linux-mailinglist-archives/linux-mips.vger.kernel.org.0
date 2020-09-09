Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6192C262628
	for <lists+linux-mips@lfdr.de>; Wed,  9 Sep 2020 06:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgIIEWW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Sep 2020 00:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725772AbgIIEWW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Sep 2020 00:22:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2E9C061573
        for <linux-mips@vger.kernel.org>; Tue,  8 Sep 2020 21:22:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gf14so694239pjb.5
        for <linux-mips@vger.kernel.org>; Tue, 08 Sep 2020 21:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IhJZzsST3gRwdDdOyZSCwbfCQK/u9uNH5w2yjyQDKJM=;
        b=QvkmPHdaQdUXXGhQr+Tau5FnfMBjaP7F49RjAOfXG58JaFBEmXmjbnkSlRX6GUKy7u
         mfOgRfGMaQCgrfmM6NfU8Mr/RmNzU6Vm7kE8Wx2/yXMhOfvQKlATzjPceWxay9KCrC0T
         uSlGXAXhLSiw0NpqnRS2yMIw+oNwoIVe3gJXEeUgS04KkmleQE5w1nX3C2koKC04LkU0
         rj6AVy8jvJytRdK9Kyh2immUiKHLKKsrzuiCyzPLvbzYe83CrVxn2WOcIcnzv2w48Wo8
         3+DnjC4S2LmOi2pgc7rMDDmlz5lAV6JL/XeAC/NAsKfF103QSHgJ0yxMZhXNdLjkS8V3
         jgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=IhJZzsST3gRwdDdOyZSCwbfCQK/u9uNH5w2yjyQDKJM=;
        b=GZFR8BRVpiDXC4Cl+eCuRohpqo29niI3dqRLiGiY8woSV+RmS2Y8bgitC+Cz3XXodN
         JjIJ0GK+IdeKD813KMdIqdrLpFdAkuRA1PvESEHUxI/kbMnRQTDHNXKmR4uUFwSLj+go
         hbg1giwGbJUM1rxzx2WsCID9FuXDoTDFPU8YOgfjlKGCvvlABmFoWoO3T5B3o0FBO6KM
         bDQQoNtLFVS5JRHdeAWpmmKsiQEUVwnNIQoPm5GdnZY5/RUPNmTZJmr2KzbdvMz/6CcU
         +OVFyM/MiB79453x2o3q5co5HYFDEyr+FOzg5uEW9wutkN/yuvFYI3kJEeUbqEUsEwyU
         uRXw==
X-Gm-Message-State: AOAM530Ucw7d+pQDygleVppG71A01r0OnuRy8+WhAHVVfVxfJZppFUPh
        fxJQS1Wmc0Uh2X99zzGFhow=
X-Google-Smtp-Source: ABdhPJwgoaZxFlL++AsqWZ9GenxK9itPY4kolz8abE6lCMY2zAGfqPuP/8PiPDSzn1xO6+CeBAINSQ==
X-Received: by 2002:a17:90a:178e:: with SMTP id q14mr1987431pja.154.1599625341786;
        Tue, 08 Sep 2020 21:22:21 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id mh8sm582507pjb.32.2020.09.08.21.22.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2020 21:22:21 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 2/2] drm/amdgpu: Don't use WC for VRAM if !AMDGPU_GEM_CREATE_CPU_GTT_USWC
Date:   Wed,  9 Sep 2020 12:22:00 +0800
Message-Id: <1599625320-17637-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1599625320-17637-1-git-send-email-chenhc@lemote.com>
References: <1599625320-17637-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Though AMDGPU_GEM_CREATE_CPU_GTT_USWC is initially used for GTT, but
this flag is bound to drm_arch_can_wc_memory(), and if arch doesn't
support WC, then VRAM should not use WC.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 5ac7b55..04299f5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -136,8 +136,10 @@ void amdgpu_bo_placement_from_domain(struct amdgpu_bo *abo, u32 domain)
 
 		places[c].fpfn = 0;
 		places[c].lpfn = 0;
-		places[c].flags = TTM_PL_FLAG_WC | TTM_PL_FLAG_UNCACHED |
-			TTM_PL_FLAG_VRAM;
+		places[c].flags = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_VRAM;
+
+		if (flags & AMDGPU_GEM_CREATE_CPU_GTT_USWC)
+			places[c].flags |= TTM_PL_FLAG_WC;
 
 		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED)
 			places[c].lpfn = visible_pfn;
-- 
2.7.0

