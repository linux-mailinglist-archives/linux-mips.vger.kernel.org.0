Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAA131FD02
	for <lists+linux-mips@lfdr.de>; Fri, 19 Feb 2021 17:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBSQTp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Feb 2021 11:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhBSQTn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 19 Feb 2021 11:19:43 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18969C061756
        for <linux-mips@vger.kernel.org>; Fri, 19 Feb 2021 08:19:02 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id o7so4947854ils.2
        for <linux-mips@vger.kernel.org>; Fri, 19 Feb 2021 08:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EcaqTWCSfVXsMoTGzYmFHrJ3PSTdaSO3AS0apxN4KlY=;
        b=Q4j3s0GwyjFaf20JY5B2RYgKSyiP4Wrwdl75NuiIhl/VleDzjZdpTy/sbpE3yp22OZ
         OGQU8pxHmxDZ9wP79VILef4QDfC8c7sqz8R7ReXUElDXjx4M2cNbiWLkaUVs5+T20fS3
         z/GpZL5UFUy4SBGzpn8xFfu7qe5ToaSIhZEE2WD71yCJkfrBD3qCXvFo7NzizOWcwNxb
         8lAf1vzP8VDMHLmUxhU7sCLnLoPgENR9vFrxOEDPvhdtWoBUVzW40ij+HnIDqlge0fl5
         vzXwMq1sQ+cRGShtxGyyJd3nmKVWd8XawU1ssaT25hSJrCSFy8r02amanAj6z5hNxd8s
         WaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EcaqTWCSfVXsMoTGzYmFHrJ3PSTdaSO3AS0apxN4KlY=;
        b=hnadvnNzXJr2FtNxowAh85v7dR3d7IHXlHAh5hoL7cyK71DEXqh5zn1s8icrmm+iM0
         I5+JuAU+p42BdJmIql5dtjI548z0vH/rhOJsm3YuW0H96894eIV964liKQDmTH9MD6SD
         3jnXoipfN68h63hJc7OaA+vYS2ACN0dyfShYh8//V688tD65gBRKe6uRZaB89MaQLL5d
         pvngdl6cTND+opMoye7m7EhA58K/yzQorJn7oDVne3s8ePNlBZwpIFTblLOggzP2gc5o
         sGYds06A4RYiMoIRc51GbwHeDumtn4S425VuOElhtE8qpAF8lh+V0tkZDvX1vG6c9p9c
         rXOQ==
X-Gm-Message-State: AOAM533K+RCGghqsKkV6WI4mrLJtGhqkO0qjGAB3kwFFvSqn5pr1rE19
        3xN12dzsa78HErQbO0uvtsIZuw==
X-Google-Smtp-Source: ABdhPJypDZOBBqEoSDVnkHvN0UvyZj33F/CLcJ/LaWrT2uOKZprfsGvk161Tv1kIDvFT2cC+I00Aqw==
X-Received: by 2002:a92:de4b:: with SMTP id e11mr4306981ilr.123.1613751541399;
        Fri, 19 Feb 2021 08:19:01 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id q10sm497286iop.10.2021.02.19.08.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 08:19:01 -0800 (PST)
Subject: Re: [next]: fs/io_uring.c:6171:10: error: implicit declaration of
 function 'io_sendmsg_prep_async'; did you mean 'io_req_prep_async'?
To:     Pavel Begunkov <asml.silence@gmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-mips@vger.kernel.org,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        io-uring@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>
References: <CA+G9fYt1Bk=DW1VoPgWe9ZHHoHu+6OyZi7ndMJHmoR14uJePyQ@mail.gmail.com>
 <87798def-0526-0a1e-6bcc-e5ee3970bd48@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <a6c9a1f0-43a2-4c8d-a574-827e85e3c314@kernel.dk>
Date:   Fri, 19 Feb 2021 09:18:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87798def-0526-0a1e-6bcc-e5ee3970bd48@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/19/21 9:10 AM, Pavel Begunkov wrote:
> On 19/02/2021 16:08, Naresh Kamboju wrote:
>> Linux next tag 20210219 arm and mips builds failed due to below error.
>>
>> Following build configs failed
>> arm (s3c6400_defconfig) with gcc-8
>> arm (s3c6400_defconfig) with gcc-9
>> arm (s3c6400_defconfig) with gcc-10
>>
>> mips (e55_defconfig) with gcc-8
>> mips (e55_defconfig) with gcc-9
>> mips (e55_defconfig) with gcc-10
>>
>> fs/io_uring.c:6171:10: error: implicit declaration of function
>> 'io_sendmsg_prep_async'; did you mean 'io_req_prep_async'?
>> [-Werror=implicit-function-declaration]
>>    return io_sendmsg_prep_async(req);
>>           ^~~~~~~~~~~~~~~~~~~~~
>>           io_req_prep_async
> 
> !CONFIG_NET, I guess. Thanks for letting know

Yep, I'm making a cleanup for that.

-- 
Jens Axboe

