Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9E9A1C88A4
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 13:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgEGLnZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 07:43:25 -0400
Received: from elvis.franken.de ([193.175.24.41]:43620 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgEGLnX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 May 2020 07:43:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jWevq-00081e-02; Thu, 07 May 2020 13:43:14 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 95D7EC0409; Thu,  7 May 2020 13:00:36 +0200 (CEST)
Date:   Thu, 7 May 2020 13:00:36 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Fangrui Song <maskray@google.com>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jouni Hogander <jouni.hogander@unikie.com>,
        Kevin Darbyshire-Bryant <ldir@darbyshire-bryant.me.uk>,
        Borislav Petkov <bp@suse.de>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: your mail
Message-ID: <20200507110036.GC11616@alpha.franken.de>
References: <20200506055245.3013374-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506055245.3013374-1-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, May 06, 2020 at 01:52:45PM +0800, Jiaxun Yang wrote:
> Subject: [PATCH v6] MIPS: Truncate link address into 32bit for 32bit kernel
> In-Reply-To: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
> 
> LLD failed to link vmlinux with 64bit load address for 32bit ELF
> while bfd will strip 64bit address into 32bit silently.
> To fix LLD build, we should truncate load address provided by platform
> into 32bit for 32bit kernel.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/786
> Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784
> Reviewed-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Maciej W. Rozycki <macro@linux-mips.org>
> ---
> V2: Take MaskRay's shell magic.
> 
> V3: After spent an hour on dealing with special character issue in
> Makefile, I gave up to do shell hacks and write a util in C instead.
> Thanks Maciej for pointing out Makefile variable problem.
> 
> v4: Finally we managed to find a Makefile method to do it properly
> thanks to Kees. As it's too far from the initial version, I removed
> Review & Test tag from Nick and Fangrui and Cc instead.
> 
> v5: Care vmlinuz as well.
> 
> v6: Rename to LIKER_LOAD_ADDRESS 
> ---
>  arch/mips/Makefile                 | 13 ++++++++++++-
>  arch/mips/boot/compressed/Makefile |  2 +-
>  arch/mips/kernel/vmlinux.lds.S     |  2 +-
>  3 files changed, 14 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
