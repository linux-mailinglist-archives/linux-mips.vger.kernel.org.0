Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 540657DB38
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2019 14:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHAMS4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Aug 2019 08:18:56 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25518 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730918AbfHAMS4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 1 Aug 2019 08:18:56 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564661879; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=G29XdmNqjsJ4D0UPvZdmOLiI/XqItRXT7klctJalvfzJVQPU6RRyXBupxccRjza5hQt0RLMS0p/MfbqXxPYN40zM72TIfw+7+J9QTIDHmOC4pCif7UyYm0ZMrjP6Ld5oAPM/OYMI21CLm+VUg/u0tifLjQxeg532npAcNz7gVsY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564661879; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=pnXglAPiqfqQmS39+JKh6ck+IIvkfDvKN7TtCs+d+E4=; 
        b=e4ytnxPkyWJT8aK2aKHexmR/FF43DUG+xrNX4fc2gpPoWgFxwrXmc4B8asTSAHH/TQYBbMgknmcs2jMRt9q5vp4dyYQUIuMHpnh5sYjJsdZJ9noEagU+og+SSJu/5H0kRMSb2xDz9qQAhAUVipDwrk96DNjnUbjxCAf40Ua2z2I=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=h9FfRvLC48226fD9Vji0BAxlthjFOmxHl4RP37NjVI9/Oda7dHI0xRLaE8srxVkPTRK00+RzTeeS
    pQbyX8MtSUuoolLzt3fnurGj4iDTjuceC1YgvnB0/bqKZlQxanVy  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564661879;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1754; bh=pnXglAPiqfqQmS39+JKh6ck+IIvkfDvKN7TtCs+d+E4=;
        b=FVUF2I049LmMvYZtLCOAjxYP3GmYTY8TpblLJGb/OJcZHDWudjXDtavom2ZLOS/F
        pgDh4OBeX8ECW9rlkly14EDQ6iCG99anjR04SQamOPiH8t68jwTuqhWQYJwXdVFmffR
        VAYJGKCKhrIBfJTLvMy4RaWQo6mLTtqRNp38qbCc=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 1564661878427514.85343183529; Thu, 1 Aug 2019 05:17:58 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
Subject: [PATCH 2/2 v3] MIPS: Ingenic: Fix bugs when calculate bogomips/lpj.
Date:   Thu,  1 Aug 2019 20:16:31 +0800
Message-Id: <1564661791-47731-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564661791-47731-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Enable BTB lookups for short loops to fix bugs when calculate
bogomips and loops_per_jiffy.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/include/asm/mipsregs.h | 4 ++++
 arch/mips/kernel/cpu-probe.c     | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 1e6966e..bdbdc19 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -689,6 +689,9 @@
 #define MIPS_CONF7_IAR		(_ULCAST_(1) << 10)
 #define MIPS_CONF7_AR		(_ULCAST_(1) << 16)
 
+/* Ingenic Config7 bits */
+#define MIPS_CONF7_BTB_LOOP_EN	(_ULCAST_(1) << 4)
+
 /* Config7 Bits specific to MIPS Technologies. */
 
 /* Performance counters implemented Per TC */
@@ -2813,6 +2816,7 @@ __BUILD_SET_C0(status)
 __BUILD_SET_C0(cause)
 __BUILD_SET_C0(config)
 __BUILD_SET_C0(config5)
+__BUILD_SET_C0(config7)
 __BUILD_SET_C0(intcontrol)
 __BUILD_SET_C0(intctl)
 __BUILD_SET_C0(srsmap)
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index eb527a1..2bdd3e1 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1964,6 +1964,13 @@ static inline void cpu_probe_ingenic(struct cpuinfo_mips *c, unsigned int cpu)
 		c->cputype = CPU_XBURST;
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		__cpu_name[cpu] = "Ingenic XBurst";
+		/*
+		 * The XBurst core by default attempts to avoid branch target
+		 * buffer lookups by detecting & special casing loops. This
+		 * feature will cause BogoMIPS and lpj calculate in error.
+		 * Set cp0 config7 bit 4 to disable this feature.
+		 */
+		set_c0_config7(MIPS_CONF7_BTB_LOOP_EN);
 		break;
 	default:
 		panic("Unknown Ingenic Processor ID!");
-- 
2.7.4


