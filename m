Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 721EF3015D2
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 15:28:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbhAWO0y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 09:26:54 -0500
Received: from aposti.net ([89.234.176.197]:33716 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725274AbhAWO0x (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:26:53 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tony Lindgren <tony@atomide.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Maarten ter Huurne <maarten@treewalker.org>
Subject: [RE-RESEND PATCH 2/4] usb: musb: Fix NULL check on struct musb_request field
Date:   Sat, 23 Jan 2021 14:25:00 +0000
Message-Id: <20210123142502.16980-2-paul@crapouillou.net>
In-Reply-To: <20210123142502.16980-1-paul@crapouillou.net>
References: <20210123142502.16980-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The 'request' variable is a pointer to the 'request' field of the
struct musb_request 'req' pointer. It only worked until now because
the 'request' field is the first one in the musb_request structure, but
as soon as that changes, the check will be invalid.

Fix it preventively by doing the NULL-check on the 'req' pointer
instead.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Suggested-by: Maarten ter Huurne <maarten@treewalker.org>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_gadget.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index f62ffaede1ab..ef374d4dd94a 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -451,7 +451,7 @@ void musb_g_tx(struct musb *musb, u8 epnum)
 		return;
 	}
 
-	if (request) {
+	if (req) {
 
 		trace_musb_req_tx(req);
 
-- 
2.29.2

