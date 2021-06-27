Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9C73B522B
	for <lists+linux-mips@lfdr.de>; Sun, 27 Jun 2021 07:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhF0FU3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 27 Jun 2021 01:20:29 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:34083 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229472AbhF0FU2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 27 Jun 2021 01:20:28 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id A133D58079F;
        Sun, 27 Jun 2021 01:18:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sun, 27 Jun 2021 01:18:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=G
        wO9YFcvq0p05jwynGkzc5BMfPPFWUI5rALwMlauuEw=; b=Yw7RWUYJ3xyfUlXsN
        1LD6kZWfY09nctzLxkZ+FL9DfnpOfquMcw8pfphWog+v3MqssQw8panEhZa+Vxi7
        AUr1VLfoYJThEKCya1a7n0daxYRQPQR73lMqv00LSHh07t/xfrXImA5Hjuo27HvX
        qpqQOv3WiSU62mnH8trLtrvQ2ri/9xb7ZBTUnQqQzyG7irU1tvQIQh1f19ePi+iG
        /lp11NhTnC9wca5C3wuZ58tre/xCREcd7p6NhXoAjnBRbTnuEF4LX9fb7gSio+XT
        2BQhPJ30T03b/LRpKaQLTSkRH8b453A0b9M+l3l7ShTElafFo5ixOWL8EXHexhKx
        432SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=GwO9YFcvq0p05jwynGkzc5BMfPPFWUI5rALwMlauu
        Ew=; b=YLbIOUbXLZc8AqFxAto8j2nVl2G2XqPzrYdxSxjejwDkfP5i1xpEBhkpq
        pF/2RlVS6Mf5GvSdAfU5MSnfai+iYRGtXSNT3hISzkDNbrPQaxHQ5236aC6kpyT6
        /uxNziQMhUC2H2lru/k3Z/4BOIsK0iFmvOIDntfej5kocRJm9afLvvze0XRWoxtq
        /eq4jerAC4AfkHhYQrJan7IRemJC90h0D0Y/6IkxLy58lfLwcwx81wcNT4pMuSCs
        EK4zqH5KRQRXd/YAKX4/rVkteaWiG5A8PEegB8lrAW7hv63QKVppdCbKxSdKaGma
        KMOzmFqMJ7KLi4PBpPJxGmOu1DAOA==
X-ME-Sender: <xms:CwrYYDMOT2sTktKm0aC02IhcXzXeN3Iy9ssRWkmTPRFXLVskaouyVA>
    <xme:CwrYYN_5ZFAgGOWh39fTTi-P94zdLACrqxI7BAFEp68HsGoXU_QR2P7KeZLj9nmiI
    yGbX7E2mJ4kB_hwyzQ>
X-ME-Received: <xmr:CwrYYCQWcaabpvPHMnqg5Jv8bn4gmfm_REPH9u5nYjDgCZy5beAtcn56qTvUdDlDnaEOLA_EQhHwzdIVIrCT3w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehuddgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:CwrYYHsxHl7xZJ4Ynn3UMgxpmKQ2bSFGC2E2-8KzSQmGot9T8ZT8Og>
    <xmx:CwrYYLdX97Zxjxt_Dw7abTEpnrpI9wnPDebZh83jdhfr8rUgalReYQ>
    <xmx:CwrYYD1fuS8X7tTSjfrUqmIgNFpI5GRh2paFbQOZh0Lca8DdSJVYLg>
    <xmx:DArYYP6m3sr-N0PUK88ENcRstBYAnVcmV8fnnJVS1eqLdx_EfHBxrg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Jun 2021 01:17:59 -0400 (EDT)
Subject: Re: [PATCH 9/9] MIPS: Make a alias for pistachio_defconfig
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20210627045631.2882-1-jiaxun.yang@flygoat.com>
 <20210627045631.2882-10-jiaxun.yang@flygoat.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1db3e2dd-5874-e1b2-d9b1-da08844edaeb@flygoat.com>
Date:   Sun, 27 Jun 2021 13:17:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210627045631.2882-10-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2021/6/27 ÏÂÎç12:56, Jiaxun Yang Ð´µÀ:
> For those who miss the old defconfig, make a alias to generic
> kernel.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/Makefile | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/mips/Makefile b/arch/mips/Makefile
> index 258234c35a09..9713f8d2fc99 100644
> --- a/arch/mips/Makefile
> +++ b/arch/mips/Makefile
> @@ -563,6 +563,9 @@ sead3micro_defconfig-y		:= micro32r2el_defconfig BOARDS=sead-3
>   legacy_defconfigs		+= xilfpga_defconfig
>   xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=xilfpga
>   
> +legacy_defconfigs		+= pistachio_defconfig
> +xilfpga_defconfig-y		:= 32r2el_defconfig BOARDS=marduk

oops... Typo...

Will fix in next reversion.

Thanks.


- Jiaxun

> +
>   .PHONY: $(legacy_defconfigs)
>   $(legacy_defconfigs):
>   	$(Q)$(MAKE) -f $(srctree)/Makefile $($@-y)
