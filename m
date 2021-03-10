Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407C33338BC
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 10:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbhCJJag (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 04:30:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229643AbhCJJaP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 04:30:15 -0500
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B34A864FE2;
        Wed, 10 Mar 2021 09:30:14 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <maz@kernel.org>)
        id 1lJvAS-000iq4-G4; Wed, 10 Mar 2021 09:30:12 +0000
Date:   Wed, 10 Mar 2021 09:30:11 +0000
Message-ID: <87blbrxsnw.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     zhangqing <zhangqing@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangming01@loongson.cn
Subject: Re: [PATCH v3 5/7] irqchip/loongson-liointc: irqchip add 2.0 version
In-Reply-To: <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
References: <20210306023633.9579-1-zhangqing@loongson.cn>
        <20210306023633.9579-6-zhangqing@loongson.cn>
        <87wnugy9oe.wl-maz@kernel.org>
        <5c5b2593-b07c-cd20-cd08-1d6542471260@loongson.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: zhangqing@loongson.cn, chenhuacai@kernel.org, jiaxun.yang@flygoat.com, tsbogend@alpha.franken.de, tglx@linutronix.de, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, wangming01@loongson.cn
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 10 Mar 2021 02:26:24 +0000,
zhangqing <zhangqing@loongson.cn> wrote:
> 
> 
> On 03/09/2021 05:10 PM, Marc Zyngier wrote:
> > 
> >> +
> >> +static void __iomem *liointc_get_reg_byname(struct device_node *node,
> >> +						const char *name)
> >> +{
> >> +	int index = of_property_match_string(node, "reg-names", name);
> >> +
> >> +	return of_iomap(node, index);
> > So if of_property_match_string() returns an error, you feed that error
> > to of_iomap()? Somehow, I don't think that's a good idea.
> 
> Hi, Marc
> 
> Thank you for your suggestion, error handling is missing here,
> 
>      +    if (index <0)
>      +           return NULL;
> 
>             return of_iomap(node, index);
> 
> It has been fixed in the fourth version, and I will send V4 soon.
> 
> > +	if (of_device_is_compatible(node, "loongson,liointc-2.0")) {
> > +		base = liointc_get_reg_byname(node, "main");
> > +		if (!base) {
> > +			err = -ENODEV;
> > +			goto out_free_priv;
> > +		}
> > +		for (i = 0; i < LIOINTC_NUM_CORES; i++) {
> > +			priv->core_isr[i] =
> > +				liointc_get_reg_byname(node, core_reg_names[i]);
> > Please write assignments on a single line.
> 
> In addition, write assignments on a single line
> 
>                  for (i = 0; i <LIOINTC_NUM_CORES; i++)
>                          priv->core_isr[i] =
> liointc_get_reg_byname(node, core_reg_names[i]);
> 
>     It is 92 characters, more than 80 characters...

I really don't care about whatever arbitrary limit people think there
is. Please put it on a single line.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
