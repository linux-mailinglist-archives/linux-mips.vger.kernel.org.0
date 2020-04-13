Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651DD1A6358
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 08:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgDMG7d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 02:59:33 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:41540 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728874AbgDMG7d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 02:59:33 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23991212AbgDMG73NT9ds (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Mon, 13 Apr 2020 08:59:29 +0200
Date:   Mon, 13 Apr 2020 07:59:29 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
cc:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit
 kernel
In-Reply-To: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
Message-ID: <alpine.LFD.2.21.2004130736410.851719@eddie.linux-mips.org>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 13 Apr 2020, Jiaxun Yang wrote:

> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.

Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>

> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
> index a5f00ec73ea6..5226cd8e4bee 100644
> --- a/arch/mips/kernel/vmlinux.lds.S
> +++ b/arch/mips/kernel/vmlinux.lds.S
> @@ -55,7 +55,7 @@ SECTIONS
>  	/* . = 0xa800000000300000; */
>  	. = 0xffffffff80300000;
>  #endif
> -	. = VMLINUX_LOAD_ADDRESS;
> +	. = VMLINUX_LINK_ADDRESS;

 The CONFIG_BOOT_ELF64 cruft right above it looks interesting to me, never 
have ever been used.  We have had the current arrangement since:

commit 923ec3d20eef9e36456868b590873ce39f17fe71
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Wed Nov 6 22:16:38 2002 +0000

    Define load address in linker script instead of relying on the
    deprecated and notoriously unreliable option -Ttext.

and previously `-Ttext' was used with this script anyway, though not very 
long, as the script was entirely ignored until:

commit 7a782968041ffc4c2d89816238e2f8ea5cceddba
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Thu Oct 31 23:54:21 2002 +0000

    Merge with Linux 2.5.36.

  Maciej
