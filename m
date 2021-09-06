Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E951401CA1
	for <lists+linux-mips@lfdr.de>; Mon,  6 Sep 2021 15:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242919AbhIFNut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Sep 2021 09:50:49 -0400
Received: from smtpbg126.qq.com ([106.55.201.22]:14354 "EHLO smtpbg587.qq.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S242659AbhIFNut (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 Sep 2021 09:50:49 -0400
X-QQ-mid: bizesmtp42t1630936166t2m8s7l1
Received: from localhost.localdomain (unknown [171.223.98.107])
        by esmtp6.qq.com (ESMTP) with 
        id ; Mon, 06 Sep 2021 21:49:25 +0800 (CST)
X-QQ-SSF: 01000000004000C0D000B00A0000000
X-QQ-FEAT: TU3YmX8YeZl7wBXBUJR8beZmR+2M+Ak7m3r5yjAGsVbMvtRbVkRCJOFuoKgbD
        Ss591D9lubapmjzOeqpde/xaVikkf2SRrnd/bS2byizKpfVZ3XvYxUEPyFyKxpsHUWCeiEq
        HJcuPVfJlmnwHKudyEeJUNZBJ9VrWWTOFX4u/iKFYDLUBmSOfTWkanEq9FDi0/I7TBHoWyw
        JBH1gl7P/ld1qABxUlIb+nG3/oLdxBBBFpmVmbU2dE7UVP0S+31Pq8JJgsK7mpTx54/D99k
        z6wn5/QnwX186Z6LJHpmDEj6DhzAUM4y0SaIPBpYx6XN6a9QwhPrPzy4lHZdqbSN68aVU06
        YVqIEUU894SH0DWsiM=
X-QQ-GoodBg: 0
From:   Jason Wang <wangborong@cdjrlc.com>
To:     zajec5@gmail.com
Cc:     hauke@hauke-m.de, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] MIPS: BCM47XX: Replace strlcpy with strscpy
Date:   Mon,  6 Sep 2021 21:49:23 +0800
Message-Id: <20210906134923.102964-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam2
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The strlcpy should not be used because it doesn't limit the source
length. As linus says, it's a completely useless function if you
can't implicitly trust the source string - but that is almost always
why people think they should use it! All in all the BSD function
will lead some potential bugs.

But the strscpy doesn't require reading memory from the src string
beyond the specified "count" bytes, and since the return value is
easier to error-check than strlcpy()'s. In addition, the implementation
is robust to the string changing out from underneath it, unlike the
current strlcpy() implementation.

Thus, We prefer using strscpy instead of strlcpy.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/mips/bcm47xx/board.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/bcm47xx/board.c b/arch/mips/bcm47xx/board.c
index 35266a70e22a..74113dcd86e0 100644
--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -345,7 +345,7 @@ void __init bcm47xx_board_detect(void)
 
 	board_detected = bcm47xx_board_get_nvram();
 	bcm47xx_board.board = board_detected->board;
-	strlcpy(bcm47xx_board.name, board_detected->name,
+	strscpy(bcm47xx_board.name, board_detected->name,
 		BCM47XX_BOARD_MAX_NAME);
 }
 
-- 
2.33.0

