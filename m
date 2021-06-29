Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037413B6CE7
	for <lists+linux-mips@lfdr.de>; Tue, 29 Jun 2021 05:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhF2DTB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 23:19:01 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:37975 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231680AbhF2DTB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 28 Jun 2021 23:19:01 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id EBB67320055E;
        Mon, 28 Jun 2021 23:16:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 28 Jun 2021 23:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=Z
        fgomsCwSdXKWwwi7g0uGoQSdn0Bmm4UCRHcNvw8Zno=; b=i0pogZ+rupFDeYeJ2
        6KW9JrFMeSmfDtz7iGBoOJVJVKL53bzqlnbuoSOuuSio43fC3NEA8jQlB4ZJowdv
        rSbe0Wm1CQjZo0kM11Kr4xx4IMDNwVOfQTjSPCHoXTxmUFc/1bB0CaP76dQZIiz8
        scDj3+EKEGsnRsaaTl8FEJa6F/gPdsV06l0Mb5+HL8MorRdML8bwrDUT2n/weFaB
        GaJFWVMfuVEXjAL/BCVWLZaWj4ihEW9ynDVzP9ZDXILa6Yj9kDVdjklprirNTLb9
        OF5MGnb2PPsT4oIVTHf6CxTo11dHgQGabOyhzDspudVjE4t8uTJ80cR2UQoziBTl
        ZiI1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ZfgomsCwSdXKWwwi7g0uGoQSdn0Bmm4UCRHcNvw8Z
        no=; b=XcrJ+sHvOlwjW02cLhkKDDyyOMuLGMn44c87Gpt+ViILgqRwgasqaGn8v
        FzKGNUdVLHoyt97VNvywG22WZgT5SVzF/62WcK2JSzqFDEds811NcaEvpGER02bq
        o1igNs4w5730qHiIOqfTTkJBb4V+c2qE0+ybjk+Wf2HaUq8WMAwLzPm/l5ZcuwOC
        D34bArkMW8DV9fLJzzOd1sBoJEnLzEfAqqQoTWYCdSNKj+tpT+7mpDQGIcv3t4qm
        6CoP4mjCGzWQnTKQiu6jz4pE2WVku2eGeUZIyQFD3nfeTKJ3EX/iBkTFQs4azU/q
        wXVmrE5kUn4lZ/gqtjg37MOsHZ0OQ==
X-ME-Sender: <xms:kJDaYMQznc_xThJ8Qbi51SW8bCaYvlEkdACmmOBYhiI_Bsz-smMfVQ>
    <xme:kJDaYJw-F5sT6a0WK12ULMwpLu1g7SKftZ0HMVQT0kMmhnOC7GhTLp3JxAmTA0tpr
    wkD9iR4gGVNTYbiE2U>
X-ME-Received: <xmr:kJDaYJ0oVuJbwVYsii8tqlCDW4OxQClHd9IbIt7u5AnQKfi80uFQlUzG75HW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehhedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:kJDaYADFy6JNgKy5uZasxgFRcPMemqL3EbdgYjaClmsvDF4qpkdCRg>
    <xmx:kJDaYFilBDzlkHmzOEa9399BJLgDBtTc_-hHWJUz60EMx5nhq3_YbQ>
    <xmx:kJDaYMoSjvhRWsQEbOA4FwtpS5k-4_DSPWLJoe8KuKtUdyEBG3SG7A>
    <xmx:kZDaYDYmqMpNWFCDfyi8RYiE29CRAe7w9sjoHGlivgHkS0EjrSfYKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 23:16:29 -0400 (EDT)
Subject: Re: [PATCH v5 2/2] MIPS: Loongson64: Add pm block node for
 Loongson-2K1000
To:     Qing Zhang <zhangqing@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210629011913.18611-1-zhangqing@loongson.cn>
 <20210629011913.18611-2-zhangqing@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <df075ce1-0b85-e032-24d5-b028447b64ea@flygoat.com>
Date:   Tue, 29 Jun 2021 11:16:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629011913.18611-2-zhangqing@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/6/29 ÉÏÎç9:19, Qing Zhang Ð´µÀ:
> The module is now supported, enable it.
>
> Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
> ---
>
> v4-v5:
> add missing spaces
>
>   arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 569e814def83..38bf14f00694 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -101,6 +101,16 @@ uart0: serial@1fe00000 {
>   			no-loopback-test;
>   		};
>   
> +		pm: power-controller {
^ power-management@1fe0700c
> +			device_type = "power management";
^ Why do you need to specify device type?
> +			compatible = "loongson, reset-controller";
^ why space?
I guess it should be loongson,ls2k-pm...

- Jiaxun
> +
> +			reg = <0 0x1fe0700c 0 0x8>,
> +			      <0 0x1fe07014 0 0x8>,
> +			      <0 0x1fe07030 0 0x8>;
> +			reg-names = "pm1_sts", "pm1_cnt", "rst_cnt";
^ I guess there is no need to specify three reg names, you can simply 
tell driver 0x1fe07000
base address and calculate them on your own.

Thanks.

- Jiaxun
> +		};
> +
>   		pci@1a000000 {
>   			compatible = "loongson,ls2k-pci";
>   			device_type = "pci";

