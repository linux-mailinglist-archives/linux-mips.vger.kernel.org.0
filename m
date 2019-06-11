Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74F873C4E8
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 09:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404349AbfFKHUk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 03:20:40 -0400
Received: from shell.v3.sk ([90.176.6.54]:60861 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404319AbfFKHUk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Jun 2019 03:20:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id CA435104F75;
        Tue, 11 Jun 2019 09:20:38 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 5c8MQUV4Q-ou; Tue, 11 Jun 2019 09:20:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id CC91B104F6E;
        Tue, 11 Jun 2019 09:20:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id SOVTM4UIXexu; Tue, 11 Jun 2019 09:20:18 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 10294104F71;
        Tue, 11 Jun 2019 09:20:18 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH] MIPS: ralink: Switch pinmux.h to SPDX header
Date:   Tue, 11 Jun 2019 09:20:14 +0200
Message-Id: <20190611072014.2978530-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The original license text had a typo ("publishhed") which would be
likely to confuse automated licensing auditing tools. Let's just switch
to SPDX instead of fixing the wording.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/mips/include/asm/mach-ralink/pinmux.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/mach-ralink/pinmux.h b/arch/mips/inclu=
de/asm/mach-ralink/pinmux.h
index ba8ac331af0c..33647f796140 100644
--- a/arch/mips/include/asm/mach-ralink/pinmux.h
+++ b/arch/mips/include/asm/mach-ralink/pinmux.h
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  publishhed by the Free Software Foundation.
- *
  *  Copyright (C) 2012 John Crispin <john@phrozen.org>
  */
=20
--=20
2.21.0

