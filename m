Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46E6F4338E2
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233928AbhJSOse (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:48:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbhJSOsO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:48:14 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C28C061797
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 07:45:32 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by xavier.telenet-ops.be with bizsmtp
        id 7qlT2600b12AN0U01qlTkZ; Tue, 19 Oct 2021 16:45:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMp-006B4b-AH; Tue, 19 Oct 2021 16:45:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FABR-Pg; Tue, 19 Oct 2021 16:45:25 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v8 11/21] auxdisplay: ht16k33: Use HT16K33_FB_SIZE in ht16k33_initialize()
Date:   Tue, 19 Oct 2021 16:45:10 +0200
Message-Id: <20211019144520.3613926-12-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
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
v8:
  - No changes,

v7:
  - No changes,

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
index ed5808349990782c..fed2f8bd2d27c65b 100644
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

