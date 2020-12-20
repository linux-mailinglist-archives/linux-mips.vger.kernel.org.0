Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B905B2DF937
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 07:23:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgLUGVw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Dec 2020 01:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgLUGVv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Dec 2020 01:21:51 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEE6C0613D3;
        Sun, 20 Dec 2020 22:21:11 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q18so9875298wrn.1;
        Sun, 20 Dec 2020 22:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WU57UDH9iBA+SpWG/JBlCFUVWISWmdR25NDdKT5/S3c=;
        b=g4p3u8GmrJminYSYCpiWCYBbi6mwQemjkAQModu/zMOx9wAjm6GE9kLEsKYRl7dVEj
         glKQpshSdTb/svbVodf1zBvONtlM0hqU+/ASJYlrg+GHyf7B3aniYpW6hL5qyFHUe9Ix
         lyM27/ldSLW+DUqsuukDrn0L532vUYHp1EXmCnYgX8yY/BNGdoCxZMVzQylPJKEXjor0
         7CUK1uNmLxdxp2HNISAliGLGnmchfPeMMng5PO6Tj+v0H2MsbfbyDzxBkGZdkUPpuhme
         1cCOQxAuBPoqV1+ohAnY1R29b/umBR0yQxHFIEQ+gjql3qcv9vRJWeIni4JxQlSQhwcX
         /ntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WU57UDH9iBA+SpWG/JBlCFUVWISWmdR25NDdKT5/S3c=;
        b=ccMd8oyhioa8JWnLxJUL60P93UtwZRoezvHiHNERJkH/+CyJHeixnZZrGAaiyC31BL
         /8I3TTFLOr7EV/OPlUQO1z1R4guoOGy2M1bImjvXZznyJkFJ8H15urOXmXFaf+a3CuBm
         7EpGmY38uEErIZPT+NI8g28NsRg4B6SafICkXwG1ijK/8ioZ3Ar4+r+SQDsNsf+YwKXS
         Qr7QvhZxuSEfoubzICJ1EXb16YN/xqrnW/wWc1ThGXaBpEZEViG/mSrR+X9leGferDs3
         wa6PLktqcPt/d561uHPWF/4oaxEH6MKIGo4MHFb8QY1ORUsEfBUY01uVUKzuseg/dGQD
         s5lQ==
X-Gm-Message-State: AOAM533sGzHFQAlavxHOFY7R/N7RtU33tWBBD7w+Ag2Se72x0GDPZ7kD
        2yXOyPjXkm9t/ge5HyziZf4IUJ7HzZxeLw==
X-Google-Smtp-Source: ABdhPJwytmEUOzZSF9jWilBV08Nu0od0fJlT0cOl+k5I/CICI8GpuyJTO/fBARjwip72nszUqtF0rQ==
X-Received: by 2002:adf:d085:: with SMTP id y5mr15571261wrh.41.1608497695921;
        Sun, 20 Dec 2020 12:54:55 -0800 (PST)
Received: from ?IPv6:2001:a61:2467:2f01:faca:3d43:5e40:30d1? ([2001:a61:2467:2f01:faca:3d43:5e40:30d1])
        by smtp.gmail.com with ESMTPSA id l8sm21563534wmf.35.2020.12.20.12.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 12:54:55 -0800 (PST)
Cc:     mtk.manpages@gmail.com, Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org
Subject: Re: [PATCH] cacheflush.2: Document Architecture-specific variants
To:     Alejandro Colomar <alx.manpages@gmail.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        linux-man@vger.kernel.org
References: <20201214143852.16565-1-alx.manpages@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <53a3c827-3e83-441b-8192-afdf323ca296@gmail.com>
Date:   Sun, 20 Dec 2020 21:54:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201214143852.16565-1-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Alex

On 12/14/20 3:38 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
> 
> Hi Michael,
> 
> Please apply this patch after
> '[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
>  portable alternative'.

Thanks. Applied.

>  man2/cacheflush.2 | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/man2/cacheflush.2 b/man2/cacheflush.2
> index fc35f1a0b..0761b429a 100644
> --- a/man2/cacheflush.2
> +++ b/man2/cacheflush.2
> @@ -31,6 +31,10 @@ cacheflush \- flush contents of instruction and/or data cache
>  .PP
>  .BI "int cacheflush(char *" addr ", int "nbytes ", int "cache );
>  .fi
> +.PP
> +.IR Note :
> +On some architectures,
> +there is no glibc wrapper for this system call; see NOTES.
>  .SH DESCRIPTION
>  .BR cacheflush ()
>  flushes the contents of the indicated cache(s) for the
> @@ -87,6 +91,44 @@ but nowadays, Linux provides a
>  .BR cacheflush ()
>  system call on some other architectures, but with different arguments.
>  .SH NOTES
> +.SS Architecture-specific variants
> +Glibc provides a wrapper for this system call,
> +with the prototype shown in SYNOPSIS,
> +for the following architectures:
> +ARC, CSKY, MIPS, and NIOS2.
> +.PP
> +On some other architectures,
> +Linux provides this system call, with different arguments:
> +.TP
> +M68K:
> +.PP
> +.in +4n
> +.EX
> +.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
> +.BI "               unsigned long " len );
> +.EE
> +.in

I made the formatting rather:

[[
.TP
M68K:
.nf
.BI "int cacheflush(unsigned long " addr ", int " scope ", int " cache ,
.BI "               unsigned long " len );
.fi
]]

That's for consistency wqith the SYNOPSIS sections, where .EX/.EE 
isn't used.

> +.TP
> +SH:
> +.PP
> +.in +4n
> +.EX
> +.BI "int cacheflush(unsigned long " addr ", unsigned long " len ", int " op );
> +.EE
> +.in
> +.TP
> +NDS32:
> +.PP
> +.in +4n
> +.EX
> +.BI "int cacheflush(unsigned int " start ", unsigned int " end ", int " cache );
> +.EE
> +.in
> +.PP
> +On the above architectures,
> +glibc does not provide a wrapper for this system call; call it using
> +.BR syscall (2).
> +.SS GCC alternative
>  Unless you need the finer grained control that this system call provides,
>  you probably want to use the GCC built-in function
>  .BR __builtin___clear_cache (),


Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
