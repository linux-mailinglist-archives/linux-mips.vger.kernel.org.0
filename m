Return-Path: <linux-mips+bounces-9307-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619EAD9A7F
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 08:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B85F2167701
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 06:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2467323DE;
	Sat, 14 Jun 2025 06:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeGMx98B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC4424B26;
	Sat, 14 Jun 2025 06:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749883448; cv=none; b=az5sXLAynrpOQF0/PrnDFeGU7dyMlJ3NxNA8aw/Pkgi/TgvkwEdS8VT8Z90gzi+N6jHZgfLbfjZ+ZWE2sVXR4TiNyhC0MsQOco4MBKa3A9N3imvnucZu5WK05udbVOlfLFbFeiAaRILfB/7s9moQCgwzpGcwvmUkSgJvVD00rSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749883448; c=relaxed/simple;
	bh=uFeEf04w0FItbYLGv7+ZkbLcd6rT7x/V327qJ7Ye52I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdiG14WZRST2CDTLeEfs8wEoyvDGOVn5b4klOwUxYhI98ZlYg0dAJOWDvqTgGX1Q71WldEkGkNTNuc1feM3TK+lTkfWYCgjzP7rY0SGOsaxJUucos9DSrKs5Mdm9QzjM2WvzkylJKGyK7zP/ayDFGWEnIO96W2gjz+B2+U+Uubg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeGMx98B; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so2660966a91.2;
        Fri, 13 Jun 2025 23:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749883446; x=1750488246; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcRCL1SokYaqLL5dVtRUxjV22mE+NnBNl5+hV7T5zY8=;
        b=QeGMx98Bm4Z3cgjrXKmLZOqf+9wXyht1dVuTI2XQA0MMPu1boQdX/9i1Oxnm0/NoDe
         eqDg9TfmKMZTneB0l8srzf59Fi/6bcnR9TQ03oYbAPPbQrJFVINVL9ZdzRJvhwkdNowf
         UYyvv3+qjF0LykxixMzmSpNFG8gD3s9iu9MC9V2YDQfgjEiLF7VjnNEQTk9ZGHSFDus/
         vDZAl44WUiM1saviwJdOygN6G0N3smRwiiiA0tBlhu4hgAxZkccwT288YMz8SUZC7suS
         12cNNisbalKsdNhEYQL/aNdg6AA5vKu1TBcDyfSwKNt5Ub4mpN2LIroU7R7lb6R+XWcl
         NzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749883446; x=1750488246;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcRCL1SokYaqLL5dVtRUxjV22mE+NnBNl5+hV7T5zY8=;
        b=jM3o2DYJuwLxqr4K07Nj0ivACX3b0rvgBlw7c/DiOXZyydiuQ2fQbBnwvnSwLRSBXU
         I4/8GM+lDkSyweKVFZSIXhh3y51HMc0144L/64TmKqO/0hCjNBqHeX0YzkV1qV3faWwn
         fRFqG9sfMSeAZjdol7d/uLyDPzDUCQMQLXGKL0cCq/jPLOvQ1WUv8TGdUA3zkjOVTggq
         QfRqD8aaGmwsf9TobBEIDQDK8sesUQ2ZlIE/sa/X7O6bRLGJifov9H4j9hkmYx5tCO5f
         Va4ttc7Gr8qdERTUXq1TtpERxFhxPB6xmh8hqXPFnzO9iGyYl3QHllb2oInl19CZ+tT4
         Kb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVOi/L1CxYIRpkQfjBLXG/ekLbhoDkq/74GYizXPFRWYHLuQPwzHv6yzq+oKz4m1vLy2wGpBzjndQlQWA==@vger.kernel.org, AJvYcCWoZRNI4hFfcCquoTUvYAd6QD1nkD9LO1llaEaaQAt+z18HSDGzo/Mvr+qzDiBMKxJJU1H8duKSegzL@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+qBg4Pyj7U+FdurpMbBpv/p2nRuWEWO3Pgsg1kVwTjYakVdd
	MuB3qkc5B6Rc7F/lRGomzv/zOApPCSHqmb1rFY1FozhvVwDgITCrT1lh+vAWsKOlQvJTFgvKoiR
	40ezwGckvXMTlLsoMMdMED0A5IfyOVy8=
X-Gm-Gg: ASbGncuv+QUDQF8gjnT2aN8YSaH1mI4V+KTjkxZ/Dz88F4di1M2gjJ/vSJCsoiBWwBX
	6QkUUv4ohuFHzHM3kGgWVucQrnO0+gj9JzfRjt+f8odNiqwqk5WVlATM1+1VYOEt4dj2mLTobCy
	oYdDPVObZJIoQkFZnsUOHJUcSSh4dvOc5agdm+ZmgA
X-Google-Smtp-Source: AGHT+IFhHSRTUmK1ZpGtdL9mQzEytJxUfzkCmxFy38uMm/0KW86o6Q0gsTIAGuLmF0aTDLs2Fqhd/51xRW+GxDMll0w=
X-Received: by 2002:a17:90b:4a92:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-313f1ca8cf7mr3067835a91.8.1749883445726; Fri, 13 Jun 2025
 23:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611194716.302126-1-ezra@easyb.ch> <20250611194716.302126-2-ezra@easyb.ch>
 <e2ffca36-d2ed-4253-86a6-a990e7931ba0@kernel.org> <CAM1KZSkcc8wh7yuJ-26ASKSehjWfD_QGs0JrKOWm+WMfXiY+DA@mail.gmail.com>
 <9a23e0e5-f48c-41a9-8e15-69cdfbc7eca2@kernel.org> <CAM1KZSkKUYcsx_gpvtEaz7hoT-KfJmQ0xHeFYEGMSZ7FEBDyjA@mail.gmail.com>
 <2ca2da8f-92b9-475f-aa41-bd54a95bfc69@kernel.org> <CAM1KZSmLwLopU8rVrPS+wFqAGZn-7LdsikEg6p2f93EiK9_2_Q@mail.gmail.com>
 <864cd33e-94d4-4ceb-a8dd-1b525f7bbf26@kernel.org> <CAM1KZSnAKee2UvGbNwaAq7cevpRcnFiCYixHHneafbDRH9+uyw@mail.gmail.com>
 <CAMhs-H9zna3TV5SvQw9SGvfvdGRJiwkhGa-s3OKvMqtXp9OEcQ@mail.gmail.com> <CAM1KZSkwBf42YEJOrEv1dErt_8dj=njBWvU2Dd5jaGfUwz5=RA@mail.gmail.com>
In-Reply-To: <CAM1KZSkwBf42YEJOrEv1dErt_8dj=njBWvU2Dd5jaGfUwz5=RA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 14 Jun 2025 08:43:54 +0200
X-Gm-Features: AX0GCFudkEuVvqXvGiDXfFbkvTvg8llDh0y-Vt4GvYQBVNrOizO8UAg6YVispyA
Message-ID: <CAMhs-H-XJme6u-XjDqA2vYubT1KZ3zkc+V6t2WTD9g=V+aKxRA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] MIPS: dts: ralink: mt7628a: Fix sysc's compatible
 property for MT7688
To: Ezra Buehler <ezra@easyb.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mips@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Reto Schneider <reto.schneider@husqvarnagroup.com>, 
	Rob Herring <robh@kernel.org>, Stefan Roese <sr@denx.de>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org, 
	Ezra Buehler <ezra.buehler@husqvarnagroup.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 14, 2025 at 7:47=E2=80=AFAM Ezra Buehler <ezra@easyb.ch> wrote:
>
> On Sat, Jun 14, 2025 at 7:01=E2=80=AFAM Sergio Paracuellos
> <sergio.paracuellos@gmail.com> wrote:
> >
> > Hi Ezra,
> >
> > On Fri, Jun 13, 2025 at 7:40=E2=80=AFPM Ezra Buehler <ezra@easyb.ch> wr=
ote:
> > >
> > > On Fri, Jun 13, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > > > On 13/06/2025 14:56, Ezra Buehler wrote:
> > > > > On Fri, Jun 13, 2025 at 2:41=E2=80=AFPM Krzysztof Kozlowski <krzk=
@kernel.org> wrote:
> > > > >> That's not a binding, but driver, so obviously it is fine since =
you are
> > > > >> not removing it from bindings.
> > > > >
> > > > > And, if we also remove all occurrences of "ralink,mt7688-sysc" fr=
om the
> > > > > code, as it is not needed from a technical standpoint, can we rem=
ove it
> > > > > from mediatek,mtmips-sysc.yaml or is there no going back?
> > > > But it is needed. MT7688 needs it to fulfill the DT bindings requir=
ement
> > > > (see writing bindings): specific compatible.
> > >
> > > I see. In that case, it seems to me that the only reasonable solution=
 is
> > > to adapt the bindings (mediatek,mtmips-sysc.yaml) and go forward with
> > > the initial patch.
> >
> > Compatibles in ralink are a bit messy historically since there are
> > platforms that are pretty similar and were developed before having
> > proper bindings mainlined, For example, as you said, mt7628 and mt7688
> > are pretty similar but having wildcard mt76x8 was not an option since
> > specific compatibles are mandatory, so I ended introducing also the
> > mt7688-sysc in bindings to match MT762X_SOC_MT7688 type [0].
> >
> > I have checked also openWRT tree and I think just modifying clk.c [1]
> > returning the expected sysc would be a valid and functional approach:
> >
> >  diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
> >  index 9db73fcac522..7ce9acec3a01 100644
> >  --- a/arch/mips/ralink/clk.c
> >  +++ b/arch/mips/ralink/clk.c
> >  @@ -48,11 +48,9 @@ static const char *clk_cpu(int *idx)
> >                  *idx =3D 2;
> >                   return "ralink,mt7620-sysc";
> >           case MT762X_SOC_MT7628AN:
> >                   *idx =3D 1;
> >                   return "ralink,mt7628-sysc";
> >          case MT762X_SOC_MT7688:
> >                  *idx =3D 1;
> >  -               return "ralink,mt7688-sysc";
> >  +               return "ralink,mt7628-sysc";
> >          default:
> >                  *idx =3D -1;
> >                  return "invalid";
> >
> > Since you are not touching bindings at all but driver code, it should b=
e ok.
> >
>
> The issue I see here is that if someone decides to put
>
> compatible =3D "ralink,mt7688-sysc", "syscon";
>
> into their DT, which seems very reasonable, the system will not boot.
> Therefore, I would not go with that change unless one removes support
> for ralink,mt7688-sysc all together.

Yes, you are right. Properly fixing it would be the correct thing to
do. I was talking only about the already available platforms in the
openWRT tree which seems to not be using that compatible at all.

I'll wait for your patches, then :-).

Thanks,
    Sergio Paracuellos
>
> Cheers,
> Ezra.

