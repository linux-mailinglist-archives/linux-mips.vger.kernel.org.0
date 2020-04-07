Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88281A133F
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 20:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgDGSA2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 14:00:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44135 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGSA2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 14:00:28 -0400
Received: by mail-pf1-f194.google.com with SMTP id b72so1136300pfb.11
        for <linux-mips@vger.kernel.org>; Tue, 07 Apr 2020 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lL9PIYFwO5H6pFnjqwU20khB08jFZDfwSO7ZNczzL60=;
        b=Q/OfXybIX8XlBl388UsB11QYwnOCa77KIKk/PH2qaCLJ0tvBd2Dw/XQfo5DA/0q5eU
         5Pz9U+Dabp+E29nomZdI8TCjGZbnxVwkEmJffIc3mGlnqjfgGbNixLmi56NjfVPKmM4k
         ceiMJ3AjBIB7lOHBJ8MH3rvgSniG1nSLjEyEVsCkU3INp01/OCa1XolRbiJd3STSkisO
         /ohkM1yAal9IN0b5N2vDDxbpYK8+HeqsvxDsH20mN5tpz/feTewAtsa7gWBv+uNkFhKv
         a5cDtTsMDv6ZDSqZSAPg464bqGFlqT3LBqOaXCXHnD3Uh1M6Db34nMS+FxWZFVTGW4OQ
         kI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lL9PIYFwO5H6pFnjqwU20khB08jFZDfwSO7ZNczzL60=;
        b=umHzl3eHQD3FtE1WEjpTE0fUehUmJuqbgB/xuLen+lF8Ospf4UHChCNGUUW0x5V6Rj
         WL2+3Nw0RoGw1LeDMQ3sjYgw5Ul4GbSw1jbZ6hcxTp7mCx5qscBNybmPmtddxC0/qyI9
         Gd40VQC9zb06JSW3yHgQfTk6u+9x9sQ8tvFC+oDnfmUYazi+AupuB5IxawVMFPtYRzPk
         1QTyfZVDGNU1rraIAnfrgE1dk8IsB0NkgfLq+8CTGpi6kQaEMLeDYk9gy9KS83vA9TLs
         L9syTXfBtFr/1mzpXKyJ3V+8rdNPlY5Qlo8ICJidI7k8jrK6os6sxk+SKZw8dS8mWmEA
         Dyqg==
X-Gm-Message-State: AGi0PuaLcacocqI8AKShm9PwYNG3kacSq2oZjilz4LdjPTyO2oEAy9XI
        tmjGUshhxX2rDHeh/OzH2evIbA==
X-Google-Smtp-Source: APiQypLwgDFHd8YN7yGnVEhfww22EfQF+geZ4hFAxh1KXBNTLxa1/8yF1fGo9CTCGQXJ0+7rbWdRbA==
X-Received: by 2002:a62:5f06:: with SMTP id t6mr3817977pfb.192.1586282427135;
        Tue, 07 Apr 2020 11:00:27 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id 66sm14769704pfb.150.2020.04.07.11.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 11:00:26 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:00:23 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] MIPS: Truncate load-y into 32bit for 32bit kernel
Message-ID: <20200407180023.vpwkhtrg3v6inqtt@google.com>
References: <20200405082451.694910-1-jiaxun.yang@flygoat.com>
 <20200407080611.859256-1-jiaxun.yang@flygoat.com>
 <CAKwvOd=Upj_OcrhBnqf1=woCRm-g2wqjv882R0HQeMJu12Uq9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOd=Upj_OcrhBnqf1=woCRm-g2wqjv882R0HQeMJu12Uq9w@mail.gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-04-07, Nick Desaulniers wrote:
>On Tue, Apr 7, 2020 at 1:07 AM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>
>> LLD failed to link vmlinux with 64bit load address for 32bit ELF
>> while bfd will strip 64bit address into 32bit silently.
>> To fix LLD build, we should truncate load address provided by platform
>> into 32bit for 32bit kernel.
>>
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Reviewed-by: Fangrui Song <maskray@google.com>
>> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
>>
>> --
>> V2: Take MaskRay's shell magic.
>
>V2 is way too clever, V1 was much more readable.

This is difficult:/
https://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html#tag_18_06_04
The POSIX shell is only required to do signed long integer arithmetic.
"signed long" can be 32-bit.

awk may not provide precision more than a double ("... decimal-floating-constant token as specified
by the ISO C standard")

   % gawk 'BEGIN {printf("%x", (0xffffffff80101234 % 0x100000000))}' /dev/null
   80101000

>Can this tag be added to the commit to help us track when and where it lands?
>Link: https://github.com/ClangBuiltLinux/linux/issues/786

And this tag for GNU ld enhancement:

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=25784

>> ---
>>  arch/mips/Makefile | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
>> index e1c44aed8156..f8fd3c39fb55 100644
>> --- a/arch/mips/Makefile
>> +++ b/arch/mips/Makefile
>> @@ -286,6 +286,9 @@ ifdef CONFIG_64BIT
>>        $(error CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32)
>>      endif
>>    endif
>> +else
>> +       # Truncate address into 32-bit
>> +       load-y := 0x$(shell echo "$(load-y)" | rev | head -c 8 | rev)
>>  endif
>>
>>  KBUILD_AFLAGS  += $(cflags-y)
>> --
>
>-- 
>Thanks,
>~Nick Desaulniers
