Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9873015CD
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 15:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbhAWO0G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 09:26:06 -0500
Received: from aposti.net ([89.234.176.197]:33652 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725899AbhAWO0F (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:26:05 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tony Lindgren <tony@atomide.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        stable@vger.kernel.org
Subject: [RE-RESEND PATCH 1/4] usb: musb: Fix runtime PM race in musb_queue_resume_work
Date:   Sat, 23 Jan 2021 14:24:59 +0000
Message-Id: <20210123142502.16980-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

musb_queue_resume_work() would call the provided callback if the runtime
PM status was 'active'. Otherwise, it would enqueue the request if the
hardware was still suspended (musb->is_runtime_suspended is true).

This causes a race with the runtime PM handlers, as it is possible to be
in the case where the runtime PM status is not yet 'active', but the
hardware has been awaken (PM resume function has been called).

When hitting the race, the resume work was not enqueued, which probably
triggered other bugs further down the stack. For instance, a telnet
connection on Ingenic SoCs would result in a 50/50 chance of a
segmentation fault somewhere in the musb code.

Rework the code so that either we call the callback directly if
(musb->is_runtime_suspended == 0), or enqueue the query otherwise.

Fixes: ea2f35c01d5e ("usb: musb: Fix sleeping function called from invalid context for hdrc glue")
Cc: stable@vger.kernel.org # v4.9+
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Tony Lindgren <tony@atomide.com>
Tested-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_core.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
index 849e0b770130..1cd87729ba60 100644
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2240,32 +2240,35 @@ int musb_queue_resume_work(struct musb *musb,
 {
 	struct musb_pending_work *w;
 	unsigned long flags;
+	bool is_suspended;
 	int error;
 
 	if (WARN_ON(!callback))
 		return -EINVAL;
 
-	if (pm_runtime_active(musb->controller))
-		return callback(musb, data);
+	spin_lock_irqsave(&musb->list_lock, flags);
+	is_suspended = musb->is_runtime_suspended;
+
+	if (is_suspended) {
+		w = devm_kzalloc(musb->controller, sizeof(*w), GFP_ATOMIC);
+		if (!w) {
+			error = -ENOMEM;
+			goto out_unlock;
+		}
 
-	w = devm_kzalloc(musb->controller, sizeof(*w), GFP_ATOMIC);
-	if (!w)
-		return -ENOMEM;
+		w->callback = callback;
+		w->data = data;
 
-	w->callback = callback;
-	w->data = data;
-	spin_lock_irqsave(&musb->list_lock, flags);
-	if (musb->is_runtime_suspended) {
 		list_add_tail(&w->node, &musb->pending_list);
 		error = 0;
-	} else {
-		dev_err(musb->controller, "could not add resume work %p\n",
-			callback);
-		devm_kfree(musb->controller, w);
-		error = -EINPROGRESS;
 	}
+
+out_unlock:
 	spin_unlock_irqrestore(&musb->list_lock, flags);
 
+	if (!is_suspended)
+		error = callback(musb, data);
+
 	return error;
 }
 EXPORT_SYMBOL_GPL(musb_queue_resume_work);
-- 
2.29.2

