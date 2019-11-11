Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13056F8088
	for <lists+linux-mips@lfdr.de>; Mon, 11 Nov 2019 20:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfKKTvl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Nov 2019 14:51:41 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40784 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727616AbfKKTvk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Nov 2019 14:51:40 -0500
Received: by mail-pg1-f194.google.com with SMTP id 15so10090927pgt.7
        for <linux-mips@vger.kernel.org>; Mon, 11 Nov 2019 11:51:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:cc:cc:subject
         :references:in-reply-to;
        bh=XaMa2FjuLSt2tNKYqOG+0isPiscHwTZGf6Ipan1nCuc=;
        b=PuQz7khFurFAkS2jdKNfC5Lu9dwoNGTETnAu5pFP7F6pGelavMBoqONUOu8WrSe4AF
         cnoLimM42cjuBcdIfGXwv9m7Y3ibQJmgBCUuQjUAjEJ6KL337D0YgK8b2EDZsN0lQ4bl
         0nveaSHqLJR/mC0KW0WGa2JDW32jrHQcVxX9X9+ZETQ91rAObxjz3+/qIr7SmsRzJkm3
         43t4vkdfyYAlj2NCIjt9CPkysZ5l9UEZpJVrwmZkmRVdpuFDTXY1lQzS4zYC+UEVrNci
         IDQqp/jZT8zkKCgTjqmTn7OQXZ8Cu5gZJjx7PBKnJ1tvJPUVMVYIgvz1FRcJhIU8Huhu
         9dzg==
X-Gm-Message-State: APjAAAXn1LmxGj3Sn0S1walIsx977/LBp1luzCweWipkzph03aoucS/d
        Bdx/lyJLnoXo99uaWC/7jy4lbdicHfzUMw==
X-Google-Smtp-Source: APXvYqzcAzdQzgTr3L7G6WagKRU1+7qGIDUvqFljZDOuqW30GK1TCnY25ZjEoqnaxJ0uTtfawpjAbA==
X-Received: by 2002:a62:38d8:: with SMTP id f207mr4143205pfa.209.1573501899867;
        Mon, 11 Nov 2019 11:51:39 -0800 (PST)
Received: from localhost (MIPS-TECHNO.ear1.SanJose1.Level3.net. [4.15.122.74])
        by smtp.gmail.com with ESMTPSA id h3sm211362pji.16.2019.11.11.11.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 11:51:39 -0800 (PST)
Message-ID: <5dc9bbcb.1c69fb81.961d9.1996@mx.google.com>
Date:   Mon, 11 Nov 2019 11:51:38 -0800
From:   Paul Burton <paulburton@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
CC:     paulburton@kernel.org, chenhe@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
CC:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 0/5] Loongson cleanups
References:  <20191107040118.10685-1-jiaxun.yang@flygoat.com>
In-Reply-To:  <20191107040118.10685-1-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello,

Jiaxun Yang wrote:
> Hi all,
> This series reduced duplicated code in Loongson platform.
> 
> 
> 
> Jiaxun Yang (5):
>   MIPS: Drop pmon.h
>   MIPS: Loongson{2ef, 32, 64} convert to generic fw cmdline
>   MIPS: Drop CPU_SUPPORTS_UNCACHED_ACCELERATED
>   MIPS: Loongson2ef: Convert to early_printk_8250
>   MIPS: Loongson64: Drop setup_pcimap
> 
>  arch/mips/Kconfig                             |  3 -
>  .../include/asm/mach-loongson2ef/loongson.h   |  2 -

Series applied to mips-next.

> MIPS: Drop pmon.h
>   commit 28e6b875fdbb
>   https://git.kernel.org/mips/c/28e6b875fdbb
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Loongson{2ef, 32, 64} convert to generic fw cmdline
>   commit 75cac781dca4
>   https://git.kernel.org/mips/c/75cac781dca4
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Drop CPU_SUPPORTS_UNCACHED_ACCELERATED
>   commit 2a5984360b01
>   https://git.kernel.org/mips/c/2a5984360b01
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Loongson2ef: Convert to early_printk_8250
>   commit 574b9a04abfc
>   https://git.kernel.org/mips/c/574b9a04abfc
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>
> 
> MIPS: Loongson64: Drop setup_pcimap
>   commit 53949e0a65b7
>   https://git.kernel.org/mips/c/53949e0a65b7
>   
>   Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>   Signed-off-by: Paul Burton <paulburton@kernel.org>

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paulburton@kernel.org to report it. ]
