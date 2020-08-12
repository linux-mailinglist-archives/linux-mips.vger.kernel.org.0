Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F3424274C
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 11:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgHLJPn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 05:15:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgHLJPm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 05:15:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09322C06174A;
        Wed, 12 Aug 2020 02:15:42 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id t23so1433820ljc.3;
        Wed, 12 Aug 2020 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/3bbT+znQtvhBvyL05XoYG/sT1t/szYIcY75YFFqv74=;
        b=t2wsHSUquV599ok7d7bCW6Ei5aL5mUDcxse9EkUaWZA6DDac8xIGsia/1RrFy0M6e0
         tuM/DI8zi7D5/OgIcr6nEWZmVIb/SL2T3+h+ZOL3y5eSUTF9c1ZajUu1KH/kQxiLErog
         fpjVPHqL4svpzM2QMPUs4qkbdAL/G4jBoi+c1ago8RYhyCE6PoUgiXyspAaqMmkIE5zb
         EwinRv2r5DUdKlAdgWqZHUOliL23wWQ9s3TFSd97ec9j4uVQero1R7FxBsuvJja9NQRG
         aFSpaaeMkniSdabQ5iYDw/Bn7ftlzGmp3MO38deO9etGxCI6DdS6X1EXesV3txXmQkC4
         2fTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/3bbT+znQtvhBvyL05XoYG/sT1t/szYIcY75YFFqv74=;
        b=kFYurdZaIoOi7b33LxIzmeNxk0nyJUfztOfMHW3hQAhdzKuCBA8xBPog7Y2AIw+x2b
         LMVudNSeEy62+6ornsQ6d/tIQrhTT5pMM8fG6unwz9U5HA/KOx+c6z6TfgmJRytWR7G8
         UrexeOB1oZWSQj7uDiK68LJrlBIsGiqQL/3Nr6PJKptyO7YZmi0mEb9Rl4jrvqv6iOAw
         px+tA9q4XT4E9ZbB24E4Rlm/zdty8KlZELrbeNpr1hSQ8gC2xZkCW0VB+mcD4o66MWZu
         IDug4pgexuMZX3N5+1zDAFpq0Mg4+zSjDup3plY9u+P2znAhTiAdIcDsPIvIXltkNxzW
         2W8g==
X-Gm-Message-State: AOAM532SC6dUjgwu1v1MMrUzPTpD/6j/UD5966IdSMzdjfRt1F8iz5S2
        HVgKTq1nBTqbtFdKeObfwd/Evw8NCSo=
X-Google-Smtp-Source: ABdhPJzEnrexISBTxARVq2yOEqceqeSZvwAJY9hy/o23qvF9pO4LaoPbBKSxndRFqx54Qsam925pgA==
X-Received: by 2002:a2e:a16f:: with SMTP id u15mr5210687ljl.5.1597223740380;
        Wed, 12 Aug 2020 02:15:40 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:41b:98d0:14d2:8cca:fcf5:be6? ([2a00:1fa0:41b:98d0:14d2:8cca:fcf5:be6])
        by smtp.gmail.com with ESMTPSA id e25sm310460ljp.47.2020.08.12.02.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 02:15:39 -0700 (PDT)
Subject: Re: [PATCH v2 07/13] MIPS: generic: Support booting with built-in or
 appended DTB
To:     Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200812001510.460382-1-paul@crapouillou.net>
 <20200812001510.460382-8-paul@crapouillou.net>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <1380509b-6479-3f1b-9e5b-7eb14f7ab158@gmail.com>
Date:   Wed, 12 Aug 2020 12:15:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812001510.460382-8-paul@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 12.08.2020 3:15, Paul Cercueil wrote:

> The plat_get_fdt() checked that the kernel was booted using UHI before
> reading the 'fw_passed_dtb' variable. However, this variable is also set
> when the kernel has been appended, or when it has been built into the

    s/kernel/DT/?

> kernel.
> 
> Support these usecases by removing the UHI check.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[...]

MBR, Sergei
