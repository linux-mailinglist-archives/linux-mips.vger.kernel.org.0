Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F80723176A
	for <lists+linux-mips@lfdr.de>; Wed, 29 Jul 2020 03:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730346AbgG2BtH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 21:49:07 -0400
Received: from relay3.mymailcheap.com ([217.182.119.157]:40261 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730328AbgG2BtG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 21:49:06 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 2755C3ECDF;
        Wed, 29 Jul 2020 03:49:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id 549192A0F5;
        Tue, 28 Jul 2020 21:49:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1595987341;
        bh=Y642tKKWgaamRJ0vO0FY457Lm355lqPLigYlI2p5Pcs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KOFeHxCKT1huBJbk/aEC3ze8xmPxhPt/ZCea/xfcAsjLew0gurqP+lL265P8FX98z
         bc5yg3bDCZZ3f2u/q1PcSYDj7QexS6TpzpQhPcaWD4arSN9Akxdblx6KuyzAogmG3b
         ZdoJhEeOyIfiS1cjRKuCBIOAMKg7QRsCvNKYJ0tg=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DjZu8um8qhIu; Tue, 28 Jul 2020 21:49:00 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Tue, 28 Jul 2020 21:49:00 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 22093418CF;
        Wed, 29 Jul 2020 01:48:57 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="adE0Jopx";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li161-247.members.linode.com [173.230.151.247])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 0FB6041312;
        Wed, 29 Jul 2020 01:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1595987331;
        bh=Y642tKKWgaamRJ0vO0FY457Lm355lqPLigYlI2p5Pcs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=adE0JopxLVYe/8QD+JX/Qp5LmqWNVxuheA83vJ/IdxSQrmoda4TQq/Uh1fOLy0CF7
         xsdMscfHdA1tPstCh3oMsn5Vq7H5u1kOvJ0B6HXTh8j0w4CELFVsBTtk2BoAAlaH8X
         bQKt0kGjwRof9AsnrCSon9YsbnT3XKmb1U/8pNcg=
Subject: Re: [PATCH v4 0/5] MIPS: Loongson64: Process ISA Node in DeviceTree
To:     linux-mips@vger.kernel.org
Cc:     Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        maobibo@loongson.cn, git@xen0n.name
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
 <20200728205245.GC22052@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0a0847d1-8d9b-8fdb-54cf-e1b07100b1f8@flygoat.com>
Date:   Wed, 29 Jul 2020 09:48:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.0.1
MIME-Version: 1.0
In-Reply-To: <20200728205245.GC22052@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 22093418CF
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/7/29 4:52, Thomas Bogendoerfer Ð´µÀ:
> On Tue, Jul 28, 2020 at 11:36:54PM +0800, Jiaxun Yang wrote:
>> Hi,
>>
>> This series convert reservation of Loongson64 Logic PIO into DeviceTree based
>> method.
>>
>> It can be used to replace Huacai's
>> "MIPS: Loongson64: Reserve legacy MMIO space according to bridge type".
>>
>> Thanks.
>>
>> v2:
>>    - Address Rob and Huacai's review comments.
>> v3:
>>    - Address Rob, Thomas's review comments.
>> v4:
>>    - Fix typo & grammar issue according to Xuerui's suggestion.
>>
>> Jiaxun Yang (5):
>>    of_address: Add bus type match for pci ranges parser
>>    MIPS: Loongson64: Process ISA Node in DeviceTree
>>    MIPS: Loongson64: Enlarge IO_SPACE_LIMIT
>>    MIPS: Loongson64: DTS: Fix ISA and PCI I/O ranges for RS780E PCH
>>    MIPS: Loongson64: Add ISA node for LS7A PCH
>>
>>   arch/mips/boot/dts/loongson/ls7a-pch.dtsi     |  7 ++
>>   arch/mips/boot/dts/loongson/rs780e-pch.dtsi   |  4 +-
>>   arch/mips/include/asm/io.h                    |  2 -
>>   arch/mips/include/asm/mach-generic/spaces.h   |  4 +
>>   .../mips/include/asm/mach-loongson64/spaces.h |  3 +-
>>   arch/mips/loongson64/init.c                   | 87 +++++++++++++------
>>   drivers/of/address.c                          | 29 ++++---
>>   include/linux/of_address.h                    |  4 +
>>   8 files changed, 97 insertions(+), 43 deletions(-)
> series applied to mips-next.

+ Xuerui & Bibo,

This series should fix the issue that RTC on RS780E chipset failed
to be probed, please kindly test latest mips-next.

Thanks!

- Jiaxun

>
> Thomas.
>
