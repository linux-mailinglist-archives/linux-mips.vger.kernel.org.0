Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37962721D5
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 13:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgIULIj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 07:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726333AbgIULIj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 07:08:39 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3066BC061755;
        Mon, 21 Sep 2020 04:08:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o25so3774915pgm.0;
        Mon, 21 Sep 2020 04:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tTJbfvIDALmyR7sTPva/nF1F/vNWEEleaGcrx9Y7chE=;
        b=pGbo9CrZk3dpPVufFvRvlvmtnSPBWwcHxeohMWGvXgBiKOsgF4lY+QXgWypEQwVmDR
         6i+JkUPN8rJs4wdJgaCX1Fl6yZOVAsofAVFv2F6SS4PmpJuplcYfJZBexy4omH1IIgsf
         GA8v12vzRmNw1BUYk02H9JFcoY7Dn+AGRNCZqWrh0VncHj6gdklC7fPR2rkZZA2ph6Go
         YqcQjjnB4K04YRCjbkvr2C9nYSMSz22f99RpL4LJ5m8OgUjFZrts4UR4PNIBoR6nB7E/
         n2B4KogYtim1RmMlOll3lqopa6BUo0xQs/LrBk64p/FV+hjGeM5PJt4/KkGlegWbgQCV
         QOug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tTJbfvIDALmyR7sTPva/nF1F/vNWEEleaGcrx9Y7chE=;
        b=YgPKZsiCjwbLeWBD1v30UpHZUVhLz8+v8Vae775EEoQLntt8XThajkIIhimJhidT68
         fi1cTY8d4FWy2BW7zA2OXV0PZyn6BDRDxp0yqz5nrIA9HIYOs0IlEf7biWDgG+FRPfx7
         0Bd2yLf+SNLNCzKcz1qMJgH3dgyIWHCRZNFPIQUn0QqmnQb6JqUji1wHfOBPr5vTvWTn
         5n+T6ECLJLzQz2mED6XS+FuFuxkoP7rjJ2iZEBpKG8SPc3aRtY5KlSluEBJ5Ufl8Id6k
         ZKN3QLlfuTUy/8tqaS9ASChrpVXzW5SShRox/u338eoKRmnhrq8LjBWLyfWwvukAyFCi
         bF8g==
X-Gm-Message-State: AOAM530r8nra6qITWnUaOVsIixRCujQSn35RpENFfEpr+8/8XQfvN7ps
        D7Ex3BRChfZUaun6FmX1L2mUzrNLNE1ggI1/
X-Google-Smtp-Source: ABdhPJzBKH5ggzLFKOwKWfQkvmXrCfIZAt5gaURBcKKuSEy9slOMJZiElyqFBxyZiCNL4gbGcVCYCw==
X-Received: by 2002:a17:902:b086:b029:d1:e5e7:bddb with SMTP id p6-20020a170902b086b02900d1e5e7bddbmr25889899plr.59.1600686518800;
        Mon, 21 Sep 2020 04:08:38 -0700 (PDT)
Received: from localhost.localdomain ([47.242.131.39])
        by smtp.gmail.com with ESMTPSA id 6sm147026pgu.16.2020.09.21.04.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 04:08:38 -0700 (PDT)
From:   Herrington <hankinsea@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herrington <hankinsea@gmail.com>,
        Pujin Shi <shipujin.t@gmail.com>, Pujin Shi <shipj@lemote.com>
Subject: [PATCH] MIPS: kernel: include probes-common.h header in branch.c
Date:   Mon, 21 Sep 2020 19:07:54 +0800
Message-Id: <20200921110754.1131-1-hankinsea@gmail.com>
X-Mailer: git-send-email 2.18.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

arch/mips/kernel/branch.c:876:5: error: no previous prototype for '__insn_is_compact_branch' [-Werror=missing-prototypes]

Signed-off-by: Herrington <hankinsea@gmail.com>
Signed-off-by: Pujin Shi <shipujin.t@gmail.com>
Signed-off-by: Pujin Shi <shipj@lemote.com>
---
 arch/mips/kernel/branch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/branch.c b/arch/mips/kernel/branch.c
index fb3e203698ea..0216ff24c392 100644
--- a/arch/mips/kernel/branch.c
+++ b/arch/mips/kernel/branch.c
@@ -20,6 +20,8 @@
 #include <asm/ptrace.h>
 #include <linux/uaccess.h>
 
+#include "probes-common.h"
+
 /*
  * Calculate and return exception PC in case of branch delay slot
  * for microMIPS and MIPS16e. It does not clear the ISA mode bit.
-- 
2.18.1

