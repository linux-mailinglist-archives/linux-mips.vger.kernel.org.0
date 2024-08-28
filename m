Return-Path: <linux-mips+bounces-5154-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E693E962976
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 15:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7595A1F2513F
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6102184535;
	Wed, 28 Aug 2024 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HO2e7C+z"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7EC1DFED;
	Wed, 28 Aug 2024 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853426; cv=none; b=OL0HzQEZDn0kBA6uM3fJnUe5WGQphH294+GFFHJ62Tt7wlQx0G/j0u7MlKEYWvs/EH/Si/faV4ftc8onDijCO0kHJH0+xKaQmjdQVjJsZFUERrs1Rmfa5KYmB/4gR4oEx232D5lffHZlRiUic+8OT/KKlUPVDtD7b9yKqY6zel4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853426; c=relaxed/simple;
	bh=zCVlon7UUPRrzx7JrU1yIZKF6ATndroXF11LNmHJuEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDDHzdMidsf/wfpvYVxU5VfB4gizwUiemfafhWhrAa/ckJn+me9mVGOBtKEmz81jkWJESaAAhUAatoCMtSdznaMPc3eXHVIRc7T+iatFIFlRZkF/B6JhNfhq+RLKlFLnSKOLrAUP2Av5e7Rqy/domFHyuMkaXxjbTbdVKy1Z46A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HO2e7C+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B0CC4AF11;
	Wed, 28 Aug 2024 13:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724853426;
	bh=zCVlon7UUPRrzx7JrU1yIZKF6ATndroXF11LNmHJuEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HO2e7C+zXTrJkgE8FeqOrCflSlL0+CQX/mWTWEn4erv0XkmjD5ompunutnPi0M4TM
	 iPP8DnFOHBgoOvwE0/+b+XpPo9kuJ/1Z3jGYStzji0O5/huOrR3cTmIj67hSypkw6n
	 CbBOLhUfJvCn7oEcJG5GGWw0bEhnqIVs8lT3Vt2A0P7BpYcBxJ78q8kTBCEuLxGN5P
	 yBB1hu5G/q1sfP1jx34Eb+mJPkEC0ZJFQHdrxNe3O1MQNbOBzXxb30+Mtw9MV2Pe5Q
	 5Uj83nK4MD/5M85YkGv6O8mfQirdVqX5tjedzzhBSeO0m0/ToQxjijAx/QSnt51S6/
	 fFD8EKCZf0juA==
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c210e23573so1227583a12.0;
        Wed, 28 Aug 2024 06:57:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVP20bqyjMlB6bIgbeNQDGHgMVl7NfXdHf5a4ERvljoGWKne/Bb8SCVk13+C7WuOtGqJ/TnMj9ucnhRnA==@vger.kernel.org, AJvYcCWZ+X/hdAlMWyFxAZjVSAxu90uMCG6vuOb4jEH0LGHJF7Gpt0ei7x8YC1TIKcL7Lnh8JJcefrHVnTgeovo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPX0MkmPFfu6WgkPRD9KPNMUeSEck1f0SqOyC3nn7euV0qnaJ
	4blQ19oQNaY3naAR8r1KVJG2utbrap0p3K16DQWdgS3p4kvGP02r4domDYGxdDrcWLgkI4g27mh
	SeLi1RO9+xeWqsqtJZkjRhZ8i+Sw=
X-Google-Smtp-Source: AGHT+IE2F1TGQZ7B8fpOxCVYD4rUH8OtSZILeyUjMPksD0NB0GDDhVKTJiUZ/JqoUCjZ+mZEQdXOWfsrNSTWRqleYhU=
X-Received: by 2002:a05:6402:1941:b0:5bf:dd0:93ad with SMTP id
 4fb4d7f45d1cf-5c0891a293amr9515577a12.27.1724853424723; Wed, 28 Aug 2024
 06:57:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828070603.3518753-1-maobibo@loongson.cn> <20240828070603.3518753-3-maobibo@loongson.cn>
In-Reply-To: <20240828070603.3518753-3-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 28 Aug 2024 21:56:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6+GYjbJbZjKUVvHJ7sTnRhMqBOun149OqO8WEL7xF8Aw@mail.gmail.com>
Message-ID: <CAAhV-H6+GYjbJbZjKUVvHJ7sTnRhMqBOun149OqO8WEL7xF8Aw@mail.gmail.com>
Subject: Re: [RFC v2 2/2] irqchip/loongson-eiointc: Add multiple interrupt pin
 routing support
To: Bibo Mao <maobibo@loongson.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

On Wed, Aug 28, 2024 at 3:06=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> Eiointc interrupt controller support 256 interrupt vectors at most,
> and irq handler gets interrupt status from base register group
> EIOINTC_REG_ISR plus specific offset. It needs to read register group
> EIOINTC_REG_ISR four times to get all 256 interrupt vectors status.
>
> Eiointc registers including EIOINTC_REG_ISR is software emulated for
> VMs, there will be VM-exits when accessing eiointc registers. Here one
> method is introduced so that eiointc interrupt controller can route
> to different cpu interrupt pins for every 64 interrupt vectors. So
> irq handler needs read only relative 64 interrupt vector, it  reduces
> VM-exits.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-eiointc.c | 72 ++++++++++++++++++++++----
>  1 file changed, 63 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq=
-loongson-eiointc.c
> index e9ec63d85ee8..c6bcb6625e6d 100644
> --- a/drivers/irqchip/irq-loongson-eiointc.c
> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> @@ -30,11 +30,20 @@
>  #define VEC_REG_IDX(irq_id)    ((irq_id) / VEC_COUNT_PER_REG)
>  #define VEC_REG_BIT(irq_id)     ((irq_id) % VEC_COUNT_PER_REG)
>  #define EIOINTC_ALL_ENABLE     0xffffffff
> +#define EIOINTC_ROUTE_MULTIPLE_IP      BIT(0)
>
>  #define MAX_EIO_NODES          (NR_CPUS / CORES_PER_EIO_NODE)
>
>  static int nr_pics;
>
> +struct eiointc_priv;
> +struct eiointc_ip_route {
> +       struct eiointc_priv     *priv;
> +       /* Routed destination IP offset */
> +       int                     start;
> +       int                     end;
> +};
> +
>  struct eiointc_priv {
>         u32                     node;
>         u32                     vec_count;
> @@ -43,6 +52,8 @@ struct eiointc_priv {
>         struct fwnode_handle    *domain_handle;
>         struct irq_domain       *eiointc_domain;
>         int                     parent_hwirq;
> +       int                     flags;
> +       struct eiointc_ip_route route_info[4];
>  };
>
>  static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
> @@ -145,12 +156,20 @@ static int eiointc_router_init(unsigned int cpu)
>         uint32_t data;
>         uint32_t node =3D cpu_to_eio_node(cpu);
>         int index =3D eiointc_index(node);
> +       int hwirq, mask;
>
>         if (index < 0) {
>                 pr_err("Error: invalid nodemap!\n");
>                 return -1;
>         }
>
> +       /* Enable cpu interrupt pin routed from eiointc */
> +       hwirq =3D eiointc_priv[index]->parent_hwirq;
> +       mask =3D BIT(hwirq);
> +       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULTIPLE_IP)
> +               mask |=3D BIT(hwirq + 1) | BIT(hwirq + 2) | BIT(hwirq + 3=
);
> +       set_csr_ecfg(mask);
> +
>         if ((cpu_logical_map(cpu) % CORES_PER_EIO_NODE) =3D=3D 0) {
>                 eiointc_enable();
>
> @@ -161,12 +180,23 @@ static int eiointc_router_init(unsigned int cpu)
>
>                 for (i =3D 0; i < eiointc_priv[0]->vec_count / 32 / 4; i+=
+) {
>                         /*
> -                        * Route to interrupt pin, using offset minus INT=
_HWI0
> -                        * Offset 0 means IP0 and so on
> -                        * Every 32 vector routing to one interrupt pin
> +                        * Route to interrupt pin, minus INT_HWI0 as offs=
et
> +                        * Offset 0 means IP0 and so on, every 32 vector
> +                        * routing to one interrupt pin
> +                        *
> +                        * If flags is set with EIOINTC_ROUTE_MULTIPLE_IP=
,
> +                        * every 64 vector routes to different consecutiv=
e
> +                        * IPs, otherwise all vector routes to the same I=
P
>                          */
> -                       bit =3D BIT(eiointc_priv[index]->parent_hwirq - I=
NT_HWI0);
> -                       data =3D bit | (bit << 8) | (bit << 16) | (bit <<=
 24);
> +                       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MU=
LTIPLE_IP) {
> +                               bit =3D BIT(hwirq++ - INT_HWI0);
> +                               data =3D bit | (bit << 8);
> +                               bit =3D BIT(hwirq++ - INT_HWI0);
> +                               data |=3D (bit << 16) | (bit << 24);
> +                       } else  {
> +                               bit =3D BIT(hwirq - INT_HWI0);
> +                               data =3D bit | (bit << 8) | (bit << 16) |=
 (bit << 24);
> +                       }
>                         iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
>                 }
>
> @@ -197,11 +227,18 @@ static void eiointc_irq_dispatch(struct irq_desc *d=
esc)
>         u64 pending;
>         bool handled =3D false;
>         struct irq_chip *chip =3D irq_desc_get_chip(desc);
> -       struct eiointc_priv *priv =3D irq_desc_get_handler_data(desc);
> +       struct eiointc_ip_route *info =3D irq_desc_get_handler_data(desc)=
;
>
>         chained_irq_enter(chip, desc);
>
> -       for (i =3D 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG;=
 i++) {
> +       /*
> +        * If EIOINTC_ROUTE_MULTIPLE_IP is set, every 64 interrupt vector=
s in
> +        * eiointc interrupt controller routes to different cpu interrupt=
 pins
> +        *
> +        * Every cpu interrupt pin has its own irq handler, it is ok to
> +        * read ISR for these 64 interrupt vectors rather than all vector=
s
> +        */
> +       for (i =3D info->start; i < info->end; i++) {
>                 pending =3D iocsr_read64(EIOINTC_REG_ISR + (i << 3));
>
>                 /* Skip handling if pending bitmap is zero */
> @@ -214,7 +251,7 @@ static void eiointc_irq_dispatch(struct irq_desc *des=
c)
>                         int bit =3D __ffs(pending);
>                         int irq =3D bit + VEC_COUNT_PER_REG * i;
>
> -                       generic_handle_domain_irq(priv->eiointc_domain, i=
rq);
> +                       generic_handle_domain_irq(info->priv->eiointc_dom=
ain, irq);
>                         pending &=3D ~BIT(bit);
>                         handled =3D true;
>                 }
> @@ -397,8 +434,25 @@ static int __init eiointc_init(struct eiointc_priv *=
priv, int parent_irq,
>         }
>
>         eiointc_priv[nr_pics++] =3D priv;
> +       if (cpu_has_hypervisor) {
> +               priv->parent_hwirq =3D INT_HWI0;
> +               for (i =3D 0; i < priv->vec_count / VEC_COUNT_PER_REG; i+=
+) {
> +                       priv->route_info[i].start  =3D priv->parent_hwirq=
 - INT_HWI0 + i;
> +                       priv->route_info[i].end    =3D priv->route_info[i=
].start + 1;
> +                       priv->route_info[i].priv   =3D priv;
> +                       parent_irq =3D get_percpu_irq(priv->parent_hwirq =
+ i);
> +                       irq_set_chained_handler_and_data(parent_irq, eioi=
ntc_irq_dispatch,
> +                                                               &priv->ro=
ute_info[i]);
> +               }
> +               priv->flags |=3D EIOINTC_ROUTE_MULTIPLE_IP;
Can real machines also use EIOINTC_ROUTE_MULTIPLE_IP?

Huacai

> +       } else {
> +               priv->route_info[0].start  =3D 0;
> +               priv->route_info[0].end    =3D priv->vec_count / VEC_COUN=
T_PER_REG;
> +               priv->route_info[0].priv   =3D priv;
> +               irq_set_chained_handler_and_data(parent_irq, eiointc_irq_=
dispatch,
> +                                                       &priv->route_info=
[0]);
> +       }
>         eiointc_router_init(0);
> -       irq_set_chained_handler_and_data(parent_irq, eiointc_irq_dispatch=
, priv);
>
>         if (nr_pics =3D=3D 1) {
>                 register_syscore_ops(&eiointc_syscore_ops);
> --
> 2.39.3
>

