Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C462DF749
	for <lists+linux-mips@lfdr.de>; Mon, 21 Dec 2020 01:39:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgLUAjQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Dec 2020 19:39:16 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55377 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725272AbgLUAjP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Dec 2020 19:39:15 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 2DE8B5803F2;
        Sun, 20 Dec 2020 19:38:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=V
        ebSOKJOTjgaSNitGFxute0whnLIjuICjIxh5PngH4I=; b=iL6DgZ97JhOEot1/I
        e9AJ8wTCmP8yB6UK5kByRx32wDO+L+gyVxFmF6dcwgfUwkNKsa3dQDhpT6hxoml4
        mldZuoW8edXLAwbQqoeFRqvCXTjDPx86HV9MwFEJY+MqUAbV91nM4rgH0D1AChDg
        f6HEjlxl7sA9AChi9vcbbkIUKiTjAWBFmuq7v7hctHdJ0ToTnTjmLBNMCZg2Y5Wk
        goCiXRcN+FMJlexZ/EI0GpgntqeFAPjwFCSS8QFPQumnS2wqfw/vS9nQYOPoaJkC
        AZMJ7DTgEJjhx6jjE75lGONmAKexhx76RkKrX1rugCZnHhp4S3JEQc7QaocDV187
        GBcAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=VebSOKJOTjgaSNitGFxute0whnLIjuICjIxh5PngH
        4I=; b=FcoyUwNGvm+AB862qiALXjXNQ1Qwr/VPAq9BzorEj1PBmW5GLL5j8IOvb
        CXF1mqb7jUAtyOFUXqLCrxI2e5MlkzgGROhEQ6w+673iXr/6aCogp4nwfhSgCJrK
        9uTjbcOlm7TBN9Y4bcofYDtp3PcHvPTE+++nWmZ34KJx3cJEx42QsFm4VtxifRxb
        d9J7xLy+aBXLXDx61tM9UwNQOIWMftNtOspUMqL0vxASVgvJtazs7Jt91wGlMpAA
        Q084KmQyYzRGlEY/VPVREbdYSql3GWA9I8pRnfmI28/fMmktKILnsZCmX1mVhI67
        OyfcQ2+bTwqsCkhBT9oK96CKvPahA==
X-ME-Sender: <xms:cO7fXyq-r32f4H2JjiC5COKUDMvZFuB_BcW02QIgh9CfkG0yam2n7Q>
    <xme:cO7fXwrQW2u6eWbWAWWzbp_MLhLMS0gbq4zJohmpd4Sp506RmagSWkOG5Gkf531F-
    BiwL_kjlKtXWEgW5Lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdeftfenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeefleduiedtvdekffeggfeukeejgeeffeetlefghfekffeuteei
    jeeghefhueffvdenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhl
    hihgohgrthdrtghomh
X-ME-Proxy: <xmx:cO7fX3PomJ_K55AYDJbvLc-NGkvt8PJ1Qp63SyxVA0mW3vpvvv6bnw>
    <xmx:cO7fXx632Z0QdCHp7rQqLrNl441EUP6atulpGxx-8yywPAQVyAWjNw>
    <xmx:cO7fXx6wI-DNSNWed4PBka8KzBFV5ahyULBfDFVRC9Os8E5Cuv9PMQ>
    <xmx:cO7fXzEEJnlwdZsYEMnpUcvnPLFWE6hit4cP6Fkdr5afnoyjYYzjneyMMyU>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 5CCBC24005B;
        Sun, 20 Dec 2020 19:38:07 -0500 (EST)
Subject: Re: CPUs with EVA support
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
References: <20201220193201.GA3184@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <d45cb374-f3dc-8c26-6b0f-27bec45854a9@flygoat.com>
Date:   Mon, 21 Dec 2020 08:38:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201220193201.GA3184@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2020/12/21 ÉÏÎç3:32, Thomas Bogendoerfer Ð´µÀ:
> Hi;
>
> I've started looking how to get rid of get_fs/set_fs for MIPS and
> my current obstacle is EVA support.
>
> Looking for CPUs supporting EVA I only found P5600, are there more ?

Hi Thomas,

It is a optional feature for M14k but nobody enabled it :-(

>
> Does someone sell boards with an EVA enabled CPU ?

Baikal-T1 supports EVA.

>
> How good is EVA support in qemu ?

EVA is functional in QEMU.
I had tested it with P5600 malta system.

- Jiaxun

>
> Thomas.
>

