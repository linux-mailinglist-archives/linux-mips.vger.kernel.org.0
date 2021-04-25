Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E0236A5D8
	for <lists+linux-mips@lfdr.de>; Sun, 25 Apr 2021 10:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbhDYIpP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Apr 2021 04:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbhDYIpP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 25 Apr 2021 04:45:15 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7DFC061574;
        Sun, 25 Apr 2021 01:44:34 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c4so13769046wrt.8;
        Sun, 25 Apr 2021 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=31vdil8td01hkvlGl+21+jMqDUYmSn86sls5WfMRhSg=;
        b=lgPkMKm/tYu+zzdehfIt3WP/UYMJP5J1wLwGb97bDBn5e7XUzz6oOK8mx0XvA89J4a
         reLzRoDLV7JApHd/GyLEadfUGzmULqJ4NMVzqqCJYnos687TYhufLOzSZu/i4hHNHQAk
         /FBnMU2IiUARmDbsveWkv9q9udiPK49ybFNZLK5uZlSlymT9iW2YRGTr6K6mdsbefY4s
         NXZOENTSn4dIDbqLveDy8wZOU8R0gQ65az+yMo/F04RrRvRmoUNkiDS6/4hSIiDKZD8P
         VMCqTpoe7M+IoxPnjKUOtACUJAzro5uVQdUqP832lYV6KRx5glrfFX4YadG3LkVioE3t
         qFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=31vdil8td01hkvlGl+21+jMqDUYmSn86sls5WfMRhSg=;
        b=TD8RowfO6MXAAFc1TzrxxXkdIWJtHT4E5EeeLc8j/CMpPETMSjxci+miLq1efp8Li4
         fV2tLvYpN37Z9qxz5ObopOzuqMm41hNwoioTOwtJIKmB9a1b2Xyvct6fitwnETU00vy3
         NF0rZw7FIA6VVMMLdSZX5xJvGHCP2faDwG8QnGpgXzGTW8PwwxxnqA4/E+3wZK87031R
         NR/gNS8XVvjtaDcoC23lPuMRooE09Zp4v3wjhbJKdqU3uIaC1CWUq3Mo9vRWW2d2U0jB
         oINLKegfGt5zvV9T/H1ekpQVLXyR3S8F3BRVT836zTVNJLCwTgF1iU+lWfwR5jUD16AS
         EHow==
X-Gm-Message-State: AOAM531NiDghJcBZrS/nFAFm5a5kERunCBmeyagtMiAqF2moz43hPsvJ
        ENU5Lbdb3OMkFjdxTugVpK+1klGOL1Q=
X-Google-Smtp-Source: ABdhPJweHiH/5X/2E9b9TYd3Tsbs3DeJYVqXTQrldUVE2z3siASvHPRHi7TkqNplK658uUMGs7wI+w==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr15660229wrn.373.1619340272873;
        Sun, 25 Apr 2021 01:44:32 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce? (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
        by smtp.gmail.com with ESMTPSA id f7sm15432133wrp.48.2021.04.25.01.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 01:44:32 -0700 (PDT)
Subject: Re: [PATCH v4] mips: Do not include hi and lo in clobber list for R6
To:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20210420211210.702980-1-sudipm.mukherjee@gmail.com>
From:   Romain Naour <romain.naour@gmail.com>
Message-ID: <79aa7a3c-92ee-48d4-4945-48061e77541d@gmail.com>
Date:   Sun, 25 Apr 2021 10:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420211210.702980-1-sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Sudip, All,

Le 20/04/2021 à 23:12, Sudip Mukherjee a écrit :
> From: Romain Naour <romain.naour@gmail.com>
> 
> From [1]
> "GCC 10 (PR 91233) won't silently allow registers that are not
> architecturally available to be present in the clobber list anymore,
> resulting in build failure for mips*r6 targets in form of:
> ...
> .../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
>   146 |  __asm__ volatile (      \
>       |  ^~~~~~~
> 
> This is because base R6 ISA doesn't define hi and lo registers w/o DSP
> extension. This patch provides the alternative clobber list for r6 targets
> that won't include those registers."
> 
> Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to
> build for mips r6 cpus with gcc 10 for the same reason as glibc.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
> [2] '24640f233b46 ("mips: Add support for generic vDSO")'
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
> 
> v4: [sudip] added macro VDSO_SYSCALL_CLOBBERS and fix checkpatch errors with commit message.
> v3 Avoid duplicate code (Maciej W. Rozycki)
> v2 use MIPS_ISA_REV instead of __mips_isa_rev (Alexander Lobakin)
> 
> I have reused the original patch by Romain and have retained his s-o-b
> and author name as he is the original author of this patch. I have just
> added the macro. Build tested with gcc-10.3.1 and gcc-9.3.0.
> 

Thanks for the rework!

Best regards,
Romain
