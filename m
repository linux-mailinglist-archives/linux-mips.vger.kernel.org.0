Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A653C2DF5E1
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 16:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727641AbgLTPgX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 10:36:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727590AbgLTPgX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Dec 2020 10:36:23 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0764C0613CF;
        Sun, 20 Dec 2020 07:35:42 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id a12so8184643wrv.8;
        Sun, 20 Dec 2020 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5HVwshWceEn2lPtPbYv3aAtF6ZGhn8pIjPtnQbkTvDA=;
        b=q+BDvMJRODbQExlaDDEkj0FSUlD79RbsMbzm98BN/l52215hOiPC57SZgL3YeFCxEq
         096qYI+VUHp7wvp2tOxIAC8V2oM6LNDSUCfo3d6wSkRCWv8iv859UEQ66d4XBy7nolZ5
         oC0GvxVCzWKwJ58xxR8gdVtJ32PoDOWYXWHQWcZMDGmubrILwsr2QGgNFkDHk/UaqbVF
         +tonNyQFfmENHgVOZ4y6R0NEIkjNLgSTkSihbU8HIkq2bZIB0SIJ6EvPTrh5HVZZ3zOz
         eopbUN/PdvsF82qTWlTjkJTk0l/2S9YnhSsLWJg9O7UQYsqFT0Ggu7PQXtdX/MvjF/ls
         VzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5HVwshWceEn2lPtPbYv3aAtF6ZGhn8pIjPtnQbkTvDA=;
        b=t7wfKMU+Rgu8X4D79o92TbUgullgMmy68dY9yYzCanrOExbI0kkwBSlTLEdMAp/Zv4
         rpBBPZ1CdAZuvfC6w8JHiJYzOWWL/l7as90b2wYpUf90NPOtaF68zWV7SIdWz68M2lY9
         EKjRj1/HihwgyhC6xjXiNKl5AnJRvWhvfTXJj3KedJInLZjB1ww+nH3YRojKRrSTEaIn
         hiyx7s6LBNMNsxXrvDHprKBE3QbBR1ILdkE4sFhxuw9ao6BHXm0DTns/NoWEBeq0vlc7
         nvg3pyhwegyuWnkcO5IRRqFPQJ/sGbUmnyNrdanalbnol/Nxuz4Ji01PhAoYGhaYItyt
         WZoQ==
X-Gm-Message-State: AOAM533VxrWFM9zDCIYPsgoJlCb8bo8XuERNAYapKa+bxGy7UARcBhpS
        khdd4tG0+nER7Vn9IsZc9wQ=
X-Google-Smtp-Source: ABdhPJzb8tZphtylC985kZv/GrLmarLQTNgjw/LUgwYXkJ4kV7KENi4AqmH/EuiEAFwDGVjuPiplRQ==
X-Received: by 2002:adf:c642:: with SMTP id u2mr3104350wrg.243.1608478541290;
        Sun, 20 Dec 2020 07:35:41 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id g11sm23431536wrq.7.2020.12.20.07.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 07:35:40 -0800 (PST)
Subject: Ping: [PATCH v6] cacheflush.2: Document __builtin___clear_cache() as
 a more portable alternative
To:     Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        Dave Martin <Dave.Martin@arm.com>,
        linux-snps-arc@lists.infradead.org,
        Martin Sebor <msebor@redhat.com>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, gcc-patches@gcc.gnu.org,
        cfe-users@lists.llvm.org, cfe-dev@lists.llvm.org
References: <e2424619-2a5a-a44a-2dc0-a16310725250@gmail.com>
 <20201215133019.14411-1-alx.manpages@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <fa3c7a2b-e364-568a-26c0-def6d494f98b@gmail.com>
Date:   Sun, 20 Dec 2020 16:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201215133019.14411-1-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ping

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
> 
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
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
