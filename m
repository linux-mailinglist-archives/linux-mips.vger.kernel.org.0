Return-Path: <linux-mips+bounces-15355-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p4fXBLN3Q2rcYwoAu9opvQ
	(envelope-from <linux-mips+bounces-15355-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 10:00:51 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7338E6E17C0
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 10:00:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=SzEeikn2;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15355-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15355-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A9ED303372F
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2026 07:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01183E5EE1;
	Tue, 30 Jun 2026 07:53:51 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8973E44E0
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 07:53:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782806031; cv=none; b=NygsavM+rr0g12Ad6OrnddeBpckCZch8h+h4bWnTotIx9FZ1PDIO4wrn3NmNHZhTKeWtF/UyzM2p3H4Sy6WOE1E+bSR7vbvs7ROPdgUeuMi6JWd5Uy2fXzegeMTU39234cKSjP8i669RsqSW4w7CD4pWE5FgYRU8E4nJwlWLPds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782806031; c=relaxed/simple;
	bh=DKWuHMD8ADL0zKU3qzM6I+0+Ls324mTKAtUCV8uTQCo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXNhXFoE+HlscYc04hS83v4duW7qsNpTS7pL+2GEqE28VP1RrslnNnjCmSpYEZiMIOsvO2UAFXtpUQzHFN+xDXAmelsTHRrkNb7GRUkTVNcfJ2b3/khASJz7C9msyscLRxYVUDp2VOsDY6B5ubM0FKzVXoV8YPqIB5jQHkFtzfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzEeikn2; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4051F00ADF
	for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782806030;
	bh=QLk1TuOjiNPuCpTV4xCdDTaOjHQTK3QruyZKcZY7x1Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SzEeikn298ntM12mqrr6eeAuWBznUx8HGeKI8OO6J1rAXqZe+DG8eH3kpdxS2Qwc/
	 BEgTe/7fHp8h71X6sCGG3fIihS5C6QKcHYkMaNYrgPUk3rcaSPmJDnw8ZoM5yrlTQE
	 KvW3inqTRly1yX4cupxJ6KIIy4QWzwTYakuwLMqpuMM/p2OaqREIyxEYDMqln50mnE
	 C1NSCn+lHyKd79yClTWWWIpGeXloq0qHFR7J5NJc/x4YvTZ2+1E8CMWE8qqPT9V+G8
	 G9xFlM4DvUB/S9Qvyumv8uzp49Hn1jyEjfrRcGIK8Lu7u5c1SmS6vDV9TdRuWHIBZh
	 32YpQJymIWJ5Q==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39b19e7d6fcso8747031fa.1
        for <linux-mips@vger.kernel.org>; Tue, 30 Jun 2026 00:53:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro9UjN91BEosEx5WbfzM5a4IJWkNgQg46m080ZH2eKeY/WKK8a2FEqmxC5RroaIhod9Fh2vfbILygaP@vger.kernel.org
X-Gm-Message-State: AOJu0YxOI9ZUrx73cLLRXTXSGIooRueLMzvj7TXbuDKuVy7bBUhbyouw
	7sKmDGFfZBbhUj8Iyinfcle4y8Rq2xoemcw/ElktvACcQemT38AsoJy/TEQMCUaqg5GyCqeIgEm
	PqjhDf/G4qcXb3BWIqFH96m/VhXg40ONzploEkKyWNQ==
X-Received: by 2002:a05:651c:2203:b0:39b:d0:e992 with SMTP id
 38308e7fff4ca-39b1da26188mr5158341fa.4.1782806029201; Tue, 30 Jun 2026
 00:53:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 00:53:46 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 00:53:46 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260629132633.1300009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629132633.1300009-1-arnd@kernel.org>
Date: Tue, 30 Jun 2026 00:53:46 -0700
X-Gmail-Original-Message-ID: <CAMRc=McnpZK+XeMcVfrBeh8SWa44UsVSJD0GJ1pXYhiFqzdpaQ@mail.gmail.com>
X-Gm-Features: AVVi8CcPrvp2PMd39-Ep5NDuNXP5lZT9A5toOBbKSjeAVmB0_7rIggX2JLATmJ0
Message-ID: <CAMRc=McnpZK+XeMcVfrBeh8SWa44UsVSJD0GJ1pXYhiFqzdpaQ@mail.gmail.com>
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
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Dominik Brodowski <linux@dominikbrodowski.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, netdev@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-phy@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[35];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15355-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:linux-gpio@vger.kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:andrew@lunn.ch,m:sebastian.hesselbarth@gmail.com,m:gregory.clement@bootlin.com,m:Frank.Li@nxp.com,m:robert.jarzmik@free.fr,m:krzk@kernel.org,m:gerg@linux-m68k.org,m:tsbogend@alpha.franken.de,m:hauke@hauke-m.de,m:zajec5@gmail.com,m:ysato@users.sourceforge.jp,m:glaubitz@physik.fu-berlin.de,m:linusw@kernel.org,m:dmitry.torokhov@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux@dominikbrodowski.net,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-input@vger.kernel.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-phy@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-sound@vger.kernel.org,m:sebastianhesselbarth@gmail.com,m:dmitrytor
 okhov@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,kernel.org,lunn.ch,gmail.com,bootlin.com,nxp.com,free.fr,linux-m68k.org,alpha.franken.de,hauke-m.de,users.sourceforge.jp,physik.fu-berlin.de,redhat.com,dominikbrodowski.net,lists.infradead.org,opensource.cirrus.com,lists.linux-m68k.org,lists.linux.dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,arndb.de:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7338E6E17C0

On Mon, 29 Jun 2026 15:26:20 +0200, Arnd Bergmann <arnd@kernel.org> said:
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
>
>       Arnd

Thanks for doing this Arnd!

For the series:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

