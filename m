Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1444321943F
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jul 2020 01:26:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbgGHX0N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Jul 2020 19:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGHX0M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Jul 2020 19:26:12 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CAC2C08C5C1
        for <linux-mips@vger.kernel.org>; Wed,  8 Jul 2020 16:26:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mn17so242459pjb.4
        for <linux-mips@vger.kernel.org>; Wed, 08 Jul 2020 16:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nH2GS/OTrvCduU0b8tDpOcN6ehsAwEU0onRF+A5Ut5k=;
        b=HYbrvo/xF79bO2B6IrkMMLUkmjKPzdJkvanrMInp8S42k6HBGtzvlMd9S1UMsOPkQq
         kD96OG7jPioQJwVhmcN6AkeMW4/SHyENEHjDe4IuQjxeLq714wlZHE3s1cGSQxT8Jbv7
         MrPitnx0OcckBdRzsOFubqaRZyUAfYAh/ym5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nH2GS/OTrvCduU0b8tDpOcN6ehsAwEU0onRF+A5Ut5k=;
        b=bKaDrUfCWjtNQvGHfkRzGMed+5Zcr5pJ2MBoYDNq/p4PXYeSP/mBuy2viOgf54cY0x
         EtKZSXnku3gPUhZKQlxp+3D5dcUnRZSsF0mCIOOv4trX+eYL6KTJZLvFf45+rdP8uVWY
         IggN5HllrLCtS7AhJtY1d+nrYLCXWMsQ7/+DKcIUWo1huq68gyT+EeOj1QqIvRh+1Dhk
         +kWYybPvn7LlDtv7O5IWAReuc+prhc0jk4kyRA95PHwTk1/As0dq/RNwwpc1mp31gfIt
         ChTbH9EVxVGCHp0FHukvFZDiix/b7070CAlhyu7e0g1bAdRaBo9uAGl7U+FZdvA8Iok5
         Py8Q==
X-Gm-Message-State: AOAM533AlUmMwNd9Y13JNZJSM/FgE9ZmQrPubRrvE+JTeP7+C5te0/yy
        txzCsk8gaW29bEX1Ue6X6uxmXx6gVmc=
X-Google-Smtp-Source: ABdhPJzniWV9Twx/MX+UzsIO+dG+AvwC8/i/kZk/gvvqhaDExjNsUdeEEAP66hKEdkwugkIW4si31A==
X-Received: by 2002:a17:90a:780f:: with SMTP id w15mr11778381pjk.235.1594250771013;
        Wed, 08 Jul 2020 16:26:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i128sm759010pfe.74.2020.07.08.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 16:26:10 -0700 (PDT)
Date:   Wed, 8 Jul 2020 16:26:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: Re: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
Message-ID: <202007081624.82FA0CC1EA@keescook>
References: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
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

This seems correct to me.

Reviewed-by: Kees Cook <keescook@chromium.org>

BTW, does MIPS also need similar changes to this series:
https://lore.kernel.org/lkml/20200327064820.12602-1-keescook@chromium.org/

Quoting from there "MIPS may need adjusting but the history of CPU
features and toolchain behavior is very unclear to me."

-- 
Kees Cook
