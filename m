Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78743447D3
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:49:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhCVOtZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhCVOs5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 10:48:57 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65ED9C0613E0
        for <linux-mips@vger.kernel.org>; Mon, 22 Mar 2021 07:48:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:250b:f16c:c5e2:505d])
        by albert.telenet-ops.be with bizsmtp
        id jSos2400j2HDxaV06Sos7T; Mon, 22 Mar 2021 15:48:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrQ-009ZWI-Ab; Mon, 22 Mar 2021 15:48:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrP-004T65-LO; Mon, 22 Mar 2021 15:48:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 07/17] auxdisplay: linedisp: Use kmemdup_nul() helper
Date:   Mon, 22 Mar 2021 15:48:38 +0100
Message-Id: <20210322144848.1065067-8-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322144848.1065067-1-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the existing kmemdup_nul() helper instead of open-coding the same
operation.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/auxdisplay/line-display.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
index 4b97c20ac0b381ee..3f35199bc39f511f 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -91,13 +91,10 @@ static int linedisp_display(struct linedisp *linedisp, const char *msg,
 		return 0;
 	}
 
-	new_msg = kmalloc(count + 1, GFP_KERNEL);
+	new_msg = kmemdup_nul(msg, count, GFP_KERNEL);
 	if (!new_msg)
 		return -ENOMEM;
 
-	memcpy(new_msg, msg, count);
-	new_msg[count] = 0;
-
 	kfree(linedisp->message);
 
 	linedisp->message = new_msg;
-- 
2.25.1

