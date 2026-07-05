Return-Path: <linux-mips+bounces-15496-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8bxUIBzrSWoD8gAAu9opvQ
	(envelope-from <linux-mips+bounces-15496-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Jul 2026 07:26:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFB170903A
	for <lists+linux-mips@lfdr.de>; Sun, 05 Jul 2026 07:26:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ViHnp2kP;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15496-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-mips+bounces-15496-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F5423036D4B
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jul 2026 05:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FD630146C;
	Sun,  5 Jul 2026 05:25:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750DC33DEE5
	for <linux-mips@vger.kernel.org>; Sun,  5 Jul 2026 05:25:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783229123; cv=none; b=NABB+R6nC1rGu06j9/IcvXs9o0qK1Dz7nhCJ7UpnD5z/YUzRU+czzXCvYVpsSZhuaJr6cPscU4OsSmZeScTBogR0K9YLtfSyJ2/+rhgXf3xdaGQn/dT0sHOVEgJYzUdGEEJeC0qBI5VyMeyctJBfQwjfl33O/t/ShVNpZbnyvNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783229123; c=relaxed/simple;
	bh=6N7zSzdblz0P8SeiuYyO9z34rfnPkZS7YNlaEIrwEKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zg1tuyf9fL7lRDQ4RjhU7SJMT4QuytmFoJQvfuBBP/+T55VutB1SHUz5J3lTGxCc5/i2jET78qIRh/uxyisl/HfQ+0UM+Q/zxvh932jT4s/GRj0NuYqk2DLQjWOKZcdVBQT0gi1DQwLf8kv7jVW1kVpi2lRpGBPEQGlidm7mVz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViHnp2kP; arc=none smtp.client-ip=209.85.216.44
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-381ed661712so1410344a91.2
        for <linux-mips@vger.kernel.org>; Sat, 04 Jul 2026 22:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783229121; x=1783833921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJ6NDJKZ5m7kRy8emFy4NFf8gh6IQF6eMPm0h3uSaoA=;
        b=ViHnp2kPkxOtuP8S4bJCeOLeBqyj2dmIlQ3LpsGmprTJysCME5NiPJUcN7GwgZIIga
         RJsZnCkmQxJG8IjRXEabJHFR9jLOiX4VAsV0N25ntC4BrTGtpxT3Vwf1s7JDb8RJQzjv
         Q1D+tk5zRVK9uYRPhgiN0NSu8QV03qZvOv7yZLSHowpfb2Ir/ysp2JSzifkh9WGp4JhA
         VAMgztYwKONrR6lvlbXZWdNv9g7E2IgVbkq5jVch/ElMaMf5ChQ6zuX1yYCxBwisuW20
         4kJYQa4cQxTeX+iEeD8OGLcxp6L0T+vZ2i2UiO32oZG+vxlZDCQtLdfv0TWWuHKRiB3x
         uxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783229121; x=1783833921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sJ6NDJKZ5m7kRy8emFy4NFf8gh6IQF6eMPm0h3uSaoA=;
        b=df77YvRdBUJDCWpirbxIzxQSU4+BHun/cqjpvHea3fIPPEMhkm/U8HIvWcx5voZ6eY
         qoGTGIoo4PSNuCUI+/rlxl3TxSEvKxn4L8nwZKPvN9AZsR9nzEk/91EU3jbykYYaJYPr
         n1FMye44gWOJeNlazUzTpKiufGn6iZs2qiOQVhJjDz43WZQB0hRrDWLFn8Mph21RVhLX
         Qex2AkFVMAdN2Y3uL9JML7g5YAf9Wc1vrz03uaHaSi7znPnBTjtczZJiLzS8QkbNfDBq
         +B4jsdVV87ozm2D0qlYotSwHFxvDbSm6KiBru0rluwYyE2As00QEet1eVCDAsCUVVa19
         HTYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpBTZXi6A+G6+57KhLzvV78r0nbFS6cWqCKDtDcG5HDOyx/qX3bJ+rOc/EFYfdp8x9CnjVj4DdSud6@vger.kernel.org
X-Gm-Message-State: AOJu0YyuIqE4poIRg7TCBzIlFxdUkDjWeEY6moAdQ5UpuLnFs522DFaW
	T+tZs0Gnj9TAZBMLVQOe9s33alSCJMH8WGWO9AC1/8UiBBpMDNfMIxpt
X-Gm-Gg: AfdE7cl+IS2GqKdlP5WPwhAWW4JPkQyLpqb6vuW6u26meGjkF42WQY1DvKTx3fU91dZ
	dbwGOBMojHxKLASHIKhNVHCcsehqnmC5NRloBsvqMecMB7rgGlqi8xgBCgwf6N93yiCmDWxWQrB
	RiJiePnMWlkbS1F6oSASN2VLn4K9YngVAvvaF1ZNjmbc3I9t+Vz1pYpHRMOOWr4Vow4jK95MMwT
	7nvJVP0LspTyEhrM6FpFpXxRMVZml+WuuMPu3O/0H66iFnMyKrGRdiMrpNw9tRlq6Wk67yUtR/X
	PikO6piZ9Y/yNYGcnyeKHhQhABT/JDkE1Rz4J+K1JekFwf92JDYKIZrtoFf5z/IFRQVgjHmb2Ob
	H9KIHJf4nNqmZUp68Qy0WWRI/ULwioVgsovkabl/VFvsbYzeJabjVwOQBn3TGiuzhAoCxyoR3Ql
	bTyecn9xqlxbGUzljXcIUEdDBLhrg9QuuSdsApUd60kECgVGDj2wtRw0bzunWKmidQHmRz0bvRv
	t8Y
X-Received: by 2002:a17:90b:3fcf:b0:368:9da3:c496 with SMTP id 98e67ed59e1d1-3829f101e2bmr5039112a91.24.1783229119312;
        Sat, 04 Jul 2026 22:25:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4560:aa1b:b33a:15b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm39035329eec.3.2026.07.04.22.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 22:25:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 04 Jul 2026 22:25:10 -0700
Subject: [PATCH 3/3] MIPS: BCM47XX: Convert buttons to software nodes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-b4-bcm47xx-swnode-v1-3-730d59340237@gmail.com>
References: <20260704-b4-bcm47xx-swnode-v1-0-730d59340237@gmail.com>
In-Reply-To: <20260704-b4-bcm47xx-swnode-v1-0-730d59340237@gmail.com>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, 
 Michael Buesch <m@bues.ch>, Hauke Mehrtens <hauke@hauke-m.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org
X-Mailer: b4 0.16-dev-b242f
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15496-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zajec5@gmail.com,m:m@bues.ch,m:hauke@hauke-m.de,m:tsbogend@alpha.franken.de,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bues.ch,hauke-m.de,alpha.franken.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCFB170903A

Convert the legacy gpio-keys platform device on BCM47XX boards to
use software nodes/properties. This allows us to describe the GPIO
keys and their GPIO bindings using software nodes, so that support
for platform data can eventually be removed from the gpio-keys
driver.

Detect the active bus type (BCMA or SSB) and reference the
corresponding GPIO controller's software node (bcma_gpio_swnode or
ssb_gpio_swnode) in the button properties.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/mips/bcm47xx/buttons.c | 434 +++++++++++++++++++++++++-------------------
 1 file changed, 247 insertions(+), 187 deletions(-)

diff --git a/arch/mips/bcm47xx/buttons.c b/arch/mips/bcm47xx/buttons.c
index 46994f9bb821..ff2e70a2e18c 100644
--- a/arch/mips/bcm47xx/buttons.c
+++ b/arch/mips/bcm47xx/buttons.c
@@ -1,9 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0
 #include "bcm47xx_private.h"
 
-#include <linux/input.h>
-#include <linux/gpio_keys.h>
+#include "linux/err.h"
+#include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
+#include <linux/input-event-codes.h>
 #include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
 #include <bcm47xx_board.h>
 #include <bcm47xx.h>
 
@@ -11,29 +16,34 @@
  * Database
  **************************************************/
 
-#define BCM47XX_GPIO_KEY(_gpio, _code)					\
-	{								\
-		.code		= _code,				\
-		.gpio		= _gpio,				\
-		.active_low	= 1,					\
+struct bcm47xx_gpio_key {
+	u16 code;
+	u8 pin;
+	u8 flags;
+};
+
+#define BCM47XX_GPIO_KEY(_gpio, _code)			\
+	{						\
+		.code	= _code,			\
+		.pin	= _gpio,			\
+		.flags	= GPIO_ACTIVE_LOW,		\
 	}
 
-#define BCM47XX_GPIO_KEY_H(_gpio, _code)				\
-	{								\
-		.code		= _code,				\
-		.gpio		= _gpio,				\
+#define BCM47XX_GPIO_KEY_H(_gpio, _code)		\
+	{						\
+		.code	= _code,			\
+		.pin	= _gpio,			\
+		.flags	= GPIO_ACTIVE_HIGH,		\
 	}
 
 /* Asus */
 
-static const struct gpio_keys_button
-bcm47xx_buttons_asus_rtn10u[] __initconst = {
+static const struct bcm47xx_gpio_key bcm47xx_buttons_asus_rtn10u[] __initconst = {
 	BCM47XX_GPIO_KEY(20, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(21, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
-bcm47xx_buttons_asus_rtn12[] __initconst = {
+static const struct bcm47xx_gpio_key bcm47xx_buttons_asus_rtn12[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(1, KEY_RESTART),
 	BCM47XX_GPIO_KEY(4, BTN_0), /* Router mode */
@@ -41,74 +51,73 @@ bcm47xx_buttons_asus_rtn12[] __initconst = {
 	BCM47XX_GPIO_KEY(6, BTN_2), /* AP mode */
 };
 
-static const struct gpio_keys_button
-bcm47xx_buttons_asus_rtn16[] __initconst = {
+static const struct bcm47xx_gpio_key bcm47xx_buttons_asus_rtn16[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_rtn66u[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(9, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl300g[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl320ge[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl330ge[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl500g[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl500gd[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl500gpv1[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_RESTART),
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl500gpv2[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_RESTART),
 	BCM47XX_GPIO_KEY(3, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl500w[] __initconst = {
 	BCM47XX_GPIO_KEY_H(6, KEY_RESTART),
 	BCM47XX_GPIO_KEY_H(7, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl520gc[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_RESTART),
 	BCM47XX_GPIO_KEY(3, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl520gu[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_RESTART),
 	BCM47XX_GPIO_KEY(3, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wl700ge[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_POWER), /* Hard disk power switch */
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON), /* EZSetup */
@@ -116,21 +125,21 @@ bcm47xx_buttons_asus_wl700ge[] __initconst = {
 	BCM47XX_GPIO_KEY(7, KEY_RESTART), /* Hard reset */
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_asus_wlhdd[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
 /* Huawei */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_huawei_e970[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
 /* Belkin */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_belkin_f7d4301[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 	BCM47XX_GPIO_KEY(8, KEY_WPS_BUTTON),
@@ -138,44 +147,44 @@ bcm47xx_buttons_belkin_f7d4301[] __initconst = {
 
 /* Buffalo */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_whr2_a54g54[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_whr_g125[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 	BCM47XX_GPIO_KEY(5, BTN_0), /* Router / AP mode switch */
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_whr_g54s[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY_H(4, KEY_RESTART),
 	BCM47XX_GPIO_KEY(5, BTN_0), /* Router / AP mode switch */
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_whr_hp_g54[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 	BCM47XX_GPIO_KEY(5, BTN_0), /* Router / AP mode switch */
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_wzr_g300n[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_wzr_rs_g54[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_buffalo_wzr_rs_g54hp[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
@@ -183,20 +192,20 @@ bcm47xx_buttons_buffalo_wzr_rs_g54hp[] __initconst = {
 
 /* Dell */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_dell_tm2300[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_RESTART),
 };
 
 /* D-Link */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_dlink_dir130[] __initconst = {
 	BCM47XX_GPIO_KEY(3, KEY_RESTART),
 	BCM47XX_GPIO_KEY(7, KEY_UNKNOWN),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_dlink_dir330[] __initconst = {
 	BCM47XX_GPIO_KEY(3, KEY_RESTART),
 	BCM47XX_GPIO_KEY(7, KEY_UNKNOWN),
@@ -204,127 +213,127 @@ bcm47xx_buttons_dlink_dir330[] __initconst = {
 
 /* Linksys */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e1000v1[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e1000v21[] __initconst = {
 	BCM47XX_GPIO_KEY(9, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(10, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e2000v1[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e2500v3[] __initconst = {
 	BCM47XX_GPIO_KEY(9, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(10, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e3000v1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e3200v1[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_RESTART),
 	BCM47XX_GPIO_KEY(8, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_e4200v1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt150nv1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt150nv11[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt160nv1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt160nv3[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt300n_v1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt300nv11[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_UNKNOWN),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt310nv1[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 	BCM47XX_GPIO_KEY(8, KEY_UNKNOWN),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt310n_v2[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt320n_v1[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt54g3gv2[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_WIMAX),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt54g_generic[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt610nv1[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 	BCM47XX_GPIO_KEY(8, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrt610nv2[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_linksys_wrtsl54gs[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
@@ -332,154 +341,154 @@ bcm47xx_buttons_linksys_wrtsl54gs[] __initconst = {
 
 /* Luxul */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_abr_4400_v1[] = {
 	BCM47XX_GPIO_KEY(14, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xap_310_v1[] = {
 	BCM47XX_GPIO_KEY(20, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xap_1210_v1[] = {
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xap_1230_v1[] = {
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xap_1240_v1[] = {
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xap_1500_v1[] = {
 	BCM47XX_GPIO_KEY(14, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xbr_4400_v1[] = {
 	BCM47XX_GPIO_KEY(14, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xvw_p30_v1[] = {
 	BCM47XX_GPIO_KEY(20, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xwr_600_v1[] = {
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_luxul_xwr_1750_v1[] = {
 	BCM47XX_GPIO_KEY(14, KEY_RESTART),
 };
 
 /* Microsoft */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_microsoft_nm700[] __initconst = {
 	BCM47XX_GPIO_KEY(7, KEY_RESTART),
 };
 
 /* Motorola */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_motorola_we800g[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_motorola_wr850gp[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_motorola_wr850gv2v3[] __initconst = {
 	BCM47XX_GPIO_KEY(5, KEY_RESTART),
 };
 
 /* Netgear */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_r6200_v1[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_RFKILL),
 	BCM47XX_GPIO_KEY(3, KEY_RESTART),
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_r6300_v1[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wn2500rp_v1[] __initconst = {
 	BCM47XX_GPIO_KEY(12, KEY_RESTART),
 	BCM47XX_GPIO_KEY(31, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wndr3400v1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 	BCM47XX_GPIO_KEY(6, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(8, KEY_RFKILL),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wndr3400_v3[] __initconst = {
 	BCM47XX_GPIO_KEY(12, KEY_RESTART),
 	BCM47XX_GPIO_KEY(23, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wndr3700v3[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_RFKILL),
 	BCM47XX_GPIO_KEY(3, KEY_RESTART),
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wndr4500v1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(5, KEY_RFKILL),
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wnr1000_v3[] __initconst = {
 	BCM47XX_GPIO_KEY(2, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(3, KEY_RESTART),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wnr3500lv1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 	BCM47XX_GPIO_KEY(6, KEY_WPS_BUTTON),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wnr3500lv2[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_RESTART),
 	BCM47XX_GPIO_KEY(6, KEY_WPS_BUTTON),
 	BCM47XX_GPIO_KEY(8, KEY_RFKILL),
 };
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_netgear_wnr834bv2[] __initconst = {
 	BCM47XX_GPIO_KEY(6, KEY_RESTART),
 };
 
 /* SimpleTech */
 
-static const struct gpio_keys_button
+static const struct bcm47xx_gpio_key
 bcm47xx_buttons_simpletech_simpleshare[] __initconst = {
 	BCM47XX_GPIO_KEY(0, KEY_RESTART),
 };
@@ -488,31 +497,88 @@ bcm47xx_buttons_simpletech_simpleshare[] __initconst = {
  * Init
  **************************************************/
 
-static struct gpio_keys_platform_data bcm47xx_button_pdata;
-
-static struct platform_device bcm47xx_buttons_gpio_keys = {
-	.name = "gpio-keys",
-	.dev = {
-		.platform_data = &bcm47xx_button_pdata,
+static int __init
+bcm47xx_buttons_add(const struct bcm47xx_gpio_key *buttons, int nbuttons)
+{
+	struct platform_device *pdev;
+	const struct software_node *gpio_swnode;
+	struct property_entry *p;
+	int error;
+	int i;
+
+	switch (bcm47xx_bus_type) {
+#ifdef CONFIG_BCM47XX_BCMA
+	case BCM47XX_BUS_TYPE_BCMA:
+		gpio_swnode = &bcma_gpio_swnode;
+		break;
+#endif
+#ifdef CONFIG_BCM47XX_SSB
+	case BCM47XX_BUS_TYPE_SSB:
+		gpio_swnode = &ssb_gpio_swnode;
+		break;
+#endif
+	default:
+		return -ENODEV;
 	}
-};
 
-/* Copy data from __initconst */
-static int __init bcm47xx_buttons_copy(const struct gpio_keys_button *buttons,
-				       size_t nbuttons)
-{
-	size_t size = nbuttons * sizeof(*buttons);
+	/* 1 node for gpio-keys device, 1 node for each button, 1 terminator */
+	const struct software_node **node_group __free(kfree) =
+		kcalloc(1 + nbuttons + 1, sizeof(*node_group), GFP_KERNEL);
+	if (!node_group)
+		return -ENOMEM;
+
+	/* 1 code property, 1 gpio property, 1 terminator */
+	struct property_entry *props __free(kfree) =
+		kcalloc(nbuttons * 3, sizeof(*props), GFP_KERNEL);
+	if (!props)
+		return -ENOMEM;
 
-	bcm47xx_button_pdata.buttons = kmemdup(buttons, size, GFP_KERNEL);
-	if (!bcm47xx_button_pdata.buttons)
+	/* 1 node for gpio-keys device, 1 node for each button */
+	struct software_node *nodes __free(kfree) =
+		kcalloc(1 + nbuttons, sizeof(*nodes), GFP_KERNEL);
+	if (!nodes)
 		return -ENOMEM;
-	bcm47xx_button_pdata.nbuttons = nbuttons;
 
+	/* gpio-keys node */
+	nodes[0].name = "bcm47xx-gpio-buttons";
+
+	p = props;
+	for (i = 0; i < nbuttons; i++) {
+		const struct bcm47xx_gpio_key *button = &buttons[i];
+		struct software_node *node = &nodes[1 + i];
+
+		node->parent = &nodes[0];
+		node->properties = p;
+
+		*p++ = PROPERTY_ENTRY_U32("linux,code", button->code);
+		*p++ = PROPERTY_ENTRY_GPIO("gpios", gpio_swnode, button->pin, button->flags);
+		p++;
+	}
+
+	for (i = 0; i < nbuttons + 1; i++)
+		node_group[i] = &nodes[i];
+
+	error = software_node_register_node_group(node_group);
+	if (error)
+		return error;
+
+	pdev = platform_device_register_full(&(struct platform_device_info){
+		.name = "gpio-keys",
+		.swnode = &nodes[0],
+	});
+	error = PTR_ERR_OR_ZERO(pdev);
+	if (error) {
+		software_node_unregister_node_group(node_group);
+		return error;
+	}
+
+	retain_and_null_ptr(props);
+	retain_and_null_ptr(nodes);
 	return 0;
 }
 
-#define bcm47xx_copy_bdata(dev_buttons)					\
-	bcm47xx_buttons_copy(dev_buttons, ARRAY_SIZE(dev_buttons));
+#define bcm47xx_add_bdata(dev_buttons)					\
+	bcm47xx_buttons_add(dev_buttons, ARRAY_SIZE(dev_buttons))
 
 int __init bcm47xx_buttons_register(void)
 {
@@ -521,52 +587,52 @@ int __init bcm47xx_buttons_register(void)
 
 	switch (board) {
 	case BCM47XX_BOARD_ASUS_RTN10U:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_rtn10u);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_rtn10u);
 		break;
 	case BCM47XX_BOARD_ASUS_RTN12:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_rtn12);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_rtn12);
 		break;
 	case BCM47XX_BOARD_ASUS_RTN16:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_rtn16);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_rtn16);
 		break;
 	case BCM47XX_BOARD_ASUS_RTN66U:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_rtn66u);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_rtn66u);
 		break;
 	case BCM47XX_BOARD_ASUS_WL300G:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl300g);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl300g);
 		break;
 	case BCM47XX_BOARD_ASUS_WL320GE:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl320ge);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl320ge);
 		break;
 	case BCM47XX_BOARD_ASUS_WL330GE:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl330ge);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl330ge);
 		break;
 	case BCM47XX_BOARD_ASUS_WL500G:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl500g);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl500g);
 		break;
 	case BCM47XX_BOARD_ASUS_WL500GD:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl500gd);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl500gd);
 		break;
 	case BCM47XX_BOARD_ASUS_WL500GPV1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl500gpv1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl500gpv1);
 		break;
 	case BCM47XX_BOARD_ASUS_WL500GPV2:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl500gpv2);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl500gpv2);
 		break;
 	case BCM47XX_BOARD_ASUS_WL500W:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl500w);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl500w);
 		break;
 	case BCM47XX_BOARD_ASUS_WL520GC:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl520gc);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl520gc);
 		break;
 	case BCM47XX_BOARD_ASUS_WL520GU:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl520gu);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl520gu);
 		break;
 	case BCM47XX_BOARD_ASUS_WL700GE:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wl700ge);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wl700ge);
 		break;
 	case BCM47XX_BOARD_ASUS_WLHDD:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_asus_wlhdd);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_asus_wlhdd);
 		break;
 
 	case BCM47XX_BOARD_BELKIN_F7D3301:
@@ -574,193 +640,193 @@ int __init bcm47xx_buttons_register(void)
 	case BCM47XX_BOARD_BELKIN_F7D4301:
 	case BCM47XX_BOARD_BELKIN_F7D4302:
 	case BCM47XX_BOARD_BELKIN_F7D4401:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_belkin_f7d4301);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_belkin_f7d4301);
 		break;
 
 	case BCM47XX_BOARD_BUFFALO_WHR2_A54G54:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_whr2_a54g54);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_whr2_a54g54);
 		break;
 	case BCM47XX_BOARD_BUFFALO_WHR_G125:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_whr_g125);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_whr_g125);
 		break;
 	case BCM47XX_BOARD_BUFFALO_WHR_G54S:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_whr_g54s);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_whr_g54s);
 		break;
 	case BCM47XX_BOARD_BUFFALO_WHR_HP_G54:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_whr_hp_g54);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_whr_hp_g54);
 		break;
 	case BCM47XX_BOARD_BUFFALO_WZR_G300N:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_wzr_g300n);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_wzr_g300n);
 		break;
 	case BCM47XX_BOARD_BUFFALO_WZR_RS_G54:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_wzr_rs_g54);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_wzr_rs_g54);
 		break;
 	case BCM47XX_BOARD_BUFFALO_WZR_RS_G54HP:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_buffalo_wzr_rs_g54hp);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_buffalo_wzr_rs_g54hp);
 		break;
 
 	case BCM47XX_BOARD_DELL_TM2300:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_dell_tm2300);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_dell_tm2300);
 		break;
 
 	case BCM47XX_BOARD_DLINK_DIR130:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_dlink_dir130);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_dlink_dir130);
 		break;
 	case BCM47XX_BOARD_DLINK_DIR330:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_dlink_dir330);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_dlink_dir330);
 		break;
 
 	case BCM47XX_BOARD_HUAWEI_E970:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_huawei_e970);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_huawei_e970);
 		break;
 
 	case BCM47XX_BOARD_LINKSYS_E1000V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e1000v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e1000v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_E1000V21:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e1000v21);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e1000v21);
 		break;
 	case BCM47XX_BOARD_LINKSYS_E2000V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e2000v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e2000v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_E2500V3:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e2500v3);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e2500v3);
 		break;
 	case BCM47XX_BOARD_LINKSYS_E3000V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e3000v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e3000v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_E3200V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e3200v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e3200v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_E4200V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e4200v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_e4200v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT150NV1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt150nv1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt150nv1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT150NV11:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt150nv11);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt150nv11);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT160NV1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt160nv1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt160nv1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT160NV3:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt160nv3);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt160nv3);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT300N_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt300n_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt300n_v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT300NV11:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt300nv11);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt300nv11);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT310NV1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt310nv1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt310nv1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT310NV2:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt310n_v2);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt310n_v2);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT320N_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt320n_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt320n_v1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT54G3GV2:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt54g3gv2);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt54g3gv2);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT54G_TYPE_0101:
 	case BCM47XX_BOARD_LINKSYS_WRT54G_TYPE_0467:
 	case BCM47XX_BOARD_LINKSYS_WRT54G_TYPE_0708:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt54g_generic);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt54g_generic);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT610NV1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt610nv1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt610nv1);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRT610NV2:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrt610nv2);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrt610nv2);
 		break;
 	case BCM47XX_BOARD_LINKSYS_WRTSL54GS:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_wrtsl54gs);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_linksys_wrtsl54gs);
 		break;
 
 	case BCM47XX_BOARD_LUXUL_ABR_4400_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_abr_4400_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_abr_4400_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XAP_310_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xap_310_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xap_310_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XAP_1210_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xap_1210_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xap_1210_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XAP_1230_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xap_1230_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xap_1230_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XAP_1240_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xap_1240_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xap_1240_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XAP_1500_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xap_1500_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xap_1500_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XBR_4400_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xbr_4400_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xbr_4400_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XVW_P30_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xvw_p30_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xvw_p30_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XWR_600_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xwr_600_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xwr_600_v1);
 		break;
 	case BCM47XX_BOARD_LUXUL_XWR_1750_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_luxul_xwr_1750_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_luxul_xwr_1750_v1);
 		break;
 
 	case BCM47XX_BOARD_MICROSOFT_MN700:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_microsoft_nm700);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_microsoft_nm700);
 		break;
 
 	case BCM47XX_BOARD_MOTOROLA_WE800G:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_motorola_we800g);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_motorola_we800g);
 		break;
 	case BCM47XX_BOARD_MOTOROLA_WR850GP:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_motorola_wr850gp);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_motorola_wr850gp);
 		break;
 	case BCM47XX_BOARD_MOTOROLA_WR850GV2V3:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_motorola_wr850gv2v3);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_motorola_wr850gv2v3);
 		break;
 
 	case BCM47XX_BOARD_NETGEAR_R6200_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_r6200_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_r6200_v1);
 		break;
 	case BCM47XX_BOARD_NETGEAR_R6300_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_r6300_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_r6300_v1);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WN2500RP_V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wn2500rp_v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wn2500rp_v1);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNDR3400V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wndr3400v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wndr3400v1);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNDR3400_V3:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wndr3400_v3);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wndr3400_v3);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNDR3700V3:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wndr3700v3);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wndr3700v3);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNDR4500V1:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wndr4500v1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wndr4500v1);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNR1000_V3:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wnr1000_v3);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wnr1000_v3);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNR3500L:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wnr3500lv1);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wnr3500lv1);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNR3500L_V2:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wnr3500lv2);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wnr3500lv2);
 		break;
 	case BCM47XX_BOARD_NETGEAR_WNR834BV2:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_netgear_wnr834bv2);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_netgear_wnr834bv2);
 		break;
 
 	case BCM47XX_BOARD_SIMPLETECH_SIMPLESHARE:
-		err = bcm47xx_copy_bdata(bcm47xx_buttons_simpletech_simpleshare);
+		err = bcm47xx_add_bdata(bcm47xx_buttons_simpletech_simpleshare);
 		break;
 
 	default:
@@ -769,13 +835,7 @@ int __init bcm47xx_buttons_register(void)
 	}
 
 	if (err)
-		return -ENOMEM;
-
-	err = platform_device_register(&bcm47xx_buttons_gpio_keys);
-	if (err) {
-		pr_err("Failed to register platform device: %d\n", err);
 		return err;
-	}
 
 	return 0;
 }

-- 
2.55.0.rc0.799.gd6f94ed593-goog


