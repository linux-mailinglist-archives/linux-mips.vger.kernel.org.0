Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0A62B122D
	for <lists+linux-mips@lfdr.de>; Thu, 12 Nov 2020 23:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgKLWuV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Nov 2020 17:50:21 -0500
Received: from elvis.franken.de ([193.175.24.41]:57148 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgKLWuU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Nov 2020 17:50:20 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kdLQ2-0005gc-05; Thu, 12 Nov 2020 23:50:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7C26BC4DE1; Thu, 12 Nov 2020 23:49:46 +0100 (CET)
Date:   Thu, 12 Nov 2020 23:49:46 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Alexander Lobakin <alobakin@pm.me>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH mips-next 0/2] mips: boot: add support for
 self-extracting FIT images (vmlinuz.itb)
Message-ID: <20201112224946.GF19695@alpha.franken.de>
References: <WnsVNeMB9c330hqKGdZ32JHsKO2ZbTM1BOGv74ZSJ9o@cp4-web-014.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <WnsVNeMB9c330hqKGdZ32JHsKO2ZbTM1BOGv74ZSJ9o@cp4-web-014.plabs.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Nov 01, 2020 at 03:11:07PM +0000, Alexander Lobakin wrote:
> Commit c3e2ee657418 ("MIPS: generic: Add support for zboot") added
> support for self-extracting images to Generic MIPS. However, the
> intended way to boot Generic MIPS kernels is using FIT Images and
> UHI boot protocol, but currently there's no way to make self-extracting
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
> 
>  arch/mips/Makefile                 |  3 +-
>  arch/mips/boot/.gitignore          |  1 +
>  arch/mips/boot/compressed/Makefile | 96 +++++++++++++++++++++++++-----
>  3 files changed, 85 insertions(+), 15 deletions(-)

series applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
