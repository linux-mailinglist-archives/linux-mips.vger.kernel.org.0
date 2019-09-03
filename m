Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17D0BA5FE6
	for <lists+linux-mips@lfdr.de>; Tue,  3 Sep 2019 05:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbfICDuO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Sep 2019 23:50:14 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:60790 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725848AbfICDuO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Sep 2019 23:50:14 -0400
Received: from mxback6o.mail.yandex.net (mxback6o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::20])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id A6704F20E20;
        Tue,  3 Sep 2019 06:50:09 +0300 (MSK)
Received: from smtp3o.mail.yandex.net (smtp3o.mail.yandex.net [2a02:6b8:0:1a2d::27])
        by mxback6o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id 62lEUQt2Wi-o9VSi1kk;
        Tue, 03 Sep 2019 06:50:09 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567482609;
        bh=PkIw7mWkWCTDrNINO37DwccJDXBDRHKoyiJUMgN/55U=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=aK434M+69tCznKfHh6l8nrg3UtYJyNfKq7bxCWHVOnmWwmJzsqE8sChnK6l4ZMzwC
         Ikhg2qCKpE2AFhjdj8wCCPapcAgjk1RWoMzUrJ8Qo88pRnHhH26fCVhV+vc7ZENKCW
         q01KavZZ8LiX+SNgwXC+7c/n9TALzmauZbXuvg7Q=
Authentication-Results: mxback6o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp3o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id gFijUlGWMN-o7MmjvTl;
        Tue, 03 Sep 2019 06:50:08 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 120/120] MIPS: Fix name of BOOT_MEM_ROM_DATA
To:     Fredrik Noring <noring@nocrew.org>
Cc:     linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <54a08fcb41b12e715529148a6bc11bcb3e2adb4d.1567326213.git.noring@nocrew.org>
 <d88ab711-b8b6-a04f-6f19-82ecbb758398@flygoat.com>
 <20190902152626.GC2479@sx9>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <01a6d6e1-2c14-c3fd-8c15-ac54726e55d3@flygoat.com>
Date:   Tue, 3 Sep 2019 11:50:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190902152626.GC2479@sx9>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2019/9/2 23:26, Fredrik Noring 写道:
>> ROM_DATA meant memory used by ROM(Bootloader) to store data in some
>> machines, is that name right?
> That's the machine reset code, and other things such as the BIOS, drivers,
> firmware, splash screen animations, a DVD player, etc.

Hi Fredik,

Then it's not *memory* right?'

And It should not be managed by boot_mem_map (Or memblock after 
boot_mem_map being dropped).

>> Btw, boot_mem_map had been droped recently, see mips-next tree, please
>> rebase.
> OK, then I think we can drop this patch since it was meant as a starting
> point to mapping all addresses in /proc/iomem. I have patches that make
> it look like this:
Add these stuff to resource system by platform code is better than 
hijack memory map of all other machines.
>
> # cat /proc/iomem
> 00000000-01ffffff : System RAM
>    00010000-00431c4b : Kernel code
>    00431c4c-00584fff : Kernel data
>    007c0000-007e695f : Kernel bss
> 12000000-13ffffff : Graphics Synthesizer
> 1c000000-1c1fffff : IOP RAM
> 1e000000-1e0fffff : System ROM
> 1f801600-1f8016ff : USB OHCI
> 1fc00000-1fffffff : System ROM
>
> There are many other regions, and it would be useful to have them all
> included eventually, but they are not essential for the initial system.
>
> Fredrik
Thanks.

--

Jiaxun Yang

