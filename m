Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3583231915
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 07:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbgG2F0P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Jul 2020 01:26:15 -0400
Received: from relay5.mymailcheap.com ([159.100.241.64]:48692 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgG2F0O (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Jul 2020 01:26:14 -0400
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id D849D206D8
        for <linux-mips@vger.kernel.org>; Wed, 29 Jul 2020 05:26:10 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id D2B523F201;
        Wed, 29 Jul 2020 01:26:08 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id B6A6A2A0F5;
        Wed, 29 Jul 2020 01:26:08 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596000368;
        bh=9VssQ0eef15T/7P1MGtE1aax+C82Jg82Exjogk88SO0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MBqyH03sQABq+2tuIBcuDlOQyQDOSkID5tn9jdeRY8db+lWrr+4l1M5lj0tB4HYwO
         lyO6PZ+Is1WAIRV+rc+SqrRz0AJ5cHaiXTuApwpyppt9UzNerPynMFi6Vr5D8R54ww
         /Nb83svj6zbG38zq+KTPeR5aM37WenEiMn3V6P5w=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id kOGvyz4H2cYR; Wed, 29 Jul 2020 01:26:07 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 29 Jul 2020 01:26:07 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D9EEC40847;
        Wed, 29 Jul 2020 05:26:03 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="HVNv0mHI";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li161-247.members.linode.com [173.230.151.247])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id C0E0240847;
        Wed, 29 Jul 2020 05:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596000333;
        bh=9VssQ0eef15T/7P1MGtE1aax+C82Jg82Exjogk88SO0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HVNv0mHIS+BjbYTqqBGzVzy39/0LHKm8HC3BsDrIHH80YjNFDNAKXVWKYU8FzeXq/
         kWzP6HBoXovvIt8nONmsaiwa8GrNFn/jQBjqQIQO3Wde6ug7vDyDQ4//Al44F7jHDO
         3r0AnnTKHBK0bwp3LmwuH4sU1X1zDsXHei0utPCk=
Subject: Re: [PATCH 1/5] dt-bindings: interrupt-controller: Update Loongson
 HTVEC description
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <c066601c-aa5b-1ef7-1fe4-9f874ed919b6@flygoat.com>
Date:   Wed, 29 Jul 2020 13:25:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <1596000130-8689-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9EEC40847
X-Spamd-Result: default: False [1.40 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         MID_RHS_MATCH_FROM(0.00)[];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[9];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         SUSPICIOUS_RECIPS(1.50)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/29 13:22, Huacai Chen Ð´µÀ:
> Loongson HTVEC support 8 parents interrupts in maximum, so update the
> maxItems description.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---
>   .../devicetree/bindings/interrupt-controller/loongson,htvec.yaml      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> index e865cd8..87a7455 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
> @@ -22,8 +22,8 @@ properties:
>   
>     interrupts:
>       minItems: 1
> -    maxItems: 4
> -    description: Four parent interrupts that receive chained interrupts.
> +    maxItems: 8
> +    description: Eight parent interrupts that receive chained interrupts.
>   
>     interrupt-controller: true
>   
