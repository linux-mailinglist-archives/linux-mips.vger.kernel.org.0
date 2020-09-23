Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019FC274F04
	for <lists+linux-mips@lfdr.de>; Wed, 23 Sep 2020 04:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgIWCbJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 22:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbgIWCbJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 22:31:09 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B459C061755
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 19:31:09 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id r19so6054202pls.1
        for <linux-mips@vger.kernel.org>; Tue, 22 Sep 2020 19:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=0V6+MO40T7RQQa2+6CkybLfijKZrU0OL4srRvkZWkcE=;
        b=atgt49gyTw8rUkL4uva3MSAMlvKNi1IgKBmdun7l1fH78Qzpgl9G84HuRUAS+yq4vT
         HcvFHVF7Cp9WSTMwnJJAuVls0eRbkWPrggU6ypquQXavyjHlmO5frh1gdTDA+eTNiOJp
         uAxSiuFrVMp5S3WL4zo4JT0QSEhKsi8Nkt7b20kF1oOr27nbKS1qy/5DtZQ28brc0VHc
         bECUL6J/+rvCigJExxXThK38bRFHz0BqZJJWQbENgwl+V1gFz1lrlCH8wIPScIdBSKlI
         5MFwiEGnxOCxuAslFwP9AFxOiJNS7nKBFwBFF4pLzrShhj8SottKSjKggnjVkhM0D+Pf
         zhew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=0V6+MO40T7RQQa2+6CkybLfijKZrU0OL4srRvkZWkcE=;
        b=DQMHyhM/QNM84oeurQ1n7mH2xKqbzkaVIsdZLTU5Mhws2U1mYNI/GShjXgVSRheAch
         rsItu+FpjmvcP8UxhC4pADnMLsuSHH/A2NJSm+W4jebCCbazxl+uVpyUyyRFGK0AGq+V
         FkhSx6OVlNSnyuAbUsuszsJF64Ka4dEmR+aN5BTaYijEwxJaSMfENt5zt4LTvK736mZu
         jCm5uQ+R62WcKhwToNkoKqEHDEPeryUaZpYK1KzcwjfmNKrxgE+knGfFWkVFTlnYEoqD
         rKpOk1g4ucyjr0V5NxzKYYB/ypbxKNvdUoM6EJ52NsEWT/wRA/jW2lDSED/5meP3FH/f
         P9uA==
X-Gm-Message-State: AOAM530Uqh/YP+ugrzge80pP2pv25NhjoWvAj7qQcCliZWWvjlsB2Hyr
        PRpNhTQ75QvZNHrSuVq+x/M=
X-Google-Smtp-Source: ABdhPJxaupKZkt0j7Iuv5fG+DSBVblOScNi25HNVSXii5MQ84paNqJNhEQzgnv3RAbaKawZxM48iWg==
X-Received: by 2002:a17:90a:ba91:: with SMTP id t17mr6486978pjr.83.1600828268579;
        Tue, 22 Sep 2020 19:31:08 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 72sm16019599pfx.79.2020.09.22.19.31.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 19:31:08 -0700 (PDT)
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
Subject: [PATCH 1/3] MIPS: Crash kernel should be able to see old memories
Date:   Wed, 23 Sep 2020 10:30:55 +0800
Message-Id: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
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

