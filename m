Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7199DE2D57
	for <lists+linux-mips@lfdr.de>; Thu, 24 Oct 2019 11:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389854AbfJXJam (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Oct 2019 05:30:42 -0400
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25413 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732032AbfJXJam (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Oct 2019 05:30:42 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571909381; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=WrguYXjCAtP48ftR77eMdv1x8/txy+wFKzts+xbut14CvvmE5+4yqtWJaQyixckVvhFI9/7F/K5pdQrVxcWF6xEmpyIk04g+L8TaC3btBmJ6eogB1lRi1l/mKBFYUCWQnr7JMT7t4oUlRZZLtElJ00jo5bUo7O08maFaWLinbm8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1571909381; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=3EybGsCTLxuKvUWQ2ksrSw4vKwwSU7hELaxSXjrfIyc=; 
        b=oATNIDKZi64y1gXvWA+R608jkbf086GI586owFtU+GZRpGHD9464Xmvokwjw0Ok/NJV/rTX2J6VZESGgPvnKzB0JLYqwshADSqm2rBLdYfK3yoFpfmAnXgioX4sxoKSoI3/AMZW/rh5dTCao/MHi1KagqXZLPuehSiquuTCj71s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=LYmiRmL/b/WzL/HBXARM4GiuEfWYUmnTGaERPjQqZoqBFR1Z+7p5qDm3PK6ACwN9UjQYwDtBopTE
    r2GD2rh6c81+ugDz3uXsY5Yp78OqX9OMP7h7SaV7O4fbVmUCJfo1  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571909381;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1561; bh=3EybGsCTLxuKvUWQ2ksrSw4vKwwSU7hELaxSXjrfIyc=;
        b=RtMqzL4YOqR/jFtiaF4GFNidbxLhf1sKVSLl+YxvqKHUCudokAtqQ85ABrSyPDFw
        IwRwccTH/rbHxPDJIk5CtumcHxe5QHg/HiS5pZfp0d5SjSvOoHaPbr1UDDRYtSdS+7R
        kV3VDAtal5AfFrgg/bGbOhL5s6qvlBri0A+5q/lo=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1571909376311135.5670853491555; Thu, 24 Oct 2019 02:29:36 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        jhogan@kernel.org, gregkh@linuxfoundation.org,
        paul.burton@mips.com, chenhc@lemote.com, paul@crapouillou.net,
        tglx@linutronix.de, jiaxun.yang@flygoat.com
Subject: [PATCH 2/2] MIPS: Ingenic: Disable abandoned HPTLB function.
Date:   Thu, 24 Oct 2019 17:29:01 +0800
Message-Id: <1571909341-10108-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

JZ4760/JZ4770/JZ4775/X1000/X1500 has an abandoned huge page
tlb, write 0xa9000000 to cp0 config5 sel4 to disable this
function to prevent getting stuck. Confirmed by Ingenic,
this operation will not adversely affect processors
without HPTLB function.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/kernel/cpu-probe.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 16033a4..cfebf8c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1966,11 +1966,23 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	}
 
 	/*
-	 * The config0 register in the Xburst CPUs with a processor ID of
+	 * The config0 register in the XBurst CPUs with a processor ID of
+	 * PRID_COMP_INGENIC_D1 has an abandoned huge page tlb, write
+	 * 0xa9000000 to cp0 config5 sel4 to disable this function to
+	 * prevent getting stuck.
+	 */
+	if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D1) {
+		__asm__ (
+			"li    $2, 0xa9000000 \n\t"
+			"mtc0  $2, $5, 4      \n\t"
+			"nop                  \n\t"
+			::"r"(2));
+	/*
+	 * The config0 register in the XBurst CPUs with a processor ID of
 	 * PRID_COMP_INGENIC_D0 report themselves as MIPS32r2 compatible,
 	 * but they don't actually support this ISA.
 	 */
-	if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D0)
+	} else if ((c->processor_id & PRID_COMP_MASK) == PRID_COMP_INGENIC_D0)
 		c->isa_level &= ~MIPS_CPU_ISA_M32R2;
 }
 
-- 
2.7.4


