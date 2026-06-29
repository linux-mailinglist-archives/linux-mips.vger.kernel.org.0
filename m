Return-Path: <linux-mips+bounces-15304-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JlWiDDR3Qmp97wkAu9opvQ
	(envelope-from <linux-mips+bounces-15304-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:46:28 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B19116DB773
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 15:46:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=l+Bjn0TW;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15304-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15304-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1875F314559C
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 13:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE596409609;
	Mon, 29 Jun 2026 13:28:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FEA400E15;
	Mon, 29 Jun 2026 13:28:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739692; cv=none; b=MbABMK7cZ+21HZrw5C0AjAneEhfuCiT5MHwXfaBeN+6d+7fHQhQNUNQKLlktihghtIGbbRJvrRkdnyxaxOR9L1Rork1lXGSFAU1kzh26ygNCEH7ZLBMF7MsEcCKljimyMkinybkpj7R7eNjB37AgVacTJlTyAmtboLAiFq3fMrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739692; c=relaxed/simple;
	bh=GNKP1XlJXRKFJBUq6P1pWbPm0LmF/k3EOFPIlsHhd0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h4cYT5HSllBTmooJA3O7zsScekmqDUXRrqoebvoYOOp/3XY2IR4XqTDzJwvv7suPKy0l967x6o7u9cLro7+DztKBe7fWcIJth4C8FbLY5w2KBewTFc/sLVv+Caxj4+UZiL9kk7dP+6qTUAe9R49LwgcIBEPMabwYq/foPqp/FAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+Bjn0TW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090611F000E9;
	Mon, 29 Jun 2026 13:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782739691;
	bh=AbxQxhI8jkWFpggqqu0BJxCVlmjNB8rVpnB3U/bG9/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=l+Bjn0TWuJNScCkv2eF3hy4+9W/x+N/FOa0Y6J7K1PFzRKxbGv4SQUtde7aDOLy8B
	 jZkrFSnHT6Vb61R5R/ETfTSspiaEh+nheFllga8qyHXfV3yUxDZSenK4zIhVp2ALI+
	 nzRCJXHiieCva9BC4U/A20qdEbhgbI/dhbWcdg/Jt7oAcq2GDapzVbIFKbACjvCd9P
	 uYVxIeyS3AcefXCPNeybaedPhtAmuQ8NxzQKp3Kq4z2cU2T7FaobBGokfDAJ0YP4jO
	 D6rFiTomsxEP9rkITDZ/6mMxQ/dBT7Rjpc7U1oDKGDNycGwvTBYGhfgJLQfBm3ssL7
	 lcm3OEdYqXtkw==
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
Subject: [PATCH 12/13] gpib: gpio: replace linux/gpio.h inclusion
Date: Mon, 29 Jun 2026 15:26:32 +0200
Message-Id: <20260629132633.1300009-13-arnd@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15304-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B19116DB773

From: Arnd Bergmann <arnd@arndb.de>

linux/gpio.h is going away, so use linux/gpio/consumer.h instead.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
index 0e227980b493..2e8d895db06a 100644
--- a/drivers/gpib/gpio/gpib_bitbang.c
+++ b/drivers/gpib/gpio/gpib_bitbang.c
@@ -64,7 +64,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 
 static int sn7516x_used = 1, sn7516x;
-- 
2.39.5


