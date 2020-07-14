Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0011D21E886
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 08:47:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgGNGr2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 02:47:28 -0400
Received: from relay3.mymailcheap.com ([217.182.119.157]:34457 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgGNGr1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 02:47:27 -0400
X-Greylist: delayed 105457 seconds by postgrey-1.27 at vger.kernel.org; Tue, 14 Jul 2020 02:47:25 EDT
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id C15B03ECDF;
        Tue, 14 Jul 2020 08:47:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id EF7762A3B3;
        Tue, 14 Jul 2020 02:47:22 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1594709243;
        bh=/2exoZAW+zEogykugQNbSbghfGyyujQ05oJp+Mrxa34=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=bewZtSkm0aMCaTvEDCF78Bmlu2AktXPgD7UHZmnZG3IsvgbjVSLuHzlmceWfbMpfI
         mkup9biNXnpIhtPyQbl6KVbDOlvJdGAI3gTI2Q1OAR0kbKFGp8CdBe7jof30vhjp1y
         Vg7Ugs+6UPb0oiKfIgy6sRxQpgs4K0AGX7dwkfU8=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iE_h8nIxHzDy; Tue, 14 Jul 2020 02:47:21 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Tue, 14 Jul 2020 02:47:20 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id DD9E540EDE;
        Tue, 14 Jul 2020 06:47:18 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="YcH1kmUf";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (ec2-18-162-193-254.ap-east-1.compute.amazonaws.com [18.162.193.254])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2EEAF40EDE;
        Tue, 14 Jul 2020 06:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1594709115;
        bh=/2exoZAW+zEogykugQNbSbghfGyyujQ05oJp+Mrxa34=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=YcH1kmUfbulne5o1nwolTE5qv/lvG67jubOfIvS4lde1eMNozOf71FT3n6Tc+t0q8
         JYHEmD1lE77IsQVpHp7nkwOPcFwdQfv8enLsKPuRVISnqlnbKLkeFSmcbk4Wx+YBtw
         BhmZ4lIYYnd7KRnFx+Cxio69KjshKiG3NkJPEYlw=
Subject: Re: [PATCH] MIPS: Replace HTTP links with HTTPS ones
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        tsbogend@alpha.franken.de, paulburton@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200713085243.32566-1-grandmaster@al2klimov.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <59938583-2ce4-c7bf-c454-89a1559be846@flygoat.com>
Date:   Tue, 14 Jul 2020 14:45:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200713085243.32566-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD9E540EDE
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/13 16:52, Alexander A. Klimov Ð´µÀ:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>
> Deterministic algorithm:
> For each file:
>    If not .svg:
>      For each line:
>        If doesn't contain `\bxmlns\b`:
>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>              If both the HTTP and HTTPS versions
>              return 200 OK and serve the same content:
>                Replace HTTP with HTTPS.
>
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>   Continuing my work started at 93431e0607e5.
>   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>   (Actually letting a shell for loop submit all this stuff for me.)
>
>   If there are any URLs to be removed completely or at least not just HTTPSified:
>   Just clearly say so and I'll *undo my change*.
>   See also: https://lkml.org/lkml/2020/6/27/64
>
>   If there are any valid, but yet not changed URLs:
>   See: https://lkml.org/lkml/2020/6/26/837
>
>   If you apply the patch, please let me know.
>
>   Sorry again to all maintainers who complained about subject lines.
>   Now I realized that you want an actually perfect prefixes,
>   not just subsystem ones.
>   I tried my best...
>   And yes, *I could* (at least half-)automate it.
>   Impossible is nothing! :)
>
>
>   arch/mips/Kconfig           | 4 ++--
>   arch/mips/include/asm/war.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 6fee1a133e9d..bdd073a0a67e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -2393,7 +2393,7 @@ config MIPS_MT_SMP
>   	  on cores with the MT ASE and uses the available VPEs to implement
>   	  virtual processors which supports SMP. This is equivalent to the
>   	  Intel Hyperthreading feature. For further information go to
> -	  <http://www.imgtec.com/mips/mips-multithreading.asp>.
> +	  <https://www.imgtec.com/mips/mips-multithreading.asp>.

All MIPS content have been removed from IMGTEC's site, we'd better remove
this link?

- Jiaxun
