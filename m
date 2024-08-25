Return-Path: <linux-mips+bounces-5076-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3605895E3FA
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 16:45:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D61DB28197E
	for <lists+linux-mips@lfdr.de>; Sun, 25 Aug 2024 14:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24DF13DDA7;
	Sun, 25 Aug 2024 14:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b="aD5NiiJB"
X-Original-To: linux-mips@vger.kernel.org
Received: from dilbert.mork.no (dilbert.mork.no [65.108.154.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CE213D28F;
	Sun, 25 Aug 2024 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.108.154.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724597095; cv=none; b=mKPfP9ny2hAiBydt2TW63oZN5SZwuyCat3kfNkyIczaVqemuc0sHrdXfm0r3zGWb12hHpKxLNiP+IczwcKWfaibWbtgd9mn+cU4FzQs3mvZOsSE5g91jct8wkg2DQlnMZx5L/TCz+M5t5RWY1DZEf1aeA4Et7+mGqM1ncT1anFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724597095; c=relaxed/simple;
	bh=dxJjCllAKMbLX97rrVTFtjqjDQtIb2Bp+dprTVEPz1Q=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=ip1piez2cnVjzCrQc5kouBsI9deB5NP2fC5nDAw/gsCQ7weyoShF1yt/ELlWYua0nKH2EvKtZKz1D2ezKqDNAE9eX/471dMvzT51qlyLKdwT9Pax4jMj1yBOn8v5uBrUTMJZZmHUi0v4XQzj2lxJTPSrvwXsxr60JGACRcVVr1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no; spf=pass smtp.mailfrom=miraculix.mork.no; dkim=pass (1024-bit key) header.d=mork.no header.i=@mork.no header.b=aD5NiiJB; arc=none smtp.client-ip=65.108.154.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mork.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miraculix.mork.no
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10da:6900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47PEiG0M3818917
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 25 Aug 2024 15:44:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1724597056; bh=YtuIvtJIjBFlQjJ+WcctjdKT+azF5P1AlLc5p6ajNKg=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=aD5NiiJBDo+YKfyOl4dRWReGNeHxcxe4bb7wF3RNE9ZtHBELLig9BaKW9bWmodbG7
	 r/egmZpYDzoN6TXW3rJDZ5jF1BUmXkk3eg4B7Szt+IDewafpb/jmjxQ+bOqB1VSSDq
	 xIHLEyWHnzBrGW+EGBl0Rx5nmA8CFUqsLxztiXrI=
Received: from miraculix.mork.no ([IPv6:2a01:799:10da:690a:d43d:737:5289:b66f])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.17.1.9/8.17.1.9) with ESMTPSA id 47PEiGem2224004
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Sun, 25 Aug 2024 16:44:16 +0200
Received: (nullmailer pid 1536577 invoked by uid 1000);
	Sun, 25 Aug 2024 14:44:16 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Steven J . Hill" <Steven.Hill@imgtec.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] MIPS: fw: Gracefully handle unknown firmware protocols
Organization: m
References: <20240824144133.1464835-1-bjorn@mork.no>
	<7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com>
Date: Sun, 25 Aug 2024 16:44:16 +0200
In-Reply-To: <7f0602dc-8a47-46cb-a12f-09afc082b48f@app.fastmail.com> (Jiaxun
	Yang's message of "Sun, 25 Aug 2024 13:50:20 +0100")
Message-ID: <87o75gy85b.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.0.5 at canardo
X-Virus-Status: Clean

"Jiaxun Yang" <jiaxun.yang@flygoat.com> writes:
> =E5=9C=A82024=E5=B9=B48=E6=9C=8824=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=
=E5=8D=883:41=EF=BC=8CBj=C3=B8rn Mork=E5=86=99=E9=81=93=EF=BC=9A
>> Boards based on the same SoC family can use different boot loaders.
>> These may pass numeric arguments which we erroneously interpret as
>> command line or environment pointers. Such errors will cause boot
>> to halt at an early stage since commit 056a68cea01e ("mips: allow
>> firmware to pass RNG seed to kernel").
>>
>> One known example of this issue is a HPE switch using a BootWare
>> boot loader.  It was found to pass these arguments to the kernel:
>>
>>   0x00020000 0x00060000 0xfffdffff 0x0000416c
>>
>> We can avoid hanging by validating that both passed pointers are in
>> KSEG1 as expected.
>
> Hi Bjorn,
>
> This is actually breaking 64 bit systems passing fw_args in XKPHYS or KSE=
G0.

Ouch.  Thanks for the feedback.

But if so, then aren't those already broken with the current test
against CKSEG0?  I didn't add that.

IIUC, CKSEGx is the sign extendend version of KSEGx on 64BIT:

#ifdef CONFIG_64BIT

/*
 * Memory segments (64bit kernel mode addresses)
 * The compatibility segments use the full 64-bit sign extended value.  Note
 * the R8000 doesn't have them so don't reference these in generic MIPS cod=
e.
 */
#define XKUSEG                  _CONST64_(0x0000000000000000)
#define XKSSEG                  _CONST64_(0x4000000000000000)
#define XKPHYS                  _CONST64_(0x8000000000000000)
#define XKSEG                   _CONST64_(0xc000000000000000)
#define CKSEG0                  _CONST64_(0xffffffff80000000)
#define CKSEG1                  _CONST64_(0xffffffffa0000000)
#define CKSSEG                  _CONST64_(0xffffffffc0000000)
#define CKSEG3                  _CONST64_(0xffffffffe0000000)

#define CKSEG0ADDR(a)           (CPHYSADDR(a) | CKSEG0)
#define CKSEG1ADDR(a)           (CPHYSADDR(a) | CKSEG1)
#define CKSEG2ADDR(a)           (CPHYSADDR(a) | CKSEG2)
#define CKSEG3ADDR(a)           (CPHYSADDR(a) | CKSEG3)


> Maybe something like:
>
> static inline bool valid_fw_arg(unsigned long arg)
> {
> #ifdef CONFIG_64BIT
> 	if (arg >=3D XKPHYS && arg < XKSEG)
> 		return TRUE;
> #endif
> 	return arg >=3D CKSEG0 && arg < CKSSEG;
> }
>
> Will be more robust.

Maybe?

But I can't make that match what U-Boot does.  AFAICS,
u-boot/arch/mips/lib/bootm.c doesn't care about 32 or 64 bit, and simply
does:

static void linux_cmdline_init(void)
{
        linux_argc =3D 1;
        linux_argv =3D (char **)CKSEG1ADDR(gd->bd->bi_boot_params);
        linux_argv[0] =3D 0;
        linux_argp =3D (char *)(linux_argv + LINUX_MAX_ARGS);
}


Then it derives the argument and environment pointers from linux_argv.
Which means that all these pointers end up somewhere between CKSEG1 and
CKSEG2 on both 32 and 64 bit. Or am I missing something?

Tried looking for other MIPS code in U-Boot handling this for 64 bit,
but all I found was arch/mips/mach-octeon/bootoctlinux.c which uses a
completely different protocol.

Sorry if I am asking stupid questions here.  Trying a rather steep
learning curve. Maybe too steep :-)




Bj=C3=B8rn

