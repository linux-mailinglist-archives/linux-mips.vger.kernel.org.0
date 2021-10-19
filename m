Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39ABD43389F
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 16:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhJSOrr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 10:47:47 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:40524 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231771AbhJSOrq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 10:47:46 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4HYc3t1tSFzMqj9Q
        for <linux-mips@vger.kernel.org>; Tue, 19 Oct 2021 16:45:30 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by baptiste.telenet-ops.be with bizsmtp
        id 7qlT2600H12AN0U01qlTMz; Tue, 19 Oct 2021 16:45:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMp-006B4e-DQ; Tue, 19 Oct 2021 16:45:27 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcqMn-00FABg-R1; Tue, 19 Oct 2021 16:45:25 +0200
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
Subject: [PATCH v8 13/21] auxdisplay: ht16k33: Convert to simple i2c probe function
Date:   Tue, 19 Oct 2021 16:45:12 +0200
Message-Id: <20211019144520.3613926-14-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019144520.3613926-1-geert@linux-m68k.org>
References: <20211019144520.3613926-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ht16k33_probe() does not use the passed i2c_device_id, so the driver can
be converted trivially to the new-style of i2c probing.

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
 drivers/auxdisplay/ht16k33.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 1ce73c4172c89244..d0d7b55059aa181e 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -391,8 +391,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	return input_register_device(keypad->dev);
 }
 
-static int ht16k33_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+static int ht16k33_probe(struct i2c_client *client)
 {
 	int err;
 	uint32_t dft_brightness;
@@ -533,7 +532,7 @@ static const struct of_device_id ht16k33_of_match[] = {
 MODULE_DEVICE_TABLE(of, ht16k33_of_match);
 
 static struct i2c_driver ht16k33_driver = {
-	.probe		= ht16k33_probe,
+	.probe_new	= ht16k33_probe,
 	.remove		= ht16k33_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
-- 
2.25.1

