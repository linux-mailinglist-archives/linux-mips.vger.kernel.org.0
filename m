Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0EB2E98FE
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 16:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbhADPkw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 10:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727373AbhADPkv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Jan 2021 10:40:51 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A381EC061794
        for <linux-mips@vger.kernel.org>; Mon,  4 Jan 2021 07:40:11 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id i18so25368622ioa.1
        for <linux-mips@vger.kernel.org>; Mon, 04 Jan 2021 07:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ZJr/xckbWzUBtxmV3MRFg0Mfek8+Ea5Ai66Ob6CkTM=;
        b=rHeD+uLE63PP7Vke0b6cc9mTtOd4Br2Oum99paaPF2u7IzbfF0bQWYTMsrYOE+rl+a
         m2Qa6KnWlXIzlxMRKxhId5xkvFd0lWu6+Hprxy9PKozJiUl2O+NQPyK6ep8C08PavgJS
         /VbnWQMb01jq/LdSFDNTaPucumkzM1y3TYH+bdBMF/0ychSAotrv9KQ7e2d1azwLiy6/
         TTBeoLKSyB86cRwc0zmS4FDrtBV69oveaNUEO6kW3wLWzML/giZCgWwwodGMm9BvBoRm
         WdL8a+5cwW/LdZFLsdqOYt0haotqG3ZqjXLzdOnTzbYh6xg89M4A75TS0CwS42y7UPxB
         qqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ZJr/xckbWzUBtxmV3MRFg0Mfek8+Ea5Ai66Ob6CkTM=;
        b=f7A5I10u+VqFpMHQ74yp3vaNeQMmBvwRPndyejvMdm25+jl0QU/eZ+LOO8kUVeWbFs
         HBpXzLRnXBLvE8G7GJObDs5qu98aXMCCP2qjTwDrjICg7o9JkGPpwtJWqnRj6DtPOmR3
         Q22/gXJ8ifucRreDe2JTatDyK9gFajVF96Of0z6MkjvZGG36SCb2+BLUppZ9Y8sXtfqT
         OgQWJDHjKAV6HsLf6bY3HPkXcXntyAdcnG8aU6CBZDuZy01tyBBmz29H/Hc9he0jJSJO
         Ab8EVDJ/CMhvASEJ0q4Zt9j080VFseX71JK8mFj2ZMWmAvVODVSZSYFniJAnYhQsThBR
         fV0Q==
X-Gm-Message-State: AOAM530SMt/1+KWC+DzSP2GzdVb0gLID1MFLtkMCUlcY0sAP0RLPQnrf
        TAsu2VekmSE2Ih7tNaMWrlo9gQ==
X-Google-Smtp-Source: ABdhPJzMsgOGA7YRIaOn2MfAm293oLnDZI8Sd81ueS9Uo1SexvZE1uCsqp4EHJPhjwJUxfqOLpATdA==
X-Received: by 2002:a02:cf30:: with SMTP id s16mr62027437jar.144.1609774811003;
        Mon, 04 Jan 2021 07:40:11 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id t18sm40523539ils.16.2021.01.04.07.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jan 2021 07:40:10 -0800 (PST)
Subject: Re: [PATCH 6/6] block: Add n64 cart driver
To:     Lauri Kasanen <cand@gmx.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, linux-block@vger.kernel.org
References: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <944dd5af-c5d0-b37c-29ca-0213ea6081db@kernel.dk>
Date:   Mon, 4 Jan 2021 08:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104155031.9b4e39ff48a6d7accc93461d@gmx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/4/21 6:50 AM, Lauri Kasanen wrote:
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  drivers/block/Kconfig   |   6 ++
>  drivers/block/Makefile  |   1 +
>  drivers/block/n64cart.c | 203 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 210 insertions(+)
>  create mode 100644 drivers/block/n64cart.c
> 
> block folks: rest of the series is on linux-mips. Being a
> mips-specific driver, not sure which tree it should go to.

It should definitely get reviewed first. One easy question - there's no
commit message in this one. It's a new driver, it should include some
documentation on what it is, etc.

-- 
Jens Axboe

