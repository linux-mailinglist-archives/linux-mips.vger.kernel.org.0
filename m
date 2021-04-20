Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAC8C364FB4
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 03:11:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhDTBMF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 21:12:05 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:50401 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229994AbhDTBME (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Apr 2021 21:12:04 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B779D33B5;
        Mon, 19 Apr 2021 21:11:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 19 Apr 2021 21:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=2
        PZTex3av6DtVxv7nSM5bRbe2hR7e4Ewi7UMffg6+xs=; b=nhblEcEWTeS+NLG7W
        YfYdsSFnQx0UHRmnLbI/hHEsk8I7X/AMAhgwD3YbnUZcCl8v7t4Y062CyrChQ9jL
        6yjBAZv1F/5sS5Qtq/Dn9OBuWacx4YQQh2pLjEnXiD8FrYO/wfxy8s06XXpNyD++
        h6sugDvTiHdefjDP+C0/qE9HjSO0TPoZNM15Qd7nGCodzGI/FBvPAc4ghpQSbF2z
        O3lEQ5pCsAkxbGd1BIERd7N1lheyQp/8O3tBQACTNfgKPbe8HvE5B9M9SEN0KRqZ
        zZU+7dTTsQbOvjffSnrDDPNEG8Pv3Lnq6VDoW7YHmpuSI1cbTyMdndqX7j1jtCET
        q1yJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=2PZTex3av6DtVxv7nSM5bRbe2hR7e4Ewi7UMffg6+
        xs=; b=DB7mRFgPTttzJ2lt+ny2qbBt14ULHDVitD40RV6utjMhb5GAgteC9QwdU
        lt1Ls93IF3Mcw2YFw75PfdCUiOVKNK0WnGKVsuP9ktYZUmz5hYLOhogtKT1IB18C
        w/5BCeWOV65oRYM9Lv0GQBn/vUEaSk3/kBBOU86V4NW/7Vf2JCoCmtYXuroFbe3z
        qSxrQZOqNK/N2TlL0S5lQ98k1mKDzvNP93Pw5CiIPXG7t6yDC4MHbo7xXz/37y43
        5iW7oZ6UtlL7rnlm+cb5R4gLBPWDyMr30/Y1Th2m+yHk2tQcI/CXhc6dlb0tkpiO
        sMGc40Qa7ZtNSMbAlNdz5NBYOduZg==
X-ME-Sender: <xms:Qyp-YCZ079hxBKayHveICxY0comEvhIroKGP6NpgF-ujGlzUedCEYg>
    <xme:Qyp-YFa0TM-h2lQvdLL67KVfoyadq6N3YfPJU9E-cAYCneUJFBwH1lDibvg3lvzMu
    kSnZvwJ7jwrYRppjtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddthedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepudduiedrvddvgedrvdegjedrgedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:RCp-YM9kVvgd_u_kUpFIrkJhQBs79TGLqkF09lrgLGTRgdcaqGBPKw>
    <xmx:RCp-YEpSEhFaRYiBpTgi1nhiN-qCD6bsCVk0RiGl7VWxbQ-77RhBNw>
    <xmx:RCp-YNpJN_8a_zcercstGmzAxy2Ehbcvl2o6naXcRD9Hui3xN_FJQA>
    <xmx:RSp-YE34Swz4s-peB6wSQXrL7nhBotkeCziCEGa987-7AM_qMGDNWQ>
Received: from [10.20.195.140] (unknown [116.224.247.41])
        by mail.messagingengine.com (Postfix) with ESMTPA id B3426240054;
        Mon, 19 Apr 2021 21:11:29 -0400 (EDT)
Subject: Re: [PATCH] mips: kdump: Crash kernel should be able to see old
 memories
To:     Youling Tang <tangyouling@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhuacai@kernel.org>
References: <1618829807-12522-1-git-send-email-tangyouling@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <bd5b70cf-cfdf-0a4a-dfb5-08e030864138@flygoat.com>
Date:   Tue, 20 Apr 2021 09:11:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618829807-12522-1-git-send-email-tangyouling@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2021/4/19 18:56, Youling Tang Ð´µÀ:
> From: Huacai Chen <chenhc@lemote.com>
>
> kexec-tools use mem=X@Y to pass usable memories to crash kernel, but in
> commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
> BIOS passed memories are removed by early_parse_mem(). I think this is
> reasonable for a normal kernel but not for a crash kernel, because a
> crash kernel should be able to see all old memories, even though it is
> not supposed to use them.
>
> Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
> Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>   arch/mips/kernel/setup.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index b86e241..ac90d3b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -351,8 +351,10 @@ static int __init early_parse_mem(char *p)
>   	 */
>   	if (usermem == 0) {
>   		usermem = 1;
> +#ifndef CONFIG_CRASH_DUMP

Why depend on a config instead of a runtime variable?

Btw as you are fixing my commit please keep me CCed.


Thanks.


- Jiaxun


