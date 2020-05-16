Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C141D6087
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 13:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgEPL3q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 07:29:46 -0400
Received: from [115.28.160.31] ([115.28.160.31]:54736 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1726191AbgEPL3p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 May 2020 07:29:45 -0400
Received: from [192.168.9.172] (unknown [220.196.60.58])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 61C196012C
        for <linux-mips@vger.kernel.org>; Sat, 16 May 2020 19:29:43 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1589628583; bh=300yPz9x80M/AbwD70DRKWY/JoilsEBbkNH5JS09Rdo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=PKNSXPH18VrMIiuaahuEF6TGrxzG2J90JL04wg3D+j+SvvOQV3ZQtHpBjnr+mV+zM
         vNwU7bUWN3LF9tkQEw75ZDHt5BTsvfFMHK/gshjA0VV0Z/uOigKlPGBuYMB7t8KIUs
         gpu6qaUo/NlXMfTGENplzpHFgvHUs90dlPRpoe4o=
Subject: Re: [PATCH v2 0/4] CPUCFG emulation on older Loongson64 cores
To:     linux-mips@vger.kernel.org
References: <20200502133846.40590-1-git@xen0n.name>
 <20200503103304.40678-1-git@xen0n.name>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <f334c7f1-9165-b4d6-deda-6bb3f9c0e8ff@xen0n.name>
Date:   Sat, 16 May 2020 19:29:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <20200503103304.40678-1-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/3/20 6:33 PM, WANG Xuerui wrote:

> This patch series brings the CPUCFG instruction to older Loongson64
> cores, enabling a unified way to query processor characteristics on
> Loongson64 systems. A detailed explanation may be found in the last
> commit.
>
> One unresolved point is how to best introduce machtype-specific bits
> into the generic MIPS code, namely the cpu probing and trap handler
> parts. I have been struggling over whether to lift this logic into
> arch/mips/kernel, but the instruction's encoding (reusing LWC2 opcode)
> might be too invasive to be useful to other MIPS platforms. What do
> people think is the best way forward?
>
> v2:
>
> - Fixed one more typo in loongson_regs.h
> - Merged simulate_loongson3_csr and simulate_loongson3_csr_cpucfg into
>    one (simulate_loongson3_cpucfg), per Huacai's suggestion
>
> WANG Xuerui (4):
>    MIPS: Loongson64: fix typos in loongson_regs.h
>    MIPS: Loongson64: define offsets and known revisions for some CPUCFG
>      features
>    MIPS: define more Loongson CP0.Config6 and CP0.Diag feature bits
>    MIPS: emulate CPUCFG instruction on older Loongson64 cores
>
>   arch/mips/Kconfig                             |  11 ++
>   arch/mips/include/asm/cpu-info.h              |   9 ++
>   .../include/asm/mach-loongson64/cpucfg-emul.h |  67 +++++++++
>   .../asm/mach-loongson64/loongson_regs.h       |  29 +++-
>   arch/mips/include/asm/mipsregs.h              |   6 +
>   arch/mips/kernel/cpu-probe.c                  | 129 ++++++++++++++++++
>   arch/mips/kernel/traps.c                      |  45 ++++++
>   arch/mips/loongson64/Makefile                 |   1 +
>   arch/mips/loongson64/cpucfg-emul.c            |  80 +++++++++++
>   9 files changed, 372 insertions(+), 5 deletions(-)
>   create mode 100644 arch/mips/include/asm/mach-loongson64/cpucfg-emul.h
>   create mode 100644 arch/mips/loongson64/cpucfg-emul.c
>
Just a friendly ping.

What is the status of this series? I know that I borked the threading of 
replies, I can resend if it's the only thing holding the series.

And I think the patch may well need to be reorganized, but no replies 
yet. I'm not a professional kernel developer, and any review is appreciated!

