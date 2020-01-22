Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED451144CCA
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 09:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgAVIDC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 03:03:02 -0500
Received: from fd.dlink.ru ([178.170.168.18]:53514 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728912AbgAVIDC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 03:03:02 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id D594B1B20B06; Wed, 22 Jan 2020 11:02:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru D594B1B20B06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579680178; bh=YrB26L+7TvmLoiEcbn5M3lNei+TBGOHZvTncVnB6+O0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=hUhXo1/nazSdC10nNX/FBdFtvMVTqbdLN2u23yIkYzw6481k04KFCpvrzNzmau2d+
         VMzLgsjeTHOdsOecKe040xt85pkxaCj6cOnxP8CsOlRyPXzrZ8mwUO8RnabaORSQ09
         Fu3Ob1pghSoS1K0aFF915WuDrwGIHoVd+SAuBklk=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,URIBL_BLOCKED,
        USER_IN_WHITELIST autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id 97E451B201C1;
        Wed, 22 Jan 2020 11:02:54 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 97E451B201C1
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id E69151B217C5;
        Wed, 22 Jan 2020 11:02:53 +0300 (MSK)
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 11:02:53 +0300 (MSK)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Wed, 22 Jan 2020 11:02:53 +0300
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH mips-fixes 0/3] MIPS: a set of tiny Kbuild fixes
In-Reply-To: <5e276f0e.1c69fb81.7e73d.180a@mx.google.com>
References: <20200117140209.17672-1-alobakin@dlink.ru>
 <5e276f0e.1c69fb81.7e73d.180a@mx.google.com>
User-Agent: Roundcube Webmail/1.4.0
Message-ID: <d99a6d22ca91ea0c251c731446c419ec@dlink.ru>
X-Sender: alobakin@dlink.ru
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Paul Burton wrote 22.01.2020 00:37:
> Hello,

Hi Paul,

> Alexander Lobakin wrote:
>> These three fix two command output messages and a typo which leads
>> to constant rebuild of vmlinux.lzma.its and all dependants on every
>> make invocation.
>> Nothing critical, and can be backported without manual intervention.
>> 
>> Alexander Lobakin (3):
>>   MIPS: fix indentation of the 'RELOCS' message
>>   MIPS: boot: fix typo in 'vmlinux.lzma.its' target
>>   MIPS: syscalls: fix indentation of the 'SYSNR' message
>> 
>>  arch/mips/Makefile.postlink        | 2 +-
>>  arch/mips/boot/Makefile            | 2 +-
>>  arch/mips/kernel/syscalls/Makefile | 2 +-
> 
> Series applied to mips-next.
> 
>> MIPS: fix indentation of the 'RELOCS' message
>>   commit a53998802e17
>>   https://git.kernel.org/mips/c/a53998802e17
>> 
>>   Fixes: 44079d3509ae ("MIPS: Use Makefile.postlink to insert 
>> relocations into vmlinux")
>>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>>   [paulburton@kernel.org: Fixup commit references in commit message.]
>>   Signed-off-by: Paul Burton <paulburton@kernel.org>
>> 
>> MIPS: boot: fix typo in 'vmlinux.lzma.its' target
>>   commit 16202c09577f
>>   https://git.kernel.org/mips/c/16202c09577f
>> 
>>   Fixes: 92b34a976348 ("MIPS: boot: add missing targets for 
>> vmlinux.*.its")
>>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>>   [paulburton@kernel.org: s/invokation/invocation/]

Thanks for fixing these two weird issues for me, I don't know where
I was looking.

>>   Signed-off-by: Paul Burton <paulburton@kernel.org>
>> 
>> MIPS: syscalls: fix indentation of the 'SYSNR' message
>>   commit 4f29ad200f7b
>>   https://git.kernel.org/mips/c/4f29ad200f7b
>> 
>>   Fixes: 9bcbf97c6293 ("mips: add system call table generation 
>> support")
>>   Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
>>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> Thanks,
>     Paul

Thank you!

> [ This message was auto-generated; if you believe anything is incorrect
>   then please email paulburton@kernel.org to report it. ]

Regards,
ᚷ ᛖ ᚢ ᚦ ᚠ ᚱ
