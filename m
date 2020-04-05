Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4EA019ECA0
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 18:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgDEQcV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 5 Apr 2020 12:32:21 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:31221 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgDEQcV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 5 Apr 2020 12:32:21 -0400
Received: from grover.flets-west.jp (softbank126125134031.bbtec.net [126.125.134.31]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 035GUxjX014785;
        Mon, 6 Apr 2020 01:30:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 035GUxjX014785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586104259;
        bh=5dte5dvvsDQ3wOKn6WARCRcNltPssbbsGfaDy3F1DZ8=;
        h=From:To:Cc:Subject:Date:From;
        b=NaC2xexFaOoeA+4Wyk79vOG79RDMzA1EzqcWHsj5lfpQ8wEgwpAeIMd/372L1zObg
         P6lY6M91GVEjJ/xAoZolwDTyQkAJ8WFvLQ6awzewAwocCIqngrtbwFRGIHMtFSfvKe
         6rG34v8soPcO4sLbDqZtL54upYVUDFyRy8qcv2gTRF063ShETYiBrDga6gjchJCsGG
         1FQzGP3x91GAY8XXBQhrf/p0pNYTkjXhIATJ6L7jLnzAWjYgzGj4G5KKEalmAA2I2u
         mC0pX7H3vkDFl79PV9K5uF2d4RylWgzNge9GOGkhj4Jgydj72Ibm4ay6uzKI86YN/b
         7x8Hav1jv/wig==
X-Nifty-SrcIP: [126.125.134.31]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org, linux-mips@linux-mips.org
Cc:     clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
Date:   Mon,  6 Apr 2020 01:30:52 +0900
Message-Id: <20200405163052.18942-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
CONFIG_SGI_IP32 is enabled.

The use of EXPORT_SYMBOL in static libraries potentially causes a
problem for the llvm linker [1]. So, I want to forcibly link lib-y
objects to vmlinux when CONFIG_MODULES=y.

As a groundwork, we must fix multiple definitions that have previously
been hidden by lib-y.

The prom_cleanup() in this file is already marked as __weak (because
it is overridden by the one in arch/mips/sgi-ip22/ip22-mc.c).
I think it should be OK to do the same for these two.

[1]: https://github.com/ClangBuiltLinux/linux/issues/515

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

If MIPS maintainers ack this patch,
I want to inser it before the following patch:

https://patchwork.kernel.org/patch/11432969/

 arch/mips/fw/arc/memory.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/fw/arc/memory.c b/arch/mips/fw/arc/memory.c
index dbbcddc82823..89fa6e62a3b3 100644
--- a/arch/mips/fw/arc/memory.c
+++ b/arch/mips/fw/arc/memory.c
@@ -117,7 +117,7 @@ static int __init prom_memtype_classify(union linux_memtypes type)
 	return memtype_classify_arc(type);
 }
 
-void __init prom_meminit(void)
+void __weak __init prom_meminit(void)
 {
 	struct linux_mdesc *p;
 
@@ -162,7 +162,7 @@ void __weak __init prom_cleanup(void)
 {
 }
 
-void __init prom_free_prom_memory(void)
+void __weak __init prom_free_prom_memory(void)
 {
 	int i;
 
-- 
2.17.1

