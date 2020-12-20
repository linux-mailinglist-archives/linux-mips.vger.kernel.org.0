Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF2A2DF893
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 06:16:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728021AbgLUFQK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 00:16:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgLUFQJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Dec 2020 00:16:09 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E533C0613D3;
        Sun, 20 Dec 2020 21:15:29 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id x22so8715108wmc.5;
        Sun, 20 Dec 2020 21:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TPubNB4+o76pxV2jUsQ6FWuL944gZMCTKS2ZqkAshzg=;
        b=RoHWJA1AJ6mNViQl3u4462wV12SBTvCbZ32NzEy47tEk/PNyZm1QyISrphfNTSZMIF
         bs/j0XuXlETtcogZUEBTWXpHuCsAM0ZCReFahn+sQi8DXrqkMilVyh9m96Ol4bzmqMVs
         vhSiCc0Ypwr6kz/xxI0kKrqlZx5XRUqvg9HYLdzfIRntWV5RTSPlQR3I45Dk9Sum5mxt
         ZrQcCQ+eAYX+IlWb09PUIC6WtL+r0nvuRXUHZ8bDCX09HmTaWYVG1dC3Sv54+IJ2bDRk
         1tvSZW1qw4Y4+dw2/zYGupCh4Ld5PmkKbFXulXDJj0y6fE3m9NihWxw420iT80xgOPYj
         u/FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TPubNB4+o76pxV2jUsQ6FWuL944gZMCTKS2ZqkAshzg=;
        b=i8SzjEz+igZraBY4OusQzMHuPoxwuiVfvf4rK3ID8NfIEs2cCzYYGfOUxsUuwrH7z2
         2JfHTb9qwgTcrAbghkh16dLseTi0Il/yXEkdlkq/Bw45bjAQm+Y45yrBRzij0/8LDF/k
         +fwPJtxzaZYOWkoKS5dCpOqyTzlA06DH5hOPxa+DB5REoL8GpMkHL48hzW4iOV9n41e7
         1Xti+N7ZtGfCJ9ksNP4Li4XYktXGZ9/YsOXgwI1fKSPDxu00o18VZAozZk4plYYDADCy
         q/DZRu6W20c0Az4pdVTeSGIZ/N7T39VW+31B9t/viVgkPBcIfq4Jpjw40rGuvInmmNWe
         CnKg==
X-Gm-Message-State: AOAM533j7DejIX18Du1YV2I9KLzq+zGrG584akqmFA//0cdGXex5YeLI
        ktI0B4ZaE3ODKoyFFhgHU58hUuWurweKUQ==
X-Google-Smtp-Source: ABdhPJyFZ1y1fQoUFEQgChpe5AV9GnxIBBOW/0NVsMBb8a2iZBbXpetzu/KkPLQanNekpScVM9jCHQ==
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr13509768wmc.149.1608497330655;
        Sun, 20 Dec 2020 12:48:50 -0800 (PST)
Received: from ?IPv6:2001:a61:2467:2f01:faca:3d43:5e40:30d1? ([2001:a61:2467:2f01:faca:3d43:5e40:30d1])
        by smtp.gmail.com with ESMTPSA id z8sm20051199wmg.17.2020.12.20.12.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 12:48:49 -0800 (PST)
Cc:     mtk.manpages@gmail.com, Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, gcc-patches@gcc.gnu.org,
        cfe-users@lists.llvm.org, cfe-dev@lists.llvm.org
Subject: Re: [PATCH v6] cacheflush.2: Document __builtin___clear_cache() as a
 more portable alternative
To:     Alejandro Colomar <alx.manpages@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        linux-man@vger.kernel.org, Martin Sebor <msebor@redhat.com>
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
 <20201215133019.14411-1-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <924d4de5-5191-26fc-a040-2501d4c74f10@gmail.com>
Date:   Sun, 20 Dec 2020 21:48:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201215133019.14411-1-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12/15/20 2:30 PM, Alejandro Colomar wrote:
> Reported-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> Cc: Martin Sebor <msebor@redhat.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> ---
> 
> v6:
> - GCC has always exposed 'void *', as Martin Sebor noted.
>   It's Clang (and maybe others) that (following GCC's docs)
>   exposed 'char *'.

Thanks, Alex. Patch applied.

Cheers,

Michael

>  man2/cacheflush.2 | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index aba625721..7a2eed506 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -86,6 +86,30 @@ On Linux, this call first appeared on the MIPS architecture,
>  but nowadays, Linux provides a
>  .BR cacheflush ()
>  system call on some other architectures, but with different arguments.
> +.SH NOTES
> +Unless you need the finer grained control that this system call provides,
> +you probably want to use the GCC built-in function
> +.BR __builtin___clear_cache (),
> +which provides a portable interface
> +across platforms supported by GCC and compatible compilers:
> +.PP
> +.in +4n
> +.EX
> +.BI "void __builtin___clear_cache(void *" begin ", void *" end );
> +.EE
> +.in
> +.PP
> +On platforms that don't require instruction cache flushes,
> +.BR __builtin___clear_cache ()
> +has no effect.
> +.PP
> +.IR Note :
> +On some GCC-compatible compilers,
> +the prototype for this built-in function uses
> +.I char *
> +instead of
> +.I void *
> +for the parameters.
>  .SH BUGS
>  Linux kernels older than version 2.6.11 ignore the
>  .I addr
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
