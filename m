Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F82C33D7F6
	for <lists+linux-mips@lfdr.de>; Tue, 16 Mar 2021 16:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236725AbhCPPpy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 16 Mar 2021 11:45:54 -0400
Received: from aposti.net ([89.234.176.197]:42038 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhCPPpr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 16 Mar 2021 11:45:47 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH] MIPS: vmlinux.lds.S: Fix appended dtb not properly aligned
Date:   Tue, 16 Mar 2021 15:45:15 +0000
Message-Id: <20210316154515.171543-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 6654111c893f ("MIPS: vmlinux.lds.S: align raw appended dtb to 8
bytes") changed the alignment from STRUCT_ALIGNMENT bytes to 8 bytes.

The commit's message makes it sound like it was actually done on
purpose, but this is not the case. The commit was written when raw
appended dtb were not aligned at all. The STRUCT_ALIGN() was added a few
days before, in commit 7a05293af39f ("MIPS: boot/compressed: Copy DTB to
aligned address"). The true purpose of the commit was not to align
specifically to 8 bytes, but to make sure that the generated vmlinux'
size was properly padded to the alignment required for DTBs.

While the switch to 8-byte alignment worked for vmlinux-appended dtb
blobs, it broke vmlinuz-appended dtb blobs, as the decompress routine
moves the blob to a STRUCT_ALIGNMENT aligned address.

Fix this by changing the raw appended dtb blob alignment from 8 bytes
back to STRUCT_ALIGNMENT bytes in vmlinux.lds.S.

Fixes: 6654111c893f ("MIPS: vmlinux.lds.S: align raw appended dtb to 8 bytes")
Cc: Bjørn Mork <bjorn@mork.no>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
index 1234834cc4c4..1f98947fe715 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -176,7 +176,7 @@ SECTIONS
 	.fill : {
 		FILL(0);
 		BYTE(0);
-		. = ALIGN(8);
+		STRUCT_ALIGN();
 	}
 	__appended_dtb = .;
 	/* leave space for appended DTB */
-- 
2.30.2

