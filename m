Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B311C7A6FF
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jul 2019 13:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730241AbfG3LcB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Jul 2019 07:32:01 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25436 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728412AbfG3LcB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Jul 2019 07:32:01 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1564486262; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=ewCwwXpYf2iGHh2AgN4SgfPc0leFlNvE0sS4GCy6U39+UoRD5Ps3IGH7dGBwkY53wi75tN3M8XnC7u6AELvHqEOVRhC1951Y5QLU6QOOmnrDleiioUOp7LXiA9WhdP3Ui7HHij08A1qJvriatxOPgjkox3HXqd3WGUC3qzg0je8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1564486262; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=wDiI6UWrIsZu51ZmamnlwdBWNBG4zNEzzLTUCR7tMe0=; 
        b=fvf97GvLP+lGu2ABLkjtYS5rMID/7f5v5rDfwO3pGYV2/odkihawEJRGxRvKYPQimDeQpHsainvym0WqX1bNHCQyRUDJ9SwlTh+fl9voBDeig014R3GQuIMUnGSQbIEod0FmhGykA9hGx7gwrYSSbhTRXYP7WkHzfr5auVVMnj0=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=upNuBRvtb/IBWW2XVei0xVUupszc0hCIwcKYyKpYiTKbPlBEZ89ISyN3wRH1EISfLU0y4eyx0pqY
    Mbmu9JFwpjsFB7+73cyNMj5VYlVuy5/94eb9kCNgbiusBItCDa9v  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1564486262;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=2096; bh=wDiI6UWrIsZu51ZmamnlwdBWNBG4zNEzzLTUCR7tMe0=;
        b=pfuxJfOMickcrG00yexEA4yOi/CdF7EbqjMSp1N8xlwrMocCqSicX7dUOtGum6XD
        FEljn6LpAA6WrHFSLdr68y0k1HuwtJin+uCvsfJe1QdtOXFzCJT2a8sKrOFB81uP1BE
        UZkdaco4kzAmjV9mrMJU0lozD2D8Rg8t6TTVR2vY=
Received: from localhost.localdomain (171.221.113.137 [171.221.113.137]) by mx.zohomail.com
        with SMTPS id 156448625986276.7208854130721; Tue, 30 Jul 2019 04:30:59 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, ralf@linux-mips.org,
        paul@crapouillou.net, paul.burton@mips.com, jhogan@kernel.org,
        fancer.lancer@gmail.com, chenhc@lemote.com, tglx@linutronix.de,
        gregkh@linuxfoundation.org, armijn@tjaldur.nl, syq@debian.org,
        jiaxun.yang@flygoat.com
Subject: [PATCH] MIPS: X1000: Add X1000 system type.
Date:   Tue, 30 Jul 2019 19:30:11 +0800
Message-Id: <1564486211-2699-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564486211-2699-1-git-send-email-zhouyanjie@zoho.com>
References: <1564486211-2699-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add X1000 system type for cat /proc/cpuinfo to give out X1000.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 arch/mips/include/asm/bootinfo.h | 1 +
 arch/mips/include/asm/cpu.h      | 2 +-
 arch/mips/jz4740/setup.c         | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index 235bc2f..32ba103 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -81,6 +81,7 @@ enum loongson_machine_type {
 #define  MACH_INGENIC_JZ4740	1	/* JZ4740 SOC		*/
 #define  MACH_INGENIC_JZ4770	2	/* JZ4770 SOC		*/
 #define  MACH_INGENIC_JZ4780	3	/* JZ4780 SOC		*/
+#define  MACH_INGENIC_X1000		4	/* X1000 SOC		*/
 
 extern char *system_type;
 const char *get_system_type(void);
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 6ad7d3c..65c780e4 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -45,7 +45,7 @@
 #define PRID_COMP_CAVIUM	0x0d0000
 #define PRID_COMP_LOONGSON	0x140000
 #define PRID_COMP_INGENIC_D0	0xd00000	/* JZ4740, JZ4750 */
-#define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775 */
+#define PRID_COMP_INGENIC_D1	0xd10000	/* JZ4770, JZ4775, X1000 */
 #define PRID_COMP_INGENIC_E1	0xe10000	/* JZ4780 */
 
 /*
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
index 4264eaf..5c58f30 100644
--- a/arch/mips/jz4740/setup.c
+++ b/arch/mips/jz4740/setup.c
@@ -45,6 +45,8 @@ static void __init jz4740_detect_mem(void)
 
 static unsigned long __init get_board_mach_type(const void *fdt)
 {
+	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1000"))
+		return MACH_INGENIC_X1000;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4780"))
 		return MACH_INGENIC_JZ4780;
 	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4770"))
@@ -85,6 +87,8 @@ void __init device_tree_init(void)
 const char *get_system_type(void)
 {
 	switch (mips_machtype) {
+	case MACH_INGENIC_X1000:
+		return "X1000";
 	case MACH_INGENIC_JZ4780:
 		return "JZ4780";
 	case MACH_INGENIC_JZ4770:
-- 
2.7.4


