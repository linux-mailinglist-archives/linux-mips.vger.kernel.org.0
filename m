Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED18430F6B2
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 16:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237396AbhBDPqr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 10:46:47 -0500
Received: from elvis.franken.de ([193.175.24.41]:52342 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237499AbhBDPjV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 10:39:21 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l7giJ-00066e-00; Thu, 04 Feb 2021 16:38:35 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F2437C0D5A; Thu,  4 Feb 2021 16:36:23 +0100 (CET)
Date:   Thu, 4 Feb 2021 16:36:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] MIPS: relocatable: Use __kaslr_offset in
 show_kernel_relocation
Message-ID: <20210204153623.GA14818@alpha.franken.de>
References: <1612348510-29569-1-git-send-email-hejinyang@loongson.cn>
 <1612348510-29569-2-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612348510-29569-2-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 03, 2021 at 06:35:10PM +0800, Jinyang He wrote:
> The type of the VMLINUX_LOAD_ADDRESS macro is the (unsigned long long)
> in 32bits kernel but (unsigned long) in the 64-bit kernel. Although there
> is no error here, avoid using it to calculate kaslr_offset. And here we
> may need is that the address of __kaslr_offset rather than (void *)offset.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/relocate.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/mips/kernel/relocate.c b/arch/mips/kernel/relocate.c
> index 95abb9c..52018a3 100644
> --- a/arch/mips/kernel/relocate.c
> +++ b/arch/mips/kernel/relocate.c
> @@ -430,13 +430,9 @@ void *__init relocate_kernel(void)
>   */
>  static void show_kernel_relocation(const char *level)
>  {
> -	unsigned long offset;
> -
> -	offset = __pa_symbol(_text) - __pa_symbol(VMLINUX_LOAD_ADDRESS);
> -
> -	if (IS_ENABLED(CONFIG_RELOCATABLE) && offset > 0) {
> +	if (__kaslr_offset > 0) {
>  		printk(level);
> -		pr_cont("Kernel relocated by 0x%pK\n", (void *)offset);
> +		pr_cont("Kernel relocated by 0x%pK\n", &__kaslr_offset);

are you sure ? I would have expected (void *)__kaslr_offset here.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
