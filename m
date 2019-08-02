Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7E07EF46
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2019 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731823AbfHBI3H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 2 Aug 2019 04:29:07 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25402 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731576AbfHBI3H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 2 Aug 2019 04:29:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564734486; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=Rko2+rMWSy68EF5M0q1Ehmsk7cY9OZoEtn7ImthRZJbcl+kwKAkb1Oo7lfPfgNl9ny5E/UOuBHksuHxmXyjfIej0HvN4Gp5IKcJbGRT/AFPZLuv2p3PENxkOcEvW/ob7t0u/qOo3kT8MfOY86Aq5IRyfaic3+yCg5deMqlQNMZE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564734486; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=XInzzMgiWJcFkaRBKjAqwD6Ji5EqOMk9SfoHZu+8Meo=; 
        b=mryTHn8MZ46YJqr3jnaF7YcuUMWZBR2xuYirGcXxTrF43oTtrOg2zhvsr3iSsnZT/UIDtimhOWt0u5BxgJGdbwulNGZ98ooDlhY87WsQMQrkV8kWncRgfKXGx0TnpfUC+iPFmK6boR9m9VfFxjpF9rQmp4E7ieJFfoqz2fP3+BU=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=ZjBpQvo/tw8NGuUcwJgoAXY0goXCCYRVtPUnr9Q5yMfCj1zWbJC+kAK+tybO7qvql2ZPEFB5CIal
    m+q+c9ehlricXdCEPvxzirH3+6O8JwA3P2Rm+wIFo2qxJE694QhP  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564734486;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=1930; bh=XInzzMgiWJcFkaRBKjAqwD6Ji5EqOMk9SfoHZu+8Meo=;
        b=Ot84g6lqLoc1OjB+B0Bud8/mCMBuhjWliMItYKSR3TixWIs6pcbxnFAnOrI20gPD
        1cTh56Y8sXOXqG5pMJtcm8P/1PDRc06+xlmOVPutADpwOGVeC/Nr4Jce+09ifNJh38x
        2qmpR9bhnZBZoF1Pz6fXJrp9bySJ02tb8cx258OE=
Received: from localhost.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1564734483932104.33420675435002; Fri, 2 Aug 2019 01:28:03 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        malat@debian.org, gregkh@linuxfoundation.org, tglx@linutronix.de,
        allison@lohutok.net, syq@debian.org, chenhc@lemote.com,
        jiaxun.yang@flygoat.com
Subject: [PATCH 2/2 v4] MIPS: Ingenic: Disable broken BTB lookup optimization.
Date:   Fri,  2 Aug 2019 16:27:37 +0800
Message-Id: <1564734457-48801-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564734457-48801-1-git-send-email-zhouyanjie@zoho.com>
References: <1564498510-3751-1-git-send-email-zhouyanjie@zoho.com>
 <1564734457-48801-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to further reduce power consumption, the XBurst core
by default attempts to avoid branch target buffer lookups by
detecting & special casing loops. This feature will cause
BogoMIPS and lpj calculate in error. Set cp0 config7 bit 4 to
disable this feature.

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


