Return-Path: <linux-mips+bounces-14454-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKTBOv+7+WnBCwMAu9opvQ
	(envelope-from <linux-mips+bounces-14454-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:44:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B124CA076
	for <lists+linux-mips@lfdr.de>; Tue, 05 May 2026 11:44:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A261302B746
	for <lists+linux-mips@lfdr.de>; Tue,  5 May 2026 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049E132E6B8;
	Tue,  5 May 2026 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gp69CTzv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B4C3264F1
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777974122; cv=none; b=Kz/tb0Q/AWXWd4gcXWZ2yOgbTPvu7fY3G6Huy6B79oU7MK2Uah55u4zfRUFlLXnkuLRLhrUcS31jJvFZlHtmWaWuy5Dt8buETw7YVbWzTV5OPu92mB+dsRtAcJ9Y8wnuo6Q4R0jX/VZFzQQCQwaDdOSrOL0eWeN4aEQC1mGOB54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777974122; c=relaxed/simple;
	bh=htbgPZC9ymCWJNSb4moZS6fBxn+yEaeysJRk974cLlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dd/YyVBtvbDPVp+C1/I1SqOL8yvKV6rhQf7VYAxwczHSbQvcBSfG3ULvXVYXfK21oiv5Fp38lvk2HeY3JS9zjDRGnofnogG2oFFFqnmZqGWD09ovJ5h+BQjyYd1HVIBiCHprDcVaVEhwVwFaRH4sfVFiBlftgn4H8X8P4V4bQq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gp69CTzv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A60FAC2BCC7
	for <linux-mips@vger.kernel.org>; Tue,  5 May 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777974122;
	bh=htbgPZC9ymCWJNSb4moZS6fBxn+yEaeysJRk974cLlM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gp69CTzvSGVDULwoIjTSu8T1pJxIDEq3cmp5TJc7j7WCBxEnpAs5cmy4RCy6FFwxs
	 tAf3ExXWBFItL7T46NpNWYPH9mP4G3X2hCMQ1rzrKsiizadMUyBwsN3sq083Rev3qH
	 SFRpsGqpaD0OJ2EBkwizkl6pzoK05EQDnyxuaPeeSgodcpP4i0J96IHB9xEqGOyGpS
	 X++Fl40KHyljD3fZhj8cPftLIPADnch5j9tZ1GCEAUFzp/tVFR7nbBXSRX5gd5Yhlo
	 Ylp0fFefS9NZgp+A+yVoip70L4eMOiuT+GOJdYOv5DweFH4TVQ1Jfn/IrJdJbxMCq0
	 PmQoQRWzReXAw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so5816174e87.2
        for <linux-mips@vger.kernel.org>; Tue, 05 May 2026 02:42:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+sQT25unkGKcHQnmwVl/ma4h0w4JZA7HBTV6wTocu5WqYdEFWa1f34kg9uu/++YOJDgbBzdRoB6ZZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0phCJp89p+qlb60ZYz5St1jcOQFSeewMsZnU0FsQnR7piaW/x
	mguZLNw/CH05Ows2Aocqp31qE2u4Mhc+Ln4Ap8GiQxM4VISw+LUGYDxHIz76KsV+JNg1BGYW+5x
	eS14FxrY61ToilJK0UksOykaKxFT2+8E=
X-Received: by 2002:a05:6512:33c3:b0:5a4:7ed:3e41 with SMTP id
 2adb3069b0e04-5a8631c3615mr4751078e87.32.1777974121308; Tue, 05 May 2026
 02:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428155651.3252500-1-arnd@kernel.org>
In-Reply-To: <20260428155651.3252500-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 11:41:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJsVfsRw6Agz7gMQRKNbYCWdNMZOuQTNSnikNu=fjDPw@mail.gmail.com>
X-Gm-Features: AVHnY4IxmeRQjrEdh0ii-61C44IEEfNFOCwvkjBQyfILS_vPvLv7Rafs66Fz9ws
Message-ID: <CAD++jLmJsVfsRw6Agz7gMQRKNbYCWdNMZOuQTNSnikNu=fjDPw@mail.gmail.com>
Subject: Re: [PATCH] mips: select legacy gpiolib interfaces where used
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 58B124CA076
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14454-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, Apr 28, 2026 at 5:56=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
>
> This is the list of all gpio_request() calls in mips:
>
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_c=
d");
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_c=
d");
>   arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
>   arch/mips/bcm47xx/workarounds.c:        err =3D gpio_request_one(usb_po=
wer, GPIOF_OUT_INIT_HIGH, "usb_power");
>   arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_on=
e(board.ephy_reset_gpio,
>   arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");
>
> Most of these should be easy enough to change to modern gpio descriptors
> or remove if they are no longer in use.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

