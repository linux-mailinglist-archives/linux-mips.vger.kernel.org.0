Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92ED81663B2
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 18:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgBTRBg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 12:01:36 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:34819 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgBTRBg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 12:01:36 -0500
Received: by mail-qv1-f66.google.com with SMTP id u10so2211941qvi.2;
        Thu, 20 Feb 2020 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cz+Bmf3nimaZlMz+RGVMMxd3Xvynr99CFi1TWALwo3s=;
        b=tfOCeEJpkzK6U8IHyMx9BGVNMceqXoPuU6TMya+DNYKtVTTdkMiWicUPESH7XdSF/n
         D+wRd7O3oixMPfN9xT9WN/OYuxtiFVXJlaD30Nceot3qbukMd5FGYJETSmyYq7P5YV3k
         NZCf3ztuwiOieIwZgCM3+h1ZjU8IN5tXbOJlNxZovv/lJ6LUL8SBFmwi16h4xRQOYEJ4
         iTfnpKGfycqP1Hj+1cR0ceLWhbQ0t1wF69tBO2rwzDv+gcWbG1eRqV0SH7uAkxAu6tmz
         eUGS3obNZW/EBS3NraozqZhNpf1YGtRKbRYsAgv0wzjULpa2DdaExTm01+2UTh8yDZUh
         p6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cz+Bmf3nimaZlMz+RGVMMxd3Xvynr99CFi1TWALwo3s=;
        b=NQS47FIVpYrk6riklf9z31TZEutph2TaAmKIc5uttbsEK5TfHJYCN0jJk6sxuUU3XV
         0dAMrg8u6WYDnP+/WIQRVfOlDdjX5tw4nDMgAUXFMOThY8CP9Gfdnhe+HIJTWzYjDoQl
         PhQ8xpauMTRLKtAUPIFQxobtk3+REq+rUZ1iDt9WAYb+Bb/KLNHpy/ta4iyJGKrD6yUm
         7mLYgSfdZubkgUGExCNnVNmd5znBxo+zBCvp7fMpwP0qnVcxs1mvw3NAjmsz7ogyXwmN
         iyaIyx6KODyUn7Y3aDmqAiuWKC8jDD/uUJqIVHZr/YY9LkyiH2hej51YfNLUDsUAkvNW
         YEIg==
X-Gm-Message-State: APjAAAWp7EbHITGRCo3gZmx3v2Wkz/JlwmIPI28XiGDbNxwTSKIyY1El
        8NFro7XAijqxcidj8j11WGcUBb6zdUrrAMzWAyU=
X-Google-Smtp-Source: APXvYqzPikzD+d/JCK30MCCr9zkafXhJSVACrgtepSek3WGV2tcjWhCpv7rBWPZtj6m5LtTCY7pMTa9YCMlAv4ATuwE=
X-Received: by 2002:a0c:cd8e:: with SMTP id v14mr26355903qvm.182.1582218095573;
 Thu, 20 Feb 2020 09:01:35 -0800 (PST)
MIME-Version: 1.0
References: <20200219191730.1277800-1-paulburton@kernel.org>
 <20200219191730.1277800-3-paulburton@kernel.org> <20200220112330.GA3053@alpha.franken.de>
 <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com> <5E4E7E3E.6070608@wanyeetech.com>
In-Reply-To: <5E4E7E3E.6070608@wanyeetech.com>
From:   YunQiang Su <wzssyqa@gmail.com>
Date:   Fri, 21 Feb 2020 01:01:24 +0800
Message-ID: <CAKcpw6V-=bFG7O8a0SKbiAzQeHGzzaQD=8ZqVUhm8-B3PTA5xQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, wayne.sun@cipunited.com,
        chris.wang@neocore.cn, Yunqiang Su <ysu@wavecomp.com>,
        dongsheng.qiu@ingenic.com, xuwanhao@wanyeetech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Zhou Yanjie <zhouyanjie@wanyeetech.com> =E4=BA=8E2020=E5=B9=B42=E6=9C=8820=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:40=E5=86=99=E9=81=93=EF=BC=
=9A
>
> Hi,
>
> CC people from Ingenic Semi and Wanyee Tech.
>
> On 2020=E5=B9=B402=E6=9C=8820=E6=97=A5 20:11, YunQiang Su wrote:
> > CC people from NeoCore and CIP United, and my Wave Computing's mail add=
ress.
> >
> > Thomas Bogendoerfer <tsbogend@alpha.franken.de> =E4=BA=8E2020=E5=B9=B42=
=E6=9C=8820=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:23=E5=86=99=E9=
=81=93=EF=BC=9A
> >> On Wed, Feb 19, 2020 at 11:17:30AM -0800, Paul Burton wrote:
> >>> My time with MIPS the company has reached its end, and so at best I'l=
l
> >>> have little time spend on maintaining arch/mips/. Reflect that in
> >>> MAINTAINERS by changing status to Odd Fixes. Hopefully this might spu=
r
> >>> the involvement of someone with more time, but even if not it should
> >>> help serve to avoid unrealistic expectations.
> >> I'd like to jump in as MIPS maintainer. I'm doing Linux MIPS kernel
> > It is a great news that you are willing to act as maintainer as Linux-M=
IPS.
> >
> >> development since ages (started with an Olivetti M700 and kernel versi=
on
> >> 2.x) and right now time for doing the jobs isn't issue:-)
> >>
> > I noticed that you are mainly working some old machines.
> > And recently years, there are some new machines from Ingenic, Loongson,=
 MTK etc.
> > MIPS Inc also have some MIPSr6 IPs.
> > I think that you need some of these machines.
>
> I can provide some new Ingenic platform machines as a gift to Thomas.
> Ingenic X1000 can be provided in a short time, it has been directly
> supported by kernel 5.6.
> X1830 and X2000 will be available later.
>
> > In the last years, we see that the single maintainer is not enough as p=
eople may
> > quite busy.
> > Do you think that we need co-maintainers?

Paul Cercueil also has interest about it. That's so cool.

As a suggestion, I think that we can have a maintainers team:

Option1: Paul Cercueil/Thomas Bogendoerfer/Jiaxun Yang
Option2: Thomas Bogendoerfer/Paul Cercueil/Jiaxun Yang

any idea?

background:
1. PaulC works lots for Ingenic support.
2. Thomas works lots for some SGI IP and some other hardware
3. Jiaxun works lots for Loongson hardware.



> >
> >> Thomas.
> >>
> >> --
> >> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> >> good idea.                                                [ RFC1925, 2=
.3 ]
> >
> >
>


--=20
YunQiang Su
