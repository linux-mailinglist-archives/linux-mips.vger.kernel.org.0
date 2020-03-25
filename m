Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 207B6191F68
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 03:46:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgCYCqu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 22:46:50 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:40940 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbgCYCqu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 22:46:50 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992811AbgCYCqrzvS2L (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Wed, 25 Mar 2020 03:46:47 +0100
Date:   Wed, 25 Mar 2020 02:46:47 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Lobakin <alobakin@dlink.ru>,
        Paul Burton <paulburton@kernel.org>,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH] MIPS: mark some functions as weak to avoid conflict with
 Octeon ones
In-Reply-To: <20200324164005.8259-1-masahiroy@kernel.org>
Message-ID: <alpine.LFD.2.21.2003250240110.2689954@eddie.linux-mips.org>
References: <20200324164005.8259-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 25 Mar 2020, Masahiro Yamada wrote:

> MIPS provides multiple definitions for the following functions:
> 
>   fw_init_cmdline
>   __delay
>   __udelay
>   __ndelay
>   memmove
>   __rmemcpy
>   memcpy
>   __copy_user
> 
> The generic ones are defined in lib-y objects, which are overridden by
> the Octeon ones when CONFIG_CAVIUM_OCTEON_SOC is enabled.
> 
> The use of EXPORT_SYMBOL in static libraries potentially causes a
> problem for the llvm linker [1]. So, I want to forcibly link lib-y
> objects to vmlinux when CONFIG_MODULES=y.
> 
> As a groundwork, we must fix multiple definitions that have been
> hidden by lib-y.

 IIUC that causes known dead code to be included in the kernel image.  
Wouldn't it be possible to actually omit replaced functions from output by 
keying the build of the sources providing generic code with appropriate 
CONFIG_* settings (such as CONFIG_GENERIC_DELAY, CONFIG_GENERIC_MEMCPY, 
etc. or suchlike)?

  Maciej
