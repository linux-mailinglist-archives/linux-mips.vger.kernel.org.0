Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7154D3502F2
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 17:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235787AbhCaPIF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 11:08:05 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:33242 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235991AbhCaPHv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 11:07:51 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 12VF77DF021201;
        Thu, 1 Apr 2021 00:07:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 12VF77DF021201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617203228;
        bh=ARbRFUFLNuhizfOq+rbCISdwf0ZvC9EkFJQtTKtjlps=;
        h=From:To:Cc:Subject:Date:From;
        b=0BXLesIP5v+3wtn3FQqyG2ppqrZdnq9H6gl0+IA5olp+NBiyCMNfCxmwDLQuR2eEI
         fl2kirvxTPzE5h+DkZRpO+kgavsmYNHxX6EA9+PAyIdGzYus1o3X6twC+Trr1bC9sJ
         XLYKukwdDHj7ON3/wu+41FoyMeD6G34UM93Cwa18iw8q+lICyienKgDyKE0iANeqDk
         bYfB0qMC99jkoUkhkEVUxfJIepDIsm7lV3ru0xALDquISA9GngQcrMXyd8ON/31gSm
         RzLmoIJDGR3HGPhB9AUota4bXQ/Tuswa/CExOvGPjpK9qDD5SNrH5OA6LSyNzF/uMV
         GY0ArNoN6PO3Q==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-mips@linux-mips.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 1/2] mips: replace deprecated EXTRA_CFLAGS with ccflags-y
Date:   Thu,  1 Apr 2021 00:06:56 +0900
Message-Id: <20210331150658.38919-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As Documentation/kbuild/makefiles.rst says, EXTRA_CFLAGS is deprecated.
Replace it with ccflags-y.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/mips/kvm/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 506c4ac0ba1c..7d42d624a7b9 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -4,7 +4,7 @@
 
 common-objs-y = $(addprefix ../../../virt/kvm/, kvm_main.o coalesced_mmio.o eventfd.o)
 
-EXTRA_CFLAGS += -Ivirt/kvm -Iarch/mips/kvm
+ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
 
 common-objs-$(CONFIG_CPU_HAS_MSA) += msa.o
 
-- 
2.27.0

