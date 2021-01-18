Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34AF2F976D
	for <lists+linux-mips@lfdr.de>; Mon, 18 Jan 2021 02:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730535AbhARBwx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 17 Jan 2021 20:52:53 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:39083 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730458AbhARBww (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 17 Jan 2021 20:52:52 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 508371250;
        Sun, 17 Jan 2021 20:52:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sun, 17 Jan 2021 20:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=J
        9jvrqQqukLeoHwiclTg0SNJ/Z7xF4sIX+lxzXqaRP0=; b=mg2hULcdtRHigRZyY
        9a5btLXnT3AYoTVCw469gWb7YpFYI7zQaEAwpqnLOtUt5ZxpViXskjW9vBlQRlnN
        Qe120hFf5I6ADRuOaLWk636mEUUkpZXdtrZLPof4jXDankuDnpYRyHcbc9ylX0Td
        zPuN/S1lX0sx78WB3gtN7SBpKMbzWZg3C8gRshY1VnDF63ZVMtdjo2nMn2QJ/qoW
        lGFGpyRb1a34OMKsDqfktwWIihKUoFeKFYqQktbOZnF9/vIBpwFl4GnpZsxopMFd
        H1uqL7tP8iXkw0pmdHBCuboFP7lABmm3EcUkigIN2XWw3Ohlidg/zf6pypfauft6
        2QDcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=J9jvrqQqukLeoHwiclTg0SNJ/Z7xF4sIX+lxzXqaR
        P0=; b=okxa47wMNMWq7WkUxtkwP+QrQp/3+D6hRToZwd+4DNwbFmYtaMCHY7/fY
        g1wMtAmDYbutvPEVmWgSp16Xwii6ieTyY1PYIMg61sf4zqLoSD+OMfsDD8h/gFIU
        ukofert7oF/VAdiv8AW6nPv1EX1vHewPEj6n6zyi7+KAA16V6ee8xDvl13V+IFAE
        R6FxwS5+a2ZqxAHWrK4dK+UDRnZPcFG25vQqQn1NNUdTZa+FKwJFN45nQgGWTNo3
        ts0m87My5EyWDF876aEmsi/oyXf9+p3AMb/5+7BNvLiYlGuW5sB71C7aCA8rSUIc
        ZR6EYG6kZHE20yboTPZm192yjYpeA==
X-ME-Sender: <xms:xOkEYOZmVFcJNiZt9gx0Dg0H_qOvepGw8pykU5pvVIiFSMsZccEOiA>
    <xme:xOkEYBaQYJvfQDdGKvAJtZ1zitCHJWdWMzCgpuC-EitS0gFf37fs9uGJfqNYrb6tM
    sNHBTkbLEArbKqz6lA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeftnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepfeeludeitddvkeffgefgueekjeegfeefteelgffhkeffueetieej
    geehhfeuffdvnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:xOkEYI91OcmnbWujb4UXiKgBHoLm_B2IAT093CUXI2eTsmI8rsDxtw>
    <xmx:xOkEYAr0zPOSMEV1rQCtnjwJU3FBNTFiE-OtpwLmOeUghif2xAGRTw>
    <xmx:xOkEYJqoANPsjrOuKzxMNCNLcJ84v5fTFVStm8e4PH_6KnVCWXoELQ>
    <xmx:xekEYAUAwn38QTvim-_TcoP0VXV5j7kH9qaw8y0xpm967FcGSIm4lAWIJUo>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 7E740108005B;
        Sun, 17 Jan 2021 20:52:00 -0500 (EST)
Subject: Re: [PATCH 0/4] MIPS: process: Some fixes and improvements about
 get_frame_info()
To:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ab6e4efb-98b5-3ad6-5bad-2338c57d9392@flygoat.com>
Date:   Mon, 18 Jan 2021 09:51:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ÔÚ 2021/1/12 ÏÂÎç8:29, Jinyang He Ð´µÀ:
> Not familiar with microMIPS. Not test on microMIPS.

Hi Jinyang,

I was messing around QEMU microMIPS and found kernel stuck
at loading init process after applied your patches :-(

Thanks.

- Jiaxun

>
> Jinyang He (4):
>    MIPS: process: Reorder header files
>    MIPS: microMIPS: Fix the judgment of mm_jr16_op and mm_jalr_op
>    MIPS: Fix get_frame_info() handing of function size
>    MIPS: Add is_jr_ra_ins() to end the loop early
>
>   arch/mips/kernel/process.c | 92 +++++++++++++++++++++++++++++++---------------
>   1 file changed, 62 insertions(+), 30 deletions(-)
>

