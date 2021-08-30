Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF443FAFC9
	for <lists+linux-mips@lfdr.de>; Mon, 30 Aug 2021 04:32:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234947AbhH3CdM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Aug 2021 22:33:12 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41629 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234922AbhH3CdF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 29 Aug 2021 22:33:05 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 480C75C0085;
        Sun, 29 Aug 2021 22:32:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 29 Aug 2021 22:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=v
        3f6jPzzBipbSiu4aVjPCilgneHFN9knpU6Krm+kjSo=; b=tukNWEtaWbA8o+Fjz
        FoTU9WTAqtl2aDhMVPweMspb92x2AlreH5LSTg8iJN5YLfoIlDblsGUofdVYDvVz
        XauQMF0uRCc6kE+vTamf3BtXFze8AQw+XznflsYBM2ueCu/n2f0Bi+C6VLYCq/l2
        rDsOy7WHsGPRf/+mcInGiZo+cnAyIt4nVZy3XfN3EL3LevaK1A39cPaP5TgauLu9
        CBUfGGFLJq2e/BuuOEgcmGgOviuGds0tCuJE/G2fZpCrQrYYzn8UFvEjju6KwMiM
        0iiby2ffzWQKaAE56bJc07e9tl16j5kvj5ejmHyXIxaDkqUO1p7zoWfYwkdRGzGq
        WHR+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=v3f6jPzzBipbSiu4aVjPCilgneHFN9knpU6Krm+kj
        So=; b=mKgrGGxuRadgm9g6e3ZPiruUZ41o5lpZ+PtBW5zNm1ccFwPTBCFM2GYf3
        gk0cRqaKiH91FUhB48UQmPvIyovsAD9JAk1BOROjYgx9CqPRdIrMi6QDX7MASCxH
        4ha/OyaH5eyyiPWz6tPkkxw3kJhU7H7UoEKpCxt1WaebJXk6QVw8uk68vyus1AnJ
        6wffj5vSS7WNq+wt6vR+YTXBBaFg6HKURcaP2/yb+ZKoVOSOWsQhp27A1x/Y1jZx
        1jvh3sar4NYFCzm1cZHb+S3gry7TYpI/+1waZQP2rwNHJtBSChWR0+JTlwvHIREk
        iTmidX0fGY5PypyO40ibPrC3YCm4A==
X-ME-Sender: <xms:KkMsYVweyrwT_4P_TngacbzysJVsc7Rm1SbDZbGOEx3vEda4o3GBUQ>
    <xme:KkMsYVSxGwYM0Rl43ORSlKVhIIW8gIbc1HwfvW8h3y2VBOyn6g6yNYo8TkG9Wovv4
    sZ6eXK61Erf7BdVcgI>
X-ME-Received: <xmr:KkMsYfVQ7MOXlOG2TaMU4rCBKdvbnBuyhJ9qUGWctk67k8Im9gC5PNKQKLyRtxidMqi1wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddukedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:KkMsYXgCGhm53jNy0YZvA25HawSeYsyvMy2Hs-LIsJ0R2-KgMHLuaA>
    <xmx:KkMsYXChLqEmHfRc_ngn6828B-MXCTAUdTEO7YfyMR_wj2WJFkqC7g>
    <xmx:KkMsYQL5C_owCsno6-HreeUhsfysYungOrALSIRB48XktDvtoRLQmA>
    <xmx:K0MsYeO8JcyuQFYRrEUvyy4AxIlLv09793SxZX9j7LbZM68fMKWURA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 22:32:07 -0400 (EDT)
Subject: Re: [PATCH] mips: remove reference to "newer Loongson-3"
To:     Xi Ruoyao <xry111@mengyan1223.wang>, linux-mips@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>
References: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b32c0d64-77b2-d054-afcf-7d006eba3418@flygoat.com>
Date:   Mon, 30 Aug 2021 10:32:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <0b7c9431efb12c2d957fcc53ec8f0743725d61b3.camel@mengyan1223.wang>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


在 2021/8/29 20:49, Xi Ruoyao 写道:
> Newest Loongson-3 processors have moved to use LoongArch architecture.
> Sadly, the LL/SC issue is still existing on both latest Loongson-3
> processors using MIPS64 (Loongson-3A4000) and LoongArch
> (Loongson-3A5000).
LLSC is fixed on Loongson-3A4000 as per CPUCFG report.
>
> As it's very unlikely there will be new Loongson-3 processors using
> MIPS64, let's stop people from false hoping.
>
> Signed-off-by: Xi Ruoyao <xry111@mengyan1223.wang>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> ---
>
> Huacai: how's the status of LL/SC issue on Loongson-2K?  If
> the issue exists on it as well, we can just force
> CPU_LOONGSON3_WORKAROUNDS when CONFIG_CPU_LOONGSON64 and
> CONFIG_SMP are both selected.

Loongson-2K do need LLSC workaround, although the reason behind the 
workaround seems different...

Thanks.

- Jiaxun

>
>   arch/mips/Kconfig | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 6dfb27d531dd..ff5f344a371e 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -1433,19 +1433,14 @@ config LOONGSON3_ENHANCEMENT
>   	  new Loongson-3 machines only, please say 'Y' here.
>   
>   config CPU_LOONGSON3_WORKAROUNDS
> -	bool "Old Loongson-3 LLSC Workarounds"
> +	bool "Loongson-3 LLSC Workarounds"
>   	default y if SMP
>   	depends on CPU_LOONGSON64
>   	help
>   	  Loongson-3 processors have the llsc issues which require workarounds.
>   	  Without workarounds the system may hang unexpectedly.
>   
> -	  Newer Loongson-3 will fix these issues and no workarounds are needed.
> -	  The workarounds have no significant side effect on them but may
> -	  decrease the performance of the system so this option should be
> -	  disabled unless the kernel is intended to be run on old systems.
> -
> -	  If unsure, please say Y.
> +	  Say Y, unless you know what you are doing.
>   
>   config CPU_LOONGSON3_CPUCFG_EMULATION
>   	bool "Emulate the CPUCFG instruction on older Loongson cores"
