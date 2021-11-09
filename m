Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE52E44B0CB
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 16:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237374AbhKIQAl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 11:00:41 -0500
Received: from elvis.franken.de ([193.175.24.41]:39311 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237265AbhKIQAl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 9 Nov 2021 11:00:41 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mkTVS-0003EX-01; Tue, 09 Nov 2021 16:57:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1477AC2C3B; Tue,  9 Nov 2021 16:32:40 +0100 (CET)
Date:   Tue, 9 Nov 2021 16:32:40 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: fix duplicated slashes for Platform file path
Message-ID: <20211109153239.GB13509@alpha.franken.de>
References: <20211109150146.529428-1-masahiroy@kernel.org>
 <20211109150146.529428-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211109150146.529428-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 10, 2021 at 12:01:46AM +0900, Masahiro Yamada wrote:
> platform-y accumulates platform names with a slash appended.
> The current $(patsubst ...) ends up with doubling slashes.
> 
> GNU Make still include Platform files, but in case of an error,
> a clumsy file path is displayed:
> 
>   arch/mips/loongson2ef//Platform:36: *** only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop.  Stop.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/Kbuild.platforms | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
> index 2c57994b5217..30193bcf9caa 100644
> --- a/arch/mips/Kbuild.platforms
> +++ b/arch/mips/Kbuild.platforms
> @@ -37,4 +37,4 @@ platform-$(CONFIG_MACH_TX49XX)		+= txx9/
>  platform-$(CONFIG_MACH_VR41XX)		+= vr41xx/
>  
>  # include the platform specific files
> -include $(patsubst %, $(srctree)/arch/mips/%/Platform, $(platform-y))
> +include $(patsubst %/, $(srctree)/arch/mips/%/Platform, $(platform-y))
> -- 
> 2.30.2

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
