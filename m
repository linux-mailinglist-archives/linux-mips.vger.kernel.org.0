Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71DB123FED4
	for <lists+linux-mips@lfdr.de>; Sun,  9 Aug 2020 16:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgHIOxf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 9 Aug 2020 10:53:35 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:60143 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIOxe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 9 Aug 2020 10:53:34 -0400
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 88C0826071
        for <linux-mips@vger.kernel.org>; Sun,  9 Aug 2020 14:53:31 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 18A583ECDA;
        Sun,  9 Aug 2020 16:53:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E92002A520;
        Sun,  9 Aug 2020 16:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596984808;
        bh=R0WzzEqN7mlSBa+1KtD/NwrIEvN0Gq43dvp71k6BdAE=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=m55ZPDEo3aYyTOsGTIg7YOs+afAm6MHSNTrWE+1qZaKLpZuXrNMrh9LdivsOkKYfU
         t447gsEEgVM/AB5J6WAudA+jO4ivEhusKPwot1JabVCmOfE99vrg+zOznu2j7EC3+F
         ym0FRbHRTGMVNB9J++3maEk9iFF0EQIaAIP2mgeA=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id THLrV2--RzoY; Sun,  9 Aug 2020 16:53:26 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sun,  9 Aug 2020 16:53:26 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id D8B45425B3;
        Sun,  9 Aug 2020 14:53:24 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="qtle7la+";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id D8070425AA;
        Sun,  9 Aug 2020 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596984800;
        bh=R0WzzEqN7mlSBa+1KtD/NwrIEvN0Gq43dvp71k6BdAE=;
        h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
        b=qtle7la+RLLtfeum+VJosir/LWmxz6cL7tiFg5Pvnt3ePhkJddrco54AJaCYER/pv
         5FyuZrk1hwpWnSqy0eGw0Q0ddbj80X7m1Flf8BPoEri9O1/cfG5wTVnTC8jFggMe2b
         i4XrDaO/69YT3bT6yGjMXIxTz7dml64Puiyj5qO0=
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
 <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
Message-ID: <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com>
Date:   Sun, 9 Aug 2020 22:53:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: D8B45425B3
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[213.133.102.83];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[lemote.com,vger.kernel.org,gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/7 下午9:25, Jiaxun Yang 写道:
>
>
> 在 2020/8/7 21:13, Thomas Bogendoerfer 写道:
>> On Wed, Aug 05, 2020 at 09:51:44PM +0800, Jiaxun Yang wrote:
>>>> yes there is. Since this COP2 is a total black box to me, it would be
>>>> really helpfull to get some docs for it or at least some 
>>>> information what
>>>> it exactly does and how you want to use it in kernel code.
>>> FYI:
>>> Loongson doesn't have any CU2 register. It just reused LWC2 & LDC2 
>>> opcode
>>> to define some load & store instructions (e.g. 128bit load to two 
>>> GPRs).
>>>
>>> I have a collection of these instructions here[1].
>>>
>>>  From GS464E (3A2000+), execuating these instruction won't produce COP2
>>> unusable
>>> exception. But older Loongson cores (GS464) will still produce COP2
>>> exception, thus
>>> we should have CU2 enabled in kernel. That would allow us use to these
>>> instructions
>>> to optimize kernel.
>> thank you that makes things a little bit clearer.
>>
>> How will this be used in kernel code ? Special assembler routines or
>> by enabling gcc options ?
>
> Via special assembly routines, as -msoft-float will disable generation of
> these instructions in GCC.
>
> I knew Huacai have out-of-tree memcpy optimization and Xuerui have
> RAID5 optimiztion with these instructions.
>
>>
>>>> And finally what I stil don't like is the splittering of more
>>>> #ifdef LOONGSON into common code. I'd prefer a more generic way
>>>> to enable COPx for in kernel usage. Maybe a more generic config option
>>>> or a dynamic solution like the one for user land.
>>> Agreed. some Kconfig options or cpuinfo_mips.options can be helpful.
>> let's see whether this really is needed.
>>
>> To me it looks like the COP2 exception support for loongson makes
>> thing worse than it helps. How about the patch below ? There is still
>> a gap between starting the kernel and COP2 enabled for which I'm not
>> sure, if we are hitting COP2 instructions.
>

I had a off-list discussion with Huacai and found it's not the case.

Some Loongson CU2 instructions (e.g. GSLQC1) uses FPU registers, and now 
we're uncoditionally
let the thread own FPU in cop2-ex handler when CU2 exception triggered.
However, if we enable CU2 all the time, than the FPU context of these 
instructions might be lost.
(Yes, these instructions won't generate CU1 unusable exception when CU2 
is enabled but not CU1,
it is likely to be a design fault.)

Thus we still need to enable CU2 with exception for user space, and we 
can always enable CU2 in
kernel since kernel won't be compiled with hard-float. :-)

Thanks.

- Jiaxun
