Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7862A655B
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 14:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgKDNj7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 4 Nov 2020 08:39:59 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:41764 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726527AbgKDNj6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 4 Nov 2020 08:39:58 -0500
Date:   Wed, 04 Nov 2020 13:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1604497192; bh=WdLBXEtTB5n+fQsb0z3+UyBitWtDwfM7q0BL1uG5J+4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=fdNyEqnONVsoXGG9bpasjovquWUEtyw3bjAP49H6fTMBFJA6Y55fCeh316i7tPguh
         g3oJV0oltLhOhgaDGTWiazuisjbwI2gkRVuCcZovJYyFWdH6O5pHnpcZdMN/wiRU8W
         gNv3ul9dSOB90b3loNPij/nnh1Fy+4iAXNVMtrId4sJWRkHV6ByJpbOC6vGqaf0D80
         orzGe/oPhKkoRPE9VAq0MI8zIO4ZOFjtslL+lsOGimpkLDtJlulvv5JyPrdGIt+cf9
         Xxs+R6eZWhYX3tR0pA9zRRMu3U+t4zmpKckxvPFakL1R2PpaVR3w4CPI33RnFtNay4
         uhEotKIfwJStg==
To:     Paul Cercueil <paul@crapouillou.net>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH mips-next 0/2] mips: boot: add support for self-extracting FIT images (vmlinuz.itb)
Message-ID: <eUfiHt8RGTIlXhRVg9xYtvUalUyxmikudUShCIFKWoo@cp7-web-039.plabs.ch>
In-Reply-To: <LRR9JQ.VHLICAJG4L2X1@crapouillou.net>
References: <WnsVNeMB9c330hqKGdZ32JHsKO2ZbTM1BOGv74ZSJ9o@cp4-web-014.plabs.ch> <LRR9JQ.VHLICAJG4L2X1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD
        shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Cercueil <paul@crapouillou.net>
Date: Wed, 04 Nov 2020 11:26:09 +0000

> Hi Alexander,

Hi Paul!

> Le dim. 1 nov. 2020 =EF=BF=BD 15:11, Alexander Lobakin <alobakin@pm.me> a
> =C3=A9crit :
>> Commit c3e2ee657418 ("MIPS: generic: Add support for zboot") added
>> support for self-extracting images to Generic MIPS. However, the
>> intended way to boot Generic MIPS kernels is using FIT Images and
>> UHI boot protocol, but currently there's no way to make
>> self-extracting
>> FIT Image (only legacy uzImages).
>>
>> This set consists of two parts:
>> 1) various cleanups in arch/mips/boot/compressed/Makefile as a
>>    prerequisite;
>> 2) a new target named "vmlinuz.itb" for composing self-extracting
>>    FIT Images, which allows to have the advantages of both UHI and
>>    vmlinuz.
>>
>> The second part involves some scenarios duplication, but I think it
>> can be a subject for another series (for constifying and unifying
>> FIT Images rules across the architectures).
>>
>> Alexander Lobakin (2):
>>   mips: boot: clean up self-extracting targets scenarios
>>   mips: boot: add support for self-extracting FIT images (vmlinuz.itb)
>
> It doesn't break anything on my end, so:
>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
>
> for the series.

Thanks!

> Why vmlinuz.itb and not vmlinuz.fit or vmlinuz.uhi? Is the .itb suffix
> already a thing?

As far as I know -- yes, ITB stands for Image Tree Blob (reference
to Device Tree Blob) and it's a standartized extension for FIT Images
(you can see that all variants for MIPS have ".itb" at the bottom of
arch/mips/boot/Makefile).

> Cheers,
> -Paul

Al

>>  arch/mips/Makefile                 |  3 +-
>>  arch/mips/boot/.gitignore          |  1 +
>>  arch/mips/boot/compressed/Makefile | 96
>> +++++++++++++++++++++++++-----
>>  3 files changed, 85 insertions(+), 15 deletions(-)
>>
>> --
>> 2.29.2

