Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CED01D1252
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 14:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729662AbgEMMJT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 08:09:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgEMMJS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 May 2020 08:09:18 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBAC5C061A0C;
        Wed, 13 May 2020 05:09:18 -0700 (PDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11] helo=nanos.tec.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tglx@linutronix.de>)
        id 1jYqCD-0001l1-QZ; Wed, 13 May 2020 14:09:09 +0200
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
        id 15F45100605; Wed, 13 May 2020 14:09:09 +0200 (CEST)
From:   Thomas Gleixner <tglx@linutronix.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 3/6] irqchip: Add Loongson PCH PIC controller
In-Reply-To: <20200428063247.2223499-3-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com> <20200428063247.2223499-1-jiaxun.yang@flygoat.com> <20200428063247.2223499-3-jiaxun.yang@flygoat.com>
Date:   Wed, 13 May 2020 14:09:09 +0200
Message-ID: <877dxg3ul6.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Jiaxun Yang <jiaxun.yang@flygoat.com> writes:
> +static void pch_pic_bitset(struct pch_pic *priv, int offset, int bit)
> +{
> +	void __iomem *addr = priv->base + offset + PIC_REG_IDX(bit) * 4;
> +	unsigned long flags;
> +	u32 reg;
> +
> +	raw_spin_lock_irqsave(&priv->pic_lock, flags);

See other reply.

> +	reg = readl(addr);
> +	reg |= BIT(PIC_REG_BIT(bit));
> +	writel(reg, addr);
> +	raw_spin_unlock_irqrestore(&priv->pic_lock, flags);
> +}
> +static int pch_pic_of_init(struct device_node *node,
> +				struct device_node *parent)
> +{
> +	struct pch_pic *priv;
> +	struct irq_domain *parent_domain;
> +	int err;

ordering

Thanks,

        tglx
