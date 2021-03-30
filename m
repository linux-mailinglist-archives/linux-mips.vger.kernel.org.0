Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C1734DDC6
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 03:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbhC3BtH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 21:49:07 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:47899 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229483AbhC3Bsg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 21:48:36 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 50D145C01DA;
        Mon, 29 Mar 2021 21:48:35 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Mon, 29 Mar 2021 21:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=uEYMZDyvC0yE4Nhl/H6s9q3zEdpO2lQ
        ZO3jozv7n0RI=; b=d113Ny3T55ataz9j7NShvS1o7jivldE9VXOYS/vvvJJKeVr
        eRjLiYLrGVejX8U8WliUNE8YMO855kIF97aQAwOHA9MPIaj4NrBtkRPasZKLpAPN
        7woC36AjBwbX43hBQKUfoMCRf1W8ces3EeDOidTpD2pjNULmFtJ50KTzxpe831QV
        GmFli1/jSlx0ZJRNS2NyYAYW2z1pZicTeagV0kOUQwxY9snibtywemqC/+l2g4a5
        pJjWki2ETwWFNNH5iNHBk04ebj9SbU9FgncCIvs37+MXu7+MtucsYF0X/SVHKkUW
        5LP71tYj4ErVhjY6qNPQYfMVSU0fB+eQFbNydjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uEYMZD
        yvC0yE4Nhl/H6s9q3zEdpO2lQZO3jozv7n0RI=; b=SrbeZXBfDfaqdsC1gXYR7T
        HS3AP150YVxC03rqzwO7M2/T+Iz00j3zQrDhqBXpePuVmiIaJwVaPaBP+rXG/nf0
        0WLpTv5ZM90vZ32mwSCbgiXKftE25m795wFD9pO++HcBqKo+PbN+nVaeg+o7zZ2x
        4WcjmRJRQDOVAYXOGcmanKUu08N0bYpxR7Z5LAABwLSjjbwV2mP8ZjQBR20tkIWj
        pFM7VETqU0JfTzYmKqLDc1st44ycS5kZ7S6va2HynfCUYI+1ttTp5xzgZv6ZuDFw
        Nez3N8wCaM6ko5yfgkY/7su17dUGE6RrnqCKhZ6o0c2YL5vEFgWINhZptKybJbYA
        ==
X-ME-Sender: <xms:cYNiYB5wrpE6ax3BHEs_xRx47Dy5SHbwTPCgOc1toiT4g0guqJiVjw>
    <xme:cYNiYO7MnmcKu9538Agz2gfzegI_23efwKDd574F7ygvgxHWZB1LnFcboIs10xc7W
    eKDyZG3LNmhuhZ9MV0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeekleehtefhhefftddtleeiveefieehueduieefueegueei
    leeitdeujeehheehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:cYNiYIdtgxEnGjw9IXEd0jtt20iwlaalkqp9mv1weuS2B-iKJrhFAQ>
    <xmx:cYNiYKJYtNjWtgWfSIS07fMebp5PvXup8MqRW-OYIi5Y-qsSJHKUfg>
    <xmx:cYNiYFINB7pZenUyHbgwu1RqeW7W4LtjWev7c6jLTKNjz1uZYEszaQ>
    <xmx:c4NiYMWy0_P0f_klRK6YtPSt6KK2pSYI1HvXGry9Z89mbwnEK9F0hw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 0BCD5130005E; Mon, 29 Mar 2021 21:48:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <b48ce495-129b-4e07-8d74-d1231073235b@www.fastmail.com>
In-Reply-To: <20210329071558.3492-1-zhangqing@loongson.cn>
References: <20210329071558.3492-1-zhangqing@loongson.cn>
Date:   Tue, 30 Mar 2021 09:48:10 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Qing Zhang" <zhangqing@loongson.cn>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc:     "Huacai Chen" <chenhuacai@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: enable CONFIG_USB_SERIAL_PL2303
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Mon, Mar 29, 2021, at 3:15 PM, Qing Zhang wrote:
> When using the Loongson-3A4000 machine for serial port debugging,
> there is no /dev/ttyUSB* output, which makes the serial port unavailable,
> For convenience, we open this configuration.
> 
> zhangqing@loongson-pc:~$ cat /sys/firmware/lefi/boardinfo
> Board Info
> Manufacturer		: THTF
> Board Name		: THTF-LS3A4000-7A1000-ML4A
> Family			: LOONGSON3
> 
> BIOS Info
> Vendor			: ZD tech
> Version			: ZD tech-V2.1.1
> ROM Size		: 4 KB
> Release Date		: 2020-06-29
> 
> zhangqing@loongson-pc:~$ lsusb
> Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 005 Device 003: ID 093a:2510 Pixart Imaging, Inc. Optical Mouse
> Bus 005 Device 002: ID 0c45:760b Microdia USB Keyboard
> Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 004 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 003 Device 003: ID 067b:2303 Prolific Technology, Inc. PL2303 Serial Port
> Bus 003 Device 001: ID 1d6b:0001 Linux Foundation 1.1 root hub
> 
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>

Please, don't add random stuff to defconfig.
Carry it locally in your config as the device doesn't come with the borad, it's your accessory.

Thanks.

-- 
- Jiaxun
