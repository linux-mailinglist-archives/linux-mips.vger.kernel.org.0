Return-Path: <linux-mips+bounces-12557-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E9CD8771
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 09:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EF1B300C2BF
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 08:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0CE31ED67;
	Tue, 23 Dec 2025 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SI1GrNwT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153A731E0F7
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479202; cv=none; b=ZMdSPqkkuo2WUyDK3nqji6BWnP5I7MUjcvkkdyLAvEOS6Pctu0kGsPy8qs3m2HEDg0RghcWpLqqjx7S9PYeyHi5uhBa8iBi4B6ItHWgg2aQPNZfqKKc1yXD9iTXanKqher4HMqHc+oT+8A5bIFmcE4BSUBmJXqKpJ2buNHItKAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479202; c=relaxed/simple;
	bh=24X1wEJ+RxZTpNOevrdGVIwC/IfL4R+5yRGPun1LA/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QVgg+VnSairCNcB3dgouc5hOUE0nWsH+UvvpuP6SZFJgZ+cB2xvOmOvwUxsE1JsTRBu+IldUteF+C324p1tG1QLDNDWN+S43XD/4W4Hgjv/TQPOXdRyU8ze1WTRMIeDLPSqvVo3x9Juv7Uz0gx3h7Yu1kG4bfsWPvMfYZcTwOAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SI1GrNwT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C951EC19423
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 08:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766479201;
	bh=24X1wEJ+RxZTpNOevrdGVIwC/IfL4R+5yRGPun1LA/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SI1GrNwTh1aENVuZrTTkdBUjXviVhnA0AySO6cHPnLIHASnw88V9FhdH89+pn6BSQ
	 uIlwpVObzn3Npeht2OEeQht24mhyqt4n0T6nHrWH+C6I4pL9CvdRpzi7y74R6VGpz9
	 KlULm0Ty/BurEIttuQ0kAvFITE9VT4POC0wiOCy+TmfU91O4eNttNjcFfC/gLoGkZk
	 pIQj5Mu8JSoNR6Zs7XARkHi9038BYkPq7AnUyVA8UTKBxEiTF0dmTQha5I3vsIcqdq
	 94ssVi2H79ic7ipMtfjYH//IHKe73Q6HSGomRAuh9ZZftglZcFNbuKoGHzdWPC+oQK
	 E9b8YF7hRO0UQ==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso3908300a12.0
        for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 00:40:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9SAtNV0B5tkz20IbUBr1QSVe5EQI/JJg00kvyEC1MDd8DFwDuFvpxgY5pju1ckVdOosvCtQ0wHYvB@vger.kernel.org
X-Gm-Message-State: AOJu0YwNYxg+zOUES8tzM3iWDpsZg3UucSf0JIqOyL09qMJXHtePRKCI
	V3JqT/dSU97jdECxRuz3CZE26OYoiMULTWoek7f/p2Jk7ni4LrQaUUjVag9AxEHw+wR//wWRhDr
	4Y8GcTje5/LUaj2YV/+p/wXUUlh+zCrU=
X-Google-Smtp-Source: AGHT+IGueURUFYuxtJeDk5ObxUkBLLajrTw98wKcfc6o8XGNqjbSlX7X2SoBHhJCvbmjyWlANxYNg8KttlKo69hdDYQ=
X-Received: by 2002:a17:907:7f0d:b0:b80:12f5:f6aa with SMTP id
 a640c23a62f3a-b803722927amr1632952966b.56.1766479200241; Tue, 23 Dec 2025
 00:40:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1766471839.git.zhoubinbin@loongson.cn> <6e10c70653b32f1f79e3f98116924e1aad7154bf.1766471839.git.zhoubinbin@loongson.cn>
In-Reply-To: <6e10c70653b32f1f79e3f98116924e1aad7154bf.1766471839.git.zhoubinbin@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 23 Dec 2025 16:40:15 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5WfEhsV4fEzThR-C95cg0nPpJ+OfQ10NXEsFKneJQQ5A@mail.gmail.com>
X-Gm-Features: AQt7F2rIkBs3EpQ6a0FQruc11Cj7yTdN5a2QCW2gUTjiMusHb4CpIzOPN_sq7nY
Message-ID: <CAAhV-H5WfEhsV4fEzThR-C95cg0nPpJ+OfQ10NXEsFKneJQQ5A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] rtc: loongson: Add Loongson-2K0300 support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Xiaochuang Mao <maoxiaochuan@loongson.cn>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
	Keguang Zhang <keguang.zhang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Binbin,

On Tue, Dec 23, 2025 at 2:42=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn=
> wrote:
>
> The Loongson-2K0300's rtc hardware design is similar to that of the
> Loongson-1B, but it does not support the alarm feature.
>
> Introduce `LOONGSON_RTC_ALARM_WORKAROUND`, which indicates a chip that
> does not support the alarm function, and rewritethe related logic in
> `loongson_rtc_alarm_setting()`
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  drivers/rtc/rtc-loongson.c | 65 ++++++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/rtc/rtc-loongson.c b/drivers/rtc/rtc-loongson.c
> index 2ca7ffd5d7a9..6b076bd4e24e 100644
> --- a/drivers/rtc/rtc-loongson.c
> +++ b/drivers/rtc/rtc-loongson.c
> @@ -67,6 +67,7 @@
>   * Accessing the relevant registers will cause the system to hang.
>   */
>  #define LS1C_RTC_CTRL_WORKAROUND       BIT(0)
> +#define LOONGSON_RTC_ALARM_WORKAROUND  BIT(1)
Can we reuse existing logic, which means "alarm_irq =3D
platform_get_irq(pdev, 0)" return 0 for LS2K0300?

Huacai

>
>  struct loongson_rtc_config {
>         u32 pm_offset;  /* Offset of PM domain, for RTC alarm wakeup */
> @@ -89,7 +90,7 @@ static const struct loongson_rtc_config ls1b_rtc_config=
 =3D {
>
>  static const struct loongson_rtc_config ls1c_rtc_config =3D {
>         .pm_offset =3D 0,
> -       .flags =3D LS1C_RTC_CTRL_WORKAROUND,
> +       .flags =3D LS1C_RTC_CTRL_WORKAROUND | LOONGSON_RTC_ALARM_WORKAROU=
ND,
>  };
>
>  static const struct loongson_rtc_config generic_rtc_config =3D {
> @@ -97,6 +98,11 @@ static const struct loongson_rtc_config generic_rtc_co=
nfig =3D {
>         .flags =3D 0,
>  };
>
> +static const struct loongson_rtc_config ls2k0300_rtc_config =3D {
> +       .pm_offset =3D 0x0,
> +       .flags =3D LOONGSON_RTC_ALARM_WORKAROUND,
> +};
> +
>  static const struct loongson_rtc_config ls2k1000_rtc_config =3D {
>         .pm_offset =3D 0x800,
>         .flags =3D 0,
> @@ -299,9 +305,41 @@ static const struct rtc_class_ops loongson_rtc_ops =
=3D {
>         .alarm_irq_enable =3D loongson_rtc_alarm_irq_enable,
>  };
>
> +static int loongson_rtc_alarm_setting(struct platform_device *pdev, void=
 __iomem *regs)
> +{
> +       int ret =3D 0, alarm_irq;
> +       struct device *dev =3D &pdev->dev;
> +       struct loongson_rtc_priv *priv =3D dev_get_drvdata(dev);
> +
> +       if (priv->config->flags & LOONGSON_RTC_ALARM_WORKAROUND) {
> +               /* Loongson-1C/Loongson-2K0300 RTC does not support alarm=
 */
> +               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> +               return 0;
> +       }
> +
> +       /* Get RTC alarm irq */
> +       alarm_irq =3D platform_get_irq(pdev, 0);
> +       if (alarm_irq < 0)
> +               return alarm_irq;
> +
> +       ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_isr, 0, "lo=
ongson-alarm",
> +                              priv);
> +       if (ret < 0)
> +               return ret;
> +
> +       priv->pm_base =3D regs - priv->config->pm_offset;
> +       device_init_wakeup(dev, true);
> +
> +       if (has_acpi_companion(dev))
> +               acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> +                                                loongson_rtc_handler, pr=
iv);
> +
> +       return ret;
> +}
> +
>  static int loongson_rtc_probe(struct platform_device *pdev)
>  {
> -       int ret, alarm_irq;
> +       int ret;
>         void __iomem *regs;
>         struct loongson_rtc_priv *priv;
>         struct device *dev =3D &pdev->dev;
> @@ -330,25 +368,9 @@ static int loongson_rtc_probe(struct platform_device=
 *pdev)
>                 return dev_err_probe(dev, PTR_ERR(priv->rtcdev),
>                                      "devm_rtc_allocate_device failed\n")=
;
>
> -       /* Get RTC alarm irq */
> -       alarm_irq =3D platform_get_irq(pdev, 0);
> -       if (alarm_irq > 0) {
> -               ret =3D devm_request_irq(dev, alarm_irq, loongson_rtc_isr=
,
> -                                      0, "loongson-alarm", priv);
> -               if (ret < 0)
> -                       return dev_err_probe(dev, ret, "Unable to request=
 irq %d\n",
> -                                            alarm_irq);
> -
> -               priv->pm_base =3D regs - priv->config->pm_offset;
> -               device_init_wakeup(dev, true);
> -
> -               if (has_acpi_companion(dev))
> -                       acpi_install_fixed_event_handler(ACPI_EVENT_RTC,
> -                                                        loongson_rtc_han=
dler, priv);
> -       } else {
> -               /* Loongson-1C RTC does not support alarm */
> -               clear_bit(RTC_FEATURE_ALARM, priv->rtcdev->features);
> -       }
> +       ret =3D loongson_rtc_alarm_setting(pdev, regs);
> +       if (ret)
> +               return ret;
>
>         /* Loongson RTC does not support UIE */
>         clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, priv->rtcdev->features);
> @@ -379,6 +401,7 @@ static const struct of_device_id loongson_rtc_of_matc=
h[] =3D {
>         { .compatible =3D "loongson,ls1b-rtc", .data =3D &ls1b_rtc_config=
 },
>         { .compatible =3D "loongson,ls1c-rtc", .data =3D &ls1c_rtc_config=
 },
>         { .compatible =3D "loongson,ls7a-rtc", .data =3D &generic_rtc_con=
fig },
> +       { .compatible =3D "loongson,ls2k0300-rtc", .data =3D &ls2k0300_rt=
c_config },
>         { .compatible =3D "loongson,ls2k1000-rtc", .data =3D &ls2k1000_rt=
c_config },
>         { /* sentinel */ }
>  };
> --
> 2.47.3
>
>

