Return-Path: <linux-mips+bounces-13108-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMdiGQocg2l/hwMAu9opvQ
	(envelope-from <linux-mips+bounces-13108-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 11:14:34 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05663E454B
	for <lists+linux-mips@lfdr.de>; Wed, 04 Feb 2026 11:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 493A03008D65
	for <lists+linux-mips@lfdr.de>; Wed,  4 Feb 2026 10:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A333D667D;
	Wed,  4 Feb 2026 10:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDx524gB"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D323D667C
	for <linux-mips@vger.kernel.org>; Wed,  4 Feb 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200072; cv=pass; b=A2E0e9Wlm/quvag1SU57nKxot/LU1eRisuoqh9soPJsSSaEJUkLvxPVHEktmXXWJw1NUBPlS8aItL5gsfv0745Hv4eEC1q6ux9zf0qTN30Y49d7QRvEdpIAQjybtzHSybX0BAY9jzpD3uOAGIClOGoi8dHeILQxZAyEg/V8YpoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200072; c=relaxed/simple;
	bh=w/OILr83glBQREHdDMB1+oQF16VwtNrKVlgEm+pr34o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhyqV6eVezhEZ01PE86AwOXYeL16mD3D6KLw26pTb0nVaoHiBRHDfeKLwqygE0SPOGzMyDXwiXkmDs+VAir7l7J8rgbwiC29q0C4kGFpWUXRlDUuhiHie7mIpfqHLiYSQJpdZU/E0pelEqTN29aOq7VdqxGCmGgbCIPvH6kZRyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDx524gB; arc=pass smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-790884840baso62954237b3.0
        for <linux-mips@vger.kernel.org>; Wed, 04 Feb 2026 02:14:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770200071; cv=none;
        d=google.com; s=arc-20240605;
        b=RqGBCLHOF+2k1wRBQsDfWR7XJ+0PQP1i3AK2cHF9jGSSTDhFCRuliBXaxGaSauVION
         Y6/ubHUdAVCtPEfGZ/7BqPqyLQrqstEs6P/VI0kNR2eTPTDnG1gExPPiuQlmcTOnMn1X
         OrD3dWOm7wgYoioc3x5aGKK38SpesS93uMqYJaP47TKDTs8PDMrB5xDsiQ0iNWoR9brD
         bV7Z0KLCRlSwamR8+FT85BQTxRC58ppmpg59IBFgUwBeFzlFoiUObfU4saJtHSYpJKW7
         +X/P1U74be+N2ozoE9qHo98wwj+HrF5SLhn2i4jciLiiF2Pd4kP6dEaOg63tmvMiX2ta
         oxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kO3LHs5RZfAPcG7LOVp03WBabPW2PtG123PLDE5PoIw=;
        fh=8VULzeVVlMP1/oNjnvG79NbZaF4KC80PuxD7/rbTaMA=;
        b=NH98mrarG/F1MEV4AeA34uvSeAWfvUX2T2O6MZLfAgkGvkWSaSYaPOCtFOIXUqY49x
         X2h9+RRi7eNkjN0lV1SlwD6TQ6A+4S3mvdIMllgvj2ONW3lKrZaBWo6BgcgBTffIF1QJ
         fep8fWBzp7//VVGeVJDZ1fGn20IM0r5Si0ipE32+AAKPaW5UDWYFCy3L18LWTE7Rs0bD
         enFO7IqyUTVmj1K32/eQw0HpO0v59tiDRaw6WikRgX/w3xp2xToj5zzjgPreORZjYcBF
         3n8+3iC4GB0ulzBgfIdN3AKc/efD1sy47kLamzvKJrl9cWfZXSt3LONwLJm9LhimSUin
         HiCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200071; x=1770804871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kO3LHs5RZfAPcG7LOVp03WBabPW2PtG123PLDE5PoIw=;
        b=mDx524gBTojjJ4VKn4l1xrBT3NbF7yBE7uEGfYiLNMZs8EC7vvLuuQF+KtDG22S8/P
         i25tsVI+O3vk81qKQmhkYFKzRmzd43jQBLPCNmPD3NjSlDTCyqoSzU5Oj+Vb1WznaJR7
         Q91iyP9YfCpW0YCF2ZEWgyBZ9/BeQm6U0g6S8zoeH6uJhl0fMlCHAiI75AfcMd0H1U+K
         I2NA00qFXZJf1Y9Wf+qwCwL5mcCSILv1pcqCgth7+85U+/Y1TlxNp5RUOKORleREDwga
         WIwg4UQwgHYN2EKvcUfXmujVqmz0coGkFYAOdt2iTsS7+VAVi//KLvefTzsW1rTT0DZf
         5qhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200071; x=1770804871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kO3LHs5RZfAPcG7LOVp03WBabPW2PtG123PLDE5PoIw=;
        b=B2ksEHh3EULmFw/8gBW2hRdL86zv/0IR6uwt3BM7j8qlg9uKKEHUFlzQwpsVEbkTF1
         4cfYMC2evup7/CjicNsQDuUI3aDvebiDZkOoNoFoew/2SbpaB+NMug2FdDWUvWcz2h7b
         txteD63hgXbz5BN8jJYv3s7R1JuKs9Kc7SyZmuZvum2XLWJwH9pWgUwmX99B22YcmYAN
         8GO726FZPIgrP5r2qEWBD7pI7NqAqiyt4dD7YWF/n+UD1ECo41ZL3F911gdl5wGRQrYL
         MgIHAjCtR4VonFks0qj62+Ycf+Uy3SibROTcM3XrkbVleeVn6cZzUD1K+cD24c8o03wO
         9BBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFfFaYBUQaXH5kR9sNKtKHe5tbxKm2CJ4aQmJi0CEDV0Jzbi/PivsXDL6NghIUTykO4dv3IlEP3EOx@vger.kernel.org
X-Gm-Message-State: AOJu0YyTVrH4bRs6HpqFUt40gqrMUUyzFgtXNRZF7Pc7kxg6PMSv19ve
	c82/LRrrkMK/6YbAPbEpXG8xiGfy2J2a7JR66pEj0vuy1fqo5NXMme9+iy8JIJyXs7PyNK8i0nS
	XB8aO8m/5WmsHHH5S6Wu4z4DkcSFqIX2zgmSTgAU=
X-Gm-Gg: AZuq6aJ8+O+Q8vMNf/l3bbEbOnbSVTCRFaPjom8zQXwXbb6N1jBEi4Hu7v0OQf7WtvV
	bCrtMFKLa8f4IKpfd6czMHubpTDJt6tsgIeC+snjm5KMc+kJf0cV6gXthSF18M0ltdLxGdYuz9D
	OMEETLghY04z2l0egcWUoT2A8oDuWDLb8Rkm4vx7RtLaVKbrCXI6WiRsRrfmKi57vuDc8Iz6XNK
	q70fjC6RcMJSPJ4hGHv/HOnm9v3vrmVJJ6C0vhhKJOfLMm3wH7u7PqLlgoEjCx8KqNXAA==
X-Received: by 2002:a05:690c:c190:b0:794:8853:53f7 with SMTP id
 00721157ae682-794fe84fc60mr23372867b3.69.1770200070804; Wed, 04 Feb 2026
 02:14:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aX-d0ShTplHKZT33@waldemar-brodkorb.de> <f0413775-1a6f-49a6-841b-bf52214a2841@app.fastmail.com>
 <1e9086c1-0cec-4aa7-aab6-e1e605dd9ebf@app.fastmail.com> <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
In-Reply-To: <aYI9jVbCU-RI2gv2@waldemar-brodkorb.de>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Wed, 4 Feb 2026 11:14:19 +0100
X-Gm-Features: AZwV_Qgho2jxDBG6AvRLTyzUKnSXLCow2eEKY7PJjInQ6BvkxzsK8gjrjcgRM_4
Message-ID: <CAOiHx=kU_kNSatruew1FQk2s=nmOanLB3tXjTi9tQ8je2mk2FQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13108-lists,linux-mips=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,openadk.org:email]
X-Rspamd-Queue-Id: 05663E454B
X-Rspamd-Action: no action

Hi,

On Tue, Feb 3, 2026 at 7:25=E2=80=AFPM Waldemar Brodkorb <wbx@openadk.org> =
wrote:
>
> Hi Jiaxun,
> Jiaxun Yang wrote,
> >
> > On Tue, 3 Feb 2026, at 3:24 PM, Jiaxun Yang wrote:
> > > On Sun, 1 Feb 2026, at 6:39 PM, Waldemar Brodkorb wrote:
> > >> Hi MIPS hackers,
> > >>
> > >> I want to use the latest Linux kernel on my Mikrotik RB532, but the
> > >> serial console is non working. I bisected the problem and the first
> > >> breaking change is this commit:
> > >
> > > Hi,
> > >
> > > Can you try this?
> >
> > Oops sorry I missed a flag, it should be:
> >
> > diff --git a/arch/mips/rb532/devices.c b/arch/mips/rb532/devices.c
> > index 8ecb56be81ac..239018540221 100644
> > --- a/arch/mips/rb532/devices.c
> > +++ b/arch/mips/rb532/devices.c
> > @@ -213,11 +213,12 @@ static struct platform_device rb532_wdt =3D {
> >  static struct plat_serial8250_port rb532_uart_res[] =3D {
> >         {
> >                 .type           =3D PORT_16550A,
> > -               .membase        =3D (char *)KSEG1ADDR(REGBASE + UART0BA=
SE),
> > +               .mapbase        =3D REGBASE + UART0BASE,
> > +               .mapsize        =3D SZ_4K,
> >                 .irq            =3D UART0_IRQ,
> >                 .regshift       =3D 2,
> >                 .iotype         =3D UPIO_MEM,
> > -               .flags          =3D UPF_BOOT_AUTOCONF,
> > +               .flags          =3D UPF_BOOT_AUTOCONF | UPF_IOREMAP,
> >         },
> >         {
> >                 .flags          =3D 0,
> >
>
> I tried the patch, but it still hangs here:
>
> RouterBOOT booter 2.18
>
> RouterBoard 532
>
> CPU frequency: 399 MHz
>   Memory size:  32 MB
>
> Press any key within 3 seconds to enter setup...
> trying dhcp protocol... OK
> resolved mac address 9C:BF:0D:00:D6:4E
> Gateway: 192.168.1.254
> transfer started ........................................ transfer ok, ti=
me=3D525.70s
> setting up elf image... OK
> jumping to kernel code
>
> Nothing in tcpdump tries to mount nfs, so I believe serial console
> breakage is not the only problem here.

Have you tried the patch on top of master or
6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6?

If it works on top of 6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6, then
it fixes the serial issue, and you can do a new git bisect between
6e690d54cfa802f939cefbd2fa2c91bd0b8bd1b6 and master to find the next
breakage, with the patch re-applied on top each step (so serial stays
working).

Best regards,
Jonas

