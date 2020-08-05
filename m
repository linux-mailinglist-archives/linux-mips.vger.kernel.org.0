Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA0823CD95
	for <lists+linux-mips@lfdr.de>; Wed,  5 Aug 2020 19:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgHERjf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Aug 2020 13:39:35 -0400
Received: from relay5.mymailcheap.com ([159.100.248.207]:51954 "EHLO
        relay5.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728915AbgHERea (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Aug 2020 13:34:30 -0400
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id C434526370
        for <linux-mips@vger.kernel.org>; Wed,  5 Aug 2020 13:57:10 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay4.mymailcheap.com (Postfix) with ESMTPS id 203A53F1D0;
        Wed,  5 Aug 2020 15:52:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id DF4042A520;
        Wed,  5 Aug 2020 15:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596635519;
        bh=CLac2EjUFlcauyotKW1A9AVfqwV6qAvXNlOsMGyq7lc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=q0EzBw/HzsAjguJDrIld02zG5VFI454bS4VYAjYwNeXJB+S4FpgRejlf7BylqS66M
         YesuF9ovGKxki9ElQqphfEVBkop4feD6fKTmq66gKqDYg3FMQmvGAYC4XKmsp5CKzs
         +sC/t+ZhjuPKdy6ABAzD2OSYIix7l6GWntd3p4gc=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id p7yJAyvHKnOt; Wed,  5 Aug 2020 15:51:57 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Wed,  5 Aug 2020 15:51:57 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id A311B425BD;
        Wed,  5 Aug 2020 13:51:56 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="HxqvFXf+";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li986-206.members.linode.com [45.33.36.206])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6F212425BC;
        Wed,  5 Aug 2020 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596635511;
        bh=CLac2EjUFlcauyotKW1A9AVfqwV6qAvXNlOsMGyq7lc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=HxqvFXf+B8dKlaqII6IBCCHlA9+s/zF6oT8C+jdH4FPB+jUCe5yRtMQvRcoCTt7yN
         09SgNYg7hEBHXPn1BY6xauFjMSo5KGA95HHQxsXI7n8ZKMt/fWM7ZmEvNHjrSREqKs
         clE3Hb66C2/cWvCYrifcVeMgYVfXQPMkmZ/xdxgI=
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
Date:   Wed, 5 Aug 2020 21:51:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200805121021.GA12598@alpha.franken.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A311B425BD
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         FREEMAIL_CC(0.00)[vger.kernel.org,lemote.com,gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/5 20:10, Thomas Bogendoerfer 写道:
> On Sat, Aug 01, 2020 at 03:59:41PM +0800, Huacai Chen wrote:
>> On Wed, May 6, 2020 at 1:30 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>>>
>>>
>>> 于 2020年5月2日 GMT+08:00 下午12:55:43, Huacai Chen <chenhc@lemote.com> 写到:
>>>> Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
>>>> mode by default. However, gslq/gssq (16-bytes load/store instructions)
>>>> overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
>>>> gssq for optimization in kernel, we should enable COP2 usage in kernel.
>>>>
>>>> Please pay attention that in this patch we only enable COP2 in kernel,
>>>> which means it will lose ST0_CU2 when a process go to user space (try
>>>> to use COP2 in user space will trigger an exception and then grab COP2,
>>>> which is similar to FPU). And as a result, we need to modify the context
>>>> switching code because the new scheduled process doesn't contain ST0_CU2
>>>> in its THERAD_STATUS probably.
>>>>
>>>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>>> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>>
>> Does this patch have some unresolved problems, or there is something unclear?
> yes there is. Since this COP2 is a total black box to me, it would be
> really helpfull to get some docs for it or at least some information what
> it exactly does and how you want to use it in kernel code.

FYI:
Loongson doesn't have any CU2 register. It just reused LWC2 & LDC2 opcode
to define some load & store instructions (e.g. 128bit load to two GPRs).

I have a collection of these instructions here[1].

 From GS464E (3A2000+), execuating these instruction won't produce COP2 
unusable
exception. But older Loongson cores (GS464) will still produce COP2 
exception, thus
we should have CU2 enabled in kernel. That would allow us use to these 
instructions
to optimize kernel.

>
> Looking closer at the patch I realized, that there is already support
> for usage of COP2 in user land, which I thought isn't the case (at least
> I understood that from one of your mails). So is there enough state
> saving to support this ?

Actually there is no CU2 state for Loongson to save.

>
> And finally what I stil don't like is the splittering of more
> #ifdef LOONGSON into common code. I'd prefer a more generic way
> to enable COPx for in kernel usage. Maybe a more generic config option
> or a dynamic solution like the one for user land.
Agreed. some Kconfig options or cpuinfo_mips.options can be helpful.

Thanks.

- Jiaxun

[1]: https://github.com/FlyGoat/loongson-insn/
>
> Thomas.
>
