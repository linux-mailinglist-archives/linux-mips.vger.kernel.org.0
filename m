Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8CB723EAB1
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 11:45:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgHGJpg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 05:45:36 -0400
Received: from relay1.mymailcheap.com ([144.217.248.102]:40937 "EHLO
        relay1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgHGJpf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 05:45:35 -0400
X-Greylist: delayed 54956 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 05:45:34 EDT
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id 1BC153F157;
        Fri,  7 Aug 2020 05:45:34 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id F2AFB2A3BD;
        Fri,  7 Aug 2020 05:45:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596793534;
        bh=t2ToXu8yhIqZ88STj/d3ONGFTA8kxJKnz/37IqJZGRM=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=uJ84z521nNKtV4R5VGcEmR9GfVXgbGZjbnPLuAd+11uWL123lN6uLnQcvIILUo1pe
         jbAjokFSB9Gdin6IcHV0MNKpEnoX96+CN0m+DK0ERVEldPi62cUN2Ln4PIbw4ahL0C
         beFKEjlBqj4TDpqIK366G9FKPdK9PIr5Ek1DUajM=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id U4cAgRT9TFvB; Fri,  7 Aug 2020 05:45:32 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri,  7 Aug 2020 05:45:32 -0400 (EDT)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 7C68B4259A;
        Fri,  7 Aug 2020 09:45:29 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="MQWInGY+";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 33B7E425A5;
        Fri,  7 Aug 2020 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596793292;
        bh=t2ToXu8yhIqZ88STj/d3ONGFTA8kxJKnz/37IqJZGRM=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=MQWInGY+u2ATCv0NCgzuj2d9PyJlN8/N2Mp7pmwP4pW3rou4d7bKSkZWhw5MRy/Xx
         oZF1G4KWtqVlcjyHc4LXOb8FDRiNyXWgzHwFYnes7sMgc1DGTTZW6cTQI6cVUnzQZv
         QrfkausLBTMPPnoFFNuEsrw09la0sTombiwU3OpU=
Subject: Re: [PATCH 4/4] MIPS: BCM63xx: refactor board declarations
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200807093825.2902474-1-noltari@gmail.com>
 <20200807093825.2902474-5-noltari@gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <4ebe17b8-699d-349a-9c33-6eec5cb40fa3@flygoat.com>
Date:   Fri, 7 Aug 2020 17:41:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200807093825.2902474-5-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 7C68B4259A
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
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[8];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         FREEMAIL_TO(0.00)[gmail.com,alpha.franken.de,broadcom.com,vger.kernel.org,lists.infradead.org];
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



在 2020/8/7 下午5:38, Álvaro Fernández Rojas 写道:
> Current board declarations are a mess. Let's put some order and make them
> follow the same structure.
> Also remove board declarations tabs and double whitespace in the header.
>
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>   arch/mips/bcm63xx/boards/board_bcm963xx.c | 617 +++++++++++-----------
>   1 file changed, 306 insertions(+), 311 deletions(-)
>
> diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> index ac9570b66f37..36dd356374b1 100644
> --- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
> +++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
> @@ -1,6 +1,6 @@
>   /*
>    * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> + * License. See the file "COPYING" in the main directory of this archive
You'd better replace licenses text with SPDX identifier.
>    * for more details.
>    *
>    * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
> @@ -41,30 +41,28 @@ static struct board_info board;
>    */
>

Thanks

- Jiaxun
