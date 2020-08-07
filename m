Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8391A23EA93
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 11:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgHGJjm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 05:39:42 -0400
Received: from relay1.mymailcheap.com ([144.217.248.100]:40547 "EHLO
        relay1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgHGJjl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 05:39:41 -0400
X-Greylist: delayed 54591 seconds by postgrey-1.27 at vger.kernel.org; Fri, 07 Aug 2020 05:39:40 EDT
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com [91.134.140.82])
        by relay1.mymailcheap.com (Postfix) with ESMTPS id BE50D3F201;
        Fri,  7 Aug 2020 05:39:39 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by filter2.mymailcheap.com (Postfix) with ESMTP id F3B532A6D5;
        Fri,  7 Aug 2020 11:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596793179;
        bh=xr0BRST6/Xn8OfADNiDvnj6VvXEN9x9a0Er5jCPYjFU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=wOKXdavR4Mg7OYpp4vli9L6wVGBwjFOSKHHF+1tRylq0nJ9LUrqFyKlykPsF0oOZG
         KIciT0dm4nWATwLMWocSBYgHhAkZUnEm/ADZhptVryJIOdtU7BhMPvVZ5189cykA+M
         EwF8fzFi/Tts+1lkvhJOq8IbV2/sdvhRoS0UxqtQ=
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
        by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YfPQYa7AxrDu; Fri,  7 Aug 2020 11:39:36 +0200 (CEST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter2.mymailcheap.com (Postfix) with ESMTPS;
        Fri,  7 Aug 2020 11:39:36 +0200 (CEST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id 58764425A5;
        Fri,  7 Aug 2020 09:39:34 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="CxJy1L3e";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (unknown [203.86.239.91])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 6F61D425A5;
        Fri,  7 Aug 2020 09:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596793165;
        bh=xr0BRST6/Xn8OfADNiDvnj6VvXEN9x9a0Er5jCPYjFU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CxJy1L3eUC1HGcWGGR62Obkeach/70fV368tZWYgbuitY7sNSNFKK0b/dYmh7sky9
         fT1PKXiDLo3GMBp7NI/3m2YACvAS8lYxRQfJw5dVHDhTiJ52ot159kO9BVtqMoTKeb
         To0/7YTg0WQ1L40RnzweITIWe1YTD54F5m+FPxvA=
Subject: Re: loongson ls2k1000: PCIe serial card WCH CH382L not working, maybe
 ioports problem
To:     Marc Kleine-Budde <mkl@blackshift.org>,
        Du Huanpeng <u74147@gmail.com>, linux-mips@vger.kernel.org
Cc:     zhangj@wch.cn, linux@rempel-privat.de
References: <20200807030826.GA10693@tkernel.org>
 <88921f60-1458-ab04-2ed9-bce57ce7101d@flygoat.com>
 <ad026820-6b57-15a1-a31e-2d8c8829b7f4@blackshift.org>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <12ec3fa0-263e-71d6-0c95-cedde0713f0c@flygoat.com>
Date:   Fri, 7 Aug 2020 17:39:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ad026820-6b57-15a1-a31e-2d8c8829b7f4@blackshift.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Rspamd-Queue-Id: 58764425A5
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[flygoat.com:+];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         FREEMAIL_TO(0.00)[blackshift.org,gmail.com,vger.kernel.org];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         MID_RHS_MATCH_FROM(0.00)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



在 2020/8/7 下午4:35, Marc Kleine-Budde 写道:
> On 8/7/20 10:01 AM, Jiaxun Yang wrote:
>>> I'm testing a PCIe card to two uarts (WCH CH382L compatible,
>>>            https://item.jd.com/48547850173.html) on a loongson ls2k1000 board.
>>>
>>> With the card inserted the kernel detects the two new uarts:
>>>
>>> [    2.060884] pci 0000:00:04.1: EHCI: unrecognized capability ff
>>> [    2.066721] pci 0000:00:04.1: EHCI: capability loop?
>>> [    2.066745] pci 0000:00:04.1: quirk_usb_early_handoff+0x0/0xa60 took 358764 usecs
>>> [    2.074542] pcieport 0000:00:09.0: PME: Signaling with IRQ 2
>>> [    2.080651] pcieport 0000:00:0a.0: PME: Signaling with IRQ 3
>>> [    2.086648] pcieport 0000:00:0b.0: PME: Signaling with IRQ 4
>>> [    2.092616] pcieport 0000:00:0c.0: PME: Signaling with IRQ 5
>>> [    2.098579] pcieport 0000:00:0d.0: PME: Signaling with IRQ 6
>>> [    2.104557] pcieport 0000:00:0e.0: PME: Signaling with IRQ 7
>>> [    2.113728] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
>>> [    2.120891] serial 0000:06:00.0: limiting MRRS to 256
>>> [    2.126314] 0000:06:00.0: ttyS0 at I/O 0xc0 (irq = 7, base_baud = 115200) is a XR16850
>>> [    2.134618] 0000:06:00.0: ttyS1 at I/O 0xc8 (irq = 7, base_baud = 115200) is a XR16850
>>> [    2.143130] 1fe00000.serial: ttyS2 at MMIO 0x1fe00000 (irq = 1, base_baud = 7812500) is a 16550A
>>> [    2.151946] printk: console [ttyS2] enabled
>>> [    2.160255] printk: bootconsole [early0] disabled
>>> [    2.170112] [drm] radeon kernel modesetting enabled.
>>>
>>> However a write to the serial fails:
>>> / # echo "hello" >/dev/ttyS0
>>> [ 9369.631915] serial 0000:06:00.0: LSR safety check engaged!
>>> sh: write error: Input/output error
>> I assume you're using my out-of-tree fork to support LS2K.
>> I messed with Logic PIO in that fork.
>> I'll fix it in mainline, sorry for the issue...
> Do you have a tree that we can test?

I'm trying to trim my patches to meet mainline requirement but I was
really busy recent days.

I'll report when the tree is ready.

Thanks.

- Jiaxun
>
> Marc
>
