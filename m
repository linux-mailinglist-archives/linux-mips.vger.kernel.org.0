Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D00D1DF47B
	for <lists+linux-mips@lfdr.de>; Sat, 23 May 2020 06:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgEWEHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 May 2020 00:07:38 -0400
Received: from [115.28.160.31] ([115.28.160.31]:55602 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1725294AbgEWEHi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 May 2020 00:07:38 -0400
Received: from [192.168.9.172] (unknown [112.65.48.98])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 988B76006D;
        Sat, 23 May 2020 12:07:33 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1590206853; bh=o623EvxXbUrx1HnraR0LAnOcneclVm69c4B8tUC+nGU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sJ9ALxlUMqkoy4udFWRhxnhtPWf7e8eIP+9I7/nzfKP620PsLb61Ft/f2PjV3fpF/
         DT8VdpXcP255tDe9Srq+Gfh4zfcn2Zmb+UHlh9PK7WcL9W5l6HyFzEUVb+90etQDcT
         lh59WJ7Lk7DgDRfS55tPdumhIq0HU8/Ydo/hKVQc=
Subject: Re: [PATCH v3 1/1] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
To:     Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20200521181403.6078-1-git@xen0n.name>
 <20200521181403.6078-2-git@xen0n.name>
 <CAAhV-H6e5EjKGtRuedjg6C8m42YfEYeGu-Lcr=o=G3X8FOggiw@mail.gmail.com>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <28226e7e-071d-db8d-158a-faf3110eac28@xen0n.name>
Date:   Sat, 23 May 2020 12:07:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.0a1
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6e5EjKGtRuedjg6C8m42YfEYeGu-Lcr=o=G3X8FOggiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 5/22/20 12:39 PM, Huacai Chen wrote:

> Hi, Xuerui,
>
> On Fri, May 22, 2020 at 2:15 AM WANG Xuerui <git@xen0n.name> wrote:
>> (snipped)
>>
>> +
>> +static inline u32 loongson3_cpucfg_read_synthesized(
>> +       struct cpuinfo_mips *c,
>> +       __u64 sel)
> This seems not the coding-style of kernel. We don't need a new line
> unless there is more than 80 characters.
Sure; although from grepping both styles are found in at least 
arch/mips, I'll send v4 with this tidbit fixed.
>> +static int simulate_loongson3_cpucfg(struct pt_regs *regs,
>> +                                    unsigned int opcode)
>> +{
>> +       int op = opcode & OPCODE;
>> +       int op2 = opcode & CSR_OPCODE2_MASK;
>> +       int csr_func = (opcode & CSR_FUNC_MASK) >> 16;
> Maybe we can reuse loongson3_lscsr_format in
> arch/mips/include/uapi/asm/inst.h here.

The declaration doesn't exist in mips-next. It seems to come from your 
KVM patch series but that is not merged for now, so let's keep things as 
it is.

All other emulation logic is currently structured like this, by the way; 
we can clean up this after everything gets merged.

