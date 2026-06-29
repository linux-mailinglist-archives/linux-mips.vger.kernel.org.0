Return-Path: <linux-mips+bounces-15310-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RuH4HFR+Qmo08gkAu9opvQ
	(envelope-from <linux-mips+bounces-15310-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:16:52 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1426DBE82
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 16:16:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15310-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15310-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18F61306783C
	for <lists+linux-mips@lfdr.de>; Mon, 29 Jun 2026 14:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199C03793B4;
	Mon, 29 Jun 2026 14:09:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ED4377EA9;
	Mon, 29 Jun 2026 14:09:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742149; cv=none; b=ZkwUyBhW5i/JO/LLbzyF73rm0KWbD8kzJ4buUfzfN+GOkuGaeH3um18l6xGBj5Eaj0YsAQPnp46lkKadF+7c3EJjR8OHr9Qm2OcOpNzQ4EkFX+EyGUP1fo7n5Qc6tf4OP4msVppJr+qoFUataiiP9Vam+/85rapgfy3CQZvhC18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742149; c=relaxed/simple;
	bh=g9dFPNs9RCiJ30PbQ83xQiLIkKE/aoKc7Ch+A3Ps5Fg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ha9GhqP0Hgtd3pKbOvoi+quZWFtEDEc2ohwpM+m0EjfVM2wX/2wbZqb3aRk9ixfkuQz83jzB7WjN02Dys6TON4NGH9mqjmLokOYX5Ri/BDNesjO3v6ECXv9DvCUmZPzU44V5NIUekgTUZ6r8G7UlxYg/s+XHXueN2Pdjrq3RIME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=212.18.0.9
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gpnxf56FLz1r5hc;
	Mon, 29 Jun 2026 16:01:10 +0200 (CEST)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4gpnxc5SYXz1r5hL;
	Mon, 29 Jun 2026 16:01:08 +0200 (CEST)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.87])
	by mail.m-online.net (Postfix) with ESMTP id 4gpnxb4V3wz1qqlS;
	Mon, 29 Jun 2026 16:01:07 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.6.182])
 by localhost (dynscan3.mail.m-online.net [192.168.6.87]) (amavis, port 10024)
 with ESMTP id 0SnzNWDJyvXI; Mon, 29 Jun 2026 16:01:01 +0200 (CEST)
X-Auth-Info: MEDGnkGkok4HHiiAHx6Yp9YpyEe4vG/D2GYhM3WXSTA4/H/l6K4jcFYiosjPmxQG
Received: from hawking (unknown [80.255.5.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 29 Jun 2026 16:01:01 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org,  Arnd Bergmann <arnd@arndb.de>,  Bartosz
 Golaszewski <brgl@kernel.org>,  Andrew Lunn <andrew@lunn.ch>,  Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Frank Li <Frank.Li@nxp.com>,  Robert
 Jarzmik <robert.jarzmik@free.fr>,  Krzysztof Kozlowski <krzk@kernel.org>,
  Greg Ungerer <gerg@linux-m68k.org>,  Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Hauke Mehrtens <hauke@hauke-m.de>,
  =?utf-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,  Yoshinori Sato
 <ysato@users.sourceforge.jp>,
  John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Linus Walleij
 <linusw@kernel.org>,  Dmitry Torokhov <dmitry.torokhov@gmail.com>,  Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,  Dominik
 Brodowski <linux@dominikbrodowski.net>,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
  patches@opensource.cirrus.com,  linux-m68k@lists.linux-m68k.org,
  linux-mips@vger.kernel.org,  linux-sh@vger.kernel.org,
  linux-input@vger.kernel.org,  linux-media@vger.kernel.org,
  netdev@vger.kernel.org,  linux-sunxi@lists.linux.dev,
  linux-phy@lists.infradead.org,  linux-rockchip@lists.infradead.org,
  linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org> (Arnd Bergmann's
	message of "Mon, 29 Jun 2026 15:26:20 +0200")
References: <20260629132633.1300009-1-arnd@kernel.org>
Date: Mon, 29 Jun 2026 16:01:00 +0200
Message-ID: <mvmik71win7.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15310-lists,linux-mips=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER(0.00)[schwab@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[schwab@linux-m68k.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,suse.de:mid];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DD1426DBE82

On Jun 29 2026, Arnd Bergmann wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.
>
> In each subsystem, we can replace the header either with
> linux/gpio/consumer.h for users of the modern gpio descriptor interface,

A few of them already used <linux/gpio/consumer.h>, and is duplicated
now.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

