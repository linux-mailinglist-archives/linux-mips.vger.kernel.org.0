Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEB1914611F
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2020 05:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgAWELg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 23:11:36 -0500
Received: from [115.28.160.31] ([115.28.160.31]:36952 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725943AbgAWELf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 23:11:35 -0500
X-Greylist: delayed 419 seconds by postgrey-1.27 at vger.kernel.org; Wed, 22 Jan 2020 23:11:34 EST
Received: from localhost.localdomain (unknown [116.236.177.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5D84460094;
        Thu, 23 Jan 2020 12:04:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1579752273; bh=hxocbyUj+kiURkc4jHTBWe/0+/sZJgH4cDwGgO2Makk=;
        h=From:To:Cc:Subject:Date:From;
        b=xg1/jx/QksStTmHg9MlZIyIS+kfcFlCj9TQyohmlSf7KrPBtCZ0p6fZ/ef5z0ARdy
         eHGJXI6QTB4Gf75DQjCsKtijphAKiIxGEtX76/PhUURLm33CubHLCVfyecUckesJ6D
         EOyxwfvTgPM97xGpRAqh2+tDJXu2j3YkNSMn9Bjc=
From:   Wang Xuerui <git@xen0n.name>
To:     linux-mips@vger.kernel.org
Cc:     Wang Xuerui <git@xen0n.name>, Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH] MIPS: asm: local: add barriers for Loongson
Date:   Thu, 23 Jan 2020 12:04:09 +0800
Message-Id: <20200123040409.18849-1-git@xen0n.name>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Somehow these LL/SC usages are not taken care of, breaking Loongson
builds. Add the SYNCs appropriately.

Signed-off-by: Wang Xuerui <git@xen0n.name>
Cc: linux-mips@vger.kernel.org
Cc: Paul Burton <paulburton@kernel.org>
Cc: Huacai Chen <chenhc@lemote.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/local.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/include/asm/local.h b/arch/mips/include/asm/local.h
index 02783e141c32..fef0fda8f82f 100644
--- a/arch/mips/include/asm/local.h
+++ b/arch/mips/include/asm/local.h
@@ -37,6 +37,7 @@ static __inline__ long local_add_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=r4000				\n"
+			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_add_return	\n"
 		"	addu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
@@ -52,6 +53,7 @@ static __inline__ long local_add_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
+			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_add_return	\n"
 		"	addu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
@@ -84,6 +86,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	arch=r4000				\n"
+			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_sub_return	\n"
 		"	subu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
@@ -99,6 +102,7 @@ static __inline__ long local_sub_return(long i, local_t * l)
 		__asm__ __volatile__(
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
+			__SYNC(full, loongson3_war) "			\n"
 		"1:"	__LL	"%1, %2		# local_sub_return	\n"
 		"	subu	%0, %1, %3				\n"
 			__SC	"%0, %2					\n"
-- 
2.21.0

