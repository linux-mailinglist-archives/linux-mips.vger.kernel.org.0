Return-Path: <linux-mips+bounces-12559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A71FACD8820
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:09:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 457FF3012748
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 09:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F8430B52B;
	Tue, 23 Dec 2025 09:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbf1xjGZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B03A230BE9
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766480975; cv=none; b=u4+xGx58S/8wyQ+JJKEjdx5WG3Uh4meEiT8UDAMFMOz7qSADoRfwBVEv3xfnsgRBs/cjjN/JGCTApdGpFh5Ngw18CiAEA6cMpzwr5PVThE8JZrn0ijeLwx9EEqXTTCs6eztxEGrFld61s4ksLSQNULX6NrZqXCeJUt/wS6iJjLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766480975; c=relaxed/simple;
	bh=aijJLNBS9FZrpQNJH65aBhLFlhQt68MEzRvn16zEJK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ker75FU4ezlMQYlKWNDz60kMOkarKr/oRrGR2CeGzd2QonIHKCxK/r0xHEBL0LQK2pVVxFyn+SwRmWrnqEzvBhvUsAa0C2tDglZIVjby8rvh0t1IV+nXB/B7wkm35ZLLtG/pgYCwP+7XU9vTYUWA7HJzLC+tLjgkPz/LORzwKi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbf1xjGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A469BC116B1
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766480974;
	bh=aijJLNBS9FZrpQNJH65aBhLFlhQt68MEzRvn16zEJK4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qbf1xjGZyJPPrQLNc1knLr4X5mvvj/UD1sZqYKd9YaEdmU6a3cT6srUeH+VezYcGy
	 ex7Z53ylPdiM0cGII/1qKNIURYjM7ewGSNCf4tnBhvKOePVDDX/hnh7EgQhEQcnMyZ
	 ax0N9mxAoKLEwGpZILPpkCMEQx7PHk+v22VIQaUGOr2K6pNqRlUr+KX0BYC85SLA9Q
	 xglJcdcrPqLrIQYJy4TRcbXHcMPKWGJFG6I8OCdFizBJhrQNskhDWPt0QOySBedZXA
	 B6KcTOsGQeiRbxvwsgbUNRykiPlb0tyNhoggyuWQAk52ISowlsxAJY0G6h9/Lkk6eC
	 LRrHhqlOvQoeQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso584248366b.3
        for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 01:09:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXHOvURdl76HWdHs1cOEjrFLiWEoKGO4qigNYuaKIZW6L8jSwTsO1Qk8jHYo9DJj9lt07s2cA8E5Gt@vger.kernel.org
X-Gm-Message-State: AOJu0YyDSr//zAmxTlP4izxkmiWB9dbJaP+QFYtYHOs0bvB1QWCPdhrw
	Jcz1OcYXpJq85mAe63FG7jfd2SwDCTYcvhmPI9Awp5mQ8klffsQS+XXv+xIunIfa8vjsRyIrHSq
	ZjcC2vZwo13i8isgB3tIyZiE0XnnHiow=
X-Google-Smtp-Source: AGHT+IHCH6qRyZ+LlGBGWAYWrVVBBEch+kme5XPnOA4eZ76YfYm6U2BH2/2ZNnC0lBPNJTuHr9jtEQ0+kOgXTjemH0w=
X-Received: by 2002:a17:907:96a7:b0:b33:b8bc:d1da with SMTP id
 a640c23a62f3a-b8036f11019mr1350206266b.1.1766480973213; Tue, 23 Dec 2025
 01:09:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn> <6e10c70653b32f1f79e3f98116924e1aad7154bf.1766471839.git.zhoubinbin@loongson.cn>
 <CAAhV-H5WfEhsV4fEzThR-C95cg0nPpJ+OfQ10NXEsFKneJQQ5A@mail.gmail.com> <CAMpQs4LMkq6BpsrnS+e+cvh2hJshO4=41vX4ETq+tkJEMZ7zdA@mail.gmail.com>
In-Reply-To: <CAMpQs4LMkq6BpsrnS+e+cvh2hJshO4=41vX4ETq+tkJEMZ7zdA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Dec 2025 17:09:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6VEnKZwoDc3zMWXQZ6BLrnq=rb9nQLdrSouOcMah3feg@mail.gmail.com>
X-Gm-Features: AQt7F2rnk7HaqDKh4LbatbnGFaCLAWIN8Ox6DiUferozFlqUt2UftDcMfuBBg4w
Message-ID: <CAAhV-H6VEnKZwoDc3zMWXQZ6BLrnq=rb9nQLdrSouOcMah3feg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] rtc: loongson: Add Loongson-2K0300 support
To: Binbin Zhou <zhoubb.aaron@gmail.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 5:06=E2=80=AFPM Binbin Zhou <zhoubb.aaron@gmail.com=
> wrote:
>
> Hi:
>
>
> On Tue, Dec 23, 2025 at 4:40=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > Hi, Binbin,
> >
> > On Tue, Dec 23, 2025 at 2:42=E2=80=AFPM Binbin Zhou <zhoubinbin@loongso=
n.cn> wrote:
> > >
> > > The Loongson-2K0300's rtc hardware design is similar to that of the
> > > Loongson-1B, but it does not support the alarm feature.
> > >
> > > Introduce `LOONGSON_RTC_ALARM_WORKAROUND`, which indicates a chip tha=
t
> > > does not support the alarm function, and rewritethe related logic in
> > > `loongson_rtc_alarm_setting()`
> > >
> > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > ---
> > >  drivers/rtc/rtc-loongson.c | 65 ++++++++++++++++++++++++++----------=
--
> > >  1 file changed, 44 insertions(+), 21 deletions(-)
> > >
> > > diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> > > index 2ca7ffd5d7a9..6b076bd4e24e 100644
> > > --- a/drivers/rtc/rtc-loongson.c
> > > +++ b/drivers/rtc/rtc-loongson.c
> > > @@ -67,6 +67,7 @@
> > >   * Accessing the relevant registers will cause the system to hang.
> > >   */
> > >  #define LS1C_RTC_CTRL_WORKAROUND       BIT(0)
> > > +#define LOONGSON_RTC_ALARM_WORKAROUND  BIT(1)
> > Can we reuse existing logic, which means "alarm_irq =3D
> > platform_get_irq(pdev, 0)" return 0 for LS2K0300?
>
> First of all, as I understand it, platform_get_irq() doesn't normally
> return 0 unless interrupt 0 is configured in the DTS, which doesn't
> seem appropriate.
>
> Also, the return value of platform_get_irq() was previously used to
> determine if the alarm feature was supported, which is not
> particularly accurate. It should be an inherent feature of the chip,
> and I think it would be more appropriate to define it in
> loongson_rtc_config.
OK, then I think it is better to rename LS1C_RTC_CTRL_WORKAROUND to
LOONGSON_RTC_CTRL_WORKAROUND for consistency.

Huacai

> >
> > Huacai
> >
> > >
> > >  struct loongson_rtc_config {
> > >         u32 pm_offset;  /* Offset of PM domain, for RTC alarm wakeup =
*/
> > > @@ -89,7 +90,7 @@ static const struct loongson_rtc_config ls1b_rtc_co=
nfig =3D {
> > >
> > >  static const struct loongson_rtc_config ls1c_rtc_config =3D {
> > >         .pm_offset =3D 0,
> > > -       .flags =3D LS1C_RTC_CTRL_WORKAROUND,
> > > +       .flags =3D LS1C_RTC_CTRL_WORKAROUND | LOONGSON_RTC_ALARM_WORK=
AROUND,
> > >  };
> > >
> > >  static const struct loongson_rtc_config generic_rtc_config =3D {
> > > @@ -97,6 +98,11 @@ static const struct loongson_rtc_config generic_rt=
c_config =3D {
> > >         .flags =3D 0,
> > >  };
> > >
> > > +static const struct loongson_rtc_config ls2k0300_rtc_config =3D {
> > > +       .pm_offset =3D 0x0,
> > > +       .flags =3D LOONGSON_RTC_ALARM_WORKAROUND,
> > > +};
> > > +
> > >  static const struct loongson_rtc_config ls2k1000_rtc_config =3D {
> > >         .pm_offset =3D 0x800,
> > >         .flags =3D 0,
> > > @@ -299,9 +305,41 @@ static const struct rtc_class_ops loongson_rtc_o=
ps =3D {
> > >         .alarm_irq_enable =3D loongson_rtc_alarm_irq_enable,
> > >  };
> > >
> > > +static int loongson_rtc_alarm_setting(struct platform_device *pdev, =
void __iomem *regs)
> > > +{
> > > +       int ret =3D 0, alarm_irq;
> > > +       struct device *dev =3D &pdev->dev;
> > > +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> > > +
> > > +       if (priv->config->flags & LOONGSON_RTC_ALARM_WORKAROUND) {
> > > +               /* Loongson-1C/Loongson-2K0300 RTC does not support a=
larm */
> > > +               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> > > +               return 0;
> > > +       }
> > > +
> > > +       /* Get RTC alarm irq */
> > > +       alarm_irq =3D platform_get_irq(pdev, 0);
> > > +       if (alarm_irq < 0)
> > > +               return alarm_irq;
> > > +
> > > +       ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_isr, 0,=
 "loongson-alarm",
> > > +                              priv);
> > > +       if (ret < 0)
> > > +               return ret;
> > > +
> > > +       priv->pm_base =3D regs - priv->config->pm_offset;
> > > +       device_init_wakeup(dev, true);
> > > +
> > > +       if (has_acpi_companion(dev))
> > > +               acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> > > +                                                loongson_rtc_handler=
, priv);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > >  static int loongson_rtc_probe(struct platform_device *pdev)
> > >  {
> > > -       int ret, alarm_irq;
> > > +       int ret;
> > >         void __iomem *regs;
> > >         struct loongson_rtc_priv *priv;
> > >         struct device *dev =3D &pdev->dev;
> > > @@ -330,25 +368,9 @@ static int loongson_rtc_probe(struct platform_de=
vice *pdev)
> > >                 return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
> > >                                      "devm_rtc_allocate_device failed=
\n");
> > >
> > > -       /* Get RTC alarm irq */
> > > -       alarm_irq =3D platform_get_irq(pdev, 0);
> > > -       if (alarm_irq > 0) {
> > > -               ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc=
_isr,
> > > -                                      0, "loongson-alarm", priv);
> > > -               if (ret < 0)
> > > -                       return dev_err_probe(dev, ret, "Unable to req=
uest irq %d\n",
> > > -                                            alarm_irq);
> > > -
> > > -               priv->pm_base =3D regs - priv->config->pm_offset;
> > > -               device_init_wakeup(dev, true);
> > > -
> > > -               if (has_acpi_companion(dev))
> > > -                       acpi_install_fixed_event_handler(ACPI_EVENT_R=
TC,
> > > -                                                        loongson_rtc=
_handler, priv);
> > > -       } else {
> > > -               /* Loongson-1C RTC does not support alarm */
> > > -               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> > > -       }
> > > +       ret =3D loongson_rtc_alarm_setting(pdev, regs);
> > > +       if (ret)
> > > +               return ret;
> > >
> > >         /* Loongson RTC does not support UIE */
> > >         clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->feature=
s);
> > > @@ -379,6 +401,7 @@ static const struct of_device_id loongson_rtc_of_=
match[] =3D {
> > >         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1b_rtc_co=
nfig },
> > >         { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1c_rtc_co=
nfig },
> > >         { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc=
_config },
> > > +       { .compatible =3D "loongson,ls2k0300-rtc", .data =3D &ls2k030=
0_rtc_config },
> > >         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k100=
0_rtc_config },
> > >         { /* sentinel */ }
> > >  };
> > > --
> > > 2.47.3
> > >
> > >
>
> --
> Thanks.
> Binbin

