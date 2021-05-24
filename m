Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA6F38E112
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 08:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhEXGi4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 May 2021 02:38:56 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36605 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232266AbhEXGi4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 May 2021 02:38:56 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 525BB5C00EE;
        Mon, 24 May 2021 02:37:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 24 May 2021 02:37:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=i
        mV8mjswkBJvQ7+FyKqZ30/NY1ju3UpvGEBroWywsfY=; b=eFq0rAu8YiUw2SyKr
        b5hzq/vpDOFY+UAGWUKhC2AgL2OanK189XCWZhan9i6MjnwY7d0j5pB0BzvhFsO5
        RbuyrsWraZMvjYocQ0MX8sWJYH9PhkeDKm75sjdxxatvssSIqy1PQ+2fBTQcs0P2
        qtbLHmtVf31CrEkimlhxecuIS8QieqX+Y+Gdw3pHRiscAY5m5xcbKtJOrA8yqK4U
        RaDNW2w9GiQE05Hb3DGEKtN57Kg5lWVlWK3tXgOE61SkYGMkmC3cq/+jsBqBhar6
        kudWuAnEEJ32hqbeKVHzyKI8v9yMZZdmzm+4NqI166sCY0ASq2q6A1S6/b/6piWV
        lxMCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=imV8mjswkBJvQ7+FyKqZ30/NY1ju3UpvGEBroWyws
        fY=; b=DPzKJkVi2k1anjX7aVCYch9jDhfJUej5MNbPQ2uEzOavTvT1mfUMmlKjM
        +jtMHfPrgGheFcPYg7GkxQSH7Paz4fOf1e5bAWupSPAM1zbBz2P8CTIhqar6HiF1
        UvbrCTt5gJcF3ZNXV4al4RaldOTp7kPvifDQYpad1AUgbscxSYyBn8UZ8J4ZxB8u
        VoncfR1QBDhMLvIAQNWXRjUfr4ma+z3HxRL95SgQoCLtMIccH8lnZqtMqjQplLPp
        vTuCCR9sQAyvTTFHl0cwQZXy3UiumUwPOKBrAC0PO3W5kYIp+HhPRQMrWABGu08w
        t9VwNpf/KRVX10tCcyXJ41EoRjWYA==
X-ME-Sender: <xms:pkmrYP_FDiQFSCb-_D-lkThFkjW6vvfQ3NezLpwsyEqBW7pU0CbX1A>
    <xme:pkmrYLuDN5FRoBQKAQyn5OguMWCYZ19gMGcLJXNdqw0oYJlgOzaDD9OhrMxpmlwOS
    WRdrrFM7KjvjYaBluY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejkedgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtke
    ertddtfeftnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludeitddvkeffge
    fgueekjeegfeefteelgffhkeffueetieejgeehhfeuffdvnecukfhppedutddurdekvddr
    heejrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:pkmrYNBwwUYoEKxJ2kdIIwZaqKuk3XuM4y9lW46-H76SrHhmdUzRyQ>
    <xmx:pkmrYLdUW5BiOoeuQP1YuyCSf50P675wXXem9dERGMDkJ_1a7Imyfg>
    <xmx:pkmrYENA94t_3SQDLC3jCvcXP9VJwSeWYSpyvfJQGwN-kdzV6dhIKw>
    <xmx:qEmrYD1Y71-Qre-dyaq9qOqszVFaL9EsVHayKWkZAqFYA1stFD6mLA>
Received: from [192.168.140.245] (unknown [101.82.57.64])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Mon, 24 May 2021 02:37:23 -0400 (EDT)
Subject: Re: [PATCH 2/5] mips: dts: loongson: fix DTC unit name warnings
To:     zhaoxiao <zhaoxiao@uniontech.com>, robh+dt@kernel.org,
        tsbogend@alpha.franken.de
Cc:     maoxiaochuan@loongson.cn, zhangqing@loongson.cn,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1621586643.git.zhaoxiao@uniontech.com>
 <a6343f728252e4134b01c2c5f63acba3b38bcdd5.1621586643.git.zhaoxiao@uniontech.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <b5e7ac2f-cd8b-507b-e9dc-4d3d174d1776@flygoat.com>
Date:   Mon, 24 May 2021 14:37:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <a6343f728252e4134b01c2c5f63acba3b38bcdd5.1621586643.git.zhaoxiao@uniontech.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2021/5/24 14:07, zhaoxiao Ð´µÀ:
> Fixes the following W=1 kernel build warning(s):
> arch/mips/boot/dts/loongson/loongson64g-package.dtsi:42.30-49.5: Warning (simple_bus_reg): /bus@1fe00000/serial@1fe001e0: simple-bus unit address format error, expected "1fe00100"
> arch/mips/boot/dts/loongson/loongson64g-package.dtsi:51.30-59.5: Warning (simple_bus_reg): /bus@1fe00000/serial@1fe001e8: simple-bus unit address format error, expected "1fe00110"

Acked-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

>
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
> ---
>   arch/mips/boot/dts/loongson/loongson64g-package.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
> index 38abc570cd82..d4314f62ccc2 100644
> --- a/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
> +++ b/arch/mips/boot/dts/loongson/loongson64g-package.dtsi
> @@ -39,7 +39,7 @@
>   
>   		};
>   
> -		cpu_uart0: serial@1fe001e0 {
> +		cpu_uart0: serial@1fe00100 {
>   			compatible = "ns16550a";
>   			reg = <0 0x1fe00100 0x10>;
>   			clock-frequency = <100000000>;
> @@ -48,7 +48,7 @@
>   			no-loopback-test;
>   		};
>   
> -		cpu_uart1: serial@1fe001e8 {
> +		cpu_uart1: serial@1fe00110 {
>   			status = "disabled";
>   			compatible = "ns16550a";
>   			reg = <0 0x1fe00110 0x10>;

