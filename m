Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A2DC40B123
	for <lists+linux-mips@lfdr.de>; Tue, 14 Sep 2021 16:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234171AbhINOkF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Sep 2021 10:40:05 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:55018 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbhINOkC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Sep 2021 10:40:02 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4H85ZB4sPhzMqpGB
        for <linux-mips@vger.kernel.org>; Tue, 14 Sep 2021 16:38:42 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d46f:7eb5:4a37:9d14])
        by baptiste.telenet-ops.be with bizsmtp
        id tqeg250092aSKa101qeghD; Tue, 14 Sep 2021 16:38:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a3-004VGv-Ml; Tue, 14 Sep 2021 16:38:39 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mQ9a2-0028yv-OB; Tue, 14 Sep 2021 16:38:38 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v6 10/19] auxdisplay: ht16k33: Use HT16K33_FB_SIZE in ht16k33_initialize()
Date:   Tue, 14 Sep 2021 16:38:26 +0200
Message-Id: <20210914143835.511051-11-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914143835.511051-1-geert@linux-m68k.org>
References: <20210914143835.511051-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the existing HT16K33_FB_SIZE definition instead of open-coding the
same calculation using an hardcoded value.
While at it, restore reverse Christmas tree variable declaration order.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Robin van der Gracht <robin@protonic.nl>
---
v6:
  - No changes,

v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - Add Acked-by.
---
 drivers/auxdisplay/ht16k33.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 2b630e194570f6e5..99daf1974980b435 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -168,9 +168,9 @@ static void ht16k33_fb_update(struct work_struct *work)
 
 static int ht16k33_initialize(struct ht16k33_priv *priv)
 {
+	uint8_t data[HT16K33_FB_SIZE];
 	uint8_t byte;
 	int err;
-	uint8_t data[HT16K33_MATRIX_LED_MAX_COLS * 2];
 
 	/* Clear RAM (8 * 16 bits) */
 	memset(data, 0, sizeof(data));
-- 
2.25.1

