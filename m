Return-Path: <linux-mips+bounces-15759-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +WqKCFViUWp+DgMAu9opvQ
	(envelope-from <linux-mips+bounces-15759-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:21:25 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD673EC26
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 23:21:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=m53mzAig;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15759-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15759-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56546302EC4F
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2026 21:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D44C3B961B;
	Fri, 10 Jul 2026 21:20:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6F03B8BD8;
	Fri, 10 Jul 2026 21:20:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718454; cv=none; b=CgEF3CEyRvSleHNiDliXIo2gHuDaFEsn+9psjTH53sDeaXQcYiQPd0MLZF4rOkLT6vFe2VOzR+IufnG2xqnbeROZTJHz5xGcKfHPoeokKvpYwA+sRd9sSadtOAVHbuyRAejBMcp3gqlcBTcWAccc9atKQNUeDBhQuvcyvJ71e4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718454; c=relaxed/simple;
	bh=1m7OrzVMoFH9IA0eQiiXSUd0ifouW11vFxHVMdd2+Go=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gbSE+KkmtQMajU7McV9enELl20J/XKiKTRtoaoCYNiXWEVODyJ8MxYk/mf2aLF+KAlE9kBgnyCG2fK1uqaaeu7T24tq5nlvz9cObj5g/7djcraSLHFaXvSonZAkXnGGMH/u0MNHznbUlG8XLrzyVPFUuRfJ+d7hJd0CPe5dEO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m53mzAig; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080DC1F000E9;
	Fri, 10 Jul 2026 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783718452;
	bh=WiMIaDHfHeDsg88B3aZLP5knyXdv30ZMibI6w8aJ4Hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m53mzAigYaO7ux+1bIOsaBGC8FpVnAoEKRZ7fa1oFXWLTRJqbHc9lZ7sOosOgski2
	 0gg8s4qWmhM1jR3HG8R1C8HyDoPokk/RkZ81iMZQnZBQrb+hyCKhgLJHXqpnLk4nDU
	 G8xyD5MVOSYGOKRTGFSXwKc9KVQjJaXjm/UhRoXkafmibn2cSLeagOY3gcrPZRcvev
	 Kg6AiP49Q+5gO0lGcU21Jp92VA5f/SHowubVX0797WfEB7ofMJk7C0iQvLB5lPyLJY
	 iX0bNtcGIBz+PS6nvtfzP7HEuYOW+6FBNuVTX/sZpAWzX/Ml88cK6TVNctrk5aDeo3
	 o07276wuF19gw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
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
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 07/10] pcmcia: replace linux/gpio.h inclusions
Date: Fri, 10 Jul 2026 23:19:52 +0200
Message-Id: <20260710211954.1373336-8-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260710211954.1373336-1-arnd@kernel.org>
References: <20260710211954.1373336-1-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15759-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-gpio@vger.kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[31];
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
	FREEMAIL_CC(0.00)[arndb.de,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,kernel.org,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,dominikbrodowski.net,vger.kernel.org,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev,oss.qualcomm.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5AD673EC26

From: Arnd Bergmann <arnd@arndb.de>

The pcmcia drivers all use the legacy interfaces, so convert to
include linux/gpio/legacy.h instead.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pcmcia/bcm63xx_pcmcia.c | 2 +-
 drivers/pcmcia/db1xxx_ss.c      | 2 +-
 drivers/pcmcia/sa1100_h3600.c   | 2 +-
 drivers/pcmcia/soc_common.c     | 2 +-
 drivers/pcmcia/xxs1500_ss.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pcmcia/bcm63xx_pcmcia.c b/drivers/pcmcia/bcm63xx_pcmcia.c
index 724fd6ee0fd0..1612b5d76975 100644
--- a/drivers/pcmcia/bcm63xx_pcmcia.c
+++ b/drivers/pcmcia/bcm63xx_pcmcia.c
@@ -14,7 +14,7 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/pci.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include <bcm63xx_regs.h>
 #include <bcm63xx_io.h>
diff --git a/drivers/pcmcia/db1xxx_ss.c b/drivers/pcmcia/db1xxx_ss.c
index 7b896d7dbc9f..410d24762f13 100644
--- a/drivers/pcmcia/db1xxx_ss.c
+++ b/drivers/pcmcia/db1xxx_ss.c
@@ -23,7 +23,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/interrupt.h>
 #include <linux/pm.h>
 #include <linux/module.h>
diff --git a/drivers/pcmcia/sa1100_h3600.c b/drivers/pcmcia/sa1100_h3600.c
index 10cb99c20a7f..6c52d90795eb 100644
--- a/drivers/pcmcia/sa1100_h3600.c
+++ b/drivers/pcmcia/sa1100_h3600.c
@@ -11,7 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 
 #include <mach/hardware.h>
 #include <asm/irq.h>
diff --git a/drivers/pcmcia/soc_common.c b/drivers/pcmcia/soc_common.c
index 87aa3f667117..23585e3968e9 100644
--- a/drivers/pcmcia/soc_common.c
+++ b/drivers/pcmcia/soc_common.c
@@ -32,8 +32,8 @@
 
 
 #include <linux/cpufreq.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/legacy.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/pcmcia/xxs1500_ss.c b/drivers/pcmcia/xxs1500_ss.c
index 8a8aae1843b5..ba1bd0f9d9f8 100644
--- a/drivers/pcmcia/xxs1500_ss.c
+++ b/drivers/pcmcia/xxs1500_ss.c
@@ -7,7 +7,7 @@
  */
 
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/legacy.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
-- 
2.39.5


