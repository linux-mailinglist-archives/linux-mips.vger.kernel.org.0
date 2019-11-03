Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8501CED20C
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2019 06:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfKCFf6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 Nov 2019 01:35:58 -0400
Received: from forward105j.mail.yandex.net ([5.45.198.248]:39283 "EHLO
        forward105j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726354AbfKCFf5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 Nov 2019 01:35:57 -0400
Received: from mxback10g.mail.yandex.net (mxback10g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:171])
        by forward105j.mail.yandex.net (Yandex) with ESMTP id 53AE4B20C4B;
        Sun,  3 Nov 2019 08:35:54 +0300 (MSK)
Received: from myt4-6a59ac13d093.qloud-c.yandex.net (myt4-6a59ac13d093.qloud-c.yandex.net [2a02:6b8:c12:88f:0:640:6a59:ac13])
        by mxback10g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id BFTFgKt6xX-Zr9OKuog;
        Sun, 03 Nov 2019 08:35:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1572759354;
        bh=uz3RinoGmSAAZqjwvGNNBaDKLmlaS6ynpF2IStaDqmo=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=gSFtrtzQxxZzbWE1iDhav+to8lFRHy0q5HkWXMUVFCL5CrXOuC70BF6JVUPmqXXQI
         4hRmBAW7tZ9fmgN37ppKYhoewUbrWPP/ZoAjgTIgUjC4ib7vxH0H+P7fsyykVrPdGr
         +bZvEFOJEWHb/qajqyNOeH+9xx/9pfjDV817SDwE=
Authentication-Results: mxback10g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by myt4-6a59ac13d093.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id ZRlKR69yq6-Zf0eFbJZ;
        Sun, 03 Nov 2019 08:35:51 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH 3/3] MIPS: Loongson: Unify LOONGSON3/LOONGSON64 Kconfig
 usage
To:     Huacai Chen <chenhc@lemote.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
 <1572758417-29265-3-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <73a53fb5-541b-24f0-8fba-fff4f3a4726e@flygoat.com>
Date:   Sun, 3 Nov 2019 13:35:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572758417-29265-3-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2019/11/3 ÏÂÎç1:20, Huacai Chen Ð´µÀ:
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

Thanks!
I'll obey your rules.
--
Jiaxun Yang
