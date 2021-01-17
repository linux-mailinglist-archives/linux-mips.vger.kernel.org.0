Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E749C2F9541
	for <lists+linux-mips@lfdr.de>; Sun, 17 Jan 2021 21:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbhAQU4b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 15:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbhAQU4a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 17 Jan 2021 15:56:30 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D127BC061573;
        Sun, 17 Jan 2021 12:55:49 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id hs11so18566408ejc.1;
        Sun, 17 Jan 2021 12:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=cc:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eOpg505sGV6Iam+auFou/fr5r84itsG3xw4cCWDVM2I=;
        b=a2FUxnsOmwTab72PFq6/BRYnz+3txE2i64jBkr/YzobB7Uw3ssOBy/vjaGgwT7yptm
         vhL+11x3snY48uUC1Dv6E1IMK85V6oUNOixYIhwp1Qhe5QaYQTR6TWVZRgMamzIGuyDY
         TPGpBDixfqqqDW+7B4ZFIf2Z9g8bilmNV5An8V7WWteBG5Hv0TsR3fvwcjRzHF4aH/rz
         s3+edfF0mAxRVQjVZXMG8NL87KjFwKsE2urguGsGG8RiBxRYAdFrymlTXthbW2ZCOVSW
         4iVWXXgCkXqTWXbYPPp/3qDaNpUw7iLMgRZrQhSRuZsq10jkie1dZnmHqI34wnU8/k+A
         dK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:cc:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eOpg505sGV6Iam+auFou/fr5r84itsG3xw4cCWDVM2I=;
        b=s7q255iZuvUzgbNTBaqW+D5VRpVoODTOS5a534SO6m0J16y3q5ng4cDRTUAimr/iN2
         VHDjUiw7XO73LVTymmetmykoalk+jJt3xZgYjiZRAagEBT9XpUc+MCoj1GmNp2t65zKs
         zVR02i+5dMqdJiAWESOKk2579zk1RQWctcvuDZTva2OSHvddOPMsLFUB/WTK8DVPvYw3
         zav6TyAKm5yIEvazzFMaGrODIdzmeBnZAptQ6oA+nwOK4iIyBeETjN54ha2HhR2Ljwyt
         HsGqo9HZC25pGAGhEZvhfdbWXim2rnDQPsu2sDA/+mLlWdHhmxVR27GOz6rPJwlZJaiW
         irvg==
X-Gm-Message-State: AOAM531uyOo9cqKk3jAGLU2joxEFaxsGNOAng/kSuS0vXNncU9Uahq3D
        CqtfWsB3Fi36ShTcegvDZKQ=
X-Google-Smtp-Source: ABdhPJwX0w8VtZ7Gq0hFAO/GpJO83P1wx8qQmehoE+C3LjGVZyYo96r/52l98VwWmR4d+bYE+PESqg==
X-Received: by 2002:a17:906:f8d5:: with SMTP id lh21mr15821902ejb.167.1610916948505;
        Sun, 17 Jan 2021 12:55:48 -0800 (PST)
Received: from ?IPv6:2001:a61:244d:fe01:9fb1:d962:461a:45e8? ([2001:a61:244d:fe01:9fb1:d962:461a:45e8])
        by smtp.gmail.com with ESMTPSA id g3sm6612531eds.69.2021.01.17.12.55.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jan 2021 12:55:47 -0800 (PST)
Cc:     mtk.manpages@gmail.com, linux-man@vger.kernel.org,
        Vineet Gupta <vgupta@synopsys.com>,
        linux-snps-arc@lists.infradead.org,
        Heinrich Schuchardt <xypron.glpk@gmx.de>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>, libc-alpha@sourceware.org,
        Dave Martin <Dave.Martin@arm.com>,
        Martin Sebor <msebor@redhat.com>
Subject: Re: [PATCH] cacheflush.2: Update SYNOPSIS for glibc wrapper
To:     "Alejandro Colomar (man-pages)" <alx.manpages@gmail.com>
References: <20210116145632.7636-1-alx.manpages@gmail.com>
 <a2418a0e-9b21-4a02-dc0b-98936c0887fa@gmail.com>
 <1c234bd5-306a-7496-fd3d-268f46450168@gmail.com>
From:   "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Message-ID: <05679e0d-c716-419d-d3e3-c4ae46446dcb@gmail.com>
Date:   Sun, 17 Jan 2021 21:55:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1c234bd5-306a-7496-fd3d-268f46450168@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/17/21 9:43 PM, Alejandro Colomar (man-pages) wrote:
> Hi Michael,
> 
> On 1/17/21 9:34 PM, Michael Kerrisk (man-pages) wrote:
>> Hi Alex,
>>
>> On 1/16/21 3:56 PM, Alejandro Colomar wrote:
>>> Glibc uses 'void *' instead of 'char *'.
>>> And the prototype is declared in <sys/cacheflush.h>.
> 
> D'oh!
> 
>>>
>>> ......
>>>
>>> $ syscall='cacheflush';
>>> $ ret='int';
>>> $ find glibc/ -type f -name '*.h' \
>>>   |xargs pcregrep -Mn "(?s)^[\w\s]*${ret}\s*${syscall}\s*\(.*?;";
>>> glibc/sysdeps/unix/sysv/linux/nios2/sys/cachectl.h:27:
> 
> It is defined in <sys/cachectl.h>
> 
> Please fix that.

Fixed! (Everything pushed now.)

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
