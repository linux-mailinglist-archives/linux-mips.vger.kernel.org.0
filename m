Return-Path: <linux-mips+bounces-8804-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A44A9E214
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 11:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30A0116AAB2
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 09:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77D12505BE;
	Sun, 27 Apr 2025 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLmttuBn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BC6250C16;
	Sun, 27 Apr 2025 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745745954; cv=none; b=kuR+k8SbPVvWlNcTwhXDRXqzZg6JUMbYmrmop0vQ2cjYLE5e8/w7vzrHnFlCHXooCL+bsAoR82Rr4Bu4MkmeCxktie1MwBiSXuSQxmQefmOlHP06Am0C4zrCQtpmb+ZrlKYKAjY6PAJfUwhVBX1VmgroEB0zE1TBgkN9KW0i0aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745745954; c=relaxed/simple;
	bh=1e4CIKEeHfm0tSrUDVV62N5Ny2tt4pWKijp71I0byWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeAliJw0r5y8h2gKdIZEBHEImzPEuF4CvrznKKNj1pLY4qIr8ai2cHov9M0L4nrtjM9hRYZ/nu56v4yLjFkQoNFSMgEb7nn71LyNn9P6dz61edDYTmjQCywpGzhsKP5hQAiljdNgdkLDhqA3d7dLcfmPO4dLufPv5BMk5A0RzMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLmttuBn; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b061a06f127so2640579a12.2;
        Sun, 27 Apr 2025 02:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745745952; x=1746350752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuVzj3Lbaamf0mUJuJOWnfeTMqxKyWNfVP9RiszFhk4=;
        b=fLmttuBn/bGhdJbIMtPofgELU+/SsBpWhj/11Tw/mYha4pJ8rwqZtmGnqfJfWeWkt4
         GqJdbZZgeGdUBBSPYe7amTtHn82huyYyhrz4S1Pv5CKOFieyecNeuCl8ySA1N/4lu/Tm
         FAO+wPGDCBIVkr7W2JYtlIvb8l86ADklaHqQ/ePAe/LHIDIRsWVJGGcHISNXL6B7kh15
         dkmcMkj/cEc1M0dkOPkzRT5fvJYu+SvovVdWJKPsYNDjftoMTgIWTleMmZAvkldw8r09
         HCuCRzNywmtda5851DZQuUixfnVbqMghQnPe7emfc36134bvzr2z8Mli1wbSTo0f45Uu
         MoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745745952; x=1746350752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuVzj3Lbaamf0mUJuJOWnfeTMqxKyWNfVP9RiszFhk4=;
        b=wLArG+ve/MF6mP+c6/sDdSEDUiLn9wj3gTqsh/2gLjDIkdLoH3UvvhpuOlOGJYVmBL
         3/6CDRdHUFeYa7n+RuPU95OjSnqfIEYyxsH8IOuTZZy4RCzcHKzh3iO+WWrRUSvI74iK
         n6IUYsssa75aaMQXpcGfHSgPvbJySe2CfPbS5hPDVVHmcbTCH9UM/u+S3xG0s9pjtI+y
         slIx4OOgzTHqAWcoN6d2WfUvSReBLTu2ZMa+03BZIthB3pNS8dGoIbGeeW6XkgIVevXD
         yj5ztTD+fJM7OOdl0CPNmgIEKre8OsvSUDN2+QwYhtkdY9GYMOhbev5F9xhMJZ6fIJvf
         NErQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDVrqEmVIGmBw+A3joztEQalnIViuobrjW0LRsBtjvQhC3CGUdkrOGxssfapwt3COJU5bwZqBF/hoOFF0=@vger.kernel.org, AJvYcCXND5ZB3gAkx7kLAiFWMzZrx0XJC4LobvSU53co7yfQWQlH2csNqtH33B/1ouhjS7lbhZ8kUb2EbqWbRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwuT/25me8RnBWWtZB8TrSBFyBMvcb77/p1szXAzLCQFpxlUUA
	Uu7+eAelzPMGlRBOZetjDXwkQ65ogD/Sc3myO38vWY8iG39lNcS9uoyc1QuZidpifTtMat0JGRi
	ljrHJvC3XELUN67eqdoVKNF6p6W4=
X-Gm-Gg: ASbGnct6Yj8f6qfzgkFb3PAdpThE6wiQ/mSlTfT4PxfZ0iak2pHMCvyZlT5SNb731I/
	tVo4TSjwfzISvySq5ZDjOEzKNTdS35r59G3hFAZucoz1R2cOLYFAVNWPsN74yWcDEPgRML9strf
	lTga6Dh1MNwGT3PK11Uqq3FDptPmE6iA==
X-Google-Smtp-Source: AGHT+IEvNEKNcBCrC3dOSLCWqJZa24uptxKsTbgRS3KfFHvuA8w4r5EgPvD56tcMPPjZHxN1GoRLDtsiAtFYwOYDwGM=
X-Received: by 2002:a17:90a:d006:b0:308:637c:74f2 with SMTP id
 98e67ed59e1d1-309f7dde701mr14210727a91.17.1745745952441; Sun, 27 Apr 2025
 02:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408082804.796515-2-thorsten.blum@linux.dev> <aA3oWzkUP3CYbShi@alpha.franken.de>
In-Reply-To: <aA3oWzkUP3CYbShi@alpha.franken.de>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 27 Apr 2025 11:25:41 +0200
X-Gm-Features: ATxdqUHsQgio5coT_ulWz__2XIhUL9CbgqohLGtDe6BQ79QMKly8Ps9gTgzo_SU
Message-ID: <CAMhs-H-GYrGMr-yorvYtX1Nud47c5pWrwtcEx9O9kmfJgZiSAw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: ralink: Avoid x/x division in rt_timer_config()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, John Crispin <john@phrozen.org>, 
	David Laight <david.laight.linux@gmail.com>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

First of all, sorry for missing this patch.

On Sun, Apr 27, 2025 at 10:19=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Tue, Apr 08, 2025 at 10:28:05AM +0200, Thorsten Blum wrote:
> > Avoid the 'rt->timer_freq / rt->timer_freq' division when the divisor i=
s
> > larger than the timer frequency and use '1' directly.
> >
> > No functional changes intended.
> >
> > Suggested-by: David Laight <david.laight.linux@gmail.com>
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> >  arch/mips/ralink/timer.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
> > index 54094f6e033e..5d8286603584 100644
> > --- a/arch/mips/ralink/timer.c
> > +++ b/arch/mips/ralink/timer.c
> > @@ -75,12 +75,16 @@ static int rt_timer_request(struct rt_timer *rt)
> >
> >  static int rt_timer_config(struct rt_timer *rt, unsigned long divisor)
> >  {
> > -     if (rt->timer_freq < divisor)
> > +     u32 t;
> > +
> > +     if (rt->timer_freq < divisor) {
> >               rt->timer_div =3D rt->timer_freq;
> > -     else
> > +             t =3D 1;
> > +     } else {
> >               rt->timer_div =3D divisor;
> > -
> > -     rt_timer_w32(rt, TIMER_REG_TMR0LOAD, rt->timer_freq / rt->timer_d=
iv);
> > +             t =3D rt->timer_freq / rt->timer_div;
> > +     }
> > +     rt_timer_w32(rt, TIMER_REG_TMR0LOAD, t);
>
> I really don't see the point for this change. IMHO, this isn't really
> runtime critical and I prefer the code like it is at the moment.

Yes, I agree with you. I also prefer the code as it is.

Thanks,
    Sergio Paracuellos

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

