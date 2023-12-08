Return-Path: <linux-mips+bounces-601-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA3F80A54B
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 15:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F191F212FB
	for <lists+linux-mips@lfdr.de>; Fri,  8 Dec 2023 14:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C372A1DFCE;
	Fri,  8 Dec 2023 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xqAI9Q7p";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5/kaQb7/"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFD8171D;
	Fri,  8 Dec 2023 06:20:07 -0800 (PST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1702045206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xflaWiDw7kr8d/dlbv/fd4pzj3NI4pM3Ha1Gv1hGpME=;
	b=xqAI9Q7p3eiImDPsYb3EgsmFw2FY4OUext9dxB4kvC+RGzJDOzzxV8/A1wrZAtU/f5dKS8
	MaZPEr64Dqr691qS0QXo/2FsEo+hSSEU/blc0/lmaDDaTSS13dyEDHpBmd7lR2wQ61VTXO
	5kevTVfzsbLzZh1XBlIOGO32ogydca3CgoFIBnw14Ia/+6AQzLdqhGWiEsa+PUsUFc7e9e
	Bep+2+JbDnQPz32EFRTOl09He+JIs74SI23GBxDA/zIYiGwR1Df/FUHbkCOaLCw5xnXKx7
	gkVTiApYhHW+vhswvyD3q/4YUfbMYl1ikBVJiWP/Kqmq9BqLeGFSsm0/78i+Hw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1702045206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xflaWiDw7kr8d/dlbv/fd4pzj3NI4pM3Ha1Gv1hGpME=;
	b=5/kaQb7/CisTC8SQuhbs5tQNRgtR1GoYBHF2P6cjQpotgD6wB8Rrfhb6lX+oh5uEnpcYP9
	VVagnqz7i2+sTyDA==
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 devicetree@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-mips@vger.kernel.org, lvjianmin@loongson.cn, WANG Xuerui
 <git@xen0n.name>, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH v5 4/5] irqchip/loongson-liointc: Fix
 'loongson,parent_int_map' parse
In-Reply-To: <fc9b3afaf8826fd437ba91397eb7fa231db2c05c.1700449792.git.zhoubinbin@loongson.cn>
References: <cover.1700449792.git.zhoubinbin@loongson.cn>
 <fc9b3afaf8826fd437ba91397eb7fa231db2c05c.1700449792.git.zhoubinbin@loongson.cn>
Date: Fri, 08 Dec 2023 15:20:06 +0100
Message-ID: <87lea4srmx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Nov 20 2023 at 17:06, Binbin Zhou wrote:

$Subject: s/parse/parsing/

> In keeping with naming standards, 'loongson,parent_int_map' is renamed
> to 'loongson,parent-int-map'. But for the driver, we need to make sure
> that both forms can be parsed.

Please keep changelogs in neutral or imperative tone:

  For backwards compatibility it is required to parse the original
  string too.

Makes it entirely clear what this is about without 'we'. See also:

  https://www.kernel.org/doc/html/latest/process/submitting-patches.rst 

> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reviewed-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/irqchip/irq-loongson-liointc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
> index e4b33aed1c97..add2e0a955b8 100644
> --- a/drivers/irqchip/irq-loongson-liointc.c
> +++ b/drivers/irqchip/irq-loongson-liointc.c
> @@ -330,6 +330,7 @@ static int __init liointc_of_init(struct device_node *node,
>  	bool have_parent = FALSE;
>  	int sz, i, index, revision, err = 0;
>  	struct resource res;
> +	const char *prop_name = "loongson,parent-int-map";

Please don't glue variables randomly into the declaration section:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#variable-declarations

>  	if (!of_device_is_compatible(node, "loongson,liointc-2.0")) {
>  		index = 0;
> @@ -350,8 +351,12 @@ static int __init liointc_of_init(struct device_node *node,
>  	if (!have_parent)
>  		return -ENODEV;
>  
> +	if (!of_find_property(node, prop_name, &i))
> +		/* Fallback to 'loongson,parent_int_map'. */
> +		prop_name = "loongson,parent_int_map";

This lacks curly brackets:

  https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracket-rules

>  	sz = of_property_read_variable_u32_array(node,
> -						"loongson,parent_int_map",
> +						prop_name,
>  						&parent_int_map[0],
>  						LIOINTC_NUM_PARENT,
>  						LIOINTC_NUM_PARENT);

Thanks,

        tglx

