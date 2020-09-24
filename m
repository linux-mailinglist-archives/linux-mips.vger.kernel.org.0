Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B894276609
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 03:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbgIXBtb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Sep 2020 21:49:31 -0400
Received: from relay2.mymailcheap.com ([217.182.113.132]:35487 "EHLO
        relay2.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725208AbgIXBta (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Sep 2020 21:49:30 -0400
X-Greylist: delayed 57812 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 21:49:29 EDT
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay2.mymailcheap.com (Postfix) with ESMTPS id 810993EDEC;
        Thu, 24 Sep 2020 03:49:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id BAB892A3A6;
        Wed, 23 Sep 2020 21:49:40 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1600912180;
        bh=b7Bx1GbfpV75fh8CUXkzc2hHbgTHikxZmeAL+m5Tojk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=StD+sK3tTAq+isdzynDggmAYnxETAGwbL1CSLuHm4qVA8kjpiRYAQuSAUasV0Sp4l
         8S2Pw5u5upQP9VY9sxcIeVQ4bjSYDABeOA/BZnnpaYZtH6RAZMPs66rarQ3vDlM/Fb
         hgjG9EvR4K745Vlw5DqCfDJ9r4Jwm+vVjUJldvkI=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id nYV19vLQdOQO; Wed, 23 Sep 2020 21:49:39 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Wed, 23 Sep 2020 21:49:39 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 7862340858;
        Thu, 24 Sep 2020 01:49:37 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="qnBMEH8I";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id EA0CD40FFB;
        Thu, 24 Sep 2020 01:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1600912141;
        bh=b7Bx1GbfpV75fh8CUXkzc2hHbgTHikxZmeAL+m5Tojk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=qnBMEH8IFR1MNJaGCuo/uPsMNgmPAe7rBRATEnI2Mv0duCjBEAb4MBuYQobh1hsPf
         IhlsnLgBRXGg9An2rKpc+nwKH1ZaqpHyCqFbd9rDMy/oT8ih1UAdb+gEtold2YgbMy
         p9k2q7Aq/XmZWKcWun/1zZFU3+kOaiBFun5iu+zo=
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add kexec/kdump support
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Youling Tang <tangyouling@loongson.cn>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com>
 <1600828257-31316-3-git-send-email-chenhc@lemote.com>
 <46167e76-3179-825c-606c-fc35fda8eb4e@flygoat.com>
 <CAAhV-H6AD5SufuMgYvVppTKytg9GZ5zydn5JLm4nFD84ONTfkg@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <7a8e64a2-116a-5f03-4b1f-aae5514bea26@flygoat.com>
Date:   Thu, 24 Sep 2020 09:48:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CAAhV-H6AD5SufuMgYvVppTKytg9GZ5zydn5JLm4nFD84ONTfkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7862340858
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCPT_COUNT_SEVEN(0.00)[11];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/9/24 9:19, Huacai Chen 写道:
> Hi, Jiaxun,
[...]
>
>
> I'm just a little bit uncomfortable with this kind of hardcoded address.
> Is it possible to generate kexec_smp_wait with uasm, or pass the SMP
> base as a parameter of this function?
> This is very difficult, and moreover, uasm wrap the assembly in C
> functions, can it be more beautiful? In my opinion, uasm is only used
> for performance-critical routines, not for beautiful code. But anyway,
> 0x900000003ff01000 should be improved.
>
>> Also I do think we can handle kexec_flag in Loongson's platform SMP,
>> or even generic MIPS SMP code just like what cavium did so this kind
>> of platform quirk can be avoided.
> I doubt this can be done, every CPU has its own method of SMP bringup.
Hi Huacai,

I don't know kexec very well.. So please ignore my ideas if they're not 
applicatable.

Hmm, as we've got control of all secondnary processors at the point, I 
suspect
we can skip platform bring-up code.

Cavium makes use of secondary_kexec_args, can we do it as well?

I think kexec_flag was designed for this reason.
Current code is sending all secondnary processors to the entry point
of the new kernel, probably we can do something here.

>>
>> I won't say it's safe.
>> Loongson-2K's PMON may place reboot vector here, also some
>> UEFI firmware may place their suspend stack here.
>> What if we allocate these buffer at runtime?
> The layout of low 2MB in our design:
> 0x80000000 the first MB, the first 64K：Exception vector
> 0x80010000 the first MB, the second 64K：STR(suspend) data
> 0x80020000 the first MB, the third and fourth 64K：UEFI HOB
> 0x80040000 the first MB, the fifth 64K：RT-Thread for SMC
> 0x80100000 the second MB, the first 64K：KEXEC code
> 0x80108000 the second MB, the second 64K：KEXEC data

Well, there are some other vendors violating this design.
Especially for embedded systems like Loongson-2K.

> All allocated buffer from the old kernel is not safe, because the new
> kernel may be larger than the old kernel. Even if the low 2MB is not a
> perfect place, it is the best place we can choose.
Oops I ignored overlapping..
Then it looks fine for me..

Thanks.

- Jiaxun


>
> Huacai
>
>> Thanks.
>>
>> - Jiaxun
>>
