Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0E2F1026B1
	for <lists+linux-mips@lfdr.de>; Tue, 19 Nov 2019 15:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfKSOaU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Nov 2019 09:30:20 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25834 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfKSOaT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Nov 2019 09:30:19 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574173766; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=EnyWa5wNBRk5KtfbwNrpGLzxflSvqx60UI9Snh7SQ/Fu5VDwiHmauosuXeHLYgctFJVsQIc2wIdAFC62QhREc72HP5p3J/2Qc8TafExPB+5cbAWiAttguwWuan5CNdFDobPzE4qdpSM6JavIBSUMj5Rtir7e0lWjWQFv4X8WCyY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574173766; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=M6lErxMa4wqpsghWs6dGPbHRixMP0dqNuhbesTM6QL0=; 
        b=HkOHz4JXqCWROyKOm4HH1pNhnfmcJI71erIwcf/TRNPwl4PS3ugA171oPaX/Vplt1UlXYoeTWE5seURuunJVYCn+8rUOd0UimeZFiZY5GxeQKj0urmVbzQafN4QFOJeQk02JffM95kPB/R+F97trkus/yWu2rxxrs96Y38pXThg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=YKTFabIRiME9bUl9yUrgtjjZiwOPOQsjGSZTfPdNDE8ElUJT8qttVH3FKkc3YJGGFOW43xZuj7OF
    5VHlNT5N15kCNM0oSJvFPKQzPUyIe7RorpYw5sCGYLsWZUQ6E2QU  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574173766;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; l=892;
        bh=M6lErxMa4wqpsghWs6dGPbHRixMP0dqNuhbesTM6QL0=;
        b=Qmde6qHX4aZugNm38Y4Jn86dHRaUKk7a3WKLSJ4YhMiCjKiYiBeZXVehXPMXRh1b
        s6gfnlg2hERnbcCqyR0M26iXHlMa1RF4wgkz9Ujhykm7MGT40BjBu4msMwWsiF9OGp9
        bFef5XBjDfKZOHj9cYI1gbLKlmtqJ36pmvhb80zQ=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.113.24 [171.221.113.24]) by mx.zohomail.com
        with SMTPS id 157417376520594.8489750435217; Tue, 19 Nov 2019 06:29:25 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paulburton@kernel.org, jhogan@kernel.org, paul@crapouillou.net,
        jiaxun.yang@flygoat.com, gregkh@linuxfoundation.org,
        malat@debian.org, tglx@linutronix.de, chenhc@lemote.com
Subject: [PATCH 1/2 v3] MIPS: Rename JZRISC to XBurst.
Date:   Tue, 19 Nov 2019 22:28:46 +0800
Message-Id: <1574173727-123321-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574173727-123321-1-git-send-email-zhouyanjie@zoho.com>
References: <1571909341-10108-1-git-send-email-zhouyanjie@zoho.com>
 <1574173727-123321-1-git-send-email-zhouyanjie@zoho.com>
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


