Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6CD5B2F86
	for <lists+linux-mips@lfdr.de>; Fri,  9 Sep 2022 09:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiIIHLW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Sep 2022 03:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbiIIHLS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Sep 2022 03:11:18 -0400
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62E5A221A
        for <linux-mips@vger.kernel.org>; Fri,  9 Sep 2022 00:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662707466; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=FsvVbkGW80NdPL1L6t7rFKs18YhDDb9J0nAQ9dtNSlMgl7+1mxqp/AaMl+bsih8yFydGC+3neg3Hkk/wS1642G5a4Udfa0X9Kp6rnHK9MuxFfE8JuruWLwwq6kDmnuwFvDYXFcDsw4Cn0ckye7gclraEVhyYsPZQJtq+PtBK1Mw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1662707466; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=rfsSkW3JEwk0plNl+DM1t68dk4w/U2uzJGmpAXN3apk=; 
        b=hTH09ue4g2CvOrFshdqMGukdCUA9JwcFA8Hq/DTIRTVnwZ4hJeONd1kowie9hj4w5nSZEacCLvFgMHmX2OmJwXmaCKDRijDQ1Nrg4aYa9sFV0zqTufvLDMkBfFR4HIP6NbY9Fz/kaFvQLO/2Zw+Nq5+GE0rG2L2jVUo/tzIAKXY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662707466;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=rfsSkW3JEwk0plNl+DM1t68dk4w/U2uzJGmpAXN3apk=;
        b=SP7Q8fUQL8+1dfgPtwAPtscaT0Rfmue5yqoPsaG28s3LjeUHUqIBdtzUp7Ho40ik
        JqiuIdaFSJxTmWqOJ8VZgHbbwRHfGddMs8+/EkB9wdFMhzSfLqKgvDdMqPi35TCutfA
        INZD7jOJ9H+tnP6s9icTFCoz7NFzE66evsSRHv7M=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
        with SMTPS id 1662707465169167.90876836171697; Fri, 9 Sep 2022 00:11:05 -0700 (PDT)
Message-ID: <3eed052a-4446-aff2-5356-0a40ba0d212c@arinc9.com>
Date:   Fri, 9 Sep 2022 10:11:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mips: ralink: mt7621: add gnubee device trees into the
 kernel
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, john@phrozen.org
References: <20220909051147.1948425-1-sergio.paracuellos@gmail.com>
From:   =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220909051147.1948425-1-sergio.paracuellos@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9.09.2022 08:11, Sergio Paracuellos wrote:
> Device tree blobs for ralink mt7621 SoCs depends on configuration
> CONFIG_SOC_MT7621 kernel option. This blobs needs to be properly
> builtin into the kernel in order to be able to properly boot the
> Gnubee boards. Hence, we need to define specific DTB config options
> to know which device tree must be compiled and embeeded into the
> kernel for every single board to allow the generated kernel to boot
> properly.
> 
> Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

My original idea was to upstream DTs of every device using the MT7621 
SoC on OpenWrt.

Currently, there are only 2 DTs on mainline, so giving each of them an 
entry is not a big deal. But doing this for hundreds of devices is not 
viable.

This is why I wanted to move away from giving an entry for each device 
and leave it to the OS builder SDKs to deal with it. We both use Neil's 
gnubee-tools, it should be possible to do this there.

For now, whichever path is taken, I'm fine with it. But I see this more 
as a design choice rather than a fix.

Arınç

> ---
>   arch/mips/boot/dts/ralink/Makefile |  6 ++----
>   arch/mips/ralink/Kconfig           | 11 ++++++++++-
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/ralink/Makefile b/arch/mips/boot/dts/ralink/Makefile
> index 11732b8c8163..b0552bfa555a 100644
> --- a/arch/mips/boot/dts/ralink/Makefile
> +++ b/arch/mips/boot/dts/ralink/Makefile
> @@ -5,9 +5,7 @@ dtb-$(CONFIG_DTB_RT3883_EVAL)	+= rt3883_eval.dtb
>   dtb-$(CONFIG_DTB_MT7620A_EVAL)	+= mt7620a_eval.dtb
>   dtb-$(CONFIG_DTB_OMEGA2P)	+= omega2p.dtb
>   dtb-$(CONFIG_DTB_VOCORE2)	+= vocore2.dtb
> -
> -dtb-$(CONFIG_SOC_MT7621) += \
> -	mt7621-gnubee-gb-pc1.dtb \
> -	mt7621-gnubee-gb-pc2.dtb
> +dtb-$(CONFIG_DTB_GNUBEE1)	+= mt7621-gnubee-gb-pc1.dtb
> +dtb-$(CONFIG_DTB_GNUBEE2)	+= mt7621-gnubee-gb-pc2.dtb
>   
>   obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index f9fe15630abb..cf2f5cccd2b3 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -62,7 +62,6 @@ endchoice
>   
>   choice
>   	prompt "Devicetree selection"
> -	depends on !SOC_MT7621
>   	default DTB_RT_NONE
>   	help
>   	  Select the devicetree.
> @@ -100,6 +99,16 @@ choice
>   		depends on SOC_MT7620
>   		select BUILTIN_DTB
>   
> +	config DTB_GNUBEE1
> +		bool "GnuBee1 2.5inch NAS"
> +		depends on SOC_MT7621
> +		select BUILTIN_DTB
> +
> +	config DTB_GNUBEE2
> +		bool "GnuBee2 3.5inch NAS"
> +		depends on SOC_MT7621
> +		select BUILTIN_DTB
> +
>   endchoice
>   
>   endif
