Return-Path: <linux-mips+bounces-7510-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98FA16170
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 12:49:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33BC31886155
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 11:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A296219F128;
	Sun, 19 Jan 2025 11:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b="yg2p8vqK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx-out.tlen.pl (mx-out.tlen.pl [193.222.135.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E7E1F941
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.222.135.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737287358; cv=none; b=AKnZl4fA/LS5eJlDmvIsF5FWvrAlMofltN8HPCt33HX19zsvwvgaW8DgGJa0YlfMBhF9rSlx7PmW2zEZzAWLcTUp1lr2z8J86cX5ulFaYkweXiF51eFTQ3fAVvDe1vByEkfLmzIqI2+/NZbAzv97yX2niVD+DcFpWP4Zxnbz46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737287358; c=relaxed/simple;
	bh=9AvbpD/4VYDe3mBnX5PuXOfKlbvCeXAWJECqqjLeN70=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ukQu6T0qk+EQM/bKmuMGdhPCo0Pia5yVyFVa/h5YuAeSf6Kn40c2BAxYUSRaihVo9pA+oepFnCciud+L6Xo43wtZedORX2lr2KYo1U1bAG2MEqKm5fE9a/YIWQlidKJP04ZHOy4K96T3HJhJVpabwtmrxOkcKWq7ErCopZSPG9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl; spf=pass smtp.mailfrom=o2.pl; dkim=pass (2048-bit key) header.d=o2.pl header.i=@o2.pl header.b=yg2p8vqK; arc=none smtp.client-ip=193.222.135.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=o2.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=o2.pl
Received: (wp-smtpd smtp.tlen.pl 49114 invoked from network); 19 Jan 2025 12:42:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1737286952; bh=xceQI/c5L0JUp9/0lwcIT4V1H2vgf5/EZpyZJD+6pVc=;
          h=Subject:From:To:Cc;
          b=yg2p8vqKyKJjmd7i/3N8u0WB+W32FzSdWJdBmnbSUzvm+etAVV3c7rUReDWoWgfwP
           zHAWWynbe6os+whtLUzC7s7O7y9Y04U48xC49qjnvwlhd+b+gNnuTRFBYYh40mQ3Ys
           VIjOrBXVGLqf25ODugJKdUcdwGZPVOQkHgTSZc7rUpls55hVsJdfzkM4qcCdj4X3yQ
           8DCf5UGeLTg/OdPwRu+Et/6Od0E0f7GN7LfJWZqnOY+kf0EHvC8c2sV8ys5M6WcBWo
           tia5NeiTwUeYaWWvXcpVYNMRLfGe+bbx64MuRJFw/dXunBUaPY+fwESC8Glf26A2OS
           Epbcg34ALWZ4Q==
Received: from unknown (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[37.109.147.248])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <jiaxun.yang@flygoat.com>; 19 Jan 2025 12:42:32 +0100
Message-ID: <017febf1-b801-4bdf-99bc-2e3c348c6643@o2.pl>
Date: Sun, 19 Jan 2025 12:42:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: pci-legacy: Override pci_address_to_pio
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Arnd Bergmann <arnd@arndb.de>, Baoquan He <bhe@redhat.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250114-malta-io-fixes-v1-1-74ef1dc402ec@flygoat.com>
 <6946ae6b-814c-4916-9428-e823c83aed3d@o2.pl>
Content-Language: en-GB, pl
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <6946ae6b-814c-4916-9428-e823c83aed3d@o2.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 98180e53ed90edec5f872ee9e4e7866e
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [8fOk]                               

W dniu 14.01.2025 o 19:42, Mateusz Jończyk pisze:
> W dniu 14.01.2025 o 19:11, Jiaxun Yang pisze:
>> pci-legacy systems are not using logic_pio to managed PIO
>> allocations, thus the generic pci_address_to_pio won't work
>> when PCI_IOBASE is defined.
>>
>> Override the function to use architecture implementation to
>> fix the problem.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 4bfb53e7d317 ("mips: add <asm-generic/io.h> including")
>> Reported-by: Mateusz Jończyk <mat.jonczyk@o2.pl>
>> Closes: 
>> https://lore.kernel.org/r/99f75c66-4c2d-45dc-a808-b5ba440c7551@app.fastmail.com/
>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hello,

Tested on:

- mips64el, QEMU malta - RTC is working, no suspicious warnings in dmesg,

- mipsel, QEMU malta - RTC is working, no suspicious warnings in dmesg,

- fuloong2e_defconfig, in QEMU on Ubuntu 24.04 - kernel does not boot, 
with or without this patch:

         [...]
         pps_core: LinuxPPS API ver. 1 registered
         pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo 
Giometti <giometti@linux.it>
         PTP clock support registered
         PCI host bridge to bus 0000:00
         pci_bus 0000:00: root bus resource [mem 0x14000000-0x1c000000]
         pci_bus 0000:00: root bus resource [io  0x4000-0xffff]
         pci_bus 0000:00: No busn resource found for root bus, will use 
[bus 00-ff]
         pci 0000:00:00.0: [df53:00d5] type 00 class 0x060000 
conventional PCI endpoint
         pci 0000:00:05.0: [1106:0686] type 00 class 0x060100 
conventional PCI endpoint
         qemu-system-mips64el: hw/pci/pci.c:297: 
pci_bus_change_irq_level: Assertion `irq_num < bus->nirq' failed.

- loongson3_defconfig, in QEMU (target loongson3-virt) - no important 
differences in dmesg output, but this
   platform does not use RTC CMOS, but a Goldfish RTC,

Greetings,

Mateusz


