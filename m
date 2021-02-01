Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EAC030A93A
	for <lists+linux-mips@lfdr.de>; Mon,  1 Feb 2021 15:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbhBAN7l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Feb 2021 08:59:41 -0500
Received: from elvis.franken.de ([193.175.24.41]:43717 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232031AbhBAN7i (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Feb 2021 08:59:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l6ZjC-0001Qe-00; Mon, 01 Feb 2021 14:58:54 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 57C92C0D38; Mon,  1 Feb 2021 13:50:28 +0100 (CET)
Date:   Mon, 1 Feb 2021 13:50:28 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: relocatable: Provide kaslr_offset() to get the
 kernel offset
Message-ID: <20210201125028.GA8621@alpha.franken.de>
References: <1611720745-8256-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1611720745-8256-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 12:12:25PM +0800, Jinyang He wrote:
> Use kimage_vaddr to indicate kernel start address. Provide kaslr_offset()
> to get the kernel offset when KASLR is enabled. Error may occur before
> update_kimage_vaddr(), so put it at the end of the offset branch.
> 
> Fixes: a307a4ce9ecd ("MIPS: Loongson64: Add KASLR support")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/include/asm/page.h |  6 ++++++
>  arch/mips/kernel/relocate.c  | 12 ++++++++++++
>  arch/mips/kernel/setup.c     |  3 +++
>  3 files changed, 21 insertions(+)
> 
> diff --git a/arch/mips/include/asm/page.h b/arch/mips/include/asm/page.h
> index 6a77bc4..9429520 100644
> --- a/arch/mips/include/asm/page.h
> +++ b/arch/mips/include/asm/page.h
> @@ -255,6 +255,12 @@ extern bool __virt_addr_valid(const volatile void *kaddr);
>  
>  #define VM_DATA_DEFAULT_FLAGS	VM_DATA_FLAGS_TSK_EXEC
>  
> +extern unsigned long kimage_vaddr;
> +static inline unsigned long kaslr_offset(void)
> +{
> +	return kimage_vaddr - VMLINUX_LOAD_ADDRESS;
> +}

this breaks for 32bit kernels:

<command-line>:0:22: error: large integer implicitly truncated to unsigned type [-Werror=overflow]
/local/tbogendoerfer/korg/linux/arch/mips/kernel/setup.c:87:41: note: in expansion of macro ‘VMLINUX_LOAD_ADDRESS’
 unsigned long kimage_vaddr __initdata = VMLINUX_LOAD_ADDRESS;
                                         ^~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
