Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA2D126467
	for <lists+linux-mips@lfdr.de>; Thu, 19 Dec 2019 15:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbfLSORO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Dec 2019 09:17:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:48970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726695AbfLSORO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Dec 2019 09:17:14 -0500
Received: from jamesdev.lan (jahogan.plus.com [212.159.75.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC7B1206D8;
        Thu, 19 Dec 2019 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576765033;
        bh=sR0y9zONxNC7kusimqGWdIYHbl3Xg5Sku/xgDA/vPKY=;
        h=From:To:Cc:Subject:Date:From;
        b=XcI1AVxPisF9vWVar6I48pnXGr2ZmrQyvMGRINgbiwbFQEC0EgMaiIjiLlz9TT03F
         O4d9d0iHaVXahkCh4qbIduf1I9q8zL920ULGrJiB/UR94L4OH2CbgcMu6SWIAgv5/k
         mqLlAR7ET7r8Wpeui4aGdK66JNICnGEwhPdqB77U=
From:   James Hogan <jhogan@kernel.org>
To:     Paul Burton <paulburton@kernel.org>
Cc:     James Hogan <jhogan@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Drop James Hogan as MIPS maintainer
Date:   Thu, 19 Dec 2019 14:16:58 +0000
Message-Id: <20191219141658.43818-1-jhogan@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I haven't been active for 18 months, and Paul seems to be doing a grand
job, so drop me from MIPS maintainership.

Signed-off-by: James Hogan <jhogan@kernel.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@vger.kernel.org
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a049abccaa26..80a6cf8c20c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10999,7 +10999,6 @@ F:	drivers/usb/image/microtek.*
 MIPS
 M:	Ralf Baechle <ralf@linux-mips.org>
 M:	Paul Burton <paulburton@kernel.org>
-M:	James Hogan <jhogan@kernel.org>
 L:	linux-mips@vger.kernel.org
 W:	http://www.linux-mips.org/
 T:	git git://git.linux-mips.org/pub/scm/ralf/linux.git
-- 
2.24.0

