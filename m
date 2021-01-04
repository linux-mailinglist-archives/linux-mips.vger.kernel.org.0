Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263A72E9A5F
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 17:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728491AbhADQJB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 11:09:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbhADQIw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 11:08:52 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444ABC0617A3
        for <linux-mips@vger.kernel.org>; Mon,  4 Jan 2021 08:07:44 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id t8so25437461iov.8
        for <linux-mips@vger.kernel.org>; Mon, 04 Jan 2021 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DIri2XXuTuc/m2XlLdT/KNcOjAYDYr/u4Sxse0H2Kl4=;
        b=EtSLpCxyCa9mX4njTy9tN1inLzBWcZRTsaAfLHreJX80QiWPGSyjGzC9/KBmR/za7l
         6HTuZOgc92nXGOU2w6dkz68Oanialk0IrZRz0RFdah9O9LXaq9IkbF9bkss60lNU9OWd
         DnaIe1Oj1SFO4nBWSI2vZGzCJir6kuYR+kDKZRVrqnyEc23rw9eNCxy3dmMQIJEPiWdH
         emgDWPKo2jCeTGo4jsSShJvVu+uAJ009LyiJp+uxo/FUe75rkymqhnLHXTrk3uZ8NEDP
         6JaqWRG92b07CUruKzBunvKfuuB4cHQ3rkfTTVVxTpN89cUCRH7QFYpHFtQLaOKyatJ/
         6EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DIri2XXuTuc/m2XlLdT/KNcOjAYDYr/u4Sxse0H2Kl4=;
        b=enXjFrhehYBfq8SIf4gAPfnGTV8p1rtKTw/RnB3Lz1QlTHGblSK4vNrK4LdWrs2t1Y
         N341oBvUnra7wUAYzr4hA35GDHUsrn1MjmJggmtQfyUZ/BD3qv/P1B6kjG0YzjTNdluh
         gU3XUe41Lp0+Gyrm/cGf3+wNQc5j6hxqmqoJfYclq6SyStTOTxXPkqT4hGEu/R0LPYND
         m+uLVxnT/MQU41Tr9eSK5/IAEfBGgyoQxg6Hq96ChDc408z2Z1QwtlTVxIOKan3nqgAg
         64xFBLYtLwD2292UTUNr+0V/PBuOP+huyPQ7/gaiEG5pqp+M+Y22Jls/TUAutFCq7myi
         HQ0g==
X-Gm-Message-State: AOAM533OOCZGBSkFCFuXjPJGkghfT8zTa45W7+4IQveu3BcE0Uj3IiSs
        oxIW2FB/vYXh+YG8V5dn0ff2dQ==
X-Google-Smtp-Source: ABdhPJxZ0J6nqQhzs312zRgHP5/YfjX+evmqJZfeOntmoP7v7n24ZKXUkAXjA4gfg9uIkrhSXs3l5Q==
X-Received: by 2002:a02:b60a:: with SMTP id h10mr61721133jam.99.1609776463552;
        Mon, 04 Jan 2021 08:07:43 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id e28sm22649117iov.38.2021.01.04.08.07.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:43 -0800 (PST)
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-block@vger.kernel.org
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
 <944dd5af-c5d0-b37c-29ca-0213ea6081db@kernel.dk>
 <20210104174348.cda010a3af0ec3d989732b37@gmx.com>
 <db1936b0-a1ab-41b3-be09-ec301ea7ebc3@kernel.dk>
 <20210104175659.f5433d55d8e41b3c8b620894@gmx.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <0aced2a8-067b-1741-9a50-7c039241e3ce@kernel.dk>
Date:   Mon, 4 Jan 2021 09:07:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104175659.f5433d55d8e41b3c8b620894@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/4/21 8:56 AM, Lauri Kasanen wrote:
> On Mon, 4 Jan 2021 08:49:55 -0700
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 1/4/21 8:43 AM, Lauri Kasanen wrote:
>>> On Mon, 4 Jan 2021 08:40:10 -0700
>>> Jens Axboe <axboe@kernel.dk> wrote:
>>>> It should definitely get reviewed first. One easy question - there's no
>>>> commit message in this one. It's a new driver, it should include some
>>>> documentation on what it is, etc.
>>>
>>> It's already had one (rfc) round on linux-mips. Or do you mean by
>>> others (who?)
>>
>> I mean the actual block driver from the block point of view. From
>> a quick look, looks like there's no irq or anything, so it's
>> strictly polled mode? Probably would make sense to push this out
>> of the app path then, by using BLK_MQ_F_BLOCKING.
> 
> It's very unclear to me what that flag does. I read all the docs
> available, but nothing made it clear (same applies for almost all
> BLK_MQ_*).

It pushes the actual processing to a helper thread instead of doing
it inline on submit. Generally used if the driver needs to block
to submit IO, as per the name, but also useful for really slow
hardware like this one.

-- 
Jens Axboe

