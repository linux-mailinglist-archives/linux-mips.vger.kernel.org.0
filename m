Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7DF6E0BAE
	for <lists+linux-mips@lfdr.de>; Tue, 22 Oct 2019 20:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732251AbfJVSp7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Oct 2019 14:45:59 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45926 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731436AbfJVSp6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Oct 2019 14:45:58 -0400
Received: by mail-wr1-f68.google.com with SMTP id q13so14258156wrs.12
        for <linux-mips@vger.kernel.org>; Tue, 22 Oct 2019 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Gq9xxxm4KZmu62EdNW4n3rdsqHgpFLADsHpYJB7Jhgo=;
        b=Uaxc/IOXwZy94FmGfM5Exx4XGSRpgEv8zUH6VN5K8UHK7nquwFtO+NdrSdOld3L8J4
         mJ2n27d8iZo1YWl0WCNozmWvEOCh6NYJoAItI18HvBaS9UYstL0chVWkTGoKDdvstKYa
         /FxM0l1qrYENmmwuzSr9glX85QGYPEBYYTiLv4/gX4DG1eRZTuhnnuEOmrYtO0QCY4PP
         dlzUqswSyG267V+zYxosTAKynGpBuM0qpYKQqRs1Xd+n53+HrIRVTTmwdw1NaOVC0Rpi
         vaIqJ7/RJiqSviJReG52DtKJW8+hI+k3Pf1QCk5QdzePpC/Zo8vlGYgCPxcbwDuQmXbW
         la9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Gq9xxxm4KZmu62EdNW4n3rdsqHgpFLADsHpYJB7Jhgo=;
        b=bOKgdpsjZ862E43OqXFTkM/EN/0tLXearJqbaki/x4PrPb4m2kjRACAhX0Sn3qPKRS
         6ikjdC+OopvuGg/cxSUBPT4r88SObK16yavcz9aS8IZ70a7B+tBASn3Uylh8jXoN93DD
         dd11HfSM4YBI9ofEcCvAM8Oc2j2dZYlUGsuKJeIJewjU1Ornkbum0Rzi+vZk9Wegvw2l
         1HYrlixNlBbp1ppxYuYLcGbYoaB95lWiIPgeNX34eUab76lDoU+ptOz8T/pWXBJGoJAi
         QrJb1F4ESfgQSMlErmnJVr6OK2tvStIQI86+865gKk9ENH6I66xSIu+bRNcSRqP59gad
         2aYg==
X-Gm-Message-State: APjAAAVwg9DB+McHb3F9yK9nREMDhsbZn0Sfpg50+Qaf2wvUIbcdhnHs
        Sp0zkzm4GqIiyNUg624/jK4MZUMn
X-Google-Smtp-Source: APXvYqyUBy0rrb+AWH3E6IUSHT+6o9YfKT7HrKolCOnnXI8+1GsCwVVdeVxuXU6t4S4IvrEt5C21QA==
X-Received: by 2002:adf:978a:: with SMTP id s10mr5020611wrb.264.1571769956262;
        Tue, 22 Oct 2019 11:45:56 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id c144sm2580761wmd.1.2019.10.22.11.45.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2019 11:45:55 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] MIPS: bmips: mark exception vectors as char arrays
Date:   Tue, 22 Oct 2019 20:45:52 +0200
Message-Id: <20191022184552.18899-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The vectors span more than one byte, so mark them as arrays.

Fixes the following build error when building when using GCC 8.3:

In file included from ./include/linux/string.h:19,
                 from ./include/linux/bitmap.h:9,
                 from ./include/linux/cpumask.h:12,
                 from ./arch/mips/include/asm/processor.h:15,
                 from ./arch/mips/include/asm/thread_info.h:16,
                 from ./include/linux/thread_info.h:38,
                 from ./include/asm-generic/preempt.h:5,
                 from ./arch/mips/include/generated/asm/preempt.h:1,
                 from ./include/linux/preempt.h:81,
                 from ./include/linux/spinlock.h:51,
                 from ./include/linux/mmzone.h:8,
                 from ./include/linux/bootmem.h:8,
                 from arch/mips/bcm63xx/prom.c:10:
arch/mips/bcm63xx/prom.c: In function 'prom_init':
./arch/mips/include/asm/string.h:162:11: error: '__builtin_memcpy' forming offset [2, 32] is out of the bounds [0, 1] of object 'bmips_smp_movevec' with type 'char' [-Werror=array-bounds]
   __ret = __builtin_memcpy((dst), (src), __len); \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
arch/mips/bcm63xx/prom.c:97:3: note: in expansion of macro 'memcpy'
   memcpy((void *)0xa0000200, &bmips_smp_movevec, 0x20);
   ^~~~~~
In file included from arch/mips/bcm63xx/prom.c:14:
./arch/mips/include/asm/bmips.h:80:13: note: 'bmips_smp_movevec' declared here
 extern char bmips_smp_movevec;

Fixes: 18a1eef92dcd ("MIPS: BMIPS: Introduce bmips.h")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 arch/mips/include/asm/bmips.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/bmips.h b/arch/mips/include/asm/bmips.h
index bf6a8afd7ad2..581a6a3c66e4 100644
--- a/arch/mips/include/asm/bmips.h
+++ b/arch/mips/include/asm/bmips.h
@@ -75,11 +75,11 @@ static inline int register_bmips_smp_ops(void)
 #endif
 }
 
-extern char bmips_reset_nmi_vec;
-extern char bmips_reset_nmi_vec_end;
-extern char bmips_smp_movevec;
-extern char bmips_smp_int_vec;
-extern char bmips_smp_int_vec_end;
+extern char bmips_reset_nmi_vec[];
+extern char bmips_reset_nmi_vec_end[];
+extern char bmips_smp_movevec[];
+extern char bmips_smp_int_vec[];
+extern char bmips_smp_int_vec_end[];
 
 extern int bmips_smp_enabled;
 extern int bmips_cpu_offset;
-- 
2.13.2

