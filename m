Return-Path: <linux-mips+bounces-9305-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC465AD9A23
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 07:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 133223B6B1F
	for <lists+linux-mips@lfdr.de>; Sat, 14 Jun 2025 05:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEDE2AE8B;
	Sat, 14 Jun 2025 05:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtTNXZc4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769E2E11DD;
	Sat, 14 Jun 2025 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749877280; cv=none; b=ppRTzfmMkm3ZyAHZSfi4ukm68znvRMMdhWhYRXiZ7vVvrHMPofXe//Hpck7Nn8pEVUdeO7vGsdmqJruuarfGIUtJOcssWX2IzpKCXiz79hNqvd5KoXrssqmOjO0Hx7FLm6c3QZmcClakluHAl3o+UVem9PLv0b00iOn4cFLSzVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749877280; c=relaxed/simple;
	bh=FZpNYsq69LeSEgl2r04MJpdIvhbJECCMX0qXigvn2MI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBO04wMwOIcp1I1wY9iJXPoli8rG9DUsrwBk8EkKxiqZ160ESTurvvuXPmn6DwUaPJR25HM5P4e60KXdey7XOdeM5x0RvtZdnqniv+2kux5FvZKnd86DIhgwFLQEi2yDPGYtOBwo6eQRK9vqOGr/Uhh75cTvDx0RsFNPQ+5mKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtTNXZc4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso3141785a91.3;
        Fri, 13 Jun 2025 22:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749877278; x=1750482078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m68LVNOOFON/7Twl5heEoS1jO1AO56f5JjZe1ydmSQA=;
        b=RtTNXZc4Rzlk6qF6EsCz3OgAd5me54sxTA2puqFDzPMg5rrokXH+hYgoruFx58cIU4
         3zMEmQ+pxHnqQNiJ2cgvpGfBnsAm87HsVbbWFSTYGzkUTgv1i+ej4JX26JmubD4wceo5
         1VPrprQQDpqbnF9V1AenKgre5TcOirwuyGI7/aBBmliruc4JSkv2rMMeUHcBUg99QYNz
         SGEdrftC96/cZDT6fv2fLQ7Rhz6GqGpEfygHSoPFmMMAsjyeXJ78v4cddM+PPwfGm7uy
         X7Cz3+Vcojqkv23rwqVAe6zHZi0ok/SDXO1MeFEibpwGXv+PG8NKYgUG+NP1rYJY+F9m
         46NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749877278; x=1750482078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m68LVNOOFON/7Twl5heEoS1jO1AO56f5JjZe1ydmSQA=;
        b=mmaNmb42HTslGiq3Ey2JEVVtarKt2Dzi9hAM/8EaGsfBciVfeDX/G9MX3TxT9XeXde
         y79STaykXver0VpSJdkv1jQ4ucKIy58ST7yl2lqjAxi/GjWNTrnNbvx7L0v9FoznAYM5
         sWO0SfyWjqyNYlttpWxyb+yxD3XMKOmYx+nQU6Jf45UxvvkiSjR+If9AGZl/XQDlV4uD
         lv+LEbSv9HroVCPquIl5pbLrHowS/goJ+1RDhP91eHy2WKdAKkNI0n0KxFJD9ivvtp+u
         rin/jWqmscjRlT4GMOF1c0eULOppEiprUZ3stAwMZ1Ycv1AL22aPgrqLoA1C7hhJe4Jt
         VoCw==
X-Forwarded-Encrypted: i=1; AJvYcCVx5GMG6fA4iWyBI4uzWD7fA0+l3Mt2B2CG8lbH8dfhKL/OS6mWJALsXEGhuRUSYQPBXyJkyGzb6ryF@vger.kernel.org, AJvYcCXmV6nMw7rr0wAb+QfEmkE4FMj/RLBH8KxCs5VgoixkxogQlX3Un483glYBeXgKsU7V1XivTBkLYoZV6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGRS6CCEF1lkK93org+GPACFhi0vzAWu1B4jD1/leDR6nozW6f
	T/FCyDcsv/sHP39eMnEq41eQLmO+Rz6h0MoguXUECIDNAYVDXOVKOFCD2uK4HL0Ox2GI0CN/J4z
	ZiC/4Ck2S8mV/Pzhusnbs0rNgilVfjkP6WlV3
X-Gm-Gg: ASbGncvnECBtsIbqfiH4yiQ1abCArybWT6Rarsuws4Y/4TgRjzsbmJIMjsaWAyG/wi1
	+YPLhYMjQKyA4oKbGh2tVq4EppzOGk5B++PAWvnWgIb31VBftUKctgl//sXgSv8PwermOxA8h0r
	v5P6y7CxAFJQGRN+OiFycaxWZ+al8FEKKT3hdg+Wm3YFxGZhN/UB4=
X-Google-Smtp-Source: AGHT+IH/HhdFeMXiT3vDjp0KY8sVDl30RNmI6xGS4ZwyJ7AXXvZrwIKRXN0nXFCDoc4ctW+CAcnxpuZqtVgmuUtq8p8=
X-Received: by 2002:a17:90b:53ce:b0:313:23ed:6ff with SMTP id
 98e67ed59e1d1-313f1ca7758mr2761283a91.1.1749877277816; Fri, 13 Jun 2025
 22:01:17 -0700 (PDT)
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
In-Reply-To: <CAM1KZSnAKee2UvGbNwaAq7cevpRcnFiCYixHHneafbDRH9+uyw@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sat, 14 Jun 2025 07:01:09 +0200
X-Gm-Features: AX0GCFs6x-9Nn-sKsWlsg5KxB6MpmzmEv_yp5hT_Q3CrZI5AOfcqIiffGqaTSyU
Message-ID: <CAMhs-H9zna3TV5SvQw9SGvfvdGRJiwkhGa-s3OKvMqtXp9OEcQ@mail.gmail.com>
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

Hi Ezra,

On Fri, Jun 13, 2025 at 7:40=E2=80=AFPM Ezra Buehler <ezra@easyb.ch> wrote:
>
> On Fri, Jun 13, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> > On 13/06/2025 14:56, Ezra Buehler wrote:
> > > On Fri, Jun 13, 2025 at 2:41=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >> That's not a binding, but driver, so obviously it is fine since you =
are
> > >> not removing it from bindings.
> > >
> > > And, if we also remove all occurrences of "ralink,mt7688-sysc" from t=
he
> > > code, as it is not needed from a technical standpoint, can we remove =
it
> > > from mediatek,mtmips-sysc.yaml or is there no going back?
> > But it is needed. MT7688 needs it to fulfill the DT bindings requiremen=
t
> > (see writing bindings): specific compatible.
>
> I see. In that case, it seems to me that the only reasonable solution is
> to adapt the bindings (mediatek,mtmips-sysc.yaml) and go forward with
> the initial patch.

Compatibles in ralink are a bit messy historically since there are
platforms that are pretty similar and were developed before having
proper bindings mainlined, For example, as you said, mt7628 and mt7688
are pretty similar but having wildcard mt76x8 was not an option since
specific compatibles are mandatory, so I ended introducing also the
mt7688-sysc in bindings to match MT762X_SOC_MT7688 type [0].

I have checked also openWRT tree and I think just modifying clk.c [1]
returning the expected sysc would be a valid and functional approach:

 diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
 index 9db73fcac522..7ce9acec3a01 100644
 --- a/arch/mips/ralink/clk.c
 +++ b/arch/mips/ralink/clk.c
 @@ -48,11 +48,9 @@ static const char *clk_cpu(int *idx)
                 *idx =3D 2;
                  return "ralink,mt7620-sysc";
          case MT762X_SOC_MT7628AN:
                  *idx =3D 1;
                  return "ralink,mt7628-sysc";
         case MT762X_SOC_MT7688:
                 *idx =3D 1;
 -               return "ralink,mt7688-sysc";
 +               return "ralink,mt7628-sysc";
         default:
                 *idx =3D -1;
                 return "invalid";

Since you are not touching bindings at all but driver code, it should be ok=
.

Obviously if you want to adapt the bindings I will also check them
when you do so.

Thanks,
    Sergio Paracuellos

[0]: https://elixir.bootlin.com/linux/v6.15.1/source/arch/mips/include/asm/=
mach-ralink/ralink_regs.h#L28
[1]: https://elixir.bootlin.com/linux/v6.15.1/source/arch/mips/ralink/clk.c=
#L55
>
> Cheers,
> Ezra.

