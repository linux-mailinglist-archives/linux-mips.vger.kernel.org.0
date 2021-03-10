Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D71334032
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 15:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233032AbhCJOTu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 10 Mar 2021 09:19:50 -0500
Received: from aposti.net ([89.234.176.197]:59880 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233030AbhCJOTh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Mar 2021 09:19:37 -0500
Date:   Wed, 10 Mar 2021 14:19:09 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/3] pinctrl: Ingenic: Fix bug and reformat the code.
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <XRBRPQ.2KHLLNUGZDFB1@crapouillou.net>
In-Reply-To: <CAHp75VeqQKOfxzPTTkiZH8v2-uXO_YSP3KipMaf9R8gRemK+Og@mail.gmail.com>
References: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1615308057-88387-2-git-send-email-zhouyanjie@wanyeetech.com>
        <CAHp75VeqQKOfxzPTTkiZH8v2-uXO_YSP3KipMaf9R8gRemK+Og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mer. 10 mars 2021 à 16:03, Andy Shevchenko 
<andy.shevchenko@gmail.com> a écrit :
> On Tue, Mar 9, 2021 at 6:42 PM 周琰杰 (Zhou Yanjie)
> <zhouyanjie@wanyeetech.com> wrote:
>> 
>>  1.Add tabs before values to align the code in the macro definition 
>> section.
>>  2.Fix bugs related to the MAC of JZ4770, add missing pins to the 
>> MII group.
>>  3.Adjust the sequence of X1830's SSI related codes to make it 
>> consistent
>>    with other Ingenic SoCs.
>>  4.Fix bug in "ingenic_pinconf_get()", so that it can read the 
>> configuration
>>    of X1830 SoC correctly.
>> 
> 
> Split to 4 patches then.
> It's quite hard for everybody to handle regression fixes like this.

Agreed. And the fixes should have a Fixes: tag.

-Paul


