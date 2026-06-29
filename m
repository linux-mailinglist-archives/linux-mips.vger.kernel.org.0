Return-Path: <linux-mips+bounces-15311-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G+nQJ3SEQmrD8wkAu9opvQ
	(envelope-from <linux-mips+bounces-15311-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:43:00 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFF96DC2D2
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arndb.de header.s=fm1 header.b=QpqdxALB;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="e D8S00w";
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15311-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15311-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arndb.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 05C5A3016D19
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 14:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736563B6BF2;
	Mon, 29 Jun 2026 14:24:54 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BF346771;
	Mon, 29 Jun 2026 14:24:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743094; cv=none; b=QRj6tIa3KwzxoXXM3n4CslIXw155vQvkk0T1+hZgLuoHYMU+iDTiuv0yUkkByMkdRt19Gl8jfVB1x0aYYE9R8Sdoy7V+8mtFtHB+C6hSXOMLgEKvMFu3h83/DcGe9Y7aulH66UPhRtPMkUuPwlIUB/WRJNVvEifKAEul+989Cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743094; c=relaxed/simple;
	bh=jKYy6z/LZavsIGCtCAO9WeqrOdZS55WfnuhWxAytq6A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rgkjrXa7zLKFSL5Anvr/7HTJUP3ep6/ZfW9FfGVbL971w9O8RzsANsZFhDykUr+zTTeWOWo4sX9zO+/UCj3RAhaBn4PlKbskZR2tBo72qF5WimzovhlRf/5Uape8Ak5l5d5PHrWFbHJWFV5dsOnv5mp6MER8zaEdKOPuW7/hDFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=QpqdxALB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eD8S00wy; arc=none smtp.client-ip=202.12.124.146
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 5DA241D0004C;
	Mon, 29 Jun 2026 10:24:50 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 29 Jun 2026 10:24:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782743090;
	 x=1782829490; bh=ST6f+Ye0p9/T3JscEZ5f79X56UQF/QbBzy9biCJtv04=; b=
	QpqdxALBlVVbSg1RXbbjqLWGXcZOg6UqpE3Vp6LevI4Da066273Jj7jYVeGLX46X
	LinpDyHOTAAY1ongsWzSZL+cCdadSKdT0xgB5OPkSaEwxh5/PislXxwdCzTIn1oC
	REt8J2lpL+fvicpf35ivwedoOFMDa8U26a+Af0XNlCdSTmG3z5R12GILfzE6SmTw
	FSZhN3jd43gzf68bIdGOSAU4nIKKt3MyN2QskGPZia8vNMzlX9e7VXzhu4kxYVYg
	UDp5rYOlGWSODvbwl5w7pVhSokE3VL50QWNcbqiwsUhiYZ7tyEoxKDIwx448Lzze
	gpc1InqfpdaZWMjyp3kd3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782743090; x=
	1782829490; bh=ST6f+Ye0p9/T3JscEZ5f79X56UQF/QbBzy9biCJtv04=; b=e
	D8S00wyxDWIHB4Vh6oD0X5VzqSqT3z4JotdW/BevQ/hvoQRvSJ4gTpnwUbUNiVvN
	G8siwGcgZmVG/TiUnnHXTn1tsmN/subJSQHJswtPIGvID4LqW/bOCUf3i8XXJylD
	WXFxcFkgAA51bD9rS9zR/PPIXlhSNlheEG9hBMoaX7lGzr2EPU8twS2qKcETnnQm
	Qs5hEZixKNmtvZib/V3CaUcHSInjjz5LDs6JZn2Dya+ogiS20nIaSB/Wve0+l3vU
	4lYeZ8peAB5opxA5w2Az8mr0V2i2rBQh06bw6SfOrM/yaqhg/PcE4nsPAcFWerV8
	TtuULrK3Mxq74ikYvQblg==
X-ME-Sender: <xms:MIBCaql7Lgd3sryMBTzkKROi9XQHyr-mPzl__i6jqTbD1qnnWKapeA>
    <xme:MIBCaspQPzsdeixLixlgpZMYG5LAHo2BNmL19hPCnpr36VcfZX9X-UrFYGxcz-wzQ
    FHMcFjDOH5GNavn-sKvTKphcbpDb8uMr6ot8UHnPkfiaw3UDeqj7rPH>
X-ME-Proxy-Cause: dmFkZTFwMprh5ZTFo5dfY8jM7ZxjUWaH+6tuhRdcmlFtEOFs7CUeegyqf4KKEhiSUkhGfs
    shXdXn9QyoPevOyt3wuw7W3b5VIqMtvVsBDfkCDz6NnAXXSMKMS5RqJu9AKvF7V/7Z/6Bi
    o0wdMW9CiqJY/GgvBhOb0boUTG3wawZBpqPqCJpYSmm0ZUUPAxL/htVEpmvED9VgSAp9uO
    zvahS1FdRiM/3V4XEQKoztXK7nRXCyS0PV0utsqTVPI12PA5tNhyvrCWLN5gRjPD2bHxU6
    yOkzZKnYaHdZcjhI1InBzIpD6AI5/7LesBqxsjdlhlSFuvuQ25fjoVntskThnjOfxN+lZE
    lFlNPLX+2itzUULLge6bWTtAB4gI3sI98mx95AMy7L7s3J2Lv71eLqppsCyvkKkEp2BD1K
    X6EPcmiBSA1+8CjSwZ9bnZEcfmRccnhjlt2iNkvsKWyLj1/wdv94pbMwFcIJuz9wDCbxo9
    iBNu3jQYL8WYsjMfsNE2vt4jeYv+M/ZCxcL9u0F0peViPJlj6wA+lX7v8n1XmcHqI61L+w
    oLntPH/4/NI3qcbGTonJrQKLjbjbudgB6r41pCwHJNyhc1FcWRmp+vAdOlmUYuMVG7tHGh
    6rD7rTPwVD+A8OzG+9MFeYdJfte1jipxt2d5zch6FCoqCZ/4EPVTxch9C7GQ
X-ME-Proxy: <xmx:MIBCatSPI8gdpFe_jZGU980MEecKsgaD01fqwY3y0NFvfmGlqDlOxA>
    <xmx:MIBCao34oOmlMnXycJ5rfPkhkaUAebnqg9lvHyA5mty5cHOJD-WBYA>
    <xmx:MIBCag-Iqfk-FL1_oE5qTJym1-rZQx9v3Q9OVRepLRT0ApXpjHMnWA>
    <xmx:MIBCap_cFbmtt8ZxWbtOgzQq15eYwtPWSzjtzUotI0VkfSQ6bHQfuw>
    <xmx:MoBCasDybz41gqrB1Ue2uuwv7YF9L8UCJORz1VN9UqDok726_y_e3jKq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1B5D1182007E; Mon, 29 Jun 2026 10:24:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AbUlhqeXux_w
Date: Mon, 29 Jun 2026 16:24:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Hauke Mehrtens" <hauke@hauke-m.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Linus Walleij" <linusw@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Dominik Brodowski" <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
Message-Id: <bb0e4e89-cefb-40e7-9373-f76ce6c0efa5@app.fastmail.com>
In-Reply-To: <mvmik71win7.fsf@suse.de>
References: <20260629132633.1300009-1-arnd@kernel.org>
 <mvmik71win7.fsf@suse.de>
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15311-lists,linux-mips=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:schwab@linux-m68k.org,m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:d
 mitrytorokhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,messagingengine.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CFF96DC2D2

On Mon, Jun 29, 2026, at 16:01, Andreas Schwab wrote:
> On Jun 29 2026, Arnd Bergmann wrote:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The linux/gpio.h header used to be the global definition for the gpio
>> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
>> 130 of those remain, so this series cleans out the rest.
>>
>> In each subsystem, we can replace the header either with
>> linux/gpio/consumer.h for users of the modern gpio descriptor interface,
>
> A few of them already used <linux/gpio/consumer.h>, and is duplicated
> now.

Indeed, I have removed the extra ones now and folded those into
the patches.

     Arnd

diff --git a/drivers/gpib/gpio/gpib_bitbang.c b/drivers/gpib/gpio/gpib_bitbang.c
index 2e8d895db06a..34d14b94a0b8 100644
--- a/drivers/gpib/gpio/gpib_bitbang.c
+++ b/drivers/gpib/gpio/gpib_bitbang.c
@@ -64,7 +64,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
-#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 
 static int sn7516x_used = 1, sn7516x;
diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 98d0269a978f..8863b741d1a3 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -16,7 +16,6 @@
 #include <linux/interrupt.h>
 #include <linux/jiffies.h>
 #include <linux/module.h>
-#include <linux/gpio/consumer.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/of.h>
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index eb11bf2e9436..a6c984205123 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -15,7 +15,6 @@
 #include <linux/dmi.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio_keys.h>
-#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 
 static bool use_low_level_irq;
diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
index 88c5c52e0e38..5f5adc9c9e83 100644
--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -16,7 +16,6 @@
 #include <linux/net_tstamp.h>
 #include <linux/ptp_classify.h>
 #include <linux/ptp_pch.h>
-#include <linux/gpio/consumer.h>
 
 #define PCH_GBE_MAR_ENTRIES		16
 #define PCH_GBE_SHORT_PKT		64
diff --git a/drivers/net/phy/mdio_device.c b/drivers/net/phy/mdio_device.c
index a18263d5bb02..06151f207134 100644
--- a/drivers/net/phy/mdio_device.c
+++ b/drivers/net/phy/mdio_device.c
@@ -9,7 +9,6 @@
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
diff --git a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
index d9c06129ed23..171bf097a8b8 100644
--- a/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
+++ b/drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c
@@ -4,7 +4,6 @@
 #include <linux/delay.h>
 #include <linux/extcon-provider.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
diff --git a/drivers/phy/ti/phy-j721e-wiz.c b/drivers/phy/ti/phy-j721e-wiz.c
index 2233babc0078..1f5dba49ace4 100644
--- a/drivers/phy/ti/phy-j721e-wiz.c
+++ b/drivers/phy/ti/phy-j721e-wiz.c
@@ -12,7 +12,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio/consumer.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
diff --git a/include/linux/mfd/ti-lmu.h b/include/linux/mfd/ti-lmu.h
index 5040c7d1e1b9..2089ec5124e8 100644
--- a/include/linux/mfd/ti-lmu.h
+++ b/include/linux/mfd/ti-lmu.h
@@ -10,7 +10,6 @@
 #ifndef __MFD_TI_LMU_H__
 #define __MFD_TI_LMU_H__
 
-#include <linux/gpio/consumer.h>
 #include <linux/notifier.h>
 #include <linux/regmap.h>
 #include <linux/gpio/consumer.h>
diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index 36c3abc21fed..f2448b4c11fc 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -16,7 +16,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
diff --git a/sound/soc/codecs/dmic.c b/sound/soc/codecs/dmic.c
index 8b05d6f9b429..cbed11136935 100644
--- a/sound/soc/codecs/dmic.c
+++ b/sound/soc/codecs/dmic.c
@@ -7,7 +7,6 @@
 
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>

