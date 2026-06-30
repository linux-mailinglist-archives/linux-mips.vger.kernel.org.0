Return-Path: <linux-mips+bounces-15371-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0bVK8M3RGrOqgoAu9opvQ
	(envelope-from <linux-mips+bounces-15371-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 23:40:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DB16E82C6
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 23:40:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hvKTMsSL;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15371-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-mips+bounces-15371-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 51CE73056151
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 21:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94503290AD;
	Tue, 30 Jun 2026 21:40:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD7131F9B3
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 21:40:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782855609; cv=none; b=GqjY6t8+zIzJzn6izuTCh5bZU8/9Ex2/8jncNavWLDnwN/zHVmMkUGSBmjPCiHHBjGHrMAyfXcuHiwf/iYqvHZU6K0WIoyu2OpIK+emcz0LI84I12NNGZTzI4yFXkWYQBnb4ULvLs6P53ze6cmlApnI5Nb1SgoTAXKfbK5eZHPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782855609; c=relaxed/simple;
	bh=La2xNvf/TCB9nBGYKaS8YDOIJOCNSEjb9+oJx13QQCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mI3hA1st3n3wX2clCo1Ez09ElUGlI6vMzG3iHA62YggQNfuxeE9cInNpQf51nt72dTefxae8feCccbVRJjw7jzi0D36vVjgkErtDOC+C8IP7iGXvLFdj99kGchM8VVPEQBuenxYyoCLqOCJqUhtCOT3NARffZNDAl4UrcfpPoAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvKTMsSL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4571F000E9
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782855606;
	bh=La2xNvf/TCB9nBGYKaS8YDOIJOCNSEjb9+oJx13QQCM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hvKTMsSLWpQ7iwnKPdGvgwo9HJsX1KaQ0ubrkEyF6jRtv6mdeKaQvRSrk8mJbQzxW
	 ig6k3MT8xKA+lTAcOlkAAOJcWdXKrFmGykfXLZNsJrC4ZUwxYU8idfhr4PDNNRiJQl
	 dL4jtvbz1PpTkasUpdlMtraBeP+0Obg7Sy1MnUWXzAfKz9u+WjtyjvDJMWkxSdE48F
	 JlrnDpUpZ2kdUZnpGkFx0rw7VpM4s3JAFfKvDSckb101eyILjgH9sF32uBzeJUlAqw
	 rc0o03G7Elsp6K6Z1gVl7D5Bnr8tmbDdWDEdfx3fznr2bRRsBeoZllbucPhSQwYNf0
	 zkw1ib+Apn52w==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aebf9a509eso1174106e87.3
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 14:40:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rougz3RC6yXAo9dK5TudwZJNDHOmAQ6klYpJVtoXU0fapFKX3+UtHFCTHNYiP7i4MCpCxqVmgp7xL07@vger.kernel.org
X-Gm-Message-State: AOJu0YyEzwNUf20bHx11K/fJMU/79fD1vaBG7tTeD56eO9oBK4EvVdhO
	r/44KjD7VsBcHT+vlPkF6rsO92AmyFgJDGl4iUdDjYmxKxE/mKcO9sKS8NFUEmCkV4809yzhYwC
	fcxKCNgDbER0ubqWnj21Sb7sN4c5/q7M=
X-Received: by 2002:a05:6512:3d19:b0:5ae:b604:4c9 with SMTP id
 2adb3069b0e04-5aebdbc9489mr1240118e87.65.1782855605213; Tue, 30 Jun 2026
 14:40:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629132633.1300009-1-arnd@kernel.org>
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 23:39:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpTa4hxNRscbiFFKZTM28ThuJMo1f3SX96LheC8L5BEQ@mail.gmail.com>
X-Gm-Features: AVVi8CfBoAND9VanduyO4lm3tElbURSYx2nmpdkO8PSRH7aiVql7RmWg2jM4Qb0
Message-ID: <CAD++jLkpTa4hxNRscbiFFKZTM28ThuJMo1f3SX96LheC8L5BEQ@mail.gmail.com>
Subject: Re: [PATCH 00/13] treewide: replace linux/gpio.h
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Greg Ungerer <gerg@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15371-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytorokhov@gmail.com,s:li
 sts@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51DB16E82C6

On Mon, Jun 29, 2026 at 3:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The linux/gpio.h header used to be the global definition for the gpio
> interfaces, with 1100 users back in linux-3.17. In linux-7.2, only about
> 130 of those remain, so this series cleans out the rest.
>
> In each subsystem, we can replace the header either with
> linux/gpio/consumer.h for users of the modern gpio descriptor interface,
> or linux/gpio/legacy.h for the few remaining users of the old number
> based interface.
>
> All patches in this series can get applied independently, so my
> preference would be for each subsystem maintainer to apply these
> directly, with the rest going into the gpio tree at some point.
>
> The final patch here obviously needs to wait for all the others
> to get merged first.

This is helpful.
The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

