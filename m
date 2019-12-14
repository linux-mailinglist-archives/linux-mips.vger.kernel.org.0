Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE2F111F360
	for <lists+linux-mips@lfdr.de>; Sat, 14 Dec 2019 19:10:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfLNSHw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Dec 2019 13:07:52 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:55596 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfLNSHv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Dec 2019 13:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1576346868; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZT2nfN79WKkY25XI09ribZUpmxko5AgJRuhVtZX21qo=;
        b=rycc+mG2TcvGcPDixft9zvbFOY3l5I4eORFU8FgZxSWjlhS+PIDP1QGCkYQ/htuivYNrx/
        zV5DHZLJjJxnEV9QMZNaisa9bUGr8Tm9S5a37Wg7yWIRC06FsCgcQIlRgJR4RLZ+BTAZqh
        QVbiBsMLp7d1OP0fTE69ISmVbPzUVMM=
Date:   Sat, 14 Dec 2019 19:07:43 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 1/5] clk: Ingenic: Remove unnecessary spinlock when
 reading registers.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= "(Zhou Yanjie)" 
        <zhouyanjie@wanyeetech.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Message-Id: <1576346863.3.1@crapouillou.net>
In-Reply-To: <1576337630-78576-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576337630-78576-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1576337630-78576-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

You can also remove the locks around ingenic_cgu_gate_get(), they are=20
useless. Then also edit the doc of this function as currently it says=20
that the caller must hold the lock.

-Paul


Le sam., d=C3=A9c. 14, 2019 at 23:33, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yan=
jie)=20
<zhouyanjie@wanyeetech.com> a =C3=A9crit :
> It is not necessary to use spinlock when reading registers,
> so remove it from cgu.c.
>=20
> Suggested-by: Paul Cercueil <paul@crapouillou.net>
> Suggested-by: Paul Burton <paulburton@kernel.org>
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> ---
>=20
> Notes:
>     v2:
>     New patch.
>=20
>     v2->v3:
>     Adjust order from [5/5] in v2 to [1/5] in v3.
>=20
>  drivers/clk/ingenic/cgu.c | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
> index 6e96303..8bd3998 100644
> --- a/drivers/clk/ingenic/cgu.c
> +++ b/drivers/clk/ingenic/cgu.c
> @@ -76,16 +76,13 @@ ingenic_pll_recalc_rate(struct clk_hw *hw,=20
> unsigned long parent_rate)
>  	const struct ingenic_cgu_pll_info *pll_info;
>  	unsigned m, n, od_enc, od;
>  	bool bypass;
> -	unsigned long flags;
>  	u32 ctl;
>=20
>  	clk_info =3D &cgu->clock_info[ingenic_clk->idx];
>  	BUG_ON(clk_info->type !=3D CGU_CLK_PLL);
>  	pll_info =3D &clk_info->pll;
>=20
> -	spin_lock_irqsave(&cgu->lock, flags);
>  	ctl =3D readl(cgu->base + pll_info->reg);
> -	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	m =3D (ctl >> pll_info->m_shift) & GENMASK(pll_info->m_bits - 1, 0);
>  	m +=3D pll_info->m_offset;
> @@ -259,12 +256,9 @@ static int ingenic_pll_is_enabled(struct clk_hw=20
> *hw)
>  	struct ingenic_cgu *cgu =3D ingenic_clk->cgu;
>  	const struct ingenic_cgu_clk_info *clk_info =3D=20
> to_clk_info(ingenic_clk);
>  	const struct ingenic_cgu_pll_info *pll_info =3D &clk_info->pll;
> -	unsigned long flags;
>  	u32 ctl;
>=20
> -	spin_lock_irqsave(&cgu->lock, flags);
>  	ctl =3D readl(cgu->base + pll_info->reg);
> -	spin_unlock_irqrestore(&cgu->lock, flags);
>=20
>  	return !!(ctl & BIT(pll_info->enable_bit));
>  }
> --
> 2.7.4
>=20

=

