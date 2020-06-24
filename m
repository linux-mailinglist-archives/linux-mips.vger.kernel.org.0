Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2E6206FEB
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:23:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388658AbgFXJX3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:23:29 -0400
Received: from mout.web.de ([217.72.192.78]:52997 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728637AbgFXJX2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592990586;
        bh=6qoeSWOpyZzTvuHSrKxIyyh7tHiK/vhd38koaTuFLXE=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=r8An7gbqeihYEzEnxik3DN1CW8Ssn2ZgbyfMnd2KyJdV4YuXYCFqTaZbW+4ejSYF/
         VLN9T29jIMX4AgZpZ+ChGDBPJF8yBm+tUe0IuJQtp8yfAfeFBn0P0B0S/dH9ygtuFO
         +Ld7ChkcDSQ6f4WjnBStIcOul5HaauMhfNVu833c=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MNLS1-1jlWVf1Wm1-006w8x; Wed, 24
 Jun 2020 11:23:06 +0200
Subject: Re: [1/7] irqchip: Fix potential resource leaks
To:     Tiezhu Yang <yangtiezhu@loongson.cn>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
 <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
Date:   Wed, 24 Jun 2020 11:23:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NhIeigujJktRoVitrLI5oXMVlaBad1PG5SDQ6AukZzK/DbbB/Sd
 yIyoo7qmiTDHWbbjg92VXvYYlSBpTZdc8H4AnUuNc/+YnpP4qY256HlY/1Ywqn6Ca3jf72W
 ZyXEEXXFcBQZVNd9RyvA/G/jTfohu/vG0RkF1v+v7+tD6gDzngl85NdhGrtijdUoLZ4/7yV
 nj7jtp4/jR0NiI4MdPmFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DQ+uk3RZryU=:aO4SHXdDs5jU6GFrZMScqK
 gNSBCXOYlishTqBqvUzrljy1LhOSnuw0lI++Ki4zs3xDPK1qCtK4Blod3SHxSZMqUBXTZyCi8
 bQPeTJJ6SrDeXJ8P1P5apYWwBJXINdWoRZw6ePWr2BV1UciOfeWLn8nqmqFWETnk191fLqcxW
 UgkMzqDVUpvoBM8gKGymMKOEoJDvn3/kSsMw+ItZh1IDVNmf/SneDy/akYiNWhr0gJvF0gzDc
 KDINgx/eB9SQDpcxV2x/mgeKdQz9dzZ5elzuAVp3ChTS3/qgh6CL8vgM4ssOFxcIGB0mV3Hxh
 huXKY/JxqtEVK70rB5FG1b/lKuQS29PEY2M0YnqM7donOxT8dB2Df1+IrOSwN5rhtT94aV6p8
 MBS/GQCcO7dD/SV0Gf/069l5M8tEIj1wIP7vQp5qETUiotp3QdHLuA5YSBDrTtAO6fnePNHiP
 h7qWQ1iyiAZ0MC62fQB38/JL+5IQNB8elwdvU4NYQ1PHqSNRGymQHCwQ9PRU1A+LH/UT7jHjy
 v6+9H9AJUTbvLSZbnv0/bZN3JB7GmZNfaie3XHLCHYT0TYc26svl7cbNxHv3MoFKz9PM29NvQ
 rRFT5VqALh8QLCKBNbmZlUK6AV4qx3ji7ruxzIrJdrWFacA0j/2jUW6JCPVgkzVatyOxt+Rsi
 i0RReUWSyA6mWRI4quCzxjW+HOLcUH4lXWTVBHfq3cMztlx/AOoX1PnCoKy1o2DPbtnRl6MoG
 FehCfnDYspR3qu2cD/uT3oBSTueH/PPkBjuH914Rwi7AZ10jgjvfDF/W8+ChywgGKAZ8HMIty
 WXeXmb0g1VONnDt4fMb1HUTGio6HJ4q2QDWIeH0dw7ATf7IQ4/W3w6xvwGeBiaL9y2JbUNXYp
 F3GdXH9GRhGLArZOvqbQuvpRz23Y1gQR0Xm6oU54j6JSj1fnjfZvgkRdYehzDUzSSYtIIfc2n
 eIxyYIzYEwErbKlELHeTXO0+8Dfr9l4gnvN1RSe6t1s5W+igg+lB7qoR4Slne9DtuQkr32c5D
 CmCqDvX7y2mZ2LsO+aKghfGaKeTzYQkpeFa/S2Cn4kFtQLU6iFul7/gu9DcgqlQXQ9o59t9s2
 sMdcQW3XEPQEol2Ub6kUW1NdgUgVFnp6LtpAmp5EEWYlrJR53tSi0fp6B9EpkEO8GgZCzm+6d
 4P8dwvOLMDAkxnh102Pv17UVcdhqH/QIIYB2LeP+V9Tb9Xqcs609qGjD5TRhc1bn0J5e2njfO
 BAt/H+R2DjW0I5IaO
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>> [PATCH v3 10/14 RESEND] irqchip/nvic: Fix potential resource leaks
>> https://lore.kernel.org/linux-mips/1592984711-3130-11-git-send-email-ya=
ngtiezhu@loongson.cn/
>> https://lore.kernel.org/patchwork/patch/1263191/
>>
>>
>> Can it matter to omit the word =E2=80=9Cpotential=E2=80=9D from change =
descriptions
>> after you detected that specific function calls were missing
>> in if branches?
>
> Oh, I find this issue through code review, I have no test environment
> to trigger the error path, but I think it is better to release the resou=
rce
> in the error path, so I use "potential" description.

Did you determine that special function calls were generally missing
in error cases?

Were any known software analysis tools involved for the detection of
questionable source code places?

Regards,
Markus
