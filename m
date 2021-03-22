Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3FC3447E0
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:50:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbhCVOtb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:49:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbhCVOtB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 10:49:01 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3269C06178A
        for <linux-mips@vger.kernel.org>; Mon, 22 Mar 2021 07:48:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:250b:f16c:c5e2:505d])
        by laurent.telenet-ops.be with bizsmtp
        id jSot2400L2HDxaV01SotgE; Mon, 22 Mar 2021 15:48:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrQ-009ZWM-OA; Mon, 22 Mar 2021 15:48:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrP-004T6Q-Pp; Mon, 22 Mar 2021 15:48:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 11/17] auxdisplay: ht16k33: Convert to simple i2c probe function
Date:   Mon, 22 Mar 2021 15:48:42 +0100
Message-Id: <20210322144848.1065067-12-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322144848.1065067-1-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ht16k33_probe() does not use the passed i2c_device_id, so the driver can
be converted trivially to the new-style of i2c probing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/auxdisplay/ht16k33.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 13d18f218b4d196e..1b67f38109bddba8 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -381,8 +381,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	return input_register_device(keypad->dev);
 }
 
-static int ht16k33_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+static int ht16k33_probe(struct i2c_client *client)
 {
 	int err;
 	uint32_t dft_brightness;
@@ -523,7 +522,7 @@ static const struct of_device_id ht16k33_of_match[] = {
 MODULE_DEVICE_TABLE(of, ht16k33_of_match);
 
 static struct i2c_driver ht16k33_driver = {
-	.probe		= ht16k33_probe,
+	.probe_new	= ht16k33_probe,
 	.remove		= ht16k33_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
-- 
2.25.1

