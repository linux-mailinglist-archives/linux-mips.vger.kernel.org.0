Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D2F334053
	for <lists+linux-mips@lfdr.de>; Wed, 10 Mar 2021 15:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232921AbhCJO1w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Mar 2021 09:27:52 -0500
Received: from out28-171.mail.aliyun.com ([115.124.28.171]:56591 "EHLO
        out28-171.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232984AbhCJO1f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Mar 2021 09:27:35 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08234295|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.00788937-0.00557144-0.986539;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Jj19BhZ_1615386448;
Received: from 192.168.10.152(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Jj19BhZ_1615386448)
          by smtp.aliyun-inc.com(10.147.41.143);
          Wed, 10 Mar 2021 22:27:29 +0800
Subject: Re: [PATCH 1/3] pinctrl: Ingenic: Fix bug and reformat the code.
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>, paul@boddie.org.uk,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
References: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1615308057-88387-2-git-send-email-zhouyanjie@wanyeetech.com>
 <CAHp75VeqQKOfxzPTTkiZH8v2-uXO_YSP3KipMaf9R8gRemK+Og@mail.gmail.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <2fe6ff68-21bb-dc51-c485-d73cfeed57f9@wanyeetech.com>
Date:   Wed, 10 Mar 2021 22:27:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeqQKOfxzPTTkiZH8v2-uXO_YSP3KipMaf9R8gRemK+Og@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Andy,

On 2021/3/10 下午10:03, Andy Shevchenko wrote:
> On Tue, Mar 9, 2021 at 6:42 PM 周琰杰 (Zhou Yanjie)
> <zhouyanjie@wanyeetech.com> wrote:
>> 1.Add tabs before values to align the code in the macro definition section.
>> 2.Fix bugs related to the MAC of JZ4770, add missing pins to the MII group.
>> 3.Adjust the sequence of X1830's SSI related codes to make it consistent
>>    with other Ingenic SoCs.
>> 4.Fix bug in "ingenic_pinconf_get()", so that it can read the configuration
>>    of X1830 SoC correctly.
>>
> Split to 4 patches then.
> It's quite hard for everybody to handle regression fixes like this.
>

Sure, I will split it to 4 patches in v2.


Thanks and best regards!


