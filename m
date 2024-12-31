Return-Path: <linux-mips+bounces-7212-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3AA9FEF7D
	for <lists+linux-mips@lfdr.de>; Tue, 31 Dec 2024 14:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FC941622A0
	for <lists+linux-mips@lfdr.de>; Tue, 31 Dec 2024 13:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E83119D06E;
	Tue, 31 Dec 2024 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8UX8Fn1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532D417BA1;
	Tue, 31 Dec 2024 13:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650415; cv=none; b=b6R6wy/Hjegv48reaNqtNE3lRzkAhTIlX53Ea7Z+YrMqaQjfnCb/wRO60rA4m/hKtZsvbGP39SQEPsW1SPr8ZwtxLzV/biS3DPt8Po/ENMRr4nZdpmx8+NjRH6EfusqCfj1m4f9mDamUfb855E1O8k80zZISCBlxqH4BW60kFpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650415; c=relaxed/simple;
	bh=KfgrrZJ+mAlsYPzOAypnjYcAigwmGANLSRGphhC8EBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZcZULUiX8QV08ouoGxLQLu1HIG/3WpJRiskSgq2ymzRkmC8U7MADa4KLyzPr+mpeiuspWi/uO499MgblFz51DqK+IeqwOQ9eYdynkRRPSnO+TFshHJQfG3BpP728OOZt1zUu3PkbN3G3MssppewKfSviI4NuKxX1rMV+SN3Yyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8UX8Fn1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3C3DC4CEDE;
	Tue, 31 Dec 2024 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735650415;
	bh=KfgrrZJ+mAlsYPzOAypnjYcAigwmGANLSRGphhC8EBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=m8UX8Fn1zCH286BfUOFaUdKtvvsYSqpYFqukR+PT5OzzMvXpookN9omInhXvPFpuo
	 wxP4z7RvCuTIsiQ1ZX22bhZ5uJBClgLk6SLfx6z0DJ+IRcraTLbkVHas6u9XFwkjOu
	 y5/7Q6WcP6fgVzPIrGa8Eoy04VpXaexhRU75Jd1EEzUk5TR2HeNO6OkON8G733z3Eo
	 dOHeOwgyspnZC8+i55oBxliB1xmCvpyEcZ0IFoshqVu2k2tjbpcoNQXrbRxQSIygdy
	 PRjfzkxVX+uIeMhDPU1yNqsxx7lpLcpSvZfXUO/CQhJ4ZZGwufSU93uL/QNJMou4Yx
	 rEa+A3LWmI0Cg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9e44654ae3so1631957966b.1;
        Tue, 31 Dec 2024 05:06:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUewUDlvq/cNFA+EZSbDu2NJesIm1cx+J7fbQZI8zgcfMCcfwdXCSyzRrBnAAy5dsTZM+mTKlr0uMgnnqk=@vger.kernel.org, AJvYcCUnpRdddY9N6sd+9OSqxK1Pk6lpsNxy9/hH400QI2hNiVPBLoARXH2Gfe53mf+7NyYDNQ5yiCuEmLO6xA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJeLZnaVdQ9BIj/vWticYqnaDhu7CU+Qxa+DNBWaZe547/nUq
	qDbARD8za+BxzPjHfdhqqKeDwP8SEOjiGnxz6MYD6NDVTaBEGaOSa5dFXAbZP1f2QYJAn8czW23
	RSpMi0SWUpqeu2sopPwJ+sNWnJw4=
X-Google-Smtp-Source: AGHT+IFSx/947s8m9GWgy9SlMypMeVfzuFH8XW9Z81uquP4B8HzUQzykMtfOwHEh8fXdgae4EWaj91v7L9Z5Mj/CmsQ=
X-Received: by 2002:a17:906:dc91:b0:aaf:300b:d1f7 with SMTP id
 a640c23a62f3a-aaf300bd28fmr1035730966b.13.1735650413529; Tue, 31 Dec 2024
 05:06:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213035026.1643517-1-maobibo@loongson.cn> <20241213035026.1643517-2-maobibo@loongson.cn>
In-Reply-To: <20241213035026.1643517-2-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 31 Dec 2024 21:06:41 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6D0Hf55d9Y+iMCTQyVyfiMVYUBREoX7LbHNxtG9Xcb+g@mail.gmail.com>
Message-ID: <CAAhV-H6D0Hf55d9Y+iMCTQyVyfiMVYUBREoX7LbHNxtG9Xcb+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] irqchip/loongson-eiointc: Route interrupt parsed
 from bios table
To: Bibo Mao <maobibo@loongson.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

This patch is correct in theory, but since we use a hard-coded method
in the first place, there may be buggy BIOS, especially for
multi-bridge machines. So I hope someone can help me to test as many
machines as possible, and then give feedback to this mail.


Huacai

On Fri, Dec 13, 2024 at 11:50=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
>
> Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
> now it is hard-coded that eiointc routes irq to CPU started from IP1,
> however with function irq_create_mapping() parameter parent hwirq
> uses irq parsed from ACPI or DTS table.
>
> Routed interrupt pin need be the consistent with parent hwirq.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq=
-loongson-eiointc.c
> index bb79e19dfb59..72979f9f0e05 100644
> --- a/drivers/irqchip/irq-loongson-eiointc.c
> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> @@ -68,6 +68,7 @@ struct eiointc_priv {
>         struct fwnode_handle    *domain_handle;
>         struct irq_domain       *eiointc_domain;
>         int                     flags;
> +       irq_hw_number_t         parent_hwirq;
>  };
>
>  static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
> @@ -211,7 +212,12 @@ static int eiointc_router_init(unsigned int cpu)
>                 }
>
>                 for (i =3D 0; i < eiointc_priv[0]->vec_count / 32 / 4; i+=
+) {
> -                       bit =3D BIT(1 + index); /* Route to IP[1 + index]=
 */
> +                       /*
> +                        * Route to interrupt pin, relative offset used h=
ere
> +                        * Offset 0 means routing to IP0 and so on
> +                        * Every 32 vector routing to one interrupt pin
> +                        */
> +                       bit =3D BIT(eiointc_priv[index]->parent_hwirq - I=
NT_HWI0);
>                         data =3D bit | (bit << 8) | (bit << 16) | (bit <<=
 24);
>                         iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
>                 }
> @@ -495,7 +501,7 @@ int __init eiointc_acpi_init(struct irq_domain *paren=
t,
>
>         priv->vec_count =3D VEC_COUNT;
>         priv->node =3D acpi_eiointc->node;
> -
> +       priv->parent_hwirq =3D acpi_eiointc->cascade;
>         parent_irq =3D irq_create_mapping(parent, acpi_eiointc->cascade);
>
>         ret =3D eiointc_init(priv, parent_irq, acpi_eiointc->node_map);
> @@ -529,6 +535,7 @@ static int __init eiointc_of_init(struct device_node =
*of_node,
>  {
>         int parent_irq, ret;
>         struct eiointc_priv *priv;
> +       struct irq_data *irq_data;
>
>         priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -544,6 +551,12 @@ static int __init eiointc_of_init(struct device_node=
 *of_node,
>         if (ret < 0)
>                 goto out_free_priv;
>
> +       irq_data =3D irq_get_irq_data(parent_irq);
> +       if (!irq_data) {
> +               ret =3D -ENODEV;
> +               goto out_free_priv;
> +       }
> +
>         /*
>          * In particular, the number of devices supported by the LS2K0500
>          * extended I/O interrupt vector is 128.
> @@ -555,7 +568,7 @@ static int __init eiointc_of_init(struct device_node =
*of_node,
>
>         priv->node =3D 0;
>         priv->domain_handle =3D of_node_to_fwnode(of_node);
> -
> +       priv->parent_hwirq =3D irqd_to_hwirq(irq_data);
>         ret =3D eiointc_init(priv, parent_irq, 0);
>         if (ret < 0)
>                 goto out_free_priv;
> --
> 2.39.3
>

