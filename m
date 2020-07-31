Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DFD23441E
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jul 2020 12:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732371AbgGaKf1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 31 Jul 2020 06:35:27 -0400
Received: from relay4.mymailcheap.com ([137.74.80.154]:44647 "EHLO
        relay4.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731922AbgGaKf1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 31 Jul 2020 06:35:27 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 101203F20A;
        Fri, 31 Jul 2020 12:35:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 350752A3B8;
        Fri, 31 Jul 2020 06:35:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596191722;
        bh=BLDS2oll/4tBNw82NF6+Q44e1HdnukGI9h57Kji6hCc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=jBub1IO1hIXu27C8R/SOoAQYIjaoGmKiqgA/OYad6vwSRer8d3ELXWI90LPO9dS2J
         TUEeesrh+38an921mG5JqbomQ/8Nt25lYbRj35WooU45oTm3WQ6WRyMAREueJddtQN
         faNulWHBn5eU0ezLQaQCGF2xNgGwEhwzJhvC62zU=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TJ4L-x7a2eLQ; Fri, 31 Jul 2020 06:35:21 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri, 31 Jul 2020 06:35:20 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id B4522419DE;
        Fri, 31 Jul 2020 10:35:18 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="fRCjWzgB";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 9B04E419DE;
        Fri, 31 Jul 2020 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596191660;
        bh=BLDS2oll/4tBNw82NF6+Q44e1HdnukGI9h57Kji6hCc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fRCjWzgBQcGj1SD3WDWcq2BmaBcYppYSrclEBvvYltGqA3d8pzF22JzB+l0Wboq1V
         lbs6ZhR8dlD4L/mZuG5x1/iBHUwHrnkO7czDW0rQBb32R83XlYOcxHNxlD6FJUDjoR
         cXwOgwbNCW1vythinJ91JKbvQd91aKLaqZ/iucRY=
Subject: Re: [PATCH] MIPS: BMIPS: Disable pref 30 for buggy CPUs
To:     Florian Fainelli <f.fainelli@gmail.com>, linux-mips@linux-mips.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20200731042401.22871-1-f.fainelli@gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <21ad5472-1287-acba-5604-09f2e633c043@flygoat.com>
Date:   Fri, 31 Jul 2020 18:34:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731042401.22871-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: B4522419DE
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         FREEMAIL_TO(0.00)[gmail.com,linux-mips.org];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/31 ÏÂÎç12:24, Florian Fainelli Ð´µÀ:
> Disable pref 30 by utilizing the standard quirk method and matching the
> affected SoCs: 7344, 7346, 7425.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   arch/mips/bmips/setup.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
> index 19308df5f577..df0efea12611 100644
> --- a/arch/mips/bmips/setup.c
> +++ b/arch/mips/bmips/setup.c
> @@ -110,6 +110,20 @@ static void bcm6368_quirks(void)
>   	bcm63xx_fixup_cpu1();
>   }
>   
> +static void bmips5000_pref30_quirk(void)
> +{
> +	__asm__ __volatile__(
> +	"	li	$8, 0x5a455048\n"
> +	"	.word	0x4088b00f\n"	/* mtc0 $8, $22, 15 */
> +	"	nop; nop; nop\n"
> +	"	.word	0x4008b008\n"	/* mfc0 $8, $22, 8 */
> +	/* disable "pref 30" on buggy CPUs */
> +	"	lui	$9, 0x0800\n"
> +	"	or	$8, $9\n"
> +	"	.word	0x4088b008\n"	/* mtc0 $8, $22, 8 */
> +	: : : "$8", "$9");
> +}
Hi,

Is there any toolchain issue blocking read_c0_**** family helpers being
used?

Use .word looks unreasonable.

Thanks

- Jiaxun

> +
>   static const struct bmips_quirk bmips_quirk_list[] = {
>   	{ "brcm,bcm3368",		&bcm6358_quirks			},
>   	{ "brcm,bcm3384-viper",		&bcm3384_viper_quirks		},
> @@ -120,6 +134,9 @@ static const struct bmips_quirk bmips_quirk_list[] = {
>   	{ "brcm,bcm6368",		&bcm6368_quirks			},
>   	{ "brcm,bcm63168",		&bcm6368_quirks			},
>   	{ "brcm,bcm63268",		&bcm6368_quirks			},
> +	{ "brcm,bcm7344",		&bmips5000_pref30_quirk		},
> +	{ "brcm,bcm7346",		&bmips5000_pref30_quirk		},
> +	{ "brcm,bcm7425",		&bmips5000_pref30_quirk		},
>   	{ },
>   };
>   
