Return-Path: <linux-mips+bounces-7213-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C59FEF7F
	for <lists+linux-mips@lfdr.de>; Tue, 31 Dec 2024 14:07:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B8063A2D7B
	for <lists+linux-mips@lfdr.de>; Tue, 31 Dec 2024 13:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E85F19CCFC;
	Tue, 31 Dec 2024 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIt/JQmV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CCC944E;
	Tue, 31 Dec 2024 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735650457; cv=none; b=GSbMTaJt5CXv3jk6wSLHB0qIFyRjvnF1OnXCRy7RalK9bkPWh37qp5iaOyeziSP1kKggxA4+oP+y2qNsy6cfDsDE/oeVwWuYJ9Uie/jKZXT3ymptV9HaA410azMYPtWlA4w5ChgwZbJBJEbdhicMDd+olYq0qS4SgyPRgUNIcto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735650457; c=relaxed/simple;
	bh=KZd8AwtH1hGejGXb4zLh+LLbzxcDrPgngBc9jFsHq28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU2ynGvu8JzmNacoL0yGLPYi3wa/uPN0C05yz+10J02IsBXt06Wm4Zov3Em1XXZF7IrPQ7EOszdkg5b6D72M6ng5fU7RS94q1voT15cJenltrE35ZgEb0Wl5QBhtWDr5vJ9tCcs8Gc8njG/jVx+JIjD43DvIDM1yRWu4Eggo6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIt/JQmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1947BC4AF0C;
	Tue, 31 Dec 2024 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735650457;
	bh=KZd8AwtH1hGejGXb4zLh+LLbzxcDrPgngBc9jFsHq28=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PIt/JQmV3NvnKXOFaLXBiB5i1xk9nF1Owfdw/t6hfOhoNpiGM2rO1MQV4jRT+YdT4
	 pdFRTi6rByX6UkLhAuXEJFnxdqpS0U93SrRdJd1v4AJ3zNWWM4xvj30MM8okPrxDnF
	 WA6W0b0wflad1JjN8/r3RuN0WzZE5/Qv2Nkrv9N86CCHblMVltt4X/EBZuzmEOoImk
	 BSDpaWn3Bw24VAAQIXqQBU67JmvlQK7NBFClP9GPem5oy6RXbJ3HqJrAFsonsNUIn1
	 76IV4hZSeKV978EU7Zh35zjvkjzbLuNtPUChZulhAWvD7kIxFNSxxE7lxsrGiVCmMT
	 wgB/iP0XgKCaA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67f31a858so1773335466b.2;
        Tue, 31 Dec 2024 05:07:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUf0JijrIRlR1Kc15q2+nkfaMHfjxNmXjzCD6KaKqBwcLQYiNEFQ9l31Bad0LkK//dugc0oC7IebDOpDbw=@vger.kernel.org, AJvYcCWfQPpIxeDIyTMfO0Y0UeujbnjUkZp0jly2eJwq33rvysH0U+fEwde0pGtoe4BtPUPchWvF8vyFHTsQTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjTNMAcQMfzUHQAhXR4dvCfeA6WmpsoLUc4LM4Ji0LaDFZ0xyb
	Gm6ylbLLgr6E4fmtSpKVyK4jFfe5Sf6BJ+i/GeXplOIZDETWXj5qQHKEXDzt2S+AgXaYj/3uNAU
	ftsslAoOnhppMunLrS2CZHOEeRA0=
X-Google-Smtp-Source: AGHT+IHTscOSekm8ut/fnh8ynpsvm9E2iLzRmWb9qiMF12SF70zr+Regue4xGO/SkC5ZQyiVcSLirruypJFOPaFGYvA=
X-Received: by 2002:a17:907:6e92:b0:aa5:b1b9:5d6a with SMTP id
 a640c23a62f3a-aac336592f2mr2901249166b.54.1735650455595; Tue, 31 Dec 2024
 05:07:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213035026.1643517-1-maobibo@loongson.cn> <20241213035026.1643517-3-maobibo@loongson.cn>
In-Reply-To: <20241213035026.1643517-3-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 31 Dec 2024 21:07:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6htCgwBztdyAWjrdUUzWp_6A9g+hbMyC_cdgydJN-Qzw@mail.gmail.com>
Message-ID: <CAAhV-H6htCgwBztdyAWjrdUUzWp_6A9g+hbMyC_cdgydJN-Qzw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] irqchip/loongson-eiointc: Add multiple interrupt
 pin routing support
To: Bibo Mao <maobibo@loongson.cn>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Gleixner <tglx@linutronix.de>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Bibo,

Do you have some performance data? It is not worth making the driver
so complicated if there is no significant improvement.


Huacai

On Fri, Dec 13, 2024 at 11:50=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wro=
te:
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
> irq handler knows interrupt pin information and reads specific
> EIOINTC_REG_ISR register. And there is only once EIOINTC_REG_ISR register
> access rather than four loop times, it  reduces VM-exit times.
>
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-eiointc.c | 81 +++++++++++++++++++++++---
>  1 file changed, 74 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq=
-loongson-eiointc.c
> index 72979f9f0e05..e504a5d3f0b1 100644
> --- a/drivers/irqchip/irq-loongson-eiointc.c
> +++ b/drivers/irqchip/irq-loongson-eiointc.c
> @@ -46,6 +46,7 @@
>  #define EIOINTC_ALL_ENABLE_VEC_MASK(vector)    (EIOINTC_ALL_ENABLE & ~BI=
T(vector & 0x1f))
>  #define EIOINTC_REG_ENABLE_VEC(vector)         (EIOINTC_REG_ENABLE + ((v=
ector >> 5) << 2))
>  #define EIOINTC_USE_CPU_ENCODE                 BIT(0)
> +#define EIOINTC_ROUTE_MULT_IP                  BIT(1)
>
>  #define MAX_EIO_NODES          (NR_CPUS / CORES_PER_EIO_NODE)
>
> @@ -59,6 +60,13 @@
>  #define EIOINTC_REG_ROUTE_VEC_MASK(vector)     (0xff << EIOINTC_REG_ROUT=
E_VEC_SHIFT(vector))
>
>  static int nr_pics;
> +struct eiointc_priv;
> +typedef struct eiointc_ip_route {
> +       struct eiointc_priv     *priv;
> +       /* Offset Routed destination IP */
> +       int                     start;
> +       int                     end;
> +} eiointc_ip_route;
>
>  struct eiointc_priv {
>         u32                     node;
> @@ -69,6 +77,7 @@ struct eiointc_priv {
>         struct irq_domain       *eiointc_domain;
>         int                     flags;
>         irq_hw_number_t         parent_hwirq;
> +       eiointc_ip_route        route_info[VEC_REG_COUNT];
>  };
>
>  static struct eiointc_priv *eiointc_priv[MAX_IO_PICS];
> @@ -189,6 +198,7 @@ static int eiointc_router_init(unsigned int cpu)
>  {
>         int i, bit, cores, index, node;
>         unsigned int data;
> +       int hwirq, mask;
>
>         node =3D cpu_to_eio_node(cpu);
>         index =3D eiointc_index(node);
> @@ -198,6 +208,13 @@ static int eiointc_router_init(unsigned int cpu)
>                 return -EINVAL;
>         }
>
> +       /* Enable cpu interrupt pin from eiointc */
> +       hwirq =3D eiointc_priv[index]->parent_hwirq;
> +       mask =3D BIT(hwirq);
> +       if (eiointc_priv[index]->flags & EIOINTC_ROUTE_MULT_IP)
> +               mask |=3D BIT(hwirq + 1) | BIT(hwirq + 2) | BIT(hwirq + 3=
);
> +       set_csr_ecfg(mask);
> +
>         if (!(eiointc_priv[index]->flags & EIOINTC_USE_CPU_ENCODE))
>                 cores =3D CORES_PER_EIO_NODE;
>         else
> @@ -215,10 +232,28 @@ static int eiointc_router_init(unsigned int cpu)
>                         /*
>                          * Route to interrupt pin, relative offset used h=
ere
>                          * Offset 0 means routing to IP0 and so on
> -                        * Every 32 vector routing to one interrupt pin
> +                        *
> +                        * If flags is set with EIOINTC_ROUTE_MULT_IP,
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
LT_IP) {
> +                               /* The first 64 vectors route to hwirq */
> +                               bit =3D BIT(hwirq++ - INT_HWI0);
> +                               data =3D bit | (bit << 8);
> +
> +                               /* The second 64 vectors route to hwirq +=
 1 */
> +                               bit =3D BIT(hwirq++ - INT_HWI0);
> +                               data |=3D (bit << 16) | (bit << 24);
> +
> +                               /*
> +                                * Route to hwirq + 2/hwirq + 3 separatel=
y
> +                                * in next loop
> +                                */
> +                       } else  {
> +                               bit =3D BIT(hwirq - INT_HWI0);
> +                               data =3D bit | (bit << 8) | (bit << 16) |=
 (bit << 24);
> +                       }
>                         iocsr_write32(data, EIOINTC_REG_IPMAP + i * 4);
>                 }
>
> @@ -251,11 +286,18 @@ static void eiointc_irq_dispatch(struct irq_desc *d=
esc)
>         u64 pending;
>         bool handled =3D false;
>         struct irq_chip *chip =3D irq_desc_get_chip(desc);
> -       struct eiointc_priv *priv =3D irq_desc_get_handler_data(desc);
> +       eiointc_ip_route *info =3D irq_desc_get_handler_data(desc);
>
>         chained_irq_enter(chip, desc);
>
> -       for (i =3D 0; i < eiointc_priv[0]->vec_count / VEC_COUNT_PER_REG;=
 i++) {
> +       /*
> +        * If EIOINTC_ROUTE_MULT_IP is set, every 64 interrupt vectors in
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
> @@ -268,7 +310,7 @@ static void eiointc_irq_dispatch(struct irq_desc *des=
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
> @@ -468,8 +510,33 @@ static int __init eiointc_init(struct eiointc_priv *=
priv, int parent_irq,
>         }
>
>         eiointc_priv[nr_pics++] =3D priv;
> +       /*
> +        * Only the first eiointc device on VM supports routing to
> +        * different Interrupt Pins. The later eiointc devices use
> +        * generic method if there are multiple eiointc devices in future
> +        */
> +       if (cpu_has_hypervisor && (nr_pics =3D=3D 1)) {
> +               priv->flags |=3D EIOINTC_ROUTE_MULT_IP;
> +               priv->parent_hwirq =3D INT_HWI0;
> +       }
> +
> +       if (priv->flags & EIOINTC_ROUTE_MULT_IP) {
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
> +                                       &priv->route_info[i]);
> +               }
> +       } else {
> +               priv->route_info[0].start  =3D 0;
> +               priv->route_info[0].end    =3D priv->vec_count / VEC_COUN=
T_PER_REG;
> +               priv->route_info[0].priv   =3D priv;
> +               irq_set_chained_handler_and_data(parent_irq, eiointc_irq_=
dispatch,
> +                               &priv->route_info[0]);
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
>

