Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C7431C25F9
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 15:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgEBN7e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 09:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgEBN7e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 09:59:34 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63434C061A0C
        for <linux-mips@vger.kernel.org>; Sat,  2 May 2020 06:59:34 -0700 (PDT)
Received: from flygoat-x1e (unknown [IPv6:240e:390:498:7d0::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 3934020CFE;
        Sat,  2 May 2020 13:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588427971; bh=C++rOYLfGVs6VhkAm45S41iLD2tp6Bqa8htmFmBjLDM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pDKKzVmf0G051Ry9YsatMqHrVgKPW5OZOJRmLBOQVnhWRm6XZ8FqpPjmKOe9zU9YX
         E5n6h2D6HeukVUgpnAACwL3Zan4jEQrPSl9sxk4GJpmQZeddx38QUG+kWCbzaKyDAa
         nHmahtr8kO7a6fEcriLcMFFKcLBGC98WBqPTCZ0Oox23e/LQitLRVdId8tskZPDY68
         0M7Q8JiMDyysfPscHhhzGnDqI9YFPruFgFv4+7LJgd1GSL/T4IsG9iNs0/JfnnTwgQ
         iXYaxiINskPFPvm0bHh8R49V0aRaZQjYhQvUConQgalJRA7kiuj3Oy5aBoJnXhWR1N
         LWoNKx/CPfe2w==
Date:   Sat, 2 May 2020 21:59:19 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     WANG Xuerui <git@xen0n.name>
Cc:     linux-mips@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH 4/4] MIPS: emulate CPUCFG instruction on older
 Loongson64 cores
Message-ID: <20200502215919.3bb50668@flygoat-x1e>
In-Reply-To: <20200502133846.40590-5-git@xen0n.name>
References: <20200502133846.40590-1-git@xen0n.name>
        <20200502133846.40590-5-git@xen0n.name>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat,  2 May 2020 21:38:46 +0800
WANG Xuerui <git@xen0n.name> wrote:

> CPUCFG is the instruction for querying processor characteristics on
> newer Loongson processors, much like CPUID of x86. Since the
> instruction is supposedly designed to provide a unified way to do
> feature detection (without having to, for example, parse
> /proc/cpuinfo which is too heavyweight), it is important to provide
> compatibility for older cores without native support. Fortunately,
> most of the fields can be synthesized without changes to semantics.
> Performance is not really big a concern, because feature detection
> logic is not expected to be invoked very often in typical userland
> applications.
> 
> The instruction can't be emulated on LOONGSON_2EF cores, according to
> FlyGoat's experiments. Because the LWC2 opcode is assigned to other
> valid instructions on 2E and 2F, no RI exception is raised for us to
> intercept. So compatibility is only extended back furthest to
> Loongson-3A1000. Loongson-2K is covered too, as it is basically a
> remix of various blocks from the 3A/3B models from a kernel
> perspective.
> 
> This is lightly based on Loongson's work on their Linux 3.10 fork, for
> being the authority on the right feature flags to fill in, where
> things aren't otherwise discoverable.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Huacai Chen <chenhc@lemote.com>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com> # Loongson-2K, 3B1500

Thanks for providing me early access of this series so I can perform
reviewing and testing before you posting to the list.

And welcome!

--
Jiaxun Yang

[...]
