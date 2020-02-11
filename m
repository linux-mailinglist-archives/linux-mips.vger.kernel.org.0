Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 135E3159B11
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2020 22:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgBKVZu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Feb 2020 16:25:50 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:38178 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgBKVZu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Feb 2020 16:25:50 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D44B683645;
        Wed, 12 Feb 2020 10:25:45 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1581456345;
        bh=ONoY5ukSuvAaVQlnYYP1oxWrnP8W7ytfW+V8qQuhakY=;
        h=From:To:Cc:Subject:Date;
        b=AgSZIRiEZ0S7iVDBoAawArJpEYt/Rz+g5DIZMp6Pvs5IJsv3ulj9htoU/9Gr5LX7P
         yF16Dd/ZUGFOh8i+xgfeMuIiPhWIibX5hmPpw6RLO8ZN3pkxYSzaKA5BvtYJIDmut5
         KPKWHwXFT5OuOsUsl7EmedTK1IfqfKxYdAcB3MtlF9n8MfYT4HBenKRsLkt1PXkYTW
         VO29odw0uWkKkKC9S0ZLI45pk3NVdHpl/D58T3ASbkp/nWTD+OaAkOuGRrChv4UIig
         Lt32BkhiO2M1aueqB8ZIaTyuHtkl66NIQ5mU3RvDjPqCU6zKriEbev7AjgjTJJZna+
         AGdT6FFN+efqw==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e431bd90000>; Wed, 12 Feb 2020 10:25:45 +1300
Received: from markto-dl.ws.atlnz.lc (markto-dl.ws.atlnz.lc [10.33.23.25])
        by smtp (Postfix) with ESMTP id 8342513EED4;
        Wed, 12 Feb 2020 10:25:45 +1300 (NZDT)
Received: by markto-dl.ws.atlnz.lc (Postfix, from userid 1155)
        id 9BBFB341316; Wed, 12 Feb 2020 10:25:45 +1300 (NZDT)
From:   Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
To:     paulburton@kernel.org, linux-mips@vger.kernel.org
Cc:     chris.packham@alliedtelesis.co.nz, linux-kernel@vger.kernel.org,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
Subject: [PATCH] MIPS: cavium_octeon: Fix syncw generation.
Date:   Wed, 12 Feb 2020 10:24:55 +1300
Message-Id: <20200211212455.3307-1-mark.tomlinson@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Cavium Octeon CPU uses a special sync instruction for implementing
wmb, and due to a CPU bug, the instruction must appear twice. A macro
had been defined to hide this:

 #define __SYNC_rpt(type)     (1 + (type =3D=3D __SYNC_wmb))

which was intended to evaluate to 2 for __SYNC_wmb, and 1 for any other
type of sync. However, this expression is evaluated by the assembler,
and not the compiler, and the result of '=3D=3D' in the assembler is 0 or
-1, not 0 or 1 as it is in C. The net result was wmb() producing no code
at all. The simple fix in this patch is to change the '+' to '-'.

Fixes: bf92927251b3 ("MIPS: barrier: Add __SYNC() infrastructure")
Signed-off-by: Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>
---
 arch/mips/include/asm/sync.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/sync.h b/arch/mips/include/asm/sync.h
index 7c6a1095f5..aabd097933 100644
--- a/arch/mips/include/asm/sync.h
+++ b/arch/mips/include/asm/sync.h
@@ -155,9 +155,11 @@
  * effective barrier as noted by commit 6b07d38aaa52 ("MIPS: Octeon: Use
  * optimized memory barrier primitives."). Here we specify that the affe=
cted
  * sync instructions should be emitted twice.
+ * Note that this expression is evaluated by the assembler (not the comp=
iler),
+ * and that the assembler evaluates '=3D=3D' as 0 or -1, not 0 or 1.
  */
 #ifdef CONFIG_CPU_CAVIUM_OCTEON
-# define __SYNC_rpt(type)	(1 + (type =3D=3D __SYNC_wmb))
+# define __SYNC_rpt(type)	(1 - (type =3D=3D __SYNC_wmb))
 #else
 # define __SYNC_rpt(type)	1
 #endif
--=20
2.25.0

