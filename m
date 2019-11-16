Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2E2FF457
	for <lists+linux-mips@lfdr.de>; Sat, 16 Nov 2019 18:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727743AbfKPRZq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Nov 2019 12:25:46 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25887 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727642AbfKPRZq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 Nov 2019 12:25:46 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573925095; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=C6astxUuaQFcYEOZG4mt0jq+AxAONeQAztbjLN8Ht+xoRnhQjGq8ijEEzSD0T1nCpmKuAzAFEyvWSAm9Okokl40iFWbhtehwlZzYaXW7mzPnDXPbiWVIDVNRCdpXnX6PUrZbWdz7zyiPBhktcyTneyKv4Ft3kSspWyNseyIVH8Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573925095; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=M6lErxMa4wqpsghWs6dGPbHRixMP0dqNuhbesTM6QL0=; 
        b=nJXMNrJLmArjaQ8eP1bjciPdr+SO5DskHkcr5501bNjgMdfMRp0pb3nuZzKfEUdqtl3KGeewUOK18wJYSwTNR7tEixVDifPPwbH4e7omBC5rCKLd5iWzty1TsLlr6rMG5R/fCH5EIetAM5coZtV6YrYYX6DoHAnTMdHnRXka+uI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=eODW4aask24oW4VRVKeHgYoLSzRn+hUcOxUC/UDbDzSOjZ7WUl7PXCHjBUJFvL6DlcH9d3+AdkKr
    Kp+QoFLm4pUbBEqpatMc8lbA66DJisCmKkB7pllLC4vWSVeq44HN  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573925095;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=892;
        bh=M6lErxMa4wqpsghWs6dGPbHRixMP0dqNuhbesTM6QL0=;
        b=asA/Pv/6I5syy2mCNbIj2nw5UJGEhmqI0S6jBauF3P7fZ86S07znkXDnmDZlsFWq
        ndiIc+jao7DAnCzS/gTJ4VdQV3jk13szmqaKaIsOIh/JlssaI3+dF6POTZgKQfu/21g
        pPURctkA1aKrcj0OL8l2Ae/YFn0cF5PMc8XcOM5w=
Received: from localhost.localdomain (171.221.112.210 [171.221.112.210]) by mx.zohomail.com
        with SMTPS id 1573925093684897.2317989318217; Sat, 16 Nov 2019 09:24:53 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, paul@crapouillou.net,
        malat@debian.org, chenhc@lemote.com, jiaxun.yang@flygoat.com,
        tglx@linutronix.de, allison@lohutok.net
Subject: [PATCH 1/2 v2] MIPS: Rename JZRISC to XBurst.
Date:   Sun, 17 Nov 2019 01:23:57 +0800
Message-Id: <1573925038-100744-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573925038-100744-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1573925038-100744-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now in addition to the JZ line, Ingenic has added three product
lines X, T and M. and the real name of the CPU from Ingenic is
XBurst, not JZRISC.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/kernel/cpu-probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f521cbf..7a0e33c 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1951,7 +1951,7 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 	case PRID_IMP_XBURST:
 		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
-		__cpu_name[cpu] = "Ingenic JZRISC";
+		__cpu_name[cpu] = "Ingenic XBurst";
 		/*
 		 * The XBurst core by default attempts to avoid branch target
 		 * buffer lookups by detecting & special casing loops. This
-- 
2.7.4


