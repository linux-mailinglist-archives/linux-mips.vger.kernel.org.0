Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C4C2F8C48
	for <lists+linux-mips@lfdr.de>; Sat, 16 Jan 2021 09:40:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbhAPIkr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 03:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbhAPIkq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Jan 2021 03:40:46 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FEAC061757;
        Sat, 16 Jan 2021 00:40:06 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id m5so6591634pjv.5;
        Sat, 16 Jan 2021 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8sQuoTWVdmAcRiVvfk4WQsms44SAyXLYRKzzgtc3Wq0=;
        b=bFghC2Jq54kRJzAY3T1nAoWUw8OJviMk78jsT12ZAZ/S7xT86WriEAIDZe20LGmQD4
         qockQay+I9lzmQkjv9e13zy0tHJoYliNv+HymjVCkDp9hpmtWjqstKpllrSzz7B91F4Z
         K476RBcE6e7NHhmTu9+425CfSb0z0njK5Ri8zUp6af44loEjNkXgKvvWZhTq4vm5nbXA
         F6qHraOH1Ta8poKpQ0E91JaKhC4wj3wMLqyCSSvg88RaNu8swzIDD3Bjo5tl7W2TJ1s2
         6KEIHqOcYzDLSy/h1PbIgW9ym23LFmlGVh5h0nt0MGp3EMQk1ToC7tAUj6L72i64iIkr
         QqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8sQuoTWVdmAcRiVvfk4WQsms44SAyXLYRKzzgtc3Wq0=;
        b=jQ45wzLfCLmq8IeZXMxTSZv9htk57PICgqrMZHJ6NSalypiHnwFhB+m4K8YVyXS8lG
         2wcOnErECIPg8yOwlXIQLnMFnrKs/3EvC8BVxc2Ih8csK2b4lfMf/6R3AaDbtc0N26dy
         KTpyEl6GeyRt0d6gr12jIehHpIgGHMBTFzr7W7RUB3Uky/Ssnd/VVRyELzbJaANiH5mL
         zKEO9QUpsA1rGvkl3oHyLziuwEU25G/2cD0NpaujJng0+WlxAF2ifXwhbDjo2ye0u0NX
         FpVvUcrRspkTCbdWST2q83D+klGLWGU19ef6GThF0z/xXSpIz0UvXdE+Fpgh1PqNPXxx
         1RKA==
X-Gm-Message-State: AOAM531pKunJ9TvECwS5Z4EAqpoegLUeI+4dQ/FLCzFryYL/v4yWq4Nl
        nlGkC82JWG1zIdTDiIj/K84=
X-Google-Smtp-Source: ABdhPJwdfkRQaysFn8SqI8cR9mN7Qm/UQO2OFU2A/P/s1VnkEOCRB+oM1Y9237awfigDtEBT4EGOeg==
X-Received: by 2002:a17:90a:4b0a:: with SMTP id g10mr14929261pjh.78.1610786405635;
        Sat, 16 Jan 2021 00:40:05 -0800 (PST)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.172.253.184])
        by smtp.gmail.com with ESMTPSA id l141sm10516247pfd.124.2021.01.16.00.40.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Jan 2021 00:40:05 -0800 (PST)
From:   Souptick Joarder <jrdr.linux@gmail.com>
To:     tsbogend@alpha.franken.de, jiaxun.yang@flygoat.com,
        yangtiezhu@loongson.cn
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] mips: cacheinfo: Remove unnecessary increment of level
Date:   Sat, 16 Jan 2021 14:10:00 +0530
Message-Id: <1610786400-3629-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

kernel test robot throws below warning ->

arch/mips/kernel/cacheinfo.c:112:3: warning: Variable 'level' is
modified but its new value is never used. [unreadVariable]

Remove unnecessary increment of level at the end.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 arch/mips/kernel/cacheinfo.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/kernel/cacheinfo.c b/arch/mips/kernel/cacheinfo.c
index 5f9d0eb..c858ae3 100644
--- a/arch/mips/kernel/cacheinfo.c
+++ b/arch/mips/kernel/cacheinfo.c
@@ -109,7 +109,6 @@ static int __populate_cache_leaves(unsigned int cpu)
 
 	if (c->tcache.waysize) {
 		populate_cache(tcache, this_leaf, level, CACHE_TYPE_UNIFIED);
-		level++;
 	}
 
 	this_cpu_ci->cpu_map_populated = true;
-- 
1.9.1

