Return-Path: <linux-mips+bounces-13110-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOWMHasug2mxjAMAu9opvQ
	(envelope-from <linux-mips+bounces-13110-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 12:34:03 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE959E530B
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 12:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6371C301ECC7
	for <lists+linux-mips@lfdr.de>; Wed,  4 Feb 2026 11:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293843ECBC9;
	Wed,  4 Feb 2026 11:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFhRnUz7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47653ECBC4
	for <linux-mips@vger.kernel.org>; Wed,  4 Feb 2026 11:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770204820; cv=pass; b=XpztLiJpO3JfcNUzL8QrvdqZCZV6wBXrNYg0TJ561QOEY68WssdI1n3BlEY+3+ELwhDexzX5mxxMpBRL6972Dc3tXh1fxydlwI9A/7ic4lmmX3eQDKd1y7DU1cIZumafIKg/09QahHmoUpaqISypoOwwFCTPQb/aa/7fqK/NfVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770204820; c=relaxed/simple;
	bh=Awcnjk1QdlTS8axdekuV1rr1gSY8pKuf/BX1tuOUgPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BB4jkCBY11udb1zIRRlnqDiiChxafLmobTlSRlXpQaRm2C8ZXuhX2G/4aC8ZJcJfPncbGhapjrMXVOF8r6l5Wb+CotIE8xcp6Asx2msMoK5m4+nz55H4hukD48MilfzRXyVF1wiM8WjvtNYauMdYQ7DdmiLFfmo/5RGVpFW8D8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFhRnUz7; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-795055a17a3so4419397b3.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Feb 2026 03:33:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770204819; cv=none;
        d=google.com; s=arc-20240605;
        b=XHKzlwCHwSGPJSpEQ8J1iK/3H8qJFcq8b8uMORx/eiTc90R87DVhLGgBl5Ltid8+tA
         NnX5owfg/a2QI18LNOZPEzZbzEdUDE+bSoOKH+PKyRHJeP0TItaX4FqL5m1oXnQQKNog
         SNPfQ20fF8GeQshletbmzYEXz/aC2rKL9AKb1DjfPfwjAcoVlC6UjsVvVjH9Fq4IMvUY
         hPw9RbwzQp9VQ5oWxioKUFionUCc4fVbLFzrqYA3vHVTeP4WKauVayeaBOXjGgFaOs9/
         4tBSdqaBRi0xPrrTh5XeIPQGHJCUhaqMCcSE1YDHh7yaptvyvN7RWhpsWMeE+wErvELT
         Byxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGfykgdBwgc8R552M5o9ej8kEUSx1+0/PxfPWPxDhhk=;
        fh=KNO1RMZVCGiA3c84g9WO4fbqzT+1iIhCjwgtW8IHIB4=;
        b=ff3Vlqvuuu1GSoaQdEe7wWslU0IzY2Fn1ptDe9SzhbcPcZYHFc0l73BPoO0zZOlgVa
         5MZO/6dtfjTVli0diniEY7aWPZIsZBmnEM5VFXB93KTzTcofwBROJr2WAuDZf1VF1SjK
         TD926C6wbVqIMeLtLC0sOPmH530FhmMDWzQQrh4XTUta5xQamKKMn2vLklrBK19iAvQX
         h+1z4BfbPMXirydzrxenAdL+5jn5p8zMy55wdPyGfgEIjRMAWoxiSkMSU/gPhWr6kVTs
         MGk7i6MnT7P4B9DW1o3JdpH/Uq4bbprHmq89A5pkJ63GYyLC3a7Yic0RerMDp+eBoeTe
         Qilg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770204819; x=1770809619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGfykgdBwgc8R552M5o9ej8kEUSx1+0/PxfPWPxDhhk=;
        b=kFhRnUz7+nBRA8iQipWt5Cvxn5GJOH5+fgSsMcoWX73PhC22YQQWqqrE7dGdZ0q9ic
         x0vRWmQo5/X4NSSq4RilifnJ1BGRm9frLFLTPxY7BsmBnZ8ESXhVy/xTTsrLkhi3I3Kb
         S+ylW+RAJwlwLI6T6OgmIF0iaddMG97ta+9LuG8GkKQ+Vz6ezDJoq3bZ3t21+meQwt3o
         WEjIrDqnFl5rJaVx250dLb3sDPQ9cdUmqcZ2ezLd7g4ZEJnr3UrH4xwjtrya/ynblcUA
         yzYTC7hq6usLiPvX6+gHawhSh2bLeZGX6YtB5Ht+hsH8x0OJnSxE/npSjH1t4bXz/sT2
         VEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770204819; x=1770809619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OGfykgdBwgc8R552M5o9ej8kEUSx1+0/PxfPWPxDhhk=;
        b=sTtZ0hDd8zsyRTc9I4mkjIU5Bq5TU1/SzXxNvsXYiO7KAc4p1g6Skes+Zo0hvdGZ2q
         nQN/KqJA9F9XSVOzA2Cd5asPQrpW++FJSZUt3LNE7G+qwrAVFdhm6z5sVnELQwOHCfqL
         JKjP9jQMvIOIvOJhJy4VdMZGhYqJodsQITTrYHQMJNYmEM/u3UCwWABmwUMP6fhcEJK7
         UX6+GbJFQbr5iH09mKpV3Adb5nWhVqtMF4SnpKp4P7HcIwJ3SIhZmA5yC2EOYkntU2Yd
         60/NUxM7G6O6RGdMv5ikp3IDHcU3ker8jwWMIswSRZ3QhQjNz4z+jKLb4faAdTmsuAjF
         N50g==
X-Forwarded-Encrypted: i=1; AJvYcCULu2aMEnLzpJ0ly+ccylpBn1W2eqwitqFvbFSOt659QDOZCHtLd9Wv6Jljro+W7a1DSVqz63fM+Ujt@vger.kernel.org
X-Gm-Message-State: AOJu0YwWj4ld0Rr5Mf3E2uRt9qybj939OhClwA+HqBPg/XEsrem3g9np
	51S5CxGuKfofQ7/QBMJ+nH55nDE7mE9wCDmUXBh3iRIhiJ6bpsDpvnk31Q+DhQXiM1DLpaV53XC
	+hQP09O6NEsOwMK4kZkKqA+j5Rd/dJcQ=
X-Gm-Gg: AZuq6aJgD4zePiy+6KW0+l/Gy+3rUVI6Oy68cOU1W8+vET3Z9QcCL/pLGJEcL0vvVof
	ppHBPz3oMcyXJSvVb+wHNbeR6jgEnRiFtLuAxP8eSA0BoEVdwwhZgMAjyeqMzUNKARMUgrwEjY+
	Kq60b/lhn+Xzvgp4WVye/QvMXlBH3XI3kAQD/aagODFurVTDHCg00avullbjpHhmdWVO4XzRFPM
	at8dxlWH43A9xIYeiJ1So1voH+Lfs4Lmzy19uhC7u7kPbWBA0+JaHMy2/RIrTJ2Tfn0fA==
X-Received: by 2002:a05:690c:1a:b0:794:c7db:51d with SMTP id
 00721157ae682-794fe6361a1mr23713627b3.9.1770204818819; Wed, 04 Feb 2026
 03:33:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de> <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
 <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com> <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
 <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com> <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de>
In-Reply-To: <aYMrN3EhBM0Ip7b3@waldemar-brodkorb.de>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 4 Feb 2026 12:33:27 +0100
X-Gm-Features: AZwV_QgOcFjY6khhAk4o2IZDHiWfvo0fbke17nAd1Hl6Gjl96STRpO6xYA0D1s4
Message-ID: <CAOiHx=nJN9suqTV7XfuTmO1X9QZv0wn=VqwkEzGmPctAF09v9Q@mail.gmail.com>
Subject: Re: serial console on Mikrotik RB532 non-working
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13110-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonasgorski@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: EE959E530B
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 12:19=E2=80=AFPM Waldemar Brodkorb <wbx@openadk.org>=
 wrote:
>
> Hi Jonas,
> Jonas Gorski wrote,
>
> > Hi,
> >
> > On Tue, Feb 3, 2026 at 7:25=E2=80=AFPM Waldemar Brodkorb <wbx@openadk.o=
rg> wrote:
> > >
> > > Hi Jiaxun,
> > > Jiaxun Yang wrote,
> > > >
> > > > On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > > > > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> > > > >> Hi MIPS hackers,
> > > > >>
> > > > >> I want to use the latest Linux kernel on my Mikrotik RB532, but =
the
> > > > >> serial console is non working. I bisected the problem and the fi=
rst
> > > > >> breaking change is this commit:
> > > > >
> > > > > Hi,
> > > > >
> > > > > Can you try this?
> > > >
> > > > Oops sorry I missed a flag, it should be:
> > > >
> > > > diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> > > > index 8ecb56be81ac..239018540221 100644
> > > > --- a/arch/mips/rb532/devices.c
> > > > +++ b/arch/mips/rb532/devices.c
> > > > @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt =3D {
> > > >  static struct plat_serial8250_port rb532_uart_res[] =3D {
> > > >         {
> > > >                 .type           =3D PORT_16550A,
> > > > -               .membase        =3D (char *)KSEG1ADDR(REGBASE + UAR=
T0BASE),
> > > > +               .mapbase        =3D REGBASE + UART0BASE,
> > > > +               .mapsize        =3D SZ_4K,
> > > >                 .irq            =3D UART0_IRQ,
> > > >                 .regshift       =3D 2,
> > > >                 .iotype         =3D UPIO_MEM,
> > > > -               .flags          =3D UPF_BOOT_AUTOCONF,
> > > > +               .flags          =3D UPF_BOOT_AUTOCONF | UPF_IOREMAP=
,
> > > >         },
> > > >         {
> > > >                 .flags          =3D 0,
> > > >
> > >
> > > I tried the patch, but it still hangs here:
> > >
> > > RouterBOOT booter 2.18
> > >
> > > RouterBoard 532
> > >
> > > CPU frequency: 399 MHz
> > >   Memory size:  32 MB
> > >
> > > Press any key within 3 seconds to enter setup...
> > > trying dhcp protocol... OK
> > > resolved mac address 9C:BF:0D:00:D6:4E
> > > Gateway: 192.168.1.254
> > > transfer started ........................................ transfer ok=
, time=3D525.70s
> > > setting up elf image... OK
> > > jumping to kernel code
> > >
> > > Nothing in tcpdump tries to mount nfs, so I believe serial console
> > > breakage is not the only problem here.
> >
> > Have you tried the patch on top of master or
> > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6?
> >
> > If it works on top of 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6, then
> > it fixes the serial issue, and you can do a new git bisect between
> > 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 and master to find the next
> > breakage, with the patch re-applied on top each step (so serial stays
> > working).
>
> Yes, thanks for the idea. I already had this idea in mind and I am 9
> steps before I get the next breakage :)
>
> Thanks for the heads up,

Also a small warning when doing a bisect with git am'd patches on top:
always (git) reset to the original tested commit before doing git
bisect <bood|bad>, else git bisect will account for these commits on
top in calculating the next revision to test and may suggest the very
same commit again you were originally testing.

It took a me a few steps until I noticed I was running in circles when
I had to bisect with a few patches on top.

Best regards,
Jonas

