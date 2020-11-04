Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE322A6340
	for <lists+linux-mips@lfdr.de>; Wed,  4 Nov 2020 12:26:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729427AbgKDL03 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 4 Nov 2020 06:26:29 -0500
Received: from aposti.net ([89.234.176.197]:51000 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729227AbgKDL03 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 4 Nov 2020 06:26:29 -0500
Date:   Wed, 04 Nov 2020 11:26:09 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH mips-next 0/2] mips: boot: add support for self-extracting
 FIT images (vmlinuz.itb)
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <LRR9JQ.VHLICAJG4L2X1@crapouillou.net>
In-Reply-To: <WnsVNeMB9c330hqKGdZ32JHsKO2ZbTM1BOGv74ZSJ9o@cp4-web-014.plabs.ch>
References: <WnsVNeMB9c330hqKGdZ32JHsKO2ZbTM1BOGv74ZSJ9o@cp4-web-014.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alexander,

Le dim. 1 nov. 2020 à 15:11, Alexander Lobakin <alobakin@pm.me> a 
écrit :
> Commit c3e2ee657418 ("MIPS: generic: Add support for zboot") added
> support for self-extracting images to Generic MIPS. However, the
> intended way to boot Generic MIPS kernels is using FIT Images and
> UHI boot protocol, but currently there's no way to make 
> self-extracting
> FIT Image (only legacy uzImages).
> 
> This set consists of two parts:
> 1) various cleanups in arch/mips/boot/compressed/Makefile as a
>    prerequisite;
> 2) a new target named "vmlinuz.itb" for composing self-extracting
>    FIT Images, which allows to have the advantages of both UHI and
>    vmlinuz.
> 
> The second part involves some scenarios duplication, but I think it
> can be a subject for another series (for constifying and unifying
> FIT Images rules across the architectures).
> 
> Alexander Lobakin (2):
>   mips: boot: clean up self-extracting targets scenarios
>   mips: boot: add support for self-extracting FIT images (vmlinuz.itb)

It doesn't break anything on my end, so:

Acked-by: Paul Cercueil <paul@crapouillou.net>

for the series.

Why vmlinuz.itb and not vmlinuz.fit or vmlinuz.uhi? Is the .itb suffix 
already a thing?

Cheers,
-Paul

>  arch/mips/Makefile                 |  3 +-
>  arch/mips/boot/.gitignore          |  1 +
>  arch/mips/boot/compressed/Makefile | 96 
> +++++++++++++++++++++++++-----
>  3 files changed, 85 insertions(+), 15 deletions(-)
> 
> --
> 2.29.2
> 
> 


