Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0FDD2CEDB7
	for <lists+linux-mips@lfdr.de>; Fri,  4 Dec 2020 13:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728666AbgLDMKy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from elvis.franken.de ([193.175.24.41]:48097 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728306AbgLDMKy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Dec 2020 07:10:54 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kl9ud-0005Nb-04; Fri, 04 Dec 2020 13:10:11 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id EED0FC02E5; Fri,  4 Dec 2020 13:08:52 +0100 (CET)
Date:   Fri, 4 Dec 2020 13:08:52 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Xingxing Su <suxingxing@loongson.cn>
Cc:     Youling Tang <tangyouling@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Enable GCOV
Message-ID: <20201204120852.GE10011@alpha.franken.de>
References: <1606980171-9536-1-git-send-email-suxingxing@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606980171-9536-1-git-send-email-suxingxing@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 03, 2020 at 03:22:51PM +0800, Xingxing Su wrote:
> Enable gcov profiling of the entire kernel on mips. Required changes
> include disabling profiling for:
> 
> * arch/kernel/boot/compressed: not linked to main kernel.
> 
> Lightly tested on Loongson 3A3000 an 3A4000, seems to work as expected.
> 
> without "GCOV_PROFILE := n" in compressed Makefile,
> build errors as follows:
> ...
> ld: arch/mips/boot/compressed/string.o:(.data+0x88):
>  undefined reference to `__gcov_merge_add'
> ld: arch/mips/boot/compressed/string.o:
>  in function `_GLOBAL__sub_I_00100_0_memcpy':
> string.c:(.text.startup+0x4): undefined reference to `__gcov_init'
> ld: arch/mips/boot/compressed/string.o:
>  in function `_GLOBAL__sub_D_00100_1_memcpy':
> string.c:(.text.exit+0x0): undefined reference to `__gcov_exit'
> ...
> 
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
> ---
>  arch/mips/Kconfig                  | 1 +
>  arch/mips/boot/compressed/Makefile | 1 +
>  2 files changed, 2 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
