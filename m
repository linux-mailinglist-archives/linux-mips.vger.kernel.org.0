Return-Path: <linux-mips+bounces-15495-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VMuiGsPqSWru8QAAu9opvQ
	(envelope-from <linux-mips+bounces-15495-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 05 Jul 2026 07:25:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE415709019
	for <lists+linux-mips@lfdr.de>; Sun, 05 Jul 2026 07:25:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AErn8zdr;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15495-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15495-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51E603008242
	for <lists+linux-mips@lfdr.de>; Sun,  5 Jul 2026 05:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6980C30D417;
	Sun,  5 Jul 2026 05:25:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1822D7DC6
	for <linux-mips@vger.kernel.org>; Sun,  5 Jul 2026 05:25:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783229120; cv=none; b=BQvdT5OO9yNdh+gevRd09ku0JuRpNdEmErcTOjiIlrH7361+bXJvomiY6vWJTnlZxVAYqe8mr7xqZDkNHsJlUWgj8IOWREeWxcKNgalNdExhklizxmYRxyuaY+SJY2AhFI3BfLFDOqKzoCVNC+a2655oOUT8DsY1LgU9/+Po1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783229120; c=relaxed/simple;
	bh=EkIaPqNh+A7KtxcuXYYBuR1mo8moLpnL3liz1A3UAYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iafYQfQ2lLyMFfP7RpPRd8AEMczmXq/R/oBdMK3Hw2I6wVUne887MwU/qXo71QOU+CJqM7IpPDR7cWzWwYdsE/t9m8ts4XJCnfgPInofaMmF2oU4BENi0Mn5IT5c5uvclRjda8rEMJsQp0eqG8ufccjq1HhC5F0tlfOr/tGadBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AErn8zdr; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1713064a91.3
        for <linux-mips@vger.kernel.org>; Sat, 04 Jul 2026 22:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783229118; x=1783833918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gR8JERLj/Sh2r4LCEipkmXCH5Vz1B+F1+s9p7kgrato=;
        b=AErn8zdrAhYWAEi8cA/TKxWiOKFsJjxPOD8g3EBzuXpv8ZXRUe1Cr2wtdNqQ3Zsd+h
         NSgzE9HWkDtwfsUp1+xhKaoKwmZjJxcFmXr1/fXFRrzccoHO7UKrIHNFJfY6e8j1v8Nu
         rjd6UgeoVnyJDsetsgjFjlQ1XWUbTJSgZhyMj9Apid8+HEwY6FsCsMlXkz7Ure8hCHnf
         D5E6ahe2EpM+yrQP9a92NB62cW2XMMPNI+G1nOu7OpqoZU7KP8/K+zoAhsofI5wQt/TI
         umxPH74HT4ml++WOmyd5YLuEavKVx8FCyXR4BbNy1qVFmfigccVphqbn/EoZcDr6P7pV
         osZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783229118; x=1783833918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gR8JERLj/Sh2r4LCEipkmXCH5Vz1B+F1+s9p7kgrato=;
        b=hCKEUIdTpmneXBhXoHxC6DBPbhVO/RYdngMLirRyGtmg4eOhMcNK8HXotm8QJXHr0b
         TwyJZJ0IYcC9yh2mmVOUedwEZsop6PHOadYdzjQ003NJl/rAx8TJhOAjaGEOECUf9dL2
         ByXjoVZuqa3fBIYGQo982d+VCOiHYSw6fB/CrYx7oEyAcvyVxpajHCTxSCy6ZhrNCZ5J
         xLcshiQz7U815Kqs5oA53sor5U+9MVVVkWLnprMujYmK5//YJT4i2KMsD+DmGVdOz/rN
         kgNhps+HattqmpSzQGlsGhxgukv/8PpfySYzEBEvbmM4/mAsY/B1dlcP71c1AjcR17fA
         wOig==
X-Forwarded-Encrypted: i=1; AHgh+Ro01qJ4KuY18AbYlA/8tVJajk4Akq3UKfG5G8wiXptFSZyDeUwrSI1q0TdQIuDCdLadOnUWqKWAN1wO@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAaqRSI7ji+fpJ3R/ko3VY8NE9TvIqKzTnuwbGmdoSHLiLFB1
	5tL2IQLa92tZhLE+qPoFRBbegw9+cbVEQgA2qcm5kdiUr4PMSB3dYCCh
X-Gm-Gg: AfdE7clfeZnkMgyeKuRSLaIwDPI1RaYkaVlcwm0IWHDaNddXnekyZll64gU4d/AA3Wt
	1xwAirXsa+3DMD0ooxkspW3skuORb8IJy7fX8xGh+a7kqvCqGF7dizGAV24Hem5f3tXMX3hIcQW
	W8xPwB28iNcQJBco3m6dzFgDgiOXFdITkMj5IkeiK5fa0HliQfjWYmoz9NC/7sndDGOtiw4n28b
	0Du/JVCV7D9ZSVjU7kimmbLr9GwreM4yYOC4BcIVBhoVOs9rww55J8ugZb1/fJX4j2GLJO0fx7o
	IAm9oDcYu60uXA/eXODNmAvYLYESd/+QkGacekhLye5BQU3c86/+iMDeFCXGVwnPVUu41kc1gzb
	5uHLMVVGHuOJxFeHVNSkFHJR7QohYxQ3E2I/PORjzor0Ap9ts6Z6FQg6ACir4RcSDikk3QNVp0w
	2yYO/oIqPYzazpVRR2DTHYjeGz+AUVj3EsPsmCNBgjkFC7kR6NvKW0QxfTmsJOxrZY0v6yroTRu
	RbH
X-Received: by 2002:a17:90a:e288:b0:37f:9cdf:f0ac with SMTP id 98e67ed59e1d1-3829f9deb9fmr3699458a91.27.1783229117942;
        Sat, 04 Jul 2026 22:25:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:4560:aa1b:b33a:15b8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a1bsm39035329eec.3.2026.07.04.22.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 22:25:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sat, 04 Jul 2026 22:25:09 -0700
Subject: [PATCH 2/3] ssb: gpio: Add and register software node for GPIO
 controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-b4-bcm47xx-swnode-v1-2-730d59340237@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15495-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:zajec5@gmail.com,m:m@bues.ch,m:hauke@hauke-m.de,m:tsbogend@alpha.franken.de,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-wireless@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mips@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dmitrytorokhov@gmail.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,bues.ch,hauke-m.de,alpha.franken.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE415709019

We want to convert the legacy gpio-keys platform device on BCM47XX
boards to use software nodes. To do this properly and allow
referencing the GPIO controller by address rather than relying on
name-based matching (which is being removed from the gpiolib core),
we need to associate the GPIO controller with a software node.

Introduce ssb_gpio_swnode, register it, and associate it with the
gpio_chip.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/ssb/driver_gpio.c | 27 ++++++++++++++++++++++++---
 include/linux/ssb/ssb.h   |  3 +++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/ssb/driver_gpio.c b/drivers/ssb/driver_gpio.c
index 905657c925bc..8aebc4145454 100644
--- a/drivers/ssb/driver_gpio.c
+++ b/drivers/ssb/driver_gpio.c
@@ -15,8 +15,14 @@
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
 #include <linux/export.h>
+#include <linux/property.h>
 #include <linux/ssb/ssb.h>
 
+const struct software_node ssb_gpio_swnode = {
+	.name = "ssb-gpio",
+};
+EXPORT_SYMBOL_GPL(ssb_gpio_swnode);
+
 
 /**************************************************
  * Shared
@@ -232,6 +238,7 @@ static int ssb_gpio_chipco_init(struct ssb_bus *bus)
 	chip->to_irq		= ssb_gpio_to_irq;
 #endif
 	chip->ngpio		= 16;
+	chip->fwnode		= software_node_fwnode(&ssb_gpio_swnode);
 	/* There is just one SoC in one device and its GPIO addresses should be
 	 * deterministic to address them more easily. The other buses could get
 	 * a random base number.
@@ -429,6 +436,7 @@ static int ssb_gpio_extif_init(struct ssb_bus *bus)
 	chip->to_irq		= ssb_gpio_to_irq;
 #endif
 	chip->ngpio		= 5;
+	chip->fwnode		= software_node_fwnode(&ssb_gpio_swnode);
 	/* There is just one SoC in one device and its GPIO addresses should be
 	 * deterministic to address them more easily. The other buses could get
 	 * a random base number.
@@ -464,11 +472,23 @@ static int ssb_gpio_extif_init(struct ssb_bus *bus)
 
 int ssb_gpio_init(struct ssb_bus *bus)
 {
+	int err;
+
+	err = software_node_register(&ssb_gpio_swnode);
+	if (err)
+		return err;
+
 	if (ssb_chipco_available(&bus->chipco))
-		return ssb_gpio_chipco_init(bus);
+		err = ssb_gpio_chipco_init(bus);
 	else if (ssb_extif_available(&bus->extif))
-		return ssb_gpio_extif_init(bus);
-	return -1;
+		err = ssb_gpio_extif_init(bus);
+	else
+		err = -1;
+
+	if (err)
+		software_node_unregister(&ssb_gpio_swnode);
+
+	return err;
 }
 
 int ssb_gpio_unregister(struct ssb_bus *bus)
@@ -476,6 +496,7 @@ int ssb_gpio_unregister(struct ssb_bus *bus)
 	if (ssb_chipco_available(&bus->chipco) ||
 	    ssb_extif_available(&bus->extif)) {
 		gpiochip_remove(&bus->gpio);
+		software_node_unregister(&ssb_gpio_swnode);
 		return 0;
 	}
 	return -1;
diff --git a/include/linux/ssb/ssb.h b/include/linux/ssb/ssb.h
index 7fee9afa9458..b2b265674a4a 100644
--- a/include/linux/ssb/ssb.h
+++ b/include/linux/ssb/ssb.h
@@ -671,4 +671,7 @@ int ssb_pcibios_plat_dev_init(struct pci_dev *dev);
 int ssb_pcibios_map_irq(const struct pci_dev *dev, u8 slot, u8 pin);
 #endif /* CONFIG_SSB_EMBEDDED */
 
+struct software_node;
+extern const struct software_node ssb_gpio_swnode;
+
 #endif /* LINUX_SSB_H_ */

-- 
2.55.0.rc0.799.gd6f94ed593-goog


