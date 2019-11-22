Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33A9107768
	for <lists+linux-mips@lfdr.de>; Fri, 22 Nov 2019 19:35:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKVSfn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Nov 2019 13:35:43 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38475 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbfKVSfn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 22 Nov 2019 13:35:43 -0500
Received: by mail-pg1-f195.google.com with SMTP id t3so3263486pgl.5;
        Fri, 22 Nov 2019 10:35:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C496R21wUL9ca4CtsQrqNT8rS3xWsFNgWAAHeXrAZps=;
        b=n8nLnWy+o67EYWdosNVhPdW5U3vZ9/2ygaDthy1kGO/ljoymyc/kekWtI327mkENhq
         dHCflQSONcF5Ic0s7NZKG5H61a4ZnpP7xbEqv0sVr0xikdo1Ogp+QaZj0+zT86Zs6/dI
         RHubSY2jqD9QMzPZTia64QKh5ndoqw1fF71ZEIoeGRIu+I01YezsSoeSyGx0kBb01v4S
         BSuDlUxcH94LsfWtVgQCfuWAW9swS/64kkHE3NKD9nhD49VbiDtrt8M+o4rDu5NjWYhJ
         LjZenRWRb3Op60hFd9QdcjR6znGMiPDb5wqBi+6lWQBkQm2F0O13JpHXUu7fKVNOsVWL
         2hag==
X-Gm-Message-State: APjAAAWCV0TcNNRx+Gpj/yp7HQH27GX0/41GdKcB4Dm+GIUCscb8ZVYJ
        B+aWmFdJiCcb5F4It6ZaxieTIUkrZi69tQ==
X-Google-Smtp-Source: APXvYqzDXWJQrZuIC1f1s93w/jXpX0SxxCUgm3qLPAVjqBr/839u4wmTH6F6WvmyS4MIEmnILpQcnw==
X-Received: by 2002:a62:1b50:: with SMTP id b77mr19201572pfb.187.1574447742174;
        Fri, 22 Nov 2019 10:35:42 -0800 (PST)
Received: from localhost ([2601:646:8a00:9810:5af3:56d9:f882:39d4])
        by smtp.gmail.com with ESMTPSA id i13sm7949307pfo.39.2019.11.22.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 10:35:41 -0800 (PST)
Date:   Fri, 22 Nov 2019 10:36:21 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     chenhc@lemote.com, jiaxun.yang@flygoat.com, ralf@linux-mips.org,
        jhogan@kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS:Loongson64:Limit 8259.h by config
Message-ID: <20191122183621.67p7vuvfzhpoldna@lantea.localdomain>
References: <20191122135851.5145-1-liulichao@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191122135851.5145-1-liulichao@loongson.cn>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Lichao,

On Fri, Nov 22, 2019 at 09:58:51PM +0800, Lichao Liu wrote:
> Not all platform config CONFIG_I8259, So Use the macro CONFIG_I8259
> to control whether to include the asm/i8259.h header file.

Generally including headers is harmless - it's quite common to include
headers which might or might not be used, and if nothing from the header
is used then its inclusion simply makes no difference. The compiler will
see the header contents & discard them, no big deal.

So can you describe why you want to add the #ifdef here? What's
problematic about including asm/i8259.h when CONFIG_I8259=n?

Thanks,
    Paul

> Signed-off-by: Lichao Liu <liulichao@loongson.cn>
> ---
>  arch/mips/loongson64/pm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/mips/loongson64/pm.c b/arch/mips/loongson64/pm.c
> index 7c8556f09781..08238a58107f 100644
> --- a/arch/mips/loongson64/pm.c
> +++ b/arch/mips/loongson64/pm.c
> @@ -9,7 +9,9 @@
>  #include <linux/interrupt.h>
>  #include <linux/pm.h>
>  
> +#ifdef CONFIG_I8259
>  #include <asm/i8259.h>
> +#endif
>  #include <asm/mipsregs.h>
>  
>  #include <loongson.h>
> -- 
> 2.17.1
> 
