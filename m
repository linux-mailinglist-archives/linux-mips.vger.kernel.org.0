Return-Path: <linux-mips+bounces-13987-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGuIEftAymky7AUAu9opvQ
	(envelope-from <linux-mips+bounces-13987-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 11:23:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB440358183
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 11:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED5C830048F6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2026 09:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849823AD531;
	Mon, 30 Mar 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RhbUYW1m"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CA33822B4
	for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 09:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861923; cv=none; b=jCu6HHnQjAA7c3pLekjmjpd/L4Kk8uCsQkmvXjApRz1xytGI7cmAY1Xl8tArdY+/px2gwBR6AEw0lkv+tNP9Ru/UnR4GqCi2ZVLRUBc07n4r4e6Hw89XyrOTrDXJLZVE4R7PQEDQ5Zrt+jz6zMecVQL8uUY5BnB5olrv1L/U8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861923; c=relaxed/simple;
	bh=ceON4+OyPO9Dpt3uRo/YI9ctvvIsu5NXrp2cWjyJbGM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qxSHbC3ksanNUxMeEjG2TInfriHddjWXWn96ucM5DmNvKhkRh7mF2N/otHn9x9yULOG5azRCEGgs3L7E8g+g8oavEU8rsSrJ9j3phcWsryLWgappfzeEwZK/Kwu9zCRR0rT/HdBZAX/PwPGE5WNn25bIHxWRi/QJGhe9aigeWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RhbUYW1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24952C2BCB2
	for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 09:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774861923;
	bh=ceON4+OyPO9Dpt3uRo/YI9ctvvIsu5NXrp2cWjyJbGM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=RhbUYW1mny2+1VgOOKTjJlNgARppS1K9nt7p4vpy0jKBvrMYdfM0wQKv0I14eSCdJ
	 HvPbgZFcjWyv0PJXoZOBX4tTlamzeGfteGy5KmcxV3rgC6Yw6imrhxXlCAehnSOzvV
	 FlwEpqnYzWJyF53poKcxDSCGxfyfixlgcDsQYEtDWU6Td9sJ0sH7Vh4g4Wj5BRKy+0
	 N8BzdWPmbNRNGV637fkqEcY0dNobxhOf6ohvVtVY7b8UrSkJrADR8rT5XVJy3aJBYI
	 Kb4pOCR1o2NNisdwpg6viQCe14RIB5F/XGupZz4pEjdSfRsE8VE+gvrVutISqiDaKT
	 U9iRekWyD0KCQ==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38be5d7c27cso40253521fa.0
        for <linux-mips@vger.kernel.org>; Mon, 30 Mar 2026 02:12:03 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz/Ie6CxZP5K8LxerqD2GGmqehlFEwKfhr5DQtXuSIZ9sA2fF7r
	NHt+nXTjKPKJXPLqaNN8xZqBIsV74ZPjX+tU/QFExbmVRQCWcixkgPfy/n/Z3+v3giOYWAYLXfN
	bv5QLMypMr4dgRZKjpghhekj7T36NcufkSxCx4pVqEA==
X-Received: by 2002:a05:651c:1594:b0:38a:8c44:75a1 with SMTP id
 38308e7fff4ca-38c730901a6mr29310131fa.8.1774861921807; Mon, 30 Mar 2026
 02:12:01 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 02:12:00 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 30 Mar 2026 02:12:00 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260328-mips-input-rb532-button-v1-0-98e201621501@kernel.org> <20260328-mips-input-rb532-button-v1-1-98e201621501@kernel.org>
Date: Mon, 30 Mar 2026 02:12:00 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mct_F-LPAsvsHWxS1SeT+SBXQ7opikmf33eR7tz_5tJwA@mail.gmail.com>
X-Gm-Features: AQROBzDH9cuPCu9EfBdDYtLtddxHJtuJYI_E5t-aB4_H_wCaSEBQDt7of5qpvKI
Message-ID: <CAMRc=Mct_F-LPAsvsHWxS1SeT+SBXQ7opikmf33eR7tz_5tJwA@mail.gmail.com>
Subject: Re: [PATCH 1/2] MIPS/input: Move RB532 button to GPIO descriptors
To: Linus Walleij <linusw@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,alpha.franken.de,gmail.com,kernel.org,bootlin.com,nod.at,ti.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-13987-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB440358183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 28 Mar 2026 16:55:47 +0100, Linus Walleij <linusw@kernel.org> said:
> Convert the Mikrotik RouterBoard RB532 to use GPIO descriptors
> by defining a software node for the GPIO chip, then register
> the button platform device with full info passing the GPIO
> as a device property.
>
> This can be used as a base to move more of the RB532 devices
> over to passing GPIOs using device properties.
>
> Use the GPIO_ACTIVE_LOW flag and drop the inversion in the
> rb532_button_pressed() function.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  arch/mips/rb532/devices.c         | 47 +++++++++++++++++++++++++++++++++------
>  drivers/input/misc/rb532_button.c | 35 ++++++++++++++++++++++++-----
>  2 files changed, 69 insertions(+), 13 deletions(-)
>
> diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> index 4f027efbf27b..3f56d9feb73a 100644
> --- a/arch/mips/rb532/devices.c
> +++ b/arch/mips/rb532/devices.c
> @@ -16,8 +16,10 @@
>  #include <linux/mtd/mtd.h>
>  #include <linux/gpio.h>
>  #include <linux/gpio/machine.h>
> +#include <linux/gpio/property.h>
>  #include <linux/gpio_keys.h>
>  #include <linux/input.h>
> +#include <linux/property.h>
>  #include <linux/serial_8250.h>
>
>  #include <asm/bootinfo.h>
> @@ -38,6 +40,10 @@ extern unsigned int idt_cpu_freq;
>
>  static struct mpmc_device dev3;
>
> +static const struct software_node rb532_gpio0_node = {
> +	.name = "gpio0",
> +};
> +

Hi Linus!

I'm seeing patches from you lately using the pattern of "dangling software"
nodes that's documented under Documentation/driver-api/gpio/board.rst as the
recommended approach but which I have been trying to come up with a better
alternetive for and eventually phase out. I will post a series providing a way
to automatically assign software nodes as secondary firmware nodes for devices
and this series will also remove the offending bits from the docs.

As you're dealing with a board file here: could you assign the firmware node
you get after registering this software node to the target GPIO controller
under arch/mips/rb532/gpio.c so that the firmware node lookup can work by
matching the address rather than falling back to the label string matching?

Thanks,
Bartosz

