Return-Path: <linux-mips+bounces-15008-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yK27GK24J2p/1AIAu9opvQ
	(envelope-from <linux-mips+bounces-15008-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 08:54:37 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C53065CF78
	for <lists+linux-mips@lfdr.de>; Tue, 09 Jun 2026 08:54:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15008-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15008-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA36B3047428
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jun 2026 06:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71CB733CEB0;
	Tue,  9 Jun 2026 06:53:28 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753C3C455C
	for <linux-mips@vger.kernel.org>; Tue,  9 Jun 2026 06:53:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780988008; cv=none; b=FwcfeTLLlj6a1NDL3dOkLe6bw4ZbHU85uPv30/YXqdqN/VT/SBhZg7v4iRAEZCr7BoNRUYVoZBGK9vW2P6VldELT4t7gbp/GZ4YjfUk6UT8P5D9dF5J1K9wn3NxRrfvLVRQ0YfTY6IuZ+oQJe85LdaX72Judjrp5XaZ2vxDldDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780988008; c=relaxed/simple;
	bh=USxDlh+cTOmctRbVLXUwHBHqPmHhLde8bvmv+bZmeZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sn65TrR2eS2nlqSbNtLVIeYDEsaiinwW2J3yMDk/OtfNHBjXE93cgEieqUJzDbFxbyzIshnWsomZkSAFDelC42JV9rEBEsmE62qv+iLbbAO8WVNK//zTh6LLavvVWk5gwNTunRtWL6J8BDRAxJ2sHO7WesgTbZVRC/WVWBCLZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9617940274bso1527546241.0
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 23:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780988004; x=1781592804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfrTmKBa/6XQOKTJVCGFPY/9uy59Ow4t/P5iBf4xoKk=;
        b=cP81QNRvaVbvMTqHZDIKdb89PUUfCq6PMuT3xVmK7xlAGAsApQ5jkKdwUKHK3c10Yp
         reAuaBuTamvizXzw+7+ap/HP+IuOz2ys2Ztul16aUee2ShswGce2xz+9pcr/7GZqTxSq
         0E0RCePSaPMmP3ErVtN0ka6DEV+2d/TuR1C5uqJzSQaByZ7IKXmbcoQj5HvNKnaOJdxZ
         WujcLUTcWpZHTERjoNOeEF+NnDy6rqx5NGst1kOf+3bWU+GjwyiV0gdNhnhfYHSvwE5U
         wc5BtReotbnCQlvy/YRdHhFkVVFOZwYaTwcVC/kc3yVxjGdwlHDuOpdT9w3auqSYFwjb
         ZXrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OwaiE1GuIumhe2B/qLcXUQl/H3tr4orusJbKNtZlwfzTLqc+L6fHQSXDTggMt1X9NHd5CTdmF0Cfn@vger.kernel.org
X-Gm-Message-State: AOJu0YzSsate+BpWZ+qkr52tWVwu9UDjuid9GO3V2Y6GNXR51VITRaGs
	pcyE4t1Ckrq70aTGSx6Krx7DTjPZJ1CU+DmpGkSzsyde8DODe/cMO9AjOgrlSPkP
X-Gm-Gg: Acq92OGd0vpaQm17Rog3YF27uscSl4f9XMnQY+q6krkA9G78JvulEYpnbz3waIYySQR
	buavekXMXJ4PvkhvrDr17tTZLkHKyjytnpymbHDk3MSVUQ43u5MbrTLG3dan5MB5qGDAq1PQH7Y
	0eZLo6T5LcBSexapjOmvPMGBARONb9SIfcfEvtIsv10S1YSev9WC2DzZcc60RkCXGxR/EoQKrh3
	ieHtsHhiggUVM2rBrbhBziAw/iSx+KkmwQ0U4EmP/0ETbz3TteyHXV7j3xXceoJ4QpQ76uIySzs
	CPMKKIgs/sENyA55w2YP/m0hXGXmTbfTBMnQqu5HpveA/GgahUXfwjjoPVf+EOe+nbkS0xPDMOF
	5a79Syr7YNapJpZAcLiC/GqwzjlVKtzbxgjkHPNDnvXm1x0eFULJW7LIiR8gOYGZAUm1OEoQq37
	pxE5ANkEr0V7vg/b96eT5XxcL+hkJbSUDahx1NDyx5oF3mvmM19PnfQYLc12ddPuijiG3Be58=
X-Received: by 2002:a05:6102:554a:b0:634:92c:bdce with SMTP id ada2fe7eead31-6fefa8ee277mr8921962137.12.1780988004555;
        Mon, 08 Jun 2026 23:53:24 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb649b54e0sm16196313137.9.2026.06.08.23.53.23
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:53:23 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-963b7d9bf68so1858039241.3
        for <linux-mips@vger.kernel.org>; Mon, 08 Jun 2026 23:53:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ++9Ur/cQI0Hr5kAmZGqbZysTEhK/PxfMN2hHF8qv5Jvba/mEaqS2eFb10Z3C2q8AynrKaK2Ac9V0ud@vger.kernel.org
X-Received: by 2002:a05:6102:94c:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-6ff02387516mr9986946137.14.1780988002958; Mon, 08 Jun 2026
 23:53:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-acpi_spcr-v2-0-3cd9a3bda727@posteo.de> <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
In-Reply-To: <20260609-acpi_spcr-v2-1-3cd9a3bda727@posteo.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 08:53:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXH0mR9Sr+ze2_m94uc46_7gubApzWOkf+vUO+w=DmNoQ@mail.gmail.com>
X-Gm-Features: AVVi8Cemo9bnqwwW5sau-L6wcH5-zrPfob50Y8WSYUrCMRB7OtaTQ6EIMHl5BFg
Message-ID: <CAMuHMdXH0mR9Sr+ze2_m94uc46_7gubApzWOkf+vUO+w=DmNoQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] serial: earlycon: add uart_clk_freq parameter
To: Markus Probst <markus.probst@posteo.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15008-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:rafael@kernel.org,m:lenb@kernel.org,m:tsbogend@alpha.franken.de,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-serial@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,linux-m68k.org:from_mime,linux-m68k.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C53065CF78

Hi Markus,

On Tue, 9 Jun 2026 at 00:40, Markus Probst <markus.probst@posteo.de> wrote:
> Add `uart_clk_freq` parameter to `setup_earlycon`. This allows the
> options string to be reused with `add_preferred_console`, while still
> allowing to set the uart clock frequency. This will be used in the
> following commit ("ACPI: SPCR: Support UART clock frequency field").
>
> No logical change intended.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

> --- a/drivers/tty/serial/earlycon.c
> +++ b/drivers/tty/serial/earlycon.c
> @@ -135,11 +135,14 @@ static int __init parse_options(struct earlycon_device *device, char *options)
>         return 0;
>  }
>
> -static int __init register_earlycon(char *buf, const struct earlycon_id *match)
> +static int __init register_earlycon(char *buf, unsigned int uart_clk_freq,
> +                                   const struct earlycon_id *match)
>  {
>         int err;
>         struct uart_port *port = &early_console_dev.port;
>
> +       port->uartclk = uart_clk_freq;

Who is actually consuming this value?
Earlycon typically works with the serial console, as configured before
Linux boot by the firmware.
The Microsoft doc referenced in patch 2 seem to agree with that:

   "On a system where the BIOS or system firmware uses the serial
    port for console input/output, this table should be used to convey
    information about the settings, to ensure a seamless transition
    between the firmware console output and Windows EMS output."

> +
>         /* On parsing error, pass the options buf to the setup function */
>         if (buf && !parse_options(&early_console_dev, buf))
>                 buf = NULL;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

