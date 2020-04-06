Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96BCA19F3EE
	for <lists+linux-mips@lfdr.de>; Mon,  6 Apr 2020 12:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727181AbgDFK5b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Apr 2020 06:57:31 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:45746 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgDFK5b (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Apr 2020 06:57:31 -0400
Received: by mail-qt1-f194.google.com with SMTP id 71so5575768qtc.12;
        Mon, 06 Apr 2020 03:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OJVdbc4/URe+WGm2RIHS01C+7ItQ2Hr946YFGhM+r6Q=;
        b=tl9rRJmbLLwNSi8rayLraEGERtM53Mp91HzHN5ePmODbG56ymHSstnBEbRubx8reNa
         royNt0lqw3KDwLjrw/AcEWNx9n3XQHOcNSlLLd3oc/r2upxFhfFi8QkY8bjLDoss8a+7
         13lNlh1b2yo9aAwIUP6nQ39u/wsUbeZggzpTW0LibRAX/R8SXBBTmsuIAjIXXfzxy7bt
         b/k/a66oSC6CEeH0T9K/gTBFiPiaZNUMiypnBLdVaxQfaWNJlQgIqIrJ0wTcXiNgBc7K
         pkeluKPCcmsZtSA9Fvjvk0msGJ//RldzC24nesu6jwsar5wquD4JJU/V9ok0RMIbtaU5
         A+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OJVdbc4/URe+WGm2RIHS01C+7ItQ2Hr946YFGhM+r6Q=;
        b=X8lmB1SNiV88n8koLGajvFe1HqH64fSxmEicJ0rM1T08ldG0+5sDpRHjcHjy1wJDv8
         mThErgnGbbyBzhVJIoPFhC71RsrbdAFfbu+N2GVk1R5jy8DbmBm8jsPZhB7HmiNUhmrM
         XGzs/xRWSJEPEW0Xg9v0ob5FpdULO0afZOxFygsBgT698ynuCrdjCsebLDr3/ReNvsBO
         gWogJCYFZF5PHqZudtdjCq0BmmSgav08nfZHHz1KjnocEL5BHHsuMlj96nIhkSXvOWwK
         e3jcmlQchs+WIhsqvJGOObVXM+kIvb+mYIUU2HbXg+FfORYcOmJnfYmppSsY6i9rb1yX
         Da2Q==
X-Gm-Message-State: AGi0PuYiZaQ5wwg7paaPRTWX30y0fjsuIRM6gPDCpJeomdpVASi/pbby
        2PFvwp94N9LJHorIhMu4RYHssS1vxj0Cuyj2fA8=
X-Google-Smtp-Source: APiQypKi+rVw7Yx3tuLfh/w9IDdOMDAcQDOY1nccoBuxFkH975v+GT9qKuQMZQBbgq5YPrSWScSrivupcGdAfyxbwsk=
X-Received: by 2002:ac8:1a8a:: with SMTP id x10mr8463923qtj.154.1586170650053;
 Mon, 06 Apr 2020 03:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com>
 <alpine.LFD.2.21.2004051738000.4156324@eddie.linux-mips.org>
 <96C9B1A0-2F89-4650-B0A4-6A6242A2AA0A@flygoat.com> <alpine.LFD.2.21.2004051817310.4156324@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.2004051817310.4156324@eddie.linux-mips.org>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Mon, 6 Apr 2020 18:57:18 +0800
Message-ID: <CAKcpw6U=VW+h4sU1fzrsqXU9z-zVfcFsENKHgAD4paqtndip2w@mail.gmail.com>
Subject: Re: [PATCH] MIPS: malta: Set load address for 32bit kernel correctly
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips <linux-mips@vger.kernel.org>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Maciej W. Rozycki <macro@linux-mips.org> =E4=BA=8E2020=E5=B9=B44=E6=9C=886=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=881:23=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Mon, 6 Apr 2020, Jiaxun Yang wrote:
>
> > > Given the description above I think it should be done uniformly and
> > >automatically across all platforms by trimming the address supplied
> > >with
> > >$(load-y) to low 8 digits in a single place, that is at the place wher=
e
> > >
> > >the variable is consumed.  This will reduce clutter across Makefile
> > >fragments, avoid inconsistencies and extra work to handle individual
> > >platforms as the problem is triggered over and over again, and limit
> > >the
> > >risk of mistakes.
> >
> > I was intended to do like this but failed to find a proper way.
> >
> > Makefile isn't designed for any kind of calculation.
> > And shell variables are 64-bit signed so it can't hold such a huge vari=
able.
> >
> > Just wish somebody can give me a way to do like:
> >
> > ifndef CONFIG_64BIT
> > load-y =3D $(load-y) & 0xffffffff
> > endif
>
>  Use the usual shell tools like `sed', `cut', `awk', or whatever we use i=
n

perl may be the easiest to use tool here.

ifndef CONFIG_64BIT
  load-y :=3D $(shell $(PERL) -e 'print $(load-y) & 0xffffffff')
endif

Note that it is `:=3D' instead of '=3D'.

> the kernel build already for other purposes.  There's no need to do any
> actual calculation here to extract the last 8 characters (and the leading
> `0x' prefix).  At worst you can write a small C program, compile it with
> the build system compiler and run, as we already do for some stuff.
>
>   Maciej



--=20
YunQiang Su
