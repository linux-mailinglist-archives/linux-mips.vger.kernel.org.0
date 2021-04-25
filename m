Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C991136A6B9
	for <lists+linux-mips@lfdr.de>; Sun, 25 Apr 2021 12:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhDYKkY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Apr 2021 06:40:24 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:52857 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229466AbhDYKkX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Apr 2021 06:40:23 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id C5FC714E2;
        Sun, 25 Apr 2021 06:39:42 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Sun, 25 Apr 2021 06:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=XoLG+aIFDcgO90G6lE25YWBzpmWK/3l
        +t91ve9Q4KX4=; b=ikyRl9eulf1qr1qyOGRAubwZCS5+ndJyQXTExuVp4v4VN/6
        E67mYf/wMF18RZ/a527+TlQkuYFtHzoAncKWNVPL1aFIBeL8omCjjY7s2mxXNqD/
        92nQPbUnUGJmls52B4AgV+tBJ/yq1afG8hF0iAXEyx2boTWb6HSt+768LwADJQnm
        MxF1o/sByOU1KuU5ZoVXfw+q2UXqKrViNgUj0MVsg7Zs7CjCVhmXEzGUL/pSIAfu
        wpnAnIYn5vBoQ0lLp0C4zpJBygTMU4gxMtOI+sGGzEznQ40F4j9VejLFF6e29VWh
        Mgg18f/UuqzEhSPPY5espI15hlzANSF1Ra7bCow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XoLG+a
        IFDcgO90G6lE25YWBzpmWK/3l+t91ve9Q4KX4=; b=Dx9fYcxegZ32Iquv3WkUZ/
        hfhXzCHAt+QYgqH+2QknmfWke7IBshyCd/1hsNJAq+s3j8zAPz3PlxR87F/IQow9
        3b61dnsWex28u0iUxt9xOMrmDLGyNTEKJY8b6ALNkJrRpl6f1XVNKLHDG+/ZUP3Y
        fpiSMDmRHx6UGhGeKUnRnAysYYf8YeEg/nTJNphkLUQbfQRGJvcG/5QNry7OOQSM
        iG7bO+NALoVcv0uyH2TjIZZD2JY/usMGHKDziORPIdDlefNRm23tR84jXUtYQ4zr
        D3Qwk2xTf5gJdlGU/9diV7LFA9Gq+w49YdZvfiF2a1wrgzmfmwg1FcbJdEbECJUQ
        ==
X-ME-Sender: <xms:7UaFYO4Q8fmbSKSkzZSsNpDn32ELhHmUgkQXFrAyiRbWiJc7Mw46Jg>
    <xme:7UaFYH4lOEgTTpQG5laIVFqwOn1GZXuZToVfQn-T9mby1_kHSQjbcaRAqEArO2kru
    eyeQ2MnKYQBezv_dGM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduiedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeevtdehveetkedvvdehhfeuueeffeduffduveevudeiveeu
    tedvheekteeujeegueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:7UaFYNeCH_1OmQv000hUNRqdE_nlmqKcjUdu2cZXYugo1XlPildYJQ>
    <xmx:7UaFYLJLD2tY4ZhbY22l1hm-xCm9hjInQE49QUPef1sLLCWcuSriLA>
    <xmx:7UaFYCLr4LMTpPHGKgbEctaQRuOgVPhKj6-Uyu5z7gU5mRDn--5XCw>
    <xmx:7kaFYHEqYYxL4DD9PYhgcasNJ107VpD23N1mVrVPnnh0dSO7tS3bYw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 1E246130005F; Sun, 25 Apr 2021 06:39:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <8cd60ba7-b0db-450f-8285-eb5429c4f3ec@www.fastmail.com>
In-Reply-To: <20210425052817.27373-1-maoxiaochuan@loongson.cn>
References: <20210425052817.27373-1-maoxiaochuan@loongson.cn>
Date:   Sun, 25 Apr 2021 18:39:20 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "xiaochuan mao" <maoxiaochuan@loongson.cn>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "Qing Zhang" <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: =?UTF-8?Q?Re:_[PATCH]_MIPS:DTS:Correct_device_id_and_class_code_of_pcie_?=
 =?UTF-8?Q?for_Loongnon-2K?=
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On Sun, Apr 25, 2021, at 1:28 PM, Xiaochuan Mao wrote:
> from Loongson-2K user manual know that Loongson-2K have two
> pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
> and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
> in each pcie controller and others are 7a09. and their class code is 0b0300.

The manual is obviously incorrect.

class0604 is PCI to PCI bridge that matches. hardware. 0b03 is undefined.

Thanks.

> 
> Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
> ---
>  .../boot/dts/loongson/loongson64-2k1000.dtsi  | 40 +++++++++----------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi 
> b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> index 569e814def83..a95121359080 100644
> --- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
> @@ -150,8 +150,8 @@
>  			pci_bridge@9,0 {
>  				compatible = "pci0014,7a19.0",
>  						   "pci0014,7a19",
> -						   "pciclass060400",
> -						   "pciclass0604";
> +						   "pciclass0b0300",
> +						   "pciclass0b03";
>  
>  				reg = <0x4800 0x0 0x0 0x0 0x0>;
>  				#interrupt-cells = <1>;
> @@ -163,10 +163,10 @@
>  			};
>  
>  			pci_bridge@a,0 {
> -				compatible = "pci0014,7a19.0",
> -						   "pci0014,7a19",
> -						   "pciclass060400",
> -						   "pciclass0604";
> +				compatible = "pci0014,7a09.0",
> +						   "pci0014,7a09",
> +						   "pciclass0b0300",
> +						   "pciclass0b03";
>  
>  				reg = <0x5000 0x0 0x0 0x0 0x0>;
>  				#interrupt-cells = <1>;
> @@ -178,10 +178,10 @@
>  			};
>  
>  			pci_bridge@b,0 {
> -				compatible = "pci0014,7a19.0",
> -						   "pci0014,7a19",
> -						   "pciclass060400",
> -						   "pciclass0604";
> +				compatible = "pci0014,7a09.0",
> +						   "pci0014,7a09",
> +						   "pciclass0b0300",
> +						   "pciclass0b03";
>  
>  				reg = <0x5800 0x0 0x0 0x0 0x0>;
>  				#interrupt-cells = <1>;
> @@ -193,10 +193,10 @@
>  			};
>  
>  			pci_bridge@c,0 {
> -				compatible = "pci0014,7a19.0",
> -						   "pci0014,7a19",
> -						   "pciclass060400",
> -						   "pciclass0604";
> +				compatible = "pci0014,7a09.0",
> +						   "pci0014,7a09",
> +						   "pciclass0b0300",
> +						   "pciclass0b03";
>  
>  				reg = <0x6000 0x0 0x0 0x0 0x0>;
>  				#interrupt-cells = <1>;
> @@ -210,8 +210,8 @@
>  			pci_bridge@d,0 {
>  				compatible = "pci0014,7a19.0",
>  						   "pci0014,7a19",
> -						   "pciclass060400",
> -						   "pciclass0604";
> +						   "pciclass0b0300",
> +						   "pciclass0b03";
>  
>  				reg = <0x6800 0x0 0x0 0x0 0x0>;
>  				#interrupt-cells = <1>;
> @@ -223,10 +223,10 @@
>  			};
>  
>  			pci_bridge@e,0 {
> -				compatible = "pci0014,7a19.0",
> -						   "pci0014,7a19",
> -						   "pciclass060400",
> -						   "pciclass0604";
> +				compatible = "pci0014,7a09.0",
> +						   "pci0014,7a09",
> +						   "pciclass0b0300",
> +						   "pciclass0b03";
>  
>  				reg = <0x7000 0x0 0x0 0x0 0x0>;
>  				#interrupt-cells = <1>;
> -- 
> 2.17.1
> 
> 


-- 
- Jiaxun
