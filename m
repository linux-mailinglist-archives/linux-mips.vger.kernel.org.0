Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBCFF5E17
	for <lists+linux-mips@lfdr.de>; Sat,  9 Nov 2019 09:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfKIIjd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Nov 2019 03:39:33 -0500
Received: from forward103p.mail.yandex.net ([77.88.28.106]:35477 "EHLO
        forward103p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726136AbfKIIjd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Nov 2019 03:39:33 -0500
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
        by forward103p.mail.yandex.net (Yandex) with ESMTP id F0E8D18C1993;
        Sat,  9 Nov 2019 11:39:30 +0300 (MSK)
Received: from mxback12q.mail.yandex.net (mxback12q.mail.yandex.net [IPv6:2a02:6b8:c0e:1b3:0:640:3818:d096])
        by forward102q.mail.yandex.net (Yandex) with ESMTP id EB3C07F20016;
        Sat,  9 Nov 2019 11:39:30 +0300 (MSK)
Received: from vla5-b45cc32a2812.qloud-c.yandex.net (vla5-b45cc32a2812.qloud-c.yandex.net [2a02:6b8:c18:3508:0:640:b45c:c32a])
        by mxback12q.mail.yandex.net (mxback/Yandex) with ESMTP id 4PpOHksn4J-dUvivaKX;
        Sat, 09 Nov 2019 11:39:30 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1573288770;
        bh=/vVsB69BCB7Xa9e7UKmSDmMWYOxu0m7iUYqaNUJ3Vek=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=qElQqevgXykAs5Jf1fUFSMJccNbnIc9puZitGQTLQqskJ6jVARy+Hjm7WvYXB5Kpg
         dvfvTyPFHCsbN7oO/QcubMWAktapaf/qegp/D1tM5xI/Kgp2X/rgFn1OdC7eiQ47dv
         Oeh+dub7TNw0rR/tWA+3XZFqhk9KxImyBHEfhamo=
Authentication-Results: mxback12q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla5-b45cc32a2812.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id WdwEYhbn1u-dMVmp0sH;
        Sat, 09 Nov 2019 11:39:29 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH V2 2/2] MIPS: Loongson: Unify LOONGSON3/LOONGSON64 Kconfig
 usage
To:     Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1572847881-21712-1-git-send-email-chenhc@lemote.com>
 <1572847881-21712-2-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d75e4fb1-7d24-4b4b-7f59-6a9cbb63316a@flygoat.com>
Date:   Sat, 9 Nov 2019 16:39:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572847881-21712-2-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2019/11/4 ÏÂÎç2:11, Huacai Chen Ð´µÀ:
> There are mixed LOONGSON3/LOONGSON64 usages in recently changes, let's
> establish some rules:
> 
> 1, In Kconfig symbols, we only use CPU_LOONGSON64, MACH_LOONGSON64 and
> SYS_HAS_CPU_LOONGSON64, all other derived symbols use "LOONGSON3" since
> they all not widely-used symbols and sometimes not suitable for all
> 64-bit Loongson processors. E.g., we use symbols LOONGSON3_ENHANCEMENT,
> CPU_LOONGSON3_WORKAROUNDS, etc.
> 
> 2, Hide GSx64/GSx64E in Kconfig title since it is not useful for
> general users. However, in the full description we use a more detailed
> manner. E.g., GS264/GS464/GS464E/GS464V.
> 
> All Kconfig titles and descriptions of Loongson processors and machines
> have also been updated in this patch for consistency.
> 
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
> ---Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks,
I'll obey the rule you established.

--
Jiaxun Yang
