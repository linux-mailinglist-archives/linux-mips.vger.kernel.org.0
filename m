Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6412E992C
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:52:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbhADPuh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbhADPuh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 10:50:37 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609E9C061793
        for <linux-mips@vger.kernel.org>; Mon,  4 Jan 2021 07:49:57 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id w18so25439941iot.0
        for <linux-mips@vger.kernel.org>; Mon, 04 Jan 2021 07:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7bOrj5NFbfU1iaPecOwGPerPa2nhKULyJEWIuFehYmw=;
        b=xyZIk+992U8/YXmiwIKamGonVEXvXbHSCAMUo+TIB36irYZ9fZFs5iY1sQKpnAVbsE
         YNB3/N29ZZH2n4v15khcuxwBYStdLNKFSBRQrDY1IUAAgtGJRGC4P/DRCuQSdvH3BcgG
         Zi0Bx10TWb/CovJBVsqVjHltBmTrWs8l/VxN6++WpWzXEQl+iRJC35AzNG4si5FExg/H
         A7bVVo/nvA9mo2vwgMPR6a5XYwum2Gu3BfAZ4b4RGqs2aCl7ksQ0SqLKcoV/EKSzfxGf
         C8s//xHCYHJSHNZccQfU9eofVI+4D32Esw5YOMh/ow7FTdia7sq7hekwCOJ7nvx1W3Kq
         mYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7bOrj5NFbfU1iaPecOwGPerPa2nhKULyJEWIuFehYmw=;
        b=fkqGiAW/p18UrCkSjuVMhpfHpvAzrZUwwcfHuv+WmeQPFBRbLK147yIInCE5GuD996
         jHl5oJ161oUv7om08AEXyUvsX4VrJ0FHj725uU6OOgIJiEJdvQN2oEFXrHtidISAzacX
         oGjqM1tJf+iL4uic4t0jjd5VC/Uct5+3LyjgnA+QRmPz+/SIrjzkZNkF8k89iF/6KQvc
         WMcqS1zgpNy/GIedKgyxL5qU8pDKvNmucz7dc8iw7jlVo92lYiAGekweQy9l7ViuauPq
         IJNmo6k68yWQTEMOpagwCXnpPwyDupj+o+JdGsohakhqOyq/EJ2maf15w0ARdc7RNQJB
         D0ig==
X-Gm-Message-State: AOAM5314ZlmAt4OjPbLF2m6TbmAbByyDKNeaCmTvFayQT0yb0D5IVPxp
        FVsPlkbhSy9b6wIoVRX0RSH64w==
X-Google-Smtp-Source: ABdhPJz0n4DYoHU2SCcDw+S/KYN5yNM5cn1fLfnR7yNSdUYKzuQE3GWviiI8df9AuLHzmLNJaI7ZJA==
X-Received: by 2002:a02:c7d1:: with SMTP id s17mr63236024jao.142.1609775396680;
        Mon, 04 Jan 2021 07:49:56 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id t21sm43961096ild.86.2021.01.04.07.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 07:49:56 -0800 (PST)
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-block@vger.kernel.org
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
 <944dd5af-c5d0-b37c-29ca-0213ea6081db@kernel.dk>
 <20210104174348.cda010a3af0ec3d989732b37@gmx.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <db1936b0-a1ab-41b3-be09-ec301ea7ebc3@kernel.dk>
Date:   Mon, 4 Jan 2021 08:49:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104174348.cda010a3af0ec3d989732b37@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/4/21 8:43 AM, Lauri Kasanen wrote:
> On Mon, 4 Jan 2021 08:40:10 -0700
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 1/4/21 6:50 AM, Lauri Kasanen wrote:
>>> Signed-off-by: Lauri Kasanen <cand@gmx.com>
>>> ---
>>>  drivers/block/Kconfig   |   6 ++
>>>  drivers/block/Makefile  |   1 +
>>>  drivers/block/n64cart.c | 203 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>  3 files changed, 210 insertions(+)
>>>  create mode 100644 drivers/block/n64cart.c
>>>
>>> block folks: rest of the series is on linux-mips. Being a
>>> mips-specific driver, not sure which tree it should go to.
>>
>> It should definitely get reviewed first. One easy question - there's no
>> commit message in this one. It's a new driver, it should include some
>> documentation on what it is, etc.
> 
> It's already had one (rfc) round on linux-mips. Or do you mean by
> others (who?)

I mean the actual block driver from the block point of view. From
a quick look, looks like there's no irq or anything, so it's
strictly polled mode? Probably would make sense to push this out
of the app path then, by using BLK_MQ_F_BLOCKING.

-- 
Jens Axboe

