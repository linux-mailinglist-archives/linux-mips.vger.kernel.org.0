Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCAEC276E32
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 12:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgIXKIP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 06:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbgIXKIO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 06:08:14 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9FAC0613CE
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 03:08:14 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d9so1611560pfd.3
        for <linux-mips@vger.kernel.org>; Thu, 24 Sep 2020 03:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=0V6+MO40T7RQQa2+6CkybLfijKZrU0OL4srRvkZWkcE=;
        b=hswEqlH0SF+N7++r+h4NGQajib5t5t3x5/C6Kk2Tj4pxhV9CGzAzRAq7OfWU6wMyXk
         8mLNUVd2TTXap67aTydcm7DBXKbvwmQ69IwiXjVhQV4SBPySIgrsti2ZI1BnQmUa7/D3
         56bypUaIAe6JdJboq1/GXO11b0RVmCaKDTL0GnGQYsiHNk92rAMJHlaORjfUC76Qbu5w
         R+zclSdxgvUQozwflBqateT7VwVnkSsiAZNvUuF69VB3h29OWdkibCKzafiDCJTot4sr
         jTZVGNCu3hEkdOCHt1yK3yh+TWKk86I1ZnkOecQOE+OSFRYz0MrMdsNXnfjuV9UxRNhZ
         wGYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=0V6+MO40T7RQQa2+6CkybLfijKZrU0OL4srRvkZWkcE=;
        b=Ms0qlWVR39TkjZg+sCCMMY/2/QjQvf5vl6yevqn8lJ4EQYW5uBTfc23zdld+5dr5v4
         mAfX3G3116hIXzPU1ewRXipCgAoyF5qC8Mlzn8UTmJFkAZdHrfxE0MycYxhVy4MoffpN
         9c0meZTpTRqK0aWaxcuz+Z0UKGpVk8jkQje9gUOTqfke9UJHhXs/31eIh0oLeLfCfYFY
         UByNdqVRISEW8trpl8UIG+qoV3GP4Hu8ibKfW7yRZVtQeVr4NlGLcR7x26oiekxCvtKP
         MjeMff5a5mh2nLUm1NrJLDwXxGwXjJUol+XRhoHnWoDmAdDqi79vDb5439ADZ3OembTU
         NqHQ==
X-Gm-Message-State: AOAM531Uuv+A63HSp1jSzMdZh0MVG9VqHa5GiwouNU9aA1ZDfjHX940H
        BIoVWXLZyUQ8mfdTYya5LT0=
X-Google-Smtp-Source: ABdhPJxUyQFfW8OhMT9xEvfvuiP4xVQq6dXcdu+DSKoXDbKPNe5BVOkT79rhhAV1R4sINAAXWfJcDw==
X-Received: by 2002:a65:5a0d:: with SMTP id y13mr3398309pgs.131.1600942094469;
        Thu, 24 Sep 2020 03:08:14 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id p6sm2532716pfn.63.2020.09.24.03.08.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Sep 2020 03:08:13 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>
Cc:     linux-mips@vger.kernel.org, kexec@lists.infradead.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 1/3] MIPS: Crash kernel should be able to see old memories
Date:   Thu, 24 Sep 2020 18:07:57 +0800
Message-Id: <1600942079-18652-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
BIOS passed memories are removed by early_parse_mem(). I think this is
reasonable for a normal kernel but not for a crash kernel, because a
crash kernel should be able to see all old memories, even though it is
not supposed to use them.

Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/kernel/setup.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 4c04a86..e2804a2 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -392,8 +392,10 @@ static int __init early_parse_mem(char *p)
 	 */
 	if (usermem == 0) {
 		usermem = 1;
+#ifndef CONFIG_CRASH_DUMP
 		memblock_remove(memblock_start_of_DRAM(),
 			memblock_end_of_DRAM() - memblock_start_of_DRAM());
+#endif
 	}
 	start = 0;
 	size = memparse(p, &p);
-- 
2.7.0

