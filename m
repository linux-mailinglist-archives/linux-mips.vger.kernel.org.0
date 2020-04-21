Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C141B1D46
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 06:10:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726021AbgDUEKc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 00:10:32 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59152 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgDUEKc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Apr 2020 00:10:32 -0400
Received: from flygoat-x1e (unknown [IPv6:240e:390:49b:be80::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 7B2FD20497;
        Tue, 21 Apr 2020 04:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587442232; bh=/pKgjWM3FrZR5KqmTx4U2F1vnDuxyBPB/pGTc3sTOew=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=ewwmtMrBm2ukBdV9s2jZWsfIaUDD+1cu3gbVqdrfGkiL/Ob/AfqY60U2ZeUKaLfHB
         SzRQuieoZtd3HUUvzanoRlHHADEaBAcD/RSVfk/wa2j9HCaMuO937gGCYxC/irvhvK
         YR6X72fWdLZv4Fw7m0YSsjnuqHU/aZUb4bWedq89TOIL8Q5E0GqubEbsFAvBBrIibk
         dQUXcu1SZT1YMNpy8Jxt0ceFczhMdx3s8E/l3reZq3wDtRa5/7RpCJYRoYr6e6ZnTt
         T1/CK0rc8/JqFX+TKaFcjn+N6yX8Ibn+t8ect3XshH1OVHs7h6l7y3etcQ7ggUYDHT
         1hCXMAhOtWMrw==
Date:   Tue, 21 Apr 2020 12:10:16 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Huacai Chen <chenhc@lemote.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Pei Huang <huangpei@loongson.cn>,
        Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
Subject: Re: [PATCH 3/3] MIPS: Loongson-3: Add some unaligned instructions
 emulation
Message-ID: <20200421121016.6294777e@flygoat-x1e>
In-Reply-To: <1586497440-25621-3-git-send-email-chenhc@lemote.com>
References: <1586497440-25621-1-git-send-email-chenhc@lemote.com>
        <1586497440-25621-3-git-send-email-chenhc@lemote.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 10 Apr 2020 13:44:00 +0800
Huacai Chen <chenhc@lemote.com> wrote:

> 1, Add unaligned gslq, gssq, gslqc1, gssqc1 emulation;
> 2, Add unaligned gsl{h, w, d}x, gss{h, w, d}x emulation;
> 3, Add unaligned gslwxc1, gsswxc1, gsldxc1, gssdxc1 emulation.
> 
> Signed-off-by: Pei Huang <huangpei@loongson.cn>
> Signed-off-by: Shuangshuang Zhang <zhangshuangshuang@loongson.cn>
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

LGTM.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!
[...]
--
Jiaxun Yang


