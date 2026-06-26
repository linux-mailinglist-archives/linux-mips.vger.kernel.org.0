Return-Path: <linux-mips+bounces-15230-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id x5/CHLl4PmrlGgkAu9opvQ
	(envelope-from <linux-mips+bounces-15230-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:03:53 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3A6CD488
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 15:03:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15230-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15230-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6CFC30AD071
	for <lists+linux-mips@lfdr.de>; Fri, 26 Jun 2026 13:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9202E7368;
	Fri, 26 Jun 2026 13:00:47 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C5A3F54B0
	for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 13:00:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478847; cv=none; b=uP+xYaXAlCf8zIuAs1UQ+OBrNv2u2RWPPiVaVI1zhX1ArKfJQh8RL+PJODiMcpPTSTQDge/NirODmCOUlwUVxzVqOK5T/pi0M7oZv3iZxtpN6jbe1mOoDabUlXlSW85eOV+GJXzLw2f1s7tXJ1RDw1WOgVnS87rb0e8ZY+cIADw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478847; c=relaxed/simple;
	bh=4F1/fUwt1PVM5XPC7LXsjVQ2Hci6TjH03w/Ot4zQN28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=prVO0M6tQcqPuV+YSrpdZ0s3u8T2Az1AeTcDf/KBAF100lq9soPvP9Lf4SVyr/RA+AwXdoIMjMp2fmNuN/LAQ20VlO4wiSNSj/k1VbYk/7Uqzy1vMfWqWZfsUOPtBvvfucg+pzyUTzIm6G8NzMLAIszgb7TLB6RrOgWZA42htI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-734b5ba782bso324453137.0
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 06:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478839; x=1783083639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXdTYWIi8vqe/RDHU9rZqOBRL11YTZO/o5NnreBxgV4=;
        b=svZ0ZYxYXP9SJo3ea0LhrK78YagbPCfgUzpqfXR03APzM1Nlqgv17Oe78zpUy28RRJ
         YmPK3bKifdCIXW7oeJ00eabBWXRD8x9Bjq/QvT3XHoy1TDGRXVnnc8rKlBzldfpRvFFC
         n3uHr/yo43pq7NFuRW06dvx47RwWPrhj9x4wzLugpPFxlkspe64ORaaAp3c7CyBTEL1v
         gPXz7ekJ93jSU0FQ3RpozIRKAXEZ7aOLZMSb8oT5zrea/I1vRc3T9CAEFqB8TqVDgKDs
         siVQAxXtSpT7WWc8Cjwx7NAdxCb98YpWRQuMJvoZZy7oDyqC1SiHD46IxUiVw+IYIgdt
         Dckw==
X-Forwarded-Encrypted: i=1; AHgh+Rrwrdl3sq9dyQCtn7/vtR52ogZJKp3UsetsvRnWMmKx7FOs3+P1vHyTPZdjTVXm0rKgDYWby+5VxbVK@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9tEUERZ3CD94MHbYnQWD83ADvZfuT1Pyya90PKW1jgUVZe8FK
	k3MXc+jsYEsdUdiptFBTUVovvna/QvspIR3kSB970tCyPbIeMjdqHd96ek/AIjoZ
X-Gm-Gg: AfdE7cno2TDDOzThQGEIcsmLU7afweqIns2mQ5sFR/q7d0UgyTgwmAPhje0IWAKXo6M
	I2F0xKWXrsudC1limT8eplItacmsSrGcxbw6cl1qbJXQfpSyp/EbiFoxPdpa1MDf/lE7kOBiCUZ
	0nUrs2EFrpfEMsAmaUl87pOzWrVODKiSd1M2L+e5EXsJHwY+ZMUf2Uwjm15VmJM/+/otCOW6bI3
	Ra1uDfSXzblWeHB2VGFOBSdYfCMzuJ5cFCHfVskhYagkptTl1qqFARGpclszh53xMHZYeYWF1RE
	VXzWuM6GsnrXOpFugrtTzdaqDOfdDx4WwIiLd/Xrkjn8O65O5ocpcZCT4ujJIGwYge+374diUU3
	eJUaGAvEsFrHxq42kvnBa3qWrVhnxS6Tklu9InSvioZXZD6bk2j3w1Vml/+uhsniudEOfjUyRCq
	nIUJ8HLUrnjHZxP7xwJDufZT2+fcUpnXaM17IURX1+fmaIvpxo3D5SJQ==
X-Received: by 2002:a05:6102:2ad0:b0:728:572d:80a1 with SMTP id ada2fe7eead31-734366cc294mr2808844137.21.1782478839038;
        Fri, 26 Jun 2026 06:00:39 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96916e88e59sm997527241.6.2026.06.26.06.00.38
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:00:38 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ab0377d0b2so280284e0c.3
        for <linux-mips@vger.kernel.org>; Fri, 26 Jun 2026 06:00:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrgfki5bGpZuKwee/7t7rEC02u22PuDJr0FDr4XICfkQuQ4rkkF8w4KSkLqa5BtPZlQ6cqW3/WeCI1u@vger.kernel.org
X-Received: by 2002:a05:6102:54aa:b0:612:21f8:5afd with SMTP id
 ada2fe7eead31-73434c67027mr2844188137.12.1782478838038; Fri, 26 Jun 2026
 06:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1782389357.git.geert@linux-m68k.org> <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
In-Reply-To: <CAD++jLnme9So3j77C9ELdon=4dmGEeBKYj80r2g9MoJXw5XApw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jun 2026 15:00:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmph4pbN_X1HNsnED1rjJr-=w9X9Zddt1hFx9uEiXhSQ@mail.gmail.com>
X-Gm-Features: AVVi8CdUw_1X2mjYstfkXFNzWlyuXI9YQXUk3v5YVf-hEzqqrdCu6KGj15CenZk
Message-ID: <CAMuHMdXmph4pbN_X1HNsnED1rjJr-=w9X9Zddt1hFx9uEiXhSQ@mail.gmail.com>
Subject: Re: [PATCH 0/9] MIPS: TXX9: Legacy GPIO interfaces cleanup
To: Linus Walleij <linusw@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15230-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:tsbogend@alpha.franken.de,m:brgl@kernel.org,m:arnd@arndb.de,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFF3A6CD488

Hi Linus,

On Fri, 26 Jun 2026 at 14:58, Linus Walleij <linusw@kernel.org> wrote:
> On Thu, Jun 25, 2026 at 2:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > This patch series gets rid of legacy GPIO interface usage on the MIPS
> > RBTX4927 development board, preceded and followed by some cleanups.
> > No blinky LEDs were harmed during the production of this series.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>

Thanks!

> Sashiko is asking you to fix the entire universe as usual, I couldn't
> care less.

Feeling lucky for not being CCed by Sashiko ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

