Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF5A36E30C
	for <lists+linux-mips@lfdr.de>; Thu, 29 Apr 2021 03:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234549AbhD2Bqn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Apr 2021 21:46:43 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:33573 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231564AbhD2Bqn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Apr 2021 21:46:43 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 18DA810C2;
        Wed, 28 Apr 2021 21:45:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 28 Apr 2021 21:45:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=D
        k51ao1IEp6JfSy4kSMl2Ei33Quo/UNxiozv8dRzrts=; b=YdMQYrPi7hm+ocAWD
        sCMvDcAGS4tKL2YoRGxRD5Yb3GG+UqzjSlUrmHAaShyIDPx1h/VeCXLBZMbIGwYl
        tKjJtaMunNEsTAo0Q2to6vPxFErFKx3pFN/oq15P6yxERz59jD1b/kpSFkyd09QX
        3pakhpoQYEUshzmkU37VgSSHdOXNQglQDAePdfHcihV9jrrmQlLBXDvetc8dhiwD
        utwDkm5sWvTQXIwdo+qdQyiepLAXJZsFXjlWw2MLuaYkQ1ryvKIUl8+Dfp4VH175
        mNEY8UvH/9sjRioyI68oPjY6wxQ5sEnHGdnCL+ZjHiMNYe8PgVjvzHTXhQYyABis
        bmhJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=Dk51ao1IEp6JfSy4kSMl2Ei33Quo/UNxiozv8dRzr
        ts=; b=VloHZsZDzfz/Mlh84tSM6YkubRVzNH8ATuagT1dLBQP5FXigm5k1mOF34
        7ig8mODw/AEqnWUExdEMzwp6n8bijXUQg92THkKyRDrny2itCQ03owghSi77nt9R
        ssKhX57JVwgt5QFvLxZ7SjZl4Uhk4SjHhk6KFxzXV2/+m30laNncyvKTfRK/NJCZ
        4JATT3oQJUGs6hkq+nSpAjCgA2sVfvCcYECsUWIAoLw5JkJi36VaQgxayMrImmqX
        qK4UFX3dT8TEBVtw6XB+FUh/1PGRgO8dyAFckmyCOWyUZ0Q9jF2ti5iOgYr8Yn5G
        9eU1kTe0HAf7k7iygJeEOe7lHRVbQ==
X-ME-Sender: <xms:0w-KYGvBZONSKjSsMwxl5heX3-vkbLMlF9Zcd0wFI0YX_3WkuRjpKA>
    <xme:0w-KYLeYRriAvsh9UXPBjAov9oJ9gw7IxmZ-5Sqd4unZ11mwPsO6UlOBPCAAq1Ok_
    _CSNLPZD50rwLe4jT0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddvfedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepudduvddrieegrddvledrudduheenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:0w-KYBzIV1Xqnu218oZ2itbZraWQKAhk8XJNNxo6KaswJbPbzoWGxw>
    <xmx:0w-KYBPI3DryFxIHfPf1g0F1gGEcP0_aeBJRU_pqUO0Xf0bZ1zZ_DQ>
    <xmx:0w-KYG8GipOCOsaY_YqPXgneuLNk5-7Bzz2tibgn9zy7dcNaClwXWQ>
    <xmx:1A-KYKZ8hmbJgs0E4U_WldIArVaQUa9mwggMEirG0RUPCHBuW_mj8Q>
Received: from [10.20.192.183] (unknown [112.64.29.115])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Wed, 28 Apr 2021 21:45:53 -0400 (EDT)
Subject: Re: [PATCH v2] MIPS:DTS:Correct device id of pcie for Loongnon-2K
To:     Xiaochuan Mao <maoxiaochuan@loongson.cn>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Qing Zhang <zhangqing@loongson.cn>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210428120628.21041-1-maoxiaochuan@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <3254396f-eabc-c7f4-8801-1efa9850025d@flygoat.com>
Date:   Thu, 29 Apr 2021 09:45:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428120628.21041-1-maoxiaochuan@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2021/4/28 20:06, Xiaochuan Mao Ð´µÀ:
> from Loongson-2K user manual know that Loongson-2K have two
> pcie controller pcie0 and pcie1, pcie0 have four port named port0~port3
> and pcie1 have 2 port named port0~port1. the device id of port0 is 7a19
> in each pcie controller and others are 7a09.
>
> Signed-off-by: Xiaochuan Mao <maoxiaochuan@loongson.cn>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> ---
> v1:
> revert class code
> ---
>   .../boot/dts/loongson/loongson64-2k1000.dtsi     | 16 ++++++++--------
[...]
