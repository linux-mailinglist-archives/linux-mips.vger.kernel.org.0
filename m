Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D979A36A795
	for <lists+linux-mips@lfdr.de>; Sun, 25 Apr 2021 15:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbhDYNur (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 25 Apr 2021 09:50:47 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:40285 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229837AbhDYNuq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Apr 2021 09:50:46 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 22C3D5C0083;
        Sun, 25 Apr 2021 09:50:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 25 Apr 2021 09:50:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=Y
        ch62pQrkLMvKo48PQDLgaNhdPAWa5zGFyf8q9cP3Bg=; b=Cy1Gqyn9vDBiG1zUk
        97pxm+sFj0qziX/0nGlJb1HVK75oT9sslQ0lnEVMO/kaldEA8Qa2WgYZ1LXXxr33
        6MNewMlhqKUctOtXCkkkiVCFQ/oTQEQB2KwRssKn/VP6+YK7NybEPf8SpB+tFHCh
        OmAWMuXeD6NzrX0mcLHrm7p7WNRCOm5lcDEeZalyIsXsMBbesdbnR/BmXPXeRNjb
        5ODivu1QHowqnqyxzTkhX78EMaDqS2tvNsD8S39co3FSL5gLF7qBOsX4oYgI4gme
        FwwORizWhUCYupPW4WBEGN7qYywLJ98Wr2W6S5TXpjFeucgtytecA8jEzppqAjqn
        37L5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Ych62pQrkLMvKo48PQDLgaNhdPAWa5zGFyf8q9cP3
        Bg=; b=VjVM8M1SWS2tjwCAcmeJ60XkZ35lsyEk3APFOGQz4jBIhme6rmp8euVJC
        ZzUyqMYm2Cp6qMu037LpEfV45cK2SaM5XULwQFVFFAiWqpA1MJFKFOvaA9qKWv5u
        Myt4mv31OVKkayntLRgwbqkYszCWXgDa5ICWkUpIvdxQVkFiYKTxBPeU+u35fuPI
        1XQKaxzCe5ob/5yqqwE1Q6IvAyYMJOVMu9w/1E2471nLPf3bvoF60x4ROQGplolh
        T2JP8mujglzkLpTe80FYNOxcvIxpjkapIdEPS2RTplDQDvzbSiKJn+IW5QFNhoXE
        M7+VW9AxNnlhZtNzDIwSEo7cVrUIg==
X-ME-Sender: <xms:jHOFYBh8ieP3RKejkaYHdU8UmwUBakyLuMY_x9pIfCxRKW-mJgdcgQ>
    <xme:jHOFYGCCHeV8Gia9Avv8oUDqhHYfeVZodMujZQWE_HrW-3I54bk608UJCy7QzrAbF
    1mAzthIF6sipelGWsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdduiedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefggfeikeejhefgkeegudffudeftefhveejleelleegheevieff
    udejudfgtedvjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeiuddrud
    ehkedrudegledrkedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:jHOFYBEbk3jfjc6t55SkEj32ZwCkJERqFRnk2xDEQu8in3JqWCZZgg>
    <xmx:jHOFYGQ4g3dNfkgc4j-N0-ag84tYTPk_TkTlsjrdH5XriNkXfJ4l7w>
    <xmx:jHOFYOye_LcbN36e1kF_pqZhLQT14XPZD1TneoxcEI_BfqIvjPg38w>
    <xmx:jnOFYItt4BXUGIYXCNfTbawxun4OFqOWSrOudjwaY4b-daFoZUbdtw>
Received: from [192.168.43.122] (unknown [61.158.149.81])
        by mail.messagingengine.com (Postfix) with ESMTPA id 425A6240054;
        Sun, 25 Apr 2021 09:49:59 -0400 (EDT)
Subject: Re: [v1] MIPS:DTS:Correct device id of pcie for Loongnon-2K
To:     Xiaochuan Mao <maoxiaochuan@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210425130915.31001-1-maoxiaochuan@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <28bbe1bf-f421-afc7-07d3-e123764afe99@flygoat.com>
Date:   Sun, 25 Apr 2021 21:49:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210425130915.31001-1-maoxiaochuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2021/4/25 21:09, Xiaochuan Mao Ð´µÀ:
> from Loongson-2K user manual know that Loongson-2K have two
> pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
> and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
> in each pcie controller and others are 7a09.
>
> Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>
> ---
> v1:
> revert class code


Could you please help me check the actual hardware?

TBH I remeber I filled it with actual hardware values.

Btw the tittle should be prefixed with [PATCH v2]

You may generate version suffix with `git format-patch -v2` or try to 
utilize patch management tools like git-publish[1].

Thanks.

[1]: https://github.com/stefanha/git-publish

- Jiaxun


> ---

[...]

