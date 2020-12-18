Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339972DE0AB
	for <lists+linux-mips@lfdr.de>; Fri, 18 Dec 2020 11:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgLRJ7a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 18 Dec 2020 04:59:30 -0500
Received: from mout.gmx.net ([212.227.17.20]:60145 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725884AbgLRJ73 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 18 Dec 2020 04:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1608285474;
        bh=Poe+I/uv1HXYH34rR5R0KfS808Uj3LLB3gp9Re3QXqU=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=MtF7hSB+mz/+3K+MzUxZWtvXfV3o7WlP+T6Y93wb4tQeodfGIeYauRjNOXLq6dk+x
         sPHfuyGVd0y4ThDa9UfIOpGmCriMohgEb49G/SLWQ+0YQfZkbvpPEMqlupEbhVufab
         iAKoKmmU/WNu0O5npVFUtgBENBX/J2Hq0KmyEbpM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.44] ([95.91.192.147]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1Ygt-1koooL1KW3-0032Nh; Fri, 18
 Dec 2020 10:57:54 +0100
Subject: Re: [PATCH] Add support for Realtek RTL838x/RTL839x switch SoCs
To:     Bert Vermeulen <bert@biot.com>, tsbogend@alpha.franken.de,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201215183557.646034-1-bert@biot.com>
 <fbd86bc4-5826-5b2b-5818-3ccd39a090fb@rempel-privat.de>
 <a4d89688-347b-21af-ef29-a28cd480d2d9@biot.com>
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <2d39c09d-6665-091c-be8f-7793b4e75ab6@rempel-privat.de>
Date:   Fri, 18 Dec 2020 10:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <a4d89688-347b-21af-ef29-a28cd480d2d9@biot.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HKnE9tzMC2kxZyQFxCTudHQnCXL3zuRxEutJQTkvS0LMg9jHq0w
 nDZ63H92xGCTZjs2mTrTEZQDByu0BOqthBDr8vvvdQx7XQBSnhZXlIiQ4PVlvFTqO1ZWiHx
 9tAkdSEmgIvY+TVXUO/Diip9xPoMpnHa7Oc4CorXFfvdnCr1wTvcAromGCZVRspruWpJXkn
 zzeGtFpbD1RbzIQLbN7TA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SchKDOQKVyg=:8mfaSQAL41OQdWB663A7d/
 G+X2ObdCXbOkqScqfnJTGd4W45vKVxgs8JgZyekzRvUlJ2BBjzkknopCOh9ZBaQ+QkvmQukJZ
 Ev8wqdiaBgKiv1FutS8RoYtIz3s14bhaAp9gcT0Ua2zOE5cbfDe/14YaUGNU/6Zr68EUpb/30
 1A4A+eSBebXOSpkaKi6UBaKSvzNp46EVuZkciQr/Qzi7ucK6orS+BQ6DcAJAMaNlSrmkYUE0T
 PB4QSRpFdotqNTszZqq/jnSKb5Z4DYEiiedRXE39vaz6smrg8J2Br7hM1uVfZnr7IayFbbkiA
 +9jiSZ+AVGhFssZcK4SEeoV3mWP25S9UuMaUh0bdcA/ndNsMJ+WVluVJBX3/Ez+Pm8ktddQHL
 yQgO5bua0Dk+gUl9nG5DBuJymzc4nn72t9aeXo4jCUJFSxurl9ziiAV6Krd6eQZHcSPp/EfaJ
 in0LM3NltLLPOgmKoobNKpdOapnblNMYY/OBaODNW4Pn7RWx8c2/cwGSgfKmkaEp7gz1b7aHD
 7057aR3gAyu7/COpFH7a6MYshVFZLPFYNGW+twTGkWb7BgrfYxUDYxuBYzevIVG8n+/JsldhQ
 yGkfP2j3wB8lMMz/5Ajn3SzIqJn7kdaAnZH0FFwu07qkzegqJjEojs8Gr6dd7iB1cLMNfL6WN
 DCCmWVPtle3L7UnZQDQCYBdRk6T9axIG4zJktP+JvDrSdVHyHbfPjEOYpwyZdnBsgCJMLkjWZ
 5ZzeYLTwCW7M6GWQgrxJsgX0zmMgZixEu/IA/GqKqXbtjXd+Zdu4NO0s73ZPk9MUtii8qpe9M
 qq/knpB2ehVkSZplnrKjUuC1xwAaK1pfSWvoGlj3nzkp4GFPWkbzf6kqOT4WgNWYOfAN15gFr
 tZbUxyaKAwkBnnq9FcjA==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 18.12.20 um 00:27 schrieb Bert Vermeulen:
> On 12/15/20 11:11 PM, Oleksij Rempel wrote:
>> Hello Bert,
>>
>> thank you for your work. Here are some comments..
>
> Thanks for reviewing. I will send in a V2 with your comments all handled=
.
>
>> I assume, after applying all needed changes, there will be no files
>> within
>> arch/mips/include/asm/mach-realtek :)
>
> I wish! Unfortunately I need somewhere to put the early printk init
> call, and the SoC family ID checks -- as they are heavily used in
> various drivers.

I would recommend you to use generic and exact SoC compatible string in
the devicetree. It will save you and the subsystem maintainers some pain
later. Please do not make drivers depend on the arch/* code.

=2D-
Regards,
Oleksij
