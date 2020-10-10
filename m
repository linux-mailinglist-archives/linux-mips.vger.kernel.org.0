Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2266E289F1E
	for <lists+linux-mips@lfdr.de>; Sat, 10 Oct 2020 10:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729672AbgJJIGj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 04:06:39 -0400
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:38328 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728994AbgJJIGJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Oct 2020 04:06:09 -0400
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 3B34B20DDA;
        Sat, 10 Oct 2020 08:05:05 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 3D913260EB;
        Sat, 10 Oct 2020 08:03:00 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id AFE953F1C5;
        Sat, 10 Oct 2020 08:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id E40442A51C;
        Sat, 10 Oct 2020 10:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1602316946;
        bh=3doH/BsO7Gp5Wo7wOwrANrNI9dHlLsavfWhADs4Lzfo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=r85UKtWUhdGCkuh1HhGBcz3ZyM78fiA55lJyElK5zePaNjmV6bbZK4K72vCUNoHWm
         n53HyHVno8TjSjH70LTtsuefUj81x3+a+2gHxk7sGPG7kreVbGZAIAk4V9RuePcdIx
         4XyHuKrx/zifypgeepT6HJFF6J83+UncfrDg2jio=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Dx6RRTGv89Nb; Sat, 10 Oct 2020 10:02:24 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 10 Oct 2020 10:02:24 +0200 (CEST)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id C741740BFB;
        Sat, 10 Oct 2020 08:02:22 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="CO4LIIW1";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li1197-90.members.linode.com [45.79.98.90])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 340F140FF4;
        Sat, 10 Oct 2020 08:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1602316916;
        bh=3doH/BsO7Gp5Wo7wOwrANrNI9dHlLsavfWhADs4Lzfo=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CO4LIIW1psWdVgZ4xeDRUzVW/SEe6bgXgUVbKDk/o1rjedM3hgJf6vadQhn9M/ENt
         zHdYfL+BWLGEPqP2xMpRXVHmUCR1dY2+MFjDwPOY/XiyUolKi7J6HHgRDKORY+DL6n
         O7vEXkIYIfuu92I9gJEXjZnp9LPjh06XzQwWsTKU=
Subject: Re: [PATCH 3/3] MIPS: Loongson64: Add /proc/boardinfo
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <1602241050-24051-1-git-send-email-yangtiezhu@loongson.cn>
 <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <9f0e4f45-dc8b-8351-8a40-8a4b8a86940f@flygoat.com>
Date:   Sat, 10 Oct 2020 16:01:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602241050-24051-4-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: C741740BFB
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[6];
         ML_SERVERS(-3.10)[213.133.102.83];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
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



ÔÚ 2020/10/9 ÏÂÎç6:57, Tiezhu Yang Ð´µÀ:
> Add /proc/boardinfo to get mainboard and BIOS info easily on the Loongson
> platform, this is useful to point out the current used mainboard type and
> BIOS version when there exists problems related with hardware or firmware.

Hi Tiezhu,

You're touching Kernel userspace API and I believe it should be 
documented. Also linux-api list
should be informed.

Also I'd like to know if it's really useful for mainline kernel.
For user who wants to check board information, dmidecode is already 
useful enough.

Thanks.

- Jiaxun

>
> E.g. with this patch:
>
> [loongson@linux ~]$ cat /proc/boardinfo
> Board Info
> Manufacturer            : LEMOTE
> Board Name              : LEMOTE-LS3A4000-7A1000-1w-V01-pc
> Family                  : LOONGSON3
>
> BIOS Info
> Vendor                  : Kunlun
> Version                 : Kunlun-A1901-V4.1.3-20200414093938
> ROM Size                : 4 KB
> Release Date            : 2020-04-14
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>
