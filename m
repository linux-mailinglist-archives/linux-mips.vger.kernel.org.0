Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA7F82AAEBB
	for <lists+linux-mips@lfdr.de>; Mon,  9 Nov 2020 02:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728038AbgKIBZY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 20:25:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727979AbgKIBZX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 8 Nov 2020 20:25:23 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE51C0613CF;
        Sun,  8 Nov 2020 17:25:23 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id d12so5507034wrr.13;
        Sun, 08 Nov 2020 17:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UOno4LSNAZKVT1XsABm9rHFwDySawnUXCeuDL7Uf5qQ=;
        b=pvD/+WeSD8QFufLgsIz6Cdu1pCuxiFf4kfR4djnPZV5vzF3kni4hXtO2bXvxwBX4m0
         AMq8fa0hcKAEk0afBEKYCEcfFRNDhkMRvQxGvn48h6MOhSqjyCiOZZjaBMfRjfSAX7dJ
         H0/96C8MaekNfwFaugcYVPgb6USa3a9Q1Wc4iUa5QifHvyidz/+BbExjKMAHOHjaBB6s
         ApMtlUGFXY+xBGgJpHQmDV4ASUfY16dbALOjeZmc2GgAJRhn6d1XUT8CPek/6Vc3ZCDX
         eN47JXUG79EuH1MS9IILeOlioycrHjzZUAnEHyF3Pv9zVJrMTtJDV8tN5Ea4jMqWdZfJ
         FRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UOno4LSNAZKVT1XsABm9rHFwDySawnUXCeuDL7Uf5qQ=;
        b=eH99O4qqygKC0MnpNoRJu58dKj+UL8Hof1Dg4pMKGdLOvAeO5JLJC0hEQDPJig0K0r
         3St6v9Zxt0SDw0yMJ94tbC7zEQqN6vuq7HdskgS0uzp7BHBZ5TvtdE+lWFLG7wc49VEA
         arW9OOkg9F8y+o6Vow3OMeBCWyrhiJO9aIJjQuaeK8tSU0of7Q8sIxOD8IlZj3RZbehU
         QaSnIgKxK4t+RcHyC4C2lH2ZjL/HaU6Lge1ECLsN3FZKdvKc9Jl5LsjTdIwXE3AVZluQ
         GqgrEfhErj8NjvfJM1gHd/6OPzXforsv2Cv6OKP5qQ9LFM5N/8YliyXqj05/vPOU9ii6
         Jp2g==
X-Gm-Message-State: AOAM531McLcNv2qyg0zPiKgRgjIkvsx3aeBpGlaCsyvRQZtfvna4TpGP
        eqj3OKtIw3odPwns1Fe2bWY=
X-Google-Smtp-Source: ABdhPJyY3/3rkyGLQrbEVKspFz7qTBeyXbIK6oeTyVD+1Sv/dj4N6x/BPUPlS/C33r7zdMUaNYAWzg==
X-Received: by 2002:a5d:6b8e:: with SMTP id n14mr14491368wrx.238.1604885122239;
        Sun, 08 Nov 2020 17:25:22 -0800 (PST)
Received: from ?IPv6:2a02:8084:e84:2480:228:f8ff:fe6f:83a8? ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id l16sm10945517wrr.83.2020.11.08.17.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 17:25:21 -0800 (PST)
Subject: Re: [PATCH 14/19] mm: Add user_landing in mm_struct
To:     Andy Lutomirski <luto@kernel.org>, Dmitry Safonov <dima@arista.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20201108051730.2042693-1-dima@arista.com>
 <20201108051730.2042693-15-dima@arista.com>
 <CALCETrUYJB3SMFEfD0CiVk9FMAA7uGqescaQLokuPRcPUbYoqg@mail.gmail.com>
From:   Dmitry Safonov <0x7f454c46@gmail.com>
Message-ID: <d028b7ca-f513-64f1-6561-4c8398a274e5@gmail.com>
Date:   Mon, 9 Nov 2020 01:25:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CALCETrUYJB3SMFEfD0CiVk9FMAA7uGqescaQLokuPRcPUbYoqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 11/8/20 7:04 PM, Andy Lutomirski wrote:
> On Sat, Nov 7, 2020 at 9:18 PM Dmitry Safonov <dima@arista.com> wrote:
>>
>> Instead of having every architecture to define vdso_base/vdso_addr etc,
>> provide a generic mechanism to track landing in userspace.
>> It'll minimize per-architecture difference, the number of callbacks to
>> provide.
>>
>> Originally, it started from thread [1] where the need for .close()
>> callback on vm_special_mapping was pointed, this generic code besides
>> removing duplicated .mremap() callbacks provides a cheaper way to
>> support munmap() on vdso mappings without introducing .close() callbacks
>> for every architecture (with would bring even more code duplication).
> 
> I find the naming odd.  It's called "user_landing", which is
> presumably a hard-to-understand shorthand for "user mode landing pad
> for return from a signal handler if SA_RESTORER is not set".  But,
> looking at the actual code, it's not this at all -- it's just the vDSO
> base address.

Agree. Originally, I tried to track the actual landing address on the
vdso, but .mremap() seemed simpler when tracking the vma base.

> So how about just calling it vdso_base?  I'm very much in favor of
> consolidating and cleaning up, and improving the vdso remap/unmap
> code, but I'm not convinced that we should call it anything other than
> the vdso base.

Sure.

Thanks,
         Dmitry
