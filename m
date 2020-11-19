Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE8512B8CD3
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 09:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgKSIHE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 03:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgKSIHE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 Nov 2020 03:07:04 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C048AC0613CF;
        Thu, 19 Nov 2020 00:07:03 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id j205so6908814lfj.6;
        Thu, 19 Nov 2020 00:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i0Uvuo4ZZwtLj0tXgSraTgdiQBCevqY5PW/cTrwUo3Y=;
        b=pJYqdZ6LUPbpyLdno+xs9ExICrOgkzhUeQ4EKm9lr33RwNmmrucCESkiuMVo6rncy5
         HBnBx22PoUnJRbVRYZPNT9Ia+KDLxL5ZD1yd2tNbQxb7g+H3qLpFv3XhUl5H7CSUpDUv
         Vn9R8A3OBhxwP5rsJ4/p+GNOjdz6Olt8pyVI0Bq+nHlVMErB8pnOZza/sD8U0/TDtOEm
         Ow3rQvUV3iz8RG15SR26qfOhENL/lIi+yzD61fxcdbFa/pBSXsJJPCVUkgDbQ1q2t+14
         Wc7sEX7rWP+ZPQUslbzqxlUuS3jgoApd139W62WfSa1seWLG7wFLIl2o1s7eTlnYJtfk
         rDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=i0Uvuo4ZZwtLj0tXgSraTgdiQBCevqY5PW/cTrwUo3Y=;
        b=Bwprz1RMh0oDv/1wqXmFErbRgSTW6u5N+zPujZxJpL+jbHJP69gUlYOGtFLqK0X6IA
         ecduMjb+foG6QI18wbq0vNvNbkI1LDe+lEWZxnGU1dVyPOdloo0e7GmCbChDQEwtgUGM
         4rkPA0jok36DuNM2RtvP83qck0bTTOCfDYOAmAPBYDSdzqfx78L/O/KviSe8c9oskEY3
         lQFMmT7o3vOMTj+PMLipudw0rn0Qj10nCzenw9mM6iCc36CUBohFiSSKvtX/HOb7Edck
         8t+R8QPM7ZMOWcqdw2FOFp/o19CtqiOh/YuzAZrr2wmk2211Ay8MMywyISYDg5kA6SyJ
         BfXQ==
X-Gm-Message-State: AOAM531HBf70gVHpaIUn924pJPesQAvQWvynxLgMzsJzFTE8yNuCGKAT
        RWj29cizef5E7RGpp/sddNRjNBqLooo1kg==
X-Google-Smtp-Source: ABdhPJyO0H4ENpZfnxI+KGEBiG1PPNDJ2BXmglPQB4mlH7OxdjKUqsNRtIRtoXl35FnQd8tSlM8kBA==
X-Received: by 2002:a19:7fcd:: with SMTP id a196mr5163876lfd.53.1605773222132;
        Thu, 19 Nov 2020 00:07:02 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:62c:2324:60ee:b7a6:d497:437c? ([2a00:1fa0:62c:2324:60ee:b7a6:d497:437c])
        by smtp.gmail.com with ESMTPSA id z131sm1419317lfc.56.2020.11.19.00.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2020 00:07:01 -0800 (PST)
Subject: Re: [PATCH 3/3] MIPS: KASLR: Make relocation_address can be
 configured
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1605752954-10368-1-git-send-email-hejinyang@loongson.cn>
 <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <7e6d428d-cf5d-e2ac-93fa-4996adc2defe@gmail.com>
Date:   Thu, 19 Nov 2020 11:06:51 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <1605752954-10368-3-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 19.11.2020 5:29, Jinyang He wrote:

> When CONFIG_RANDOMIZE_BASE is not set, determine_relocation_address()
> always returns a constant. It is not friendly to users if the address
> cannot be used. Make it can be configured at Kconfig.

    Make it configurable?

> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
[...]

MBR, Sergei
