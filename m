Return-Path: <linux-mips+bounces-552-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 625DA805EF1
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 20:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D5ACB2118D
	for <lists+linux-mips@lfdr.de>; Tue,  5 Dec 2023 19:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88F36ABB8;
	Tue,  5 Dec 2023 19:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmHKZPy9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E5CA5;
	Tue,  5 Dec 2023 11:58:41 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58df5988172so3644511eaf.0;
        Tue, 05 Dec 2023 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701806321; x=1702411121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml+guyEFPChymz1fE4bXVI0RffgdmNpaE0/U4fT7luE=;
        b=MmHKZPy9NFRv2aATElD12D8eQ8Be7F5njGfh9IHk/3yg0XmZtiX/Gw/uQPFhAcCrJ+
         8tJKej5jajxcZKALG6h131tesVP52sJpCbG8sx2OIONghyIUGFmhOrvN0+ckNB8p71Fp
         EXeY9+1FlooWBKdlUCNhr3z/jngkAHM/EkiY+AKqgxgNIZiFPgqkZKI6AqP4ROw7CYM8
         422d3Uv/sjv3USo4/JqYliHOijYjsGUjqrRHtyq+oMNxthf9PG3z6g35NitG/MIfzYqg
         DYJ4Ye6YJi0I6yW/6dX667txNhNWb65sAFwOoEpPTqS2+L1OztfOZoowawo/MT2IfM8K
         dKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701806321; x=1702411121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml+guyEFPChymz1fE4bXVI0RffgdmNpaE0/U4fT7luE=;
        b=Ie5e6T1aUW6CweEgCgzQUMl+MeeBiBGZ2oBErRqSlZp8QPFAxaEXhrSgnJkc3uDPy9
         9o8xIB6Sdpthx+XNJQ1LV/rv4l3vQ7l4NWN4CWoVVxIIjgjlYXnBLsFX+GE1M3PZlZMr
         GcqEWVJhytIq3SSPUiDjSCDjUt140ttdQK2C7LGkCP7N6GIwAxUNSpUUMOzA7U0qJfZb
         95bgkCrcG/PdpVdmZhxhfOYVNpZFnWR+r0hyI5k+ATXf8VaZZ5XhUlAU00U4Ak6H9p2F
         pQy0PwT/UtrquV4CFgNsbDWNGn/v5EjSvcIn0VpL3J3SSmc4ZWIR46YrSiJnoKFtU2BK
         0ysA==
X-Gm-Message-State: AOJu0YyFMTbSL5iNKYyT3YkadkDxQZ0CgomnwIgDjuYej74QUuE/iRNY
	nG3hrdlLM5Vt7u9zXcjFrwF9Pjl3TqgZb3jFa31PL3Fz
X-Google-Smtp-Source: AGHT+IGBGHccfvZnPQQ1I+T2ua8n3xYLStXRcfEpETa3g5gIJLTKU3Ph1WZfXPuY0pCvTjsKJo5ZMmcJmTNuQ8ghi90=
X-Received: by 2002:a05:6870:6122:b0:1fb:75b:131f with SMTP id
 s34-20020a056870612200b001fb075b131fmr7472252oae.113.1701806321123; Tue, 05
 Dec 2023 11:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231022090633.792831-1-sergio.paracuellos@gmail.com>
 <513bc341-25b8-5a57-d760-861a3e88a4a1@linaro.org> <CAMhs-H8A0p=nFSnU9pRn=rTC_=CH6jXFQdYgZdimFNq9+dVqSw@mail.gmail.com>
 <ZVxlRE0tcAv1iaoA@alpha.franken.de> <CAMhs-H8bs89SFWPVOEJFT6B+zYh2Anf=DqCJXNaq=Tjiq5X5Ow@mail.gmail.com>
In-Reply-To: <CAMhs-H8bs89SFWPVOEJFT6B+zYh2Anf=DqCJXNaq=Tjiq5X5Ow@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 5 Dec 2023 20:58:29 +0100
Message-ID: <CAMhs-H_ojHprCxsRwfXo_xavSYv9YH0eppg9ZobscvQamcDNxg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as maintainer of the Ralink architecture
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	linux-mips@vger.kernel.org, john@phrozen.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 1:43=E2=80=AFPM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Tue, Nov 21, 2023 at 10:02=E2=80=AFAM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> >
> > On Mon, Nov 20, 2023 at 08:59:25PM +0100, Sergio Paracuellos wrote:
> > > On Wed, Oct 25, 2023 at 2:58=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > > <philmd@linaro.org> wrote:
> > > >
> > > > On 22/10/23 11:06, Sergio Paracuellos wrote:
> > > > > Its been a while since I am making contributions to this architec=
ture.
> > > > > Hence add myself as maintainer.
> > > > >
> > > > > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > > > > ---
> > > > > Hi John, if you are not ok with this please let me know. In other=
 case
> > > > > please ack this patch. I can add myself as Reviewer if you prefer=
 to
> > > > > maintain alone this.
> > > > >
> > > > > Thanks in advance for your time!
> > > > >
> > > > > Best regards,
> > > > >      Sergio Paracuellos
> > > > >
> > > > >   MAINTAINERS | 1 +
> > > > >   1 file changed, 1 insertion(+)
> > > >
> > > > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > > >
> > >
> > > Thomas, can you take this patch through the mips tree?
> >
> > sure
>
> Thanks!

Gentle ping for this patch :)

Thanks,
    Sergio Paracuellos
>
> Best regards,
>     Sergio Paracuellos
>
> >
> > Thomas.
> >
> > --
> > Crap can work. Given enough thrust pigs will fly, but it's not necessar=
ily a
> > good idea.                                                [ RFC1925, 2.=
3 ]

