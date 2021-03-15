Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E242233AFE7
	for <lists+linux-mips@lfdr.de>; Mon, 15 Mar 2021 11:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhCOKYW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 15 Mar 2021 06:24:22 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:42128 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbhCOKYG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 15 Mar 2021 06:24:06 -0400
Date:   Mon, 15 Mar 2021 10:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1615803844; bh=l1RduitC4Ez6ULnicCuXvf1dgC7AKOU5uLPjYiJFJKM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Q7/upxzH81CCp5LPNHTkQFpH3RzuKteWoOY+JBzTDt40hVe67JPu1458Rpyc4vYbQ
         SBtBqd+kQDcOq8zApv7VhgRJPq4XJggaD4Rp2vUGVqJgVEXknqJt6Z51jggKwLPfbw
         E74tdd8ix0QSud0xdY/MQcfZeB1d45sDXPaxL1J5yDfXbQ/KVE/+l+hgqlDGw8XCQ8
         fTe9d3Qlw7GKewmxwHCTR6syKLGbgthB5kD0E6FFMNNgy9QxuiEL/GeK49IsedZwEq
         w2O9Q9eeneUOsSYu0wJpvpcRcobKvvb+eglCmmb145N7IoBIwmr3rvFW4QrjUVgtWh
         67ZZktFpPzv+A==
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        David Laight <David.Laight@ACULAB.COM>
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH v2] MIPS: Check __clang__ to avoid performance influence with GCC in csum_tcpudp_nofold()
Message-ID: <20210315102346.10227-1-alobakin@pm.me>
In-Reply-To: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Tue, 9 Mar 2021 12:18:13 +0800

> The asm code in csum_tcpudp_nofold() is performance-critical, I am sorry
> for the poorly considered implementation about the performance influence
> with GCC in the commit 198688edbf77 ("MIPS: Fix inline asm input/output
> type mismatch in checksum.h used with Clang").
>
> With this patch, we can build successfully by both GCC and Clang,
> at the same time, we can avoid the potential performance influence
> with GCC.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/checksum.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/arch/mips/include/asm/checksum.h b/arch/mips/include/asm/che=
cksum.h
> index 1e6c135..80eddd4 100644
> --- a/arch/mips/include/asm/checksum.h
> +++ b/arch/mips/include/asm/checksum.h
> @@ -128,9 +128,13 @@ static inline __sum16 ip_fast_csum(const void *iph, =
unsigned int ihl)
>
>  static inline __wsum csum_tcpudp_nofold(__be32 saddr, __be32 daddr,
>  =09=09=09=09=09__u32 len, __u8 proto,
> -=09=09=09=09=09__wsum sum)
> +=09=09=09=09=09__wsum sum_in)
>  {
> -=09unsigned long tmp =3D (__force unsigned long)sum;
> +#ifdef __clang__

Why not rely on CONFIG_CC_IS_CLANG here?

> +=09unsigned long sum =3D (__force unsigned long)sum_in;
> +#else
> +=09__wsum sum =3D sum_in;
> +#endif
>
>  =09__asm__(
>  =09"=09.set=09push=09=09# csum_tcpudp_nofold\n"
> @@ -159,7 +163,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr,=
 __be32 daddr,
>  =09"=09addu=09%0, $1=09=09\n"
>  #endif
>  =09"=09.set=09pop"
> -=09: "=3Dr" (tmp)
> +=09: "=3Dr" (sum)
>  =09: "0" ((__force unsigned long)daddr),
>  =09  "r" ((__force unsigned long)saddr),
>  #ifdef __MIPSEL__
> @@ -169,7 +173,7 @@ static inline __wsum csum_tcpudp_nofold(__be32 saddr,=
 __be32 daddr,
>  #endif
>  =09  "r" ((__force unsigned long)sum));
>
> -=09return (__force __wsum)tmp;
> +=09return (__force __wsum)sum;
>  }
>  #define csum_tcpudp_nofold csum_tcpudp_nofold
>
> --
> 2.1.0

Al

