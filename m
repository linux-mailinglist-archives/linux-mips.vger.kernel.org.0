Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46EBCA488F
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 11:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfIAJU5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 05:20:57 -0400
Received: from forward104p.mail.yandex.net ([77.88.28.107]:35586 "EHLO
        forward104p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726631AbfIAJU5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 05:20:57 -0400
Received: from mxback6o.mail.yandex.net (mxback6o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::20])
        by forward104p.mail.yandex.net (Yandex) with ESMTP id E6F924B0012D;
        Sun,  1 Sep 2019 12:20:53 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback6o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id FyIWLazL5B-KqlWCq8O;
        Sun, 01 Sep 2019 12:20:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567329653;
        bh=+dQUWzvOoq4qGSjlURDh4Sb6fIMM0OpqQnF9bdhPSO4=;
        h=In-Reply-To:From:To:Subject:Cc:Date:References:Message-ID;
        b=OdmDzG4hP2t4GcctD1B1r+QABiwblbFKerYt/EzHqy9e1J55dY7DwT6x6tZPdhoIt
         E4bEvdL0YRRGhuoW7tdrPT1pO+lUt1MjPCWVL0Q8dFH7EppNKy+EhRzI4MhgLvLNnh
         adZ/+mG8txfcd6LSCw18zTsyX+PEJtulPdoQoy9g=
Authentication-Results: mxback6o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id kg80VAixx4-KhnaaP0h;
        Sun, 01 Sep 2019 12:20:50 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
Subject: Re: [PATCH] MIPS: Add syscall auditing support
To:     Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@linux-mips.org, linux-mips@vger.kernel.org,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>
References: <1549454480-8962-1-git-send-email-chenhc@lemote.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <0be2db69-6f36-69f7-4f66-ace4c76149f4@flygoat.com>
Date:   Sun, 1 Sep 2019 17:20:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1549454480-8962-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


On 2019/2/6 下午8:01, Huacai Chen wrote:
> From: Ralf Baechle <ralf@linux-mips.org>
>
> The original patch is from Ralf. I have maintained it for more than six
> years on Loongson platform, and it works perfectly. Most of the commit
> messages are written by Ralf.
>
> MIPS doesn't quite fit into the existing pattern of other architectures
> and I'd appreciate your comments and maybe even an Acked-by.
>
>   - Linux on MIPS extends the traditional syscall table used by older UNIX
>     implementations.  This is why 32-bit Linux syscalls are starting from
>     4000; the native 64-bit syscalls start from 5000 and the N32 compat ABI
>     from 6000.  The existing syscall bitmap is only large enough for at most
>     2048 syscalls, so I had to increase AUDIT_BITMASK_SIZE to 256 which
>     provides enough space for 8192 syscalls.  Because include/uapi/linux/
>     audit.h and AUDIT_BITMASK_SIZE are exported to userspace I've used an
>     #ifdef __mips__ for this.
>
>   - The code treats the little endian MIPS architecture as separate from
>     big endian.  Combined with the 3 ABIs that's 6 combinations.  I tried
>     to sort of follow the example set by ARM which explicitly lists the
>     (rare) big endian architecture variant - but it doesn't seem to very
>     useful so I wonder if this could be squashed to just the three ABIs
>     without consideration of endianess?
>
> Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Any update about this patch?

Thanks.

--

Jiaxun Yang

