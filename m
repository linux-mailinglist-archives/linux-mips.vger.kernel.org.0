Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1421221ED2
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 10:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbgGPIqL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 04:46:11 -0400
Received: from mout.web.de ([212.227.17.12]:44183 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgGPIqK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 04:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1594889137;
        bh=VusW5YM72RqAR8xITEj0Yi1KvYFZxamXirv457LPUjY=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=OXUPHXWC5TiClh3HhM5gERRsd7+C9FGS+5FJUyRU2Ucynhf1Cm5UAsW7RdUX1UHPr
         xTSLtaMS0qXguHgudQjbDAtW5MnObgaq9pZJrDKFpC0ZuxI1/YvjdyYuWE96HE/MOu
         dYCRpCqrio2DgOPZIkDEgFALm+V/9tLURhIRbYbg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.165.142]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LfztP-1kclys24BH-00pdEQ; Thu, 16
 Jul 2020 10:45:37 +0200
To:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 1/8] irqchip/loongson-htpic: Remove redundant kfree
 operation
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <a865581c-0566-f7c0-380b-488ccfe4205f@web.de>
Date:   Thu, 16 Jul 2020 10:45:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
X-Provags-ID: V03:K1:+D4vu1ph+bXoPxDzWB8KpOkomNaww6LMr5/7cKyS3kC766RcSkX
 F8q/Iu5/JJTSVRCGOUR1iqZNfpD9s8Hufp/sgL624W+djkrEcs8sXNvgFi4cVn45Zm6CI4R
 Rryr0DVhcbJwKU7ejL03/k7JNWkIS0IoEgHTBB+h9pRKr2lm3uutEKthL0+ImG7D5/GYazV
 yq5jyDQ4B4b+vPnyGSmuw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bZojPfWXlEs=:nqFTssH6DpDViGEvtKBAUM
 lX/bcEv4sAhHUdFzIg3fA5VKTh3NobCFv6GgJoIOsFfoFsas7QqS/NuqBlL4YiCyfdcwxR+sC
 lFvd6qgrRtqKSYpS4REiqffDJEXSUF4xSUZ3Acx+Ftk8+w6cC+IatdN015gnmvFM+OvlFsU9i
 gStfmdMoMPwj4eYEkmm66cDONGu6nn2hb37DbwTx2u11dqmEkQhWHa0iQkpLHPNWwPNisA/KC
 IIIRvGlVAtPWB5650RlL7KaN+xoWtqW/lsQqP95/wwbz5CN9rjnYy6ECAn9lk0stWb5OmYb/R
 GiyGxwIhxciONayFG45Mhjk/qHclOJjBi7cqTU83HcyCc3klZMp5IIB8Ahu9siGV2hNLXLhz+
 EP6wMfkvndZYgydMLPhNlkNY+LhJmBaQvY55k/bI1C1DOjryLkoqmS9YhW+/E5V0JEQsOL5ZN
 nzBfvlP7KxpLjhWJX6/GuUNw2kv+rCdKOStRytrae5p74Hm0o0ar28G2ujc03yI9FWgoajIqm
 RPnPtPy3KZHSmryVpD6oLm27lRsQJfmjWovtJu97+xosmNlpYYU/6qvz4gdST7LLsVVeQOAGU
 RKBT81WcfA/V5Zvbepdb62nf0e/Fr4uLu7OsyfNlDa14etxrUMTj//RxgSDO9G7icSBgGTvvY
 aUQrFG+Imqo1SsY1qiKbHvTOQccFk5SFusxojrDuk9Rom06HKxQFnsYLWccldEaBgAi8UV7jR
 YCxnVw1xVtK0MSc5iGVQfjSJrvsX7/GY71lFay0Dmt4GDd00SdV599SkP6hKK6iZ1AoWpRisV
 f9k6S2UcMb8HhwOf48eNS4H+0Q4jseAlWMFfHlr+j/a0eP0/FIqICJksXDGDDvV8WCXHpA91N
 mln3YE6PgEvQExAors62xchRSdV2psV39Wj8HuP8IfyK+8OYV+0toA2VUCnC3FM63R0MMQ5QV
 1uifgLqewT0lqusIAQkhh4Oniwb5QsZPfU9ebouecne3xqfkGfwx307ErrZUMNXpb7Q+e7+1L
 0yW58kAqGszJcu5IAzWn3hZvt7U1DdR9OlPED2Vn+N+KM7G7tNxtpMiagtzmP2Me90MLo2s2i
 7oqIIX9Bt5vLm9Za25dl7/++Pkggc/Z5GsJ5EIlkfHeyZKNjeOTNfs9UXqgzC2OD6j7I1SqiX
 Y7XxZbgN9PvHJuu5hcaVmgQ6sCOv2GCeJaZq9NaDVOVSj2x3hTUQCL4fsz65rwDvDnGqkpEzz
 ePEMNq6hA74/NMAwgSHh0FVdpZ58uP50ZlQ5YUw==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> In the function htpic_of_init(), when kzalloc htpic fails, it should
> return -ENOMEM directly, no need to execute "goto" to kfree.

Would another imperative wording be preferred for the commit message?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=f8456690ba8eb18ea4714e68554e242a04f65cff#n151

Regards,
Markus
