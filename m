Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A075F3E1C88
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 21:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbhHETVg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 15:21:36 -0400
Received: from aposti.net ([89.234.176.197]:54872 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242531AbhHETVg (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 15:21:36 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     list@opendingux.net, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] drivers core: Export driver_deferred_probe_check_state()
Date:   Thu,  5 Aug 2021 21:21:08 +0200
Message-Id: <20210805192110.90302-2-paul@crapouillou.net>
In-Reply-To: <20210805192110.90302-1-paul@crapouillou.net>
References: <20210805192110.90302-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Export this function as a GPL symbol, so that it can be used from
modules.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/base/dd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index daeb9b5763ae..658f1527a58b 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -296,6 +296,7 @@ int driver_deferred_probe_check_state(struct device *dev)
 
 	return -EPROBE_DEFER;
 }
+EXPORT_SYMBOL_GPL(driver_deferred_probe_check_state);
 
 static void deferred_probe_timeout_work_func(struct work_struct *work)
 {
-- 
2.30.2

