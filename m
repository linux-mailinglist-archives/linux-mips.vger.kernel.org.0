Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0C12A1BC7
	for <lists+linux-mips@lfdr.de>; Sun,  1 Nov 2020 04:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgKADeV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Oct 2020 23:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgKADeV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Oct 2020 23:34:21 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DBD3C0617A6
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2020 20:34:21 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t22so5033978plr.9
        for <linux-mips@vger.kernel.org>; Sat, 31 Oct 2020 20:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/18yX+QhpCHQL7uLlUv4BeS0wQVLShfX8b0wqPUJf8s=;
        b=u2cnw5ta650ZBY2iOwaZI3I8+LMyu1ASRg8ykjHrtGo19VYyR4ACsePTktCTdHf3lT
         nyRYnL2guO7YcfOagGpekIJjFe3CFwCuyVHUq5F1XWbL1nHU12SLpC+/Kz51cA4n5Mnw
         DWdKQrSm1BRFmOQMXSnq3jaanF8wVNfsw+JrrSLcAfYp++uZBfHCImSGb3ITCfi0sd5y
         RgJd+co9aIkRDio7gCMkGU2zlA62jWes0VrDGNN3SkG9ws3blRLJySFQHN1e5Rb1Km5Y
         iS24TIU8G9+J1syTzfIr/LmVqMJjaUcQvQaEWbi52yWHrpjFM6UWz4pH++2nxCogq42n
         qz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=/18yX+QhpCHQL7uLlUv4BeS0wQVLShfX8b0wqPUJf8s=;
        b=KlOhSN7hLrhfDlcrx/col4H01syuwI/K9TSloCMRXUSR33T8xge0vaNrvdldBrhSf/
         aWKCHj1KFzB8IxZ9Ohk2GYaGRI5IzOQnJKO7uoAWWsm78bFohk5sgcEmCgJ2uR3IKD1a
         VFxkJJ+dsM06U7HAOkDmzHG/2TzDAHVJbr7tCksa7TKJPdtpG3mNDxxekknvt9a7eG2Y
         3ogjms2hACWacd0ot/rhc43vfBfiyLtM6bnZNGxbjZqFZOHDmGDGvpGtpfjBIN0KCAxy
         jFnwX6TRg5cQeufYZpLGQd1TxbktV4FQXr2dE+8+T1tnghV2UUz+t+SbtTzKI8Aopwqo
         mXNg==
X-Gm-Message-State: AOAM533401CloMDPwYRdFhGGLLHiI8W2/+UFP+tecAG/irXgLK6eLA+0
        /jh8PMsb+9byPcMrW02VHPvqdEbndYCx3w==
X-Google-Smtp-Source: ABdhPJw6GWNJm5elvYqJ0zYPJBXf3GUgShmZqsyhRiVBSLilAdstibdlCs/TQsXUBtnni9smZW54aQ==
X-Received: by 2002:a17:90a:67c7:: with SMTP id g7mr11085927pjm.140.1604201661230;
        Sat, 31 Oct 2020 20:34:21 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id k8sm9038447pgi.39.2020.10.31.20.34.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 31 Oct 2020 20:34:20 -0700 (PDT)
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
Subject: [PATCH Resend 3/3] MIPS: Loongson64: Enlarge cross-package node distance
Date:   Sun,  1 Nov 2020 11:33:58 +0800
Message-Id: <1604201638-4001-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1604201638-4001-1-git-send-email-chenhc@lemote.com>
References: <1604201638-4001-1-git-send-email-chenhc@lemote.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

NUMA node distances affect the NUMA balancing behaviors. The cost of
cross-package memory access is very high, and our benchmarks show that
200 is a more appropriate value than 100 (for cross-package numa node
distance) on Loongson64 platforms, so enlarge it.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/loongson64/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
index 901f5be..ee4fedb 100644
--- a/arch/mips/loongson64/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -79,7 +79,7 @@ static int __init compute_node_distance(int row, int col)
 	else if (package_row == package_col)
 		return 40;
 	else
-		return 100;
+		return 200;
 }
 
 static void __init init_topology_matrix(void)
-- 
2.7.0

