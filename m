Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8F681965FB
	for <lists+linux-mips@lfdr.de>; Sat, 28 Mar 2020 13:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgC1MGe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 28 Mar 2020 08:06:34 -0400
Received: from mx.0dd.nl ([5.2.79.48]:48116 "EHLO mx.0dd.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgC1MGe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 28 Mar 2020 08:06:34 -0400
Received: from mail.vdorst.com (mail.vdorst.com [IPv6:fd01::250])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mx.0dd.nl (Postfix) with ESMTPS id D991D5FA80;
        Sat, 28 Mar 2020 13:06:32 +0100 (CET)
Authentication-Results: mx.0dd.nl;
        dkim=pass (2048-bit key; secure) header.d=vdorst.com header.i=@vdorst.com header.b="d5KhzrfD";
        dkim-atps=neutral
Received: from www (www.vdorst.com [192.168.2.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.vdorst.com (Postfix) with ESMTPSA id 8898B26BF2F;
        Sat, 28 Mar 2020 13:06:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.vdorst.com 8898B26BF2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdorst.com;
        s=default; t=1585397192;
        bh=SkFKJkY8E//tW+Dis4BsAeTtpnp5rok+icUiekyoMqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:From;
        b=d5KhzrfDV2pYn4v8aUb10YcAM5RgQx4nRdo3rJTCOeAHtq8+6pxf3L4f3HVGG+axo
         87VMnC2QH6MLM8mWm1brykFfcIHKmoCbVhvhZZ4uLXX2q2L0B21VUotG56b6W5tQOm
         snd531SrzZjkzmZtFscmkYbSRTP4tGlJxp4E64sbbAm1mrWJuhQ8ogHP84WvLu+ljr
         dNApJyDYX2qHBUW5acnQkuWfQ6AJohK5YTDs+kPno9UYpbTZrcO9uNMGdFcxgY6HhO
         SmRoSc1JJhadIm+XFXwqHYJEm50RdF1GPRWrdgtueOKGdXRNt8iO5MB7EDqOS67foq
         w65Q3uLdPs25A==
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1]) by
 www.vdorst.com (Horde Framework) with HTTPS; Sat, 28 Mar 2020 12:06:32 +0000
Date:   Sat, 28 Mar 2020 12:06:32 +0000
Message-ID: <20200328120632.Horde.u68iv-GbxRgnXZTYfkNn0hr@www.vdorst.com>
From:   =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     John Crispin <john@phrozen.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] MIPS: ralink: mt7621: Fix soc_device introduction
In-Reply-To: <20200328102715.8309-1-tsbogend@alpha.franken.de>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

Thanks for fixing the compile issue for me.
Now I can make a kernel again.

Tested-by: René van Dorst <opensource@vdorst.com>

Greats,

René

Quoting Thomas Bogendoerfer <tsbogend@alpha.franken.de>:

> Depending on selected SMP config options soc_device didn't get
> initialised at all. With UP config vmlinux didn't link because
> of missing soc bus.
>
> Fixes: 71b9b5e0130d ("MIPS: ralink: mt7621: introduce 'soc_device'  
> initialization")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/ralink/Kconfig  | 1 +
>  arch/mips/ralink/mt7621.c | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index 94e9ce994494..35c2ebd8f094 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -52,6 +52,7 @@ choice
>  		select COMMON_CLK
>  		select CLKSRC_MIPS_GIC
>  		select HAVE_PCI if PCI_MT7621
> +		select SOC_BUS
>  endchoice
>
>  choice
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index 905460aeeb1f..0accb80db709 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -243,12 +243,12 @@ void prom_soc_init(struct ralink_soc_info *soc_info)
>
>  	rt2880_pinmux_data = mt7621_pinmux_data;
>
> +	soc_dev_init(soc_info, rev);
> +
>  	if (!register_cps_smp_ops())
>  		return;
>  	if (!register_cmp_smp_ops())
>  		return;
>  	if (!register_vsmp_smp_ops())
>  		return;
> -
> -	soc_dev_init(soc_info, rev);
>  }
> --
> 2.16.4



