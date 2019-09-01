Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B52A4A25
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729158AbfIAPsF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:05 -0400
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:39451 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfIAPsF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:05 -0400
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D3A4A3F797;
        Sun,  1 Sep 2019 17:38:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LxdvdqJ1fkop; Sun,  1 Sep 2019 17:38:26 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id C84293F6D0;
        Sun,  1 Sep 2019 17:38:25 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:38:25 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>
Subject: [PATCH 005/120] MIPS: R5900: Reset the funnel shift amount (SA)
 register in RESTORE_SOME
Message-ID: <5ea4fddbb423d86cbf9894690fd221a121636c3a.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The shift amount (SA) register is a 64-bit special register storing the
funnel shift amount[1]. It is used by the QFSRV (quadword funnel shift
right variable) 256-bit multimedia instruction. This is a provisional
measure until the SA register is saved/restored properly.

The R5900 specific MTSAB (move byte count to shift amount register)
instruction is used to reset the SA register.

References:

[1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
    Toshiba Corporation, p. B-161, https://wiki.qemu.org/File:C790.pdf

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
The shift amount (SA) register ought to be saved and restored properly too,
along with the 128-bit GPRs, I think.
---
 arch/mips/include/asm/stackframe.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index aaed9b522220..2fbead2e86d1 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -394,6 +394,7 @@
 		pcpyld	$29, $0, $29
 		pcpyld	$30, $0, $30
 		pcpyld	$31, $0, $31
+		mtsab	$0, 0 /* Reset the funnel shift (SA) register. */
 		.set	pop
 		.endm
 #else
-- 
2.21.0

