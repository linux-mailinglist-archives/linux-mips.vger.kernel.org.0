Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADBCB222223
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 14:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgGPMEn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 08:04:43 -0400
Received: from elvis.franken.de ([193.175.24.41]:38371 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728001AbgGPMEn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 08:04:43 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jw2cz-0000rW-00; Thu, 16 Jul 2020 14:04:41 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 2E6AFC080E; Thu, 16 Jul 2020 13:59:51 +0200 (CEST)
Date:   Thu, 16 Jul 2020 13:59:51 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
Message-ID: <20200716115951.GA11361@alpha.franken.de>
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jul 07, 2020 at 05:39:01PM +0800, Tiezhu Yang wrote:
> In the MIPS architecture, we should clear the security-relevant
> flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
> file arch/mips/include/asm/elf.h.
> 
> Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
> mmap to make memory executable that is not safe, because this
> condition allows an attacker to simply jump to and execute bytes
> that are considered to be just data [1].
> 
> In mm/mmap.c:
> unsigned long do_mmap(struct file *file, unsigned long addr,
> 			unsigned long len, unsigned long prot,
> 			unsigned long flags, vm_flags_t vm_flags,
> 			unsigned long pgoff, unsigned long *populate,
> 			struct list_head *uf)
> {
> 	[...]
> 	if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
> 		if (!(file && path_noexec(&file->f_path)))
> 			prot |= PROT_EXEC;
> 	[...]
> }
> 
> By the way, x86 and ARM64 have done the similar thing.
> 
> After commit 250c22777fe1 ("x86_64: move kernel"), in the file
> arch/x86/kernel/process_64.c:
> void set_personality_64bit(void)
> {
> 	[...]
> 	current->personality &= ~READ_IMPLIES_EXEC;
> }
> 
> After commit 48f99c8ec0b2 ("arm64: Preventing READ_IMPLIES_EXEC
> propagation"), in the file arch/arm64/include/asm/elf.h:
> #define SET_PERSONALITY(ex)						\
> ({									\
> 	clear_thread_flag(TIF_32BIT);					\
> 	current->personality &= ~READ_IMPLIES_EXEC;			\
> })
> 
> [1] https://insights.sei.cmu.edu/cert/2014/02/feeling-insecure-blame-your-parent.html
> 
> Reported-by: Juxin Gao <gaojuxin@loongson.cn>
> Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/elf.h | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
