Return-Path: <linux-mips+bounces-7018-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666719F104C
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 16:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27A9028431F
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2024 15:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBD31E2307;
	Fri, 13 Dec 2024 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dioN9aaw"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1CE1E231A
	for <linux-mips@vger.kernel.org>; Fri, 13 Dec 2024 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734102430; cv=none; b=qBaJCdfESuZo5JIFMjsxLvEbBCavigJ4Bc9lhQAcCq/SCWhY/x6ndI9iBYg9eqgZmrs/axLGrPl2uwhtHDfSMQQm+XoY/UYbofMT1ez0L3LwFA+htlrlUQbRFtUn6mJ2xy6iimZHEFY7XMNSZevuo/U9erjz8Kqa16RAgzitWdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734102430; c=relaxed/simple;
	bh=KeUbuHRKIgv/HogaL/+ErSJahryWzkcm/96Y35zfph0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jn1J8QFK7IIWuzs4M5evC4WzjJoLUfjyqycmdKpGe+jab5Cc1ZCwVrpMw+3k2yDxLhOwKSIxzGsmw7HRiZh6jHFCnqhuRjRuJLeq52KfYUhq2DyeCxCLfPmKICS336XnDSa5l8xAQlyhOFXGQ3mCWILnKnS8GZl5GNtQ8p2enV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dioN9aaw; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21625b4f978so125595ad.0
        for <linux-mips@vger.kernel.org>; Fri, 13 Dec 2024 07:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734102428; x=1734707228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=dioN9aaw/9KMyHpTwSNpp4K2e23br1VUICzq0u7sx/Z2OEIT08f10GnwlPi1FkVhdT
         A8NKn1q3C91kwEPoLS6wYmjZvS1vxfY+t8cVqAqyMQLHWjwybzu8Bn0UEUAMLteCYJNb
         b7AM5IZt0kn77HIEcfGmrve4zEDEVmbuYHnYhPEbmqsAfNow9Bkost0+4+cPi8OOptcH
         gF+CS4pJLqSjF2abo0DXwFHi3zvNTt4k1HitUlvFLvGJiqYu2/QEAykQ7gjOxg2mAMD2
         kP6f0RWNw9jWPX/3fb/mhOihWVLSog9DX8StQv10FIEAi5bG8vgK2T/IeK0ovRky0BWQ
         YRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734102428; x=1734707228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOK+EabcLART//wNWq/2bx90ZPHXhDUCyx5nSPtp/mo=;
        b=v1Iig9dJlh/b8c17/vOGxp4JLkvs09G66XKXOgVbZIxgc+AGMgmsQdkbdi+R305ukK
         edL10DkVfW6i6BbU2+HegOWQnKpDaGDnqe1FwALTO1AfWs3e/UxjMK7wCbgvY9BlcaSq
         CW3vAu1YttU8qJtl89wdJf99eJbwZd4pDQc1ysPIFk2JDATmmZ1nQVyBJ4lutnvkDV/u
         nS41hLatHz9Fu5YY99ocMyzWESnk8dZauszz/ytckvpEJYTvVn+ohsiUtR1qLoBeeXP0
         wR9xL8LNhYL7Q0yM7v/9dzyhmhFuNDSQzmDFJ5Jtw2Pbei3mRlQvn7hmf80V+RPbNijQ
         GB1w==
X-Forwarded-Encrypted: i=1; AJvYcCVXdpnXM5zPBlwER2Fo60ImO0YBvmPB3eG07a7NwYb5VkycmlY5v43oqe+3muyVe/sACa9RB3WcZZOR@vger.kernel.org
X-Gm-Message-State: AOJu0YypZxPzpNUgMab8tXga0o+8RENYWvyixcIqC5N9Syts02OKZjqS
	5G3jqV+8KtqGbgvaKaZlz85bnXhmx0t8CW7AkNGkB91yaaSqT8Z2X/IZroyabYl3XE8zDGlUXcE
	cCF4ScbhaDPVJsgYBa1Ng/L2VjH2xkQwBzHHt
X-Gm-Gg: ASbGncuWrbrPPGIHDY9c9x8nWlBYWmNcBvqnZT4W0Grni+sbEYR8CaXlBgjGw2E+Qjl
	jSZQsPNDejlipDT9fVLAeeiGpzyYzimPRgJengg==
X-Google-Smtp-Source: AGHT+IEFkkLrbUVuE/cQvOQQfUpzDKI51xwKn+aUa2wuLKN/e2/s4qkcLn7DHuV9QVymd56Ir4cx8C6BN8kJhz8qssU=
X-Received: by 2002:a17:902:da82:b0:215:44af:313b with SMTP id
 d9443c01a7336-21891d3ead6mr2786695ad.0.1734102427757; Fri, 13 Dec 2024
 07:07:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
 <hmuzfspqjzb36xlj2x44keihacrrhzj5madqrfbcnhqouzredv@wo75achgkuh5>
 <1818e2ea-f170-4a9c-8d93-2a24f2755a41@lucifer.local> <20241212173609.afd41d1dffbefe0d731ed4ed@linux-foundation.org>
 <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
In-Reply-To: <695eabb8-ba28-4031-bc4d-66dc4f1d096f@lucifer.local>
From: Kalesh Singh <kaleshsingh@google.com>
Date: Fri, 13 Dec 2024 10:06:55 -0500
Message-ID: <CAC_TJvcdz854DmBoVRkb_B5j+u-t=4zHkLtHVeB5RJ=bXcBJag@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v2 00/16] mm: Introduce arch_mmap_hint()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka@suse.cz, 
	yang@os.amperecomputing.com, riel@surriel.com, david@redhat.com, 
	minchan@kernel.org, jyescas@google.com, linux@armlinux.org.uk, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	davem@davemloft.net, andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 4:00=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> On Thu, Dec 12, 2024 at 05:36:09PM -0800, Andrew Morton wrote:
> > On Thu, 12 Dec 2024 22:51:34 +0000 Lorenzo Stoakes <lorenzo.stoakes@ora=
cle.com> wrote:
> >
> > > You've fundamentally violated kernel process and etiquette. I'd be mo=
re
> > > forgiving, but this is at v2 and you've not cc'd KEY people. Twice. T=
his is
> > > totally unacceptable. See [0] if you are unsure of how to do so.
> >
> > This feels excessive to me.  linux-mm averages a mere 140 mesages/day
> > and it seems reasonable to assume that key people are spending their 5
> > minutes to scroll through the email subjects.
>
> In practice we did all miss it, and I don't think it's unreasonable to as=
k
> people to run get_maintainers.pl to avoid this.
>
> In any case, I truly do think this series works better as RFC, I mean Lia=
m
> has already voiced the kind of disagreements I share with it, and we need
> to rethink how to approach it in general.
>
> So if this is simply sent as RFC with the correct cc's (and ideally with
> some review feedback applied - a better cover letter, etc.) then it makes
> everything easier.
>
> As mentioned the timing is unfortunate here, this is a series we really
> want to make sure is properly reviewed before any chance of merge so agai=
n
> this points to RFC being the way forward.

Hi everyone,

Sorry for the delayed response -- I was traveling and didn=E2=80=99t have
access to email.

Thank you for the feedback. I realize I missed some key reviewers in
the CC list for this patch.
When I ran get_maintainer.pl, it returned a large list of recipients.
To avoid over-CC=E2=80=99ing people (which has been an issue for me in the
past), I tried to trim it down to maintainers and a few others I
thought would be interested. Clearly, I got it wrong and missed some
key folks. That was not my intention, and I=E2=80=99ll make sure to fix it
when I resend the patch as an RFC.

On the technical side, Liam is right that the copy-pasted arch code
has inconsistencies (missing checks, order of checks, ...). I agree
there=E2=80=99s room for further consolidation. I=E2=80=99ll take another s=
tab at it
and resend it as an RFC with an updated cover letter, as Lorenzo and
others suggested.

Thanks,
Kalesh

