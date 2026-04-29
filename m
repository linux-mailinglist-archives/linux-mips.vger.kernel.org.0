Return-Path: <linux-mips+bounces-14389-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIl2DCTF8WkbkQEAu9opvQ
	(envelope-from <linux-mips+bounces-14389-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 10:45:24 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8675C491512
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 10:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D8963037D76
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F963B9D9C;
	Wed, 29 Apr 2026 08:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UboxyE7O"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D1D3B95F9
	for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777452307; cv=none; b=NnGbjIrEGQF+GrBsiCBYhu88QVVFOHfX1r2Ww3nD9Dtah621eUEfH/dfPyq5ixEkcqbJGezNh06g2mIVNlAfKp4S+9ElfEW+uVCFvjZZs5aUt35huBVmr9TmjUcrgeqcmisEK1y9YIEEJDUm3owCIowrCIUIdJrLv/MkmSx4Caw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777452307; c=relaxed/simple;
	bh=AG2CfndSRmEyHhUxf+LTkGJV4s0YhLuGqKWpvvo80NI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7e8bD1btuSUrdzNNZJ7zRUfKM8RL20TPOxCepNKT1nN0bJRgbi1Vca9zCjJOVRuRiCuPkXl/DD2nxoBUSU3LPD4+OoEyaB0Xl6j1492oq4CdwHKAzrsybqznO4MX0WZ03zkVWp/112RAoh7eOqXHX6u5a5oDvRfD+JSgJCh4Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UboxyE7O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6D7DC2BCF5
	for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2026 08:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777452306;
	bh=AG2CfndSRmEyHhUxf+LTkGJV4s0YhLuGqKWpvvo80NI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=UboxyE7OzK4NW20A3R7NaOTWhFB537xNRC0P6AVcCYUBgiJtZ7FMZ7AgsGS8fkvOr
	 kIytbjOBk2m3SZTnuhK1eUanr7JjvyPjX64fRmZFXDqks7XEplXjNcPrYwhagiF7dm
	 3ScrYeGIbaG9UGDrFGI0wF4jP3ZS/Gt2/kt8ld8Hknfg6J+btT5zYd0X+btu4ZHq6M
	 pdftzFNBX+uErIIpytzTUkXD6OxW34evqkoQIr77lO2qHa92NQ7Kgaztve7LTuEI+C
	 95qr0ciRB2Mqvyx9DW+uAHeaeje5l4IvjJLKAhtRWFmIOwzArTpp1QtL1sVtjjSWvd
	 Ofgaj6NBr37cg==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38e7d983f79so95420731fa.0
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2026 01:45:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/eDRS9V+IMtWGDhSumdoYBl+T5oCV6a9TgyHmNnVM5JYwArZMPZLCIrubpuDZsTk78JBajCAFI4xD1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ZFTi1C4lLlU7JVBKibgLBlx9nBOMElhyBaCxt4da8148LLDx
	AKqKZUtd9dZDRZuYAN/BqKTA6sP8ctMS9J4dYQbysKFICom5txZr7oSp+OSbh0nceyuwqtRmd7K
	WgVANH53yLN+tk73sTJ/bdRkH1V4ezTuv4h0yfmcQfA==
X-Received: by 2002:a05:6512:6d6:b0:5a2:afbe:4aaf with SMTP id
 2adb3069b0e04-5a749d16a22mr1008681e87.21.1777452305304; Wed, 29 Apr 2026
 01:45:05 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Apr 2026 08:45:03 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Apr 2026 08:45:03 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260428155651.3252500-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428155651.3252500-1-arnd@kernel.org>
Date: Wed, 29 Apr 2026 08:45:03 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mf22L=mzgH4wjfMeXRfQ--UuDaV_GwPEdENdxn9vYFchQ@mail.gmail.com>
X-Gm-Features: AVHnY4K1cbFZX_UqU9MbAACS7R1pQ0IJ0CRy7--CuSoLDUfZDeX5U1g4d3_vtCg
Message-ID: <CAMRc=Mf22L=mzgH4wjfMeXRfQ--UuDaV_GwPEdENdxn9vYFchQ@mail.gmail.com>
Subject: Re: [PATCH] mips: select legacy gpiolib interfaces where used
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 8675C491512
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
	TAGGED_FROM(0.00)[bounces-14389-lists,linux-mips=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, 28 Apr 2026 17:56:19 +0200, Arnd Bergmann <arnd@kernel.org> said:
> From: Arnd Bergmann <arnd@arndb.de>
>
> A few old machines have not been converted away from the old-style
> gpiolib interfaces. Make these select the new CONFIG_GPIOLIB_LEGACY
> symbol so the code still works where it is needed but can be left
> out otherwise.
>
> This is the list of all gpio_request() calls in mips:
>
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(19, "sd0_cd");
>   arch/mips/alchemy/devboards/db1000.c:           gpio_request(20, "sd1_cd");
>   arch/mips/alchemy/devboards/db1200.c:   gpio_request(215, "otg-vbus");
>   arch/mips/bcm47xx/workarounds.c:        err = gpio_request_one(usb_power, GPIOF_OUT_INIT_HIGH, "usb_power");
>   arch/mips/bcm63xx/boards/board_bcm963xx.c:              gpio_request_one(board.ephy_reset_gpio,
>   arch/mips/txx9/rbtx4927/setup.c:        gpio_request(15, "sio-dtr");
>
> Most of these should be easy enough to change to modern gpio descriptors
> or remove if they are no longer in use.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

