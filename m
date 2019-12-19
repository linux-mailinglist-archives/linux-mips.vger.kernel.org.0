Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6512812653C
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2019 15:53:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbfLSOxJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Dec 2019 09:53:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726757AbfLSOxJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Dec 2019 09:53:09 -0500
Received: from jamesdev.lan (jahogan.plus.com [212.159.75.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9786206D8;
        Thu, 19 Dec 2019 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576767189;
        bh=AemSnB4fpkAss0YdqoqSrWvXbFZWO+SC3mjIImqwFBo=;
        h=From:To:Cc:Subject:Date:From;
        b=de2B7q8yRNuhZF/ND0zRJ7Qi83MD0crlQKpzKfnuhz5YTLjDZExbp58GPcKFuYuFq
         ARMxgpB2JFIs77frgMqkyfk0SAwXIHSG7+YcwAITqzlKwGOzT93zJ/QV3S0QTUQNnA
         lQyrm2R4aL13pMxXdHUYyWtCgQU8JtV57+vrSbZQ=
From:   James Hogan <jhogan@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     James Hogan <jhogan@kernel.org>,
        James Hartley <james.hartley@sondrel.com>,
        Paul Burton <paulburton@kernel.org>,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Orphan img-ir driver
Date:   Thu, 19 Dec 2019 14:52:57 +0000
Message-Id: <20191219145257.45267-1-jhogan@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I haven't been active for 18 months, and don't have the hardware set up
to test the img-ir driver, so mark it as orphaned and remove myself as
maintainer.

I used to test this driver using a Minimorph board with Meta based
TZ1090 SoC, but the Meta arch port is long gone from the kernel. The
only remaining platform in-tree using this driver is the Imagination
Pistachio SoC, and the only Pistachio based board with DTS in-tree (MIPS
Creator Ci40) doesn't bring the IR out.

However I presume the IP persists under the guardianship of Sondrel, and
its possible current & future SoCs/boards may continue to use this IP.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: James Hartley <james.hartley@sondrel.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-mips@vger.kernel.org
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80a6cf8c20c0..19d17815c0fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8104,8 +8104,7 @@ F:	Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
 F:	drivers/auxdisplay/img-ascii-lcd.c
 
 IMGTEC IR DECODER DRIVER
-M:	James Hogan <jhogan@kernel.org>
-S:	Maintained
+S:	Orphan
 F:	drivers/media/rc/img-ir/
 
 IMON SOUNDGRAPH USB IR RECEIVER
-- 
2.24.0

