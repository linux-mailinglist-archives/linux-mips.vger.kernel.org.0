Return-Path: <linux-mips+bounces-11032-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180EB46AC8
	for <lists+linux-mips@lfdr.de>; Sat,  6 Sep 2025 12:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8C771B25B97
	for <lists+linux-mips@lfdr.de>; Sat,  6 Sep 2025 10:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFC72E7F25;
	Sat,  6 Sep 2025 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzjDEbJs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010EA16F265;
	Sat,  6 Sep 2025 10:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757153596; cv=none; b=lua9YheLU9ijYZu56MeIP0lJRlryPjzF//X5M3NfHrrhUzw+RRZx44VD7BayLMW/LwdQIML5hyQLGvEZ0KkhvP88eEM86zMdaPPnBddL+l/xhUxD9IAz2yHLkmcXeCx2zX7+3gJksuqeWc3EGEKfQoE+VZ2/6Nhj8ixLxBCuKtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757153596; c=relaxed/simple;
	bh=ByOyrmhw76sib+QC/DJ6J5eB0YKm5Is8sHXtlb8k4h0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j5Q9uSXgdgFe925xUxe2R2eBn+Ta7VBKnyGBd7jOAFFyzgc640w7SzxIeyQ2+piWGVJ7S2MME8SxgXBwMyjuoIJhyIV/n5AWr4e6W8FHQvmsGArXo8yIOUaqHL3jvIKTMcnYVu5MVUeobeQgZn48cKac9LHBIkbsQMbVKNPvNmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzjDEbJs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717F9C4CEF9;
	Sat,  6 Sep 2025 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757153594;
	bh=ByOyrmhw76sib+QC/DJ6J5eB0YKm5Is8sHXtlb8k4h0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VzjDEbJsBI1t1KRfad2SrgQsTlU7cw8xn2wieA02kasSBzGR9g98kmqiV9aZhnulT
	 zwA4ifPkoKEdgJeVHqEtCcS7adH6gjAPkRBLHAz8di2hz/K9/gfHNf94X8zlgZACyK
	 dE5xLySOJHiQZ6T/wNziqDcefh8t7wFN8egSuQTXwVERaDRI3IklKkNluzOcZKcaZu
	 IJDLJTOpiRi/4aySxttaUoIEo72Y99+Mkjio4cyJJ4bbh7tQVyZp/B/5EluoAJ6mPr
	 w9Gh6fmLLfxGBSjZG2g3H85tMl8maC2F7LcyTBZcYCnfSDEd98j+pCAHnWghBnO1we
	 bZ+vRPKiiusbQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so4559821a12.0;
        Sat, 06 Sep 2025 03:13:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNdV7sePSEJP1Ktr+jVODwesWMb5lmiccbak/6vmDf6D68+QMfqWzbCGyeK07mLAkHoeG2muEn/StGCw==@vger.kernel.org, AJvYcCX3bwlnc6/S4MlXLw/unvnwpWPiz1ft/S/ECWAlqih9OtH4uGwGIX8kW1CYr3Wi29OfdccQU+RkBEKdjLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAG4k7bB/cn1zz4Smu/5jozcI4RlTYeA59oFkgydEqFpJnz26V
	bP9kWMv2e9Gn7FSwXLfpt584vphVDAn3N7tSF4H+dKmu3jZ04x5hdSy5GoRq8w7JaBw/KPWwPB1
	RPq4S9Jy1BDXa4cQUbYPMkVYPYcuoxd0=
X-Google-Smtp-Source: AGHT+IFEMzcpjb1F7HrVerRmNEAClo3vMkaFyoQwQqbZwmYnq/aFQUripeKqB1JRCdMek9nRuVaw+OrWqYjQ4KyAFVQ=
X-Received: by 2002:a05:6402:1ed3:b0:61c:7a45:583a with SMTP id
 4fb4d7f45d1cf-6237b8740cfmr1867207a12.10.1757153593035; Sat, 06 Sep 2025
 03:13:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804081946.1456573-1-maobibo@loongson.cn> <20250804081946.1456573-2-maobibo@loongson.cn>
In-Reply-To: <20250804081946.1456573-2-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 6 Sep 2025 18:13:00 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76VOW2yzqUZznUzXAx-bDRjLjtyVe2KmMpEkg_hZT8YQ@mail.gmail.com>
X-Gm-Features: Ac12FXxqfcbVS0Oym9-liirSElqMSdq0UiJiq0Bqz9Z7H5gY7RTp5ic7UgEqCgU
Message-ID: <CAAhV-H76VOW2yzqUZznUzXAx-bDRjLjtyVe2KmMpEkg_hZT8YQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] irqchip/loongson-eiointc: Route interrupt parsed
 from bios table
To: Bibo Mao <maobibo@loongson.cn>, Mingcong Bai <jeffbai@aosc.io>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Mingcong,

On Mon, Aug 4, 2025 at 4:19=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> Interrupt controller eiointc routes irq to cpu interface IP0 - IP7,
> now it is hard-coded that eiointc routes irq to CPU started from IP1,
> however with function irq_create_mapping() parameter parent hwirq
> uses irq parsed from ACPI or DTS table.
>
> Routed interrupt pin need be the consistent with parent hwirq.
I remember that you want to test as many machine types as possible,
have you completed it?


Huacai

>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-eiointc.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq=
-loongson-eiointc.c
> index b2860eb2d32c..3e987d1232d2 100644
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
> @@ -552,7 +565,7 @@ static int __init eiointc_of_init(struct device_node =
*of_node,
>                 priv->vec_count =3D 128;
>         else
>                 priv->vec_count =3D VEC_COUNT;
> -
> +       priv->parent_hwirq =3D irqd_to_hwirq(irq_data);
>         priv->node =3D 0;
>         priv->domain_handle =3D of_fwnode_handle(of_node);
>
> --
> 2.39.3
>

