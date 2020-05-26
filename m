Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E01F1E22E3
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgEZN0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 09:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgEZN0H (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 09:26:07 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF01C03E96D
        for <linux-mips@vger.kernel.org>; Tue, 26 May 2020 06:26:03 -0700 (PDT)
Received: from halation.net.flygoat.com (unknown [IPv6:240e:390:49e:d1a0::d68])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 7A7C0205AA;
        Tue, 26 May 2020 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590499562; bh=APv2p10Or7U0Xsa9BZ4LPWCBIXPTVv3dOq6acP2s4QU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=RUT1OK1PCk/2HOlYPgP4aSia3cwlC24F2cl102e/0C9mk7FMYstAfXXP0cyCz0+aO
         m6lKy+g0F3hWDCShSa5GYzsk4R8PEo9EgF7sgDi3kAbrw0nrxf3f7lHmSM6oEKYIg4
         /bPZ1xj0o+a9vXyHIiMT30syQMDVd4950o3+eaid9icsG2mjxHUutzuKItavkkNl//
         qQg9ErjOeMEARpdLtyFGY4aKqD80LCG1x+nIVjSq69ZrQevRXopWJSvFviKXTaL+Sj
         f1dc8Cw32xKlXPr49ghdO1Bq0AmTpAVj8WwqMwPNEDhMw/qTZzfu4ejPYP+SoSJ2zr
         3E6+estsTO2Fg==
Date:   Tue, 26 May 2020 21:25:44 +0800
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     Lichao Liu <liulichao@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Max Filippov <jcmvbkbc@gmail.com>, yuanjunqing@loongson.cn,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: CPU_LOONGSON2EF need software to maintain cache
 consistency
Message-ID: <20200526212544.1737411f@halation.net.flygoat.com>
In-Reply-To: <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
References: <20200526111438.3788-1-liulichao@loongson.cn>
        <20200526193859.0adaea3b@halation.net.flygoat.com>
        <e9c015c2-b979-27c8-5f43-7af8d43174c5@loongson.cn>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 26 May 2020 20:40:28 +0800
Lichao Liu <liulichao@loongson.cn> wrote:

> On 2020/5/26 =E4=B8=8B=E5=8D=887:38, Jiaxun Yang wrote:
> > On Tue, 26 May 2020 19:14:38 +0800
> > Lichao Liu <liulichao@loongson.cn> wrote:
> > =20
> >> CPU_LOONGSON2EF need software to maintain cache consistency,
> >> so modify the 'cpu_needs_post_dma_flush' function to return true
> >> when the cpu type is CPU_LOONGSON2EF. =20
> >
> > Hi Lichao,
> >
> > I don't think that's required for Loongson-2EF,
> >
> > According to the comment in code:
> >
> > The affected CPUs below in 'cpu_needs_post_dma_flush()' can
> > speculatively
> > fill random cachelines with stale data at any time, requiring an
> > extra flush post-DMA.
> >
> > And according to my understanding that's not going to happen on
> > Loongson-2EF. We're always allocating coherent DMA memory in
> > uncached range, Loongson-2EF's writeback policy will ensure it
> > won't writeback random lines to the memory but only modified dirty
> > lines.
> >
> > We've been fine without post flush for almost 10 years, there is no
> > stability issue revealed.
> >
> > Btw: Please keep me CCed for Loongson-2EF patches. I'm not very
> > active on 2EF development but I'll still review patches.
> >
> > Thanks.
> > =20
> Hi Jiaxun,
>=20
> Loongson-2EF need software maintain cache consistency, So when using=20
> streaming DMA, software needs to maintain consistency.
>=20
> dma_map_single() is correct, but dma_unmap_single is wrong.=20
>=20
> The function call path:
> 'dma_unmap_single->dma_unmap_page_attrs->dma_direct_unmap_page->
>  dma_direct_sync_single_for_cpu->arch_sync_dma_for_cpu->
>  cpu_needs_post_dma_flush'
>=20
> In current version, 'cpu_needs_post_dma_flush' will return false=20
> at Loongon-2EF platform, and dma_unmap_single will not invalidate
> cache, driver may access wrong dma data.
>=20
> I don't know what's the exact meaning of "fill random cachelines with=20
> stale data at any time". I always think 'cpu_needs_post_dma_flush()'=20
> means whether this platform needs software to maintain cache
> consistency.
>=20
> I found this problem in 4.19.90 kernel's ethernet driver,=20
> and this patch can fix this problem.


Which machine with which ethernet card?

My Fuloong 2F is still serving as printer server and looks like there
is no stability issue.

Thanks.
--
Jiaxun Yang

