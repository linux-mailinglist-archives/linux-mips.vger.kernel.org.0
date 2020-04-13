Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B325B1A68EF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730511AbgDMPe6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbgDMPe5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:34:57 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA5BC0A3BDC
        for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2020 08:34:57 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id np9so3962300pjb.4
        for <linux-mips@vger.kernel.org>; Mon, 13 Apr 2020 08:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ghs4l4nI57la7hO/6EnhN56epQlSYo2HQcGuqn9At3E=;
        b=o8Ku15VylZmW9RmUdw3LqYItOHWR5uR+BhCzrC4IOozU56RYAeexGHQrmUeAjY0cUB
         oqwdCBwanWaSy1xBLCk53ZHMr0WWy/+2ket481Z6niFhhrc1+dWnLe5NB0+Nn1LJ6biM
         pe8iK7TQ1s0nB7ksBzQ942wAKyrtwrXKLYFgYaIvevq/AR/mS2kBX0vDrjFGK53Lf7p7
         c7GfBtx0lCLZqVjnntovV3+Cf4/aC7VzdGF04fTeHCWdsbTI9HSsEVToZFo+vKm/F9Gx
         IpT1KUmj0ARujnTGKsn2qx/2/EzWBZVSaTzIWz6v5uatfnpEq/LCceAV5vOou0azpcxt
         5mWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ghs4l4nI57la7hO/6EnhN56epQlSYo2HQcGuqn9At3E=;
        b=oeJ1j2UlLBQ6NkCgqhcYdiEiVdbpRsRYzIpCgdsI4JTdrDqcfOxHSZhaKDX9ZYS1j3
         5U/8IOnh4I/cEAYzzw04ZcLqGGYI3IJT20EWFyKM/LEYcwEQGO2kZow9utF/b97ZM7LI
         Xu3l/n8b1mSxVnD1kipP9YOCsZZn4GG/B5LJcAyDs3FJUxzCeEhVDwwiOr28ly0zEVoI
         evX6weJMTlJ82xFUbFxsb5Fy1p/1RobyQcCvsvlq3elcRrLFSgosse6b7UOQBb5kS+Hg
         vAMligbChurbwWGshU7E+k+vKX9mwhapc4KGZjRr2SgRmdWOz5Pv20tgy73vQe2AZ1Aw
         NiAw==
X-Gm-Message-State: AGi0PuY3+7Hpmad4G+sJyoFS7AKRs5SI1OgL61KnyWRnNp258fbcC/6l
        egn/R5cDBjFywjqsLIqheyaHmQ==
X-Google-Smtp-Source: APiQypI6Dvk7gIIjLIxzrGkUSM2NUDSzxSvhD2oYSFiXn15uxg9GYJwz0R4Bsuz7njjnFBRvvCEVGw==
X-Received: by 2002:a17:902:ac85:: with SMTP id h5mr17038570plr.76.1586792096747;
        Mon, 13 Apr 2020 08:34:56 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id q12sm8205213pgi.86.2020.04.13.08.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 08:34:56 -0700 (PDT)
Date:   Mon, 13 Apr 2020 08:34:53 -0700
From:   Fangrui Song <maskray@google.com>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "Maciej W. Rozycki" <macro@linux-mips.org>,
        linux-mips@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Borislav Petkov <bp@suse.de>,
        Kees Cook <keescook@chromium.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: Truncate link address into 32bit for 32bit
 kernel
Message-ID: <20200413153453.zi4jvu3c4ul23e23@google.com>
References: <20200413062651.3992652-1-jiaxun.yang@flygoat.com>
 <alpine.LFD.2.21.2004130736410.851719@eddie.linux-mips.org>
 <20200413153205.4ee52239@flygoat-x1e>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200413153205.4ee52239@flygoat-x1e>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-04-13, Jiaxun Yang wrote:
>On Mon, 13 Apr 2020 07:59:29 +0100 (BST)
>"Maciej W. Rozycki" <macro@linux-mips.org> wrote:
>
>> On Mon, 13 Apr 2020, Jiaxun Yang wrote:
>>
>> > LLD failed to link vmlinux with 64bit load address for 32bit ELF
>> > while bfd will strip 64bit address into 32bit silently.
>> > To fix LLD build, we should truncate load address provided by
>> > platform into 32bit for 32bit kernel.
>>
>> Reviewed-by: Maciej W. Rozycki <macro@linux-mips.org>
>>
>> > diff --git a/arch/mips/kernel/vmlinux.lds.S
>> > b/arch/mips/kernel/vmlinux.lds.S index a5f00ec73ea6..5226cd8e4bee
>> > 100644 --- a/arch/mips/kernel/vmlinux.lds.S
>> > +++ b/arch/mips/kernel/vmlinux.lds.S
>> > @@ -55,7 +55,7 @@ SECTIONS
>> >  	/* . = 0xa800000000300000; */
>> >  	. = 0xffffffff80300000;
>> >  #endif
>> > -	. = VMLINUX_LOAD_ADDRESS;
>> > +	. = VMLINUX_LINK_ADDRESS;
>>
>>  The CONFIG_BOOT_ELF64 cruft right above it looks interesting to me,
>> never have ever been used.  We have had the current arrangement since:
>
>It confused me either.
>It's only used by SGI so probably it's time to rename it as
>BOOT_SEG_ELF64.
>
>Wish someone could clarify what is it.
>
>Thanks.

Agreed that -Ttext in

arch/mips/boot/compressed/Makefile
100:      cmd_zld = $(LD) $(KBUILD_LDFLAGS) -Ttext $(VMLINUZ_LOAD_ADDRESS) -T $< $(vmlinuzobjs-y) -o $@

and a few other places are brittle. They need to be replaced with Output Section Address:
(https://sourceware.org/binutils/docs/ld/Output-Section-Address.html
https://github.com/llvm/llvm-project/blob/master/lld/docs/ELF/linker_script.rst#output-section-address)

-Ttext changes the address of .text . This can lead to the change of the
address of the text segment (RX), but this is not guaranteed (many
sections can be placed before .text and they are not affected).
See https://reviews.llvm.org/D70468 "[ELF] Error if -Ttext-segment is specified"


Reviewed-by: Fangrui Song <maskray@google.com>

>>
>> commit 923ec3d20eef9e36456868b590873ce39f17fe71
>> Author: Ralf Baechle <ralf@linux-mips.org>
>> Date:   Wed Nov 6 22:16:38 2002 +0000
>>
>>     Define load address in linker script instead of relying on the
>>     deprecated and notoriously unreliable option -Ttext.
>>
>> and previously `-Ttext' was used with this script anyway, though not
>> very long, as the script was entirely ignored until:
>>
>> commit 7a782968041ffc4c2d89816238e2f8ea5cceddba
>> Author: Ralf Baechle <ralf@linux-mips.org>
>> Date:   Thu Oct 31 23:54:21 2002 +0000
>>
>>     Merge with Linux 2.5.36.
>>
>>   Maciej
>
>--
>Jiaxun Yang
