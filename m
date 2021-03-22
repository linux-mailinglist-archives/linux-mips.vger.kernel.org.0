Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC55334406B
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 13:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbhCVMFD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 08:05:03 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:31664 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbhCVMEx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 08:04:53 -0400
Date:   Mon, 22 Mar 2021 12:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1616414690; bh=AFgCbLguriV3CwFF1nhSPTfmyyoAQpRcEnd0zBssKuA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=R2bsUqhAg7Fb96oKF1Og1ulpJbeTnxg9Y4uLtwnit83vvh+9uG8Nj3KGjQyjUaZLT
         ikLY5u/4aOVlDvfJARcJxogpArdlynErRRX8V5/fp561LEUK8LeB2dn8E7MAR0hxsS
         xBwLtBEqYJ508r6yD5t1DYRVXjGprSBF/Yqt/KZ7zEywTVG/GMbC9+ATTmQ7/uNtHA
         eFC7xLk5UUIO/0GHIFgmbR8smuGILktzsL545NR2h+78m1pQfSabQ1CF/oWLuDRP2K
         ETKrOCCrmL8qkf/qeRziA0e8cL0VbN1Da+8EyJpoGAglypHPZAjhog9mXW+FumsQDE
         k+5sAKgbGuR4w==
To:     Paul Cercueil <paul@crapouillou.net>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Paul Burton <paulburton@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH] MIPS: generic: Support linking with LLVM ld.lld
Message-ID: <20210322120429.3706-1-alobakin@pm.me>
In-Reply-To: <20210321131805.98422-1-paul@crapouillou.net>
References: <20210321131805.98422-1-paul@crapouillou.net>
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

From: Paul Cercueil <paul@crapouillou.net>
Date: Sun, 21 Mar 2021 13:18:05 +0000

> LLVM's ld.lld chokes on the 64-bit sign-extended load addresses. Use
> 32-bit addresses if the linker is LLVM's ld.lld.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/generic/Platform | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
> index b871af16b5b6..19b7d92a4ca7 100644
> --- a/arch/mips/generic/Platform
> +++ b/arch/mips/generic/Platform
> @@ -12,8 +12,8 @@
>  cflags-$(CONFIG_MACH_INGENIC_SOC)=09+=3D -I$(srctree)/arch/mips/include/=
asm/mach-ingenic
>  cflags-$(CONFIG_MIPS_GENERIC)=09+=3D -I$(srctree)/arch/mips/include/asm/=
mach-generic
>
> -load-$(CONFIG_MIPS_GENERIC)=09+=3D 0xffffffff80100000
> -zload-$(CONFIG_MIPS_GENERIC)=09+=3D 0xffffffff81000000
> +load-$(CONFIG_MIPS_GENERIC)=09=09+=3D $(if $(CONFIG_LD_IS_LLD),0x8010000=
0,0xffffffff80100000)
> +zload-$(CONFIG_MIPS_GENERIC)=09+=3D $(if $(CONFIG_LD_IS_LLD),0x81000000,=
0xffffffff81000000)
>  all-$(CONFIG_MIPS_GENERIC)=09:=3D vmlinux.gz.itb

For load-y, it's handled in arch/mips/Makefile:289 arch-wide.
For zload-y, it's not handled at all, but the proper way to do this
is to add a similar to load-ld logics in
arch/mips/boot/compressed/Makefile.

>  its-y=09=09=09=09=09:=3D vmlinux.its.S
> --
> 2.30.2

Thanks,
Al

