Return-Path: <linux-mips+bounces-15305-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cpoaBs91Qmrr7gkAu9opvQ
	(envelope-from <linux-mips+bounces-15305-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:40:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE866DB5D4
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:40:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h5AFqQi4;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15305-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15305-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CD2A30A5C7F
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B26409613;
	Mon, 29 Jun 2026 13:28:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB51636A366;
	Mon, 29 Jun 2026 13:28:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739699; cv=none; b=iyWCDobA2jUBdSKBsRorK79k1ZKPfeL/ThmS7BRO/Dw/sx1gVq2mkZPZy2z2zuxNo9JFR6a4DsKm20Jp+pueHNFsFQxlJCx0auuBHE6OzbI6ZtGQebJvPhp+05HLy9rGhsv+BDgOm/8Dp6q3E/3fnR25kCsob6VAxAeP4XgKhyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739699; c=relaxed/simple;
	bh=j+Xq+qlf0aQy5fadHBX3DKpcoyWe26ABu8Ry5PWEXLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gZOZCEenL6dg3lhJx2agmm9T5YkZrbI2l+dGpQaYVK4dAgpKDa2X7s9SEmLT+4Phx7hn6r21OVId2aJyNRlv6vPpxXUIlXsqPg7npL5DHuBomc2k/cEDhC3RXhF31Kaepsdl6BtKhXgyxspfd4iuK0cXbS9abptwJ3g+qElETdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5AFqQi4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089BD1F00A3A;
	Mon, 29 Jun 2026 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739698;
	bh=iYwaK59VeErRBhP0Q9iTMSGYiDgPnUNQAe6MLCdyQLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h5AFqQi4jStPxyTSP1+6Qa/JvBSIFtVgK0MNZzsiH6wjFRswa/RLrnQqFNHih/qjG
	 EWv3fVYPKDKbBtHjWpFdO8cIy9X4E9hkJpPP6vBXA8/qsQylAAtt6v+NK73U7OXv92
	 YB7mQNWAxRfG6dGtDgsPLk0YTrL8XMwVLZP0DiJLe31ovoUMss8UP/7D/l/j5xY8/E
	 GWyr+Tst/J+V3i8q9C/i4YobqaQblCJhFZjTHY4YfQcFjDhwMaiBx0Ip4Lj1e9DE6L
	 mM017Lryq9TQOfeRAPIp4At1UOUu2ZNtp0Xj6zezM1lXYTXWiO8CpisTNWLtJuCnOG
	 JFsljvXoooevw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 13/13] gpiolib: remove linux/gpio.h
Date: Mon, 29 Jun 2026 15:26:33 +0200
Message-Id: <20260629132633.1300009-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
References: <20260629132633.1300009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15305-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:
 lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7BE866DB5D4

From: Arnd Bergmann <arnd@arndb.de>

After all other drivers have converted to linux/gpio/consumer.h
or linux/gpio/legacy.h, remove the final leftover bits here.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                   |  1 -
 drivers/gpio/TODO             |  4 +---
 drivers/gpio/gpiolib-cdev.c   |  2 +-
 drivers/gpio/gpiolib-legacy.c |  3 +--
 drivers/gpio/gpiolib.c        |  2 +-
 include/linux/gpio.h          | 22 ----------------------
 6 files changed, 4 insertions(+), 30 deletions(-)
 delete mode 100644 include/linux/gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..7f3f386b1d8c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11175,7 +11175,6 @@ F:	Documentation/devicetree/bindings/gpio/
 F:	Documentation/driver-api/gpio/
 F:	drivers/gpio/
 F:	include/dt-bindings/gpio/
-F:	include/linux/gpio.h
 F:	include/linux/gpio/
 K:	(devm_)?gpio_(request|free|direction|get|set)
 K:	GPIOD_FLAGS_BIT_NONEXCLUSIVE
diff --git a/drivers/gpio/TODO b/drivers/gpio/TODO
index 7ce80fde1f17..894c7e1af252 100644
--- a/drivers/gpio/TODO
+++ b/drivers/gpio/TODO
@@ -52,9 +52,7 @@ Work items:
   base can be made dynamic (set to -1) if CONFIG_GPIO_SYSFS is disabled.
 
 - When this work is complete (will require some of the items in the
-  following ongoing work as well) we can delete the old global
-  numberspace accessors from <linux/gpio.h> and eventually delete
-  <linux/gpio.h> altogether.
+  following ongoing work as well) we can delete <linux/gpio/lagacy.h>.
 
 -------------------------------------------------------------------------------
 
diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 82f27db0b230..9b6a28819371 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -11,7 +11,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/file.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/hte.h>
 #include <linux/interrupt.h>
diff --git a/drivers/gpio/gpiolib-legacy.c b/drivers/gpio/gpiolib-legacy.c
index ef3f2ef30cf2..33e5a45e720b 100644
--- a/drivers/gpio/gpiolib-legacy.c
+++ b/drivers/gpio/gpiolib-legacy.c
@@ -7,8 +7,7 @@
 
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
-
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include "gpiolib.h"
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151..1f498d6c8c68 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -29,7 +29,7 @@
 #include <linux/string.h>
 #include <linux/string_choices.h>
 
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
deleted file mode 100644
index b0d4942a65de..000000000000
--- a/include/linux/gpio.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * NOTE: This header *must not* be included.
- *
- * If you're implementing a GPIO driver, only include <linux/gpio/driver.h>
- * If you're implementing a GPIO consumer, only include <linux/gpio/consumer.h>
- * If you're using the legacy interfaces, include <linux/gpio/legacy.h>
- */
-
-#ifndef __LINUX_GPIO_H
-#define __LINUX_GPIO_H
-
-#include <linux/types.h>
-#ifdef CONFIG_GPIOLIB
-#include <linux/gpio/consumer.h>
-#endif
-
-#ifdef CONFIG_GPIOLIB_LEGACY
-#include <linux/gpio/legacy.h>
-#endif /* CONFIG_GPIOLIB_LEGACY */
-
-#endif /* __LINUX_GPIO_H */
-- 
2.39.5


