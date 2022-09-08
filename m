Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898AA5B2629
	for <lists+linux-mips@lfdr.de>; Thu,  8 Sep 2022 20:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbiIHSuA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Sep 2022 14:50:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbiIHSt4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 8 Sep 2022 14:49:56 -0400
X-Greylist: delayed 904 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 08 Sep 2022 11:49:53 PDT
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39B4245F67
        for <linux-mips@vger.kernel.org>; Thu,  8 Sep 2022 11:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662662078; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=fotINh0QiCBqqcjEu9X62O41+22XkqIOaA8IoniPpLGU7L8Aa6wCpVg7S05tntRfKUh4cvXvuOw4wApIhSoQmm2fJPTIeRMnhsDDF8nIqWemJRAIQqJ3TIBelXLTYlHWjK6AbjqxHQcChYgmDhQ7Rq4rI0SoB1fxaHJlQFt6rBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1662662078; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=+ZSQ/hCiHo3MVsDOSXfFn92+sn56Fwr/PHvAptiaK+A=; 
        b=mUsh8UFhbDzW+V4v8ZFt21iv2nR3rC2gya5WTWK9o8PPseGXyl7ZsGg+UoOuaXdBjwyLAwWTcchufLlqnDeTbCoMcUr2JtmFS452p8Xxn6SOCzp8bCgZyjw7a8Bb6BaIumM/GfiK5vNIihM6sEsy8z6NVShsTCUT6Y5HXqBQQkY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=arinc9.com;
        spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
        dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662662078;
        s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
        h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=+ZSQ/hCiHo3MVsDOSXfFn92+sn56Fwr/PHvAptiaK+A=;
        b=Kay5Jtv3gpN79e6L0NKJCWvDM4zJeh3bn72RXvGBEeDy4jY3GcNm9Smf/YrDn712
        OkIdFgFq5a6AWSpBEMc+E/zu48mwdO5YnsU/XeczAn92FZAcwnJYfVeQeNM4Rg1ZCt5
        8yPjGSAjMxEi4iecpkCGe9rpJNK1SBx0Y781rdSw=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
        with SMTPS id 1662662076622445.43536504018743; Thu, 8 Sep 2022 11:34:36 -0700 (PDT)
Message-ID: <055843d1-ec76-2db4-8860-4bf1e81110d3@arinc9.com>
Date:   Thu, 8 Sep 2022 21:34:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] mips: ralink: mt7621: add device tree into the kernel
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, john@phrozen.org
References: <20220908060804.1531428-1-sergio.paracuellos@gmail.com>
From:   =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220908060804.1531428-1-sergio.paracuellos@gmail.com>
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

On 8.09.2022 09:08, Sergio Paracuellos wrote:
> Device tree blobs for ralink mt7621 SoCs depends on configuration
> CONFIG_SOC_MT7621 kernel option. This blobs needs to be properly
> builtin into the kernel in order to be able to properly boot the
> Gnubee boards. Hence, select CONFIG_BUILTIN_DTB for mt7621 Socs.
> This option was a miss when this related device tree files were
> moved from staging into the real 'arch/mips/boot/dts/ralink'
> folder in kernel.
> 
> Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

I just tested this on a GB-PC2. If I understand correctly, this option 
adds all compiled DT on top of the compiled linux image, vmlinux, 
vmlinuz, etc..

DTB for GB-PC1 must come first since the bootloader on my GB-PC2 thinks 
the device is GB-PC1.

[    0.000000] Linux version 6.0.0-rc3+ (arinc9@arinc9-PC) 
(mipsel-linux-gnu-gcc (Ubuntu 10.3.0-1ubuntu1) 10.3.0, GNU ld (GNU 
Binutils for Ubuntu) 2.38) #8 SMP Thu Sep 8 21:16:57 +03 2022
[    0.000000] SoC Type: MediaTek MT7621 ver:1 eco:3
[    0.000000] printk: bootconsole [early0] enabled
[    0.000000] CPU0 revision is: 0001992f (MIPS 1004Kc)
[    0.000000] MIPS: machine is GB-PC1

I think we should not make SOC_MT7621 select this option now that we 
compile devicetrees for all devices which use the MT7621 SoC but rather 
leave it to the OS builder, OpenWrt SDK, etc. to decide and add the DTB 
on top of the compiled linux image.

I think this is already the case for all arm devicetrees?

Arınç

> ---
>   arch/mips/ralink/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
> index f9fe15630abb..f3b14bfc8066 100644
> --- a/arch/mips/ralink/Kconfig
> +++ b/arch/mips/ralink/Kconfig
> @@ -54,6 +54,7 @@ choice
>   		select HAVE_PCI
>   		select PCI_DRIVERS_GENERIC
>   		select SOC_BUS
> +		select BUILTIN_DTB
>   
>   		help
>   		  The MT7621 system-on-a-chip includes an 880 MHz MIPS1004Kc dual-core CPU,
