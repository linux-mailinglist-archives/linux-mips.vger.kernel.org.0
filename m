Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B622DF5E4
	for <lists+linux-mips@lfdr.de>; Sun, 20 Dec 2020 16:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgLTPhP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 10:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727645AbgLTPhP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Dec 2020 10:37:15 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FBFC0617B0;
        Sun, 20 Dec 2020 07:36:21 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id r3so8212486wrt.2;
        Sun, 20 Dec 2020 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GIxWxKRMw7SGkXKjHPxOnFiDqc9PfOlR1jMdml5CQBA=;
        b=CahlGOxs8PABDe3GI4PYpEjkHztw0ECNbKvQdGhykotf12SXD5PebrToXvYWEdpx1Y
         CHzD09G3+yTlH2FIQNuveJ4g59up9frZMEdma4QJbyVxBMptE8fIaeIEFBePoMSUnb/o
         DDbpnCZh/dERTZF22EWy7MCnpLr3+N4BwRQWJalwA2Zw0NwZOcdqwz2Rue4FNX91iKKM
         u5R7pnnFBb6/HAPGv8+WNj3KmQXlEOMmvmZFmqj1NI/XWJAgYkNUfacQg6mUVIKOVJBC
         vjAGMocHnFe60lbD3f8JFMI1U9j4LrBQFxbl7fB6nI3j+Id3NsxHZLihq8ZIm6SgtXgZ
         7fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GIxWxKRMw7SGkXKjHPxOnFiDqc9PfOlR1jMdml5CQBA=;
        b=c5+/UNUoQYXQElyndoLMGVEJLUnYeZ+rhTnB9FNG2FmcFzRZ8jZHjUvSE8N09tz8kx
         RTSy9phKxBfUGNtZ2dK/r63r2xDC9mYlUfD8owk2nkpZGwN2DylJ6LMMxEM7YtQ5rH/R
         q0d4XzC4mAWhQDfOfaJxEuyG29cL7B7fOaMu6AMVMCFDxx19tyFesH4kmvSRKNDOKSta
         uNolMA3Nh0+Tu/bEKCF5jmgAES482vKXXODZ2YEJYK0FReIyxxTB412HlXFRRCar5+c5
         qU4xcs1h/J22teQFW/FlseLwi2S73gILThBAaPfor7pN9Rp0RcxuOSyusTMZ7VBlOFpM
         5t8w==
X-Gm-Message-State: AOAM530eV+ZOmSJroPdRRFSqblu/fSuXItQHepMjTlOTzS/GvbA7csBR
        lkR19B4SWjmYM/JKfpGkmvo=
X-Google-Smtp-Source: ABdhPJxBdONObhh0opceXMVxKG0VzqzR4kUa2LRuF8cC1ictBN1LgRYp5x07gs9VLSIGJsDdlkdJcg==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr14333321wrn.122.1608478579945;
        Sun, 20 Dec 2020 07:36:19 -0800 (PST)
Received: from [192.168.1.143] ([170.253.51.130])
        by smtp.gmail.com with ESMTPSA id k10sm21616433wrq.38.2020.12.20.07.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Dec 2020 07:36:19 -0800 (PST)
Subject: Ping: [PATCH] cacheflush.2: Document Architecture-specific variants
To:     Michael Kerrisk <mtk.manpages@gmail.com>, linux-man@vger.kernel.org
Cc:     Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org,
        Dave Martin <Dave.Martin@arm.com>
References: <20201214143852.16565-1-alx.manpages@gmail.com>
From:   "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
Message-ID: <a0f3e871-4ad4-408c-f3ca-d5ba4344e307@gmail.com>
Date:   Sun, 20 Dec 2020 16:36:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201214143852.16565-1-alx.manpages@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ping

On 12/14/20 3:38 PM, Alejandro Colomar wrote:
> Signed-off-by: Alejandro Colomar <alx.manpages@gmail.com>
> ---
> 
> Hi Michael,
> 
> Please apply this patch after
> '[PATCH v5] cacheflush.2: Document __builtin___clear_cache() as a more
>  portable alternative'.
> 
> Thanks,
> 
> Alex
> 
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
> 

-- 
Alejandro Colomar
Linux man-pages comaintainer; https://www.kernel.org/doc/man-pages/
http://www.alejandro-colomar.es/
