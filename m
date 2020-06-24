Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55AA520740E
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 15:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389515AbgFXNNH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 09:13:07 -0400
Received: from mout.web.de ([217.72.192.78]:37983 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387747AbgFXNNA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 09:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593004360;
        bh=zAuqcv5c3pQC472cThqMqd6o0JE7uGZhrYFFqHnzpD8=;
        h=X-UI-Sender-Class:Cc:Subject:From:To:Date;
        b=c+9zBn6OyF/rpjb+YDc5rw+SBM7IvLd5lGQPuoH5DrOICqy5pcwfXOp7+icjc9/Pd
         8EKEdetSa+AhQeFrYEoQqkr8/9agn2lTlnEVNaqVxhbJy/vk8MNZeq9WUQiKFnJ8Md
         DMkZ9N05ayEagCWiqaT5YElLlWbHvTegoHcr3S9g=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MJCWU-1jpkA6120A-002oqa; Wed, 24
 Jun 2020 15:12:40 +0200
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v3 04/14] irqchip/davinci-aintc: Fix potential resource
 leaks
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
To:     Tiezhu Yang <yangtiezhu@loongson.cn>, linux-mips@vger.kernel.org
Message-ID: <0e39761c-4673-d116-fc62-5573c2abae06@web.de>
Date:   Wed, 24 Jun 2020 15:12:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iW2saXIEBgXpQgxGEEEAAuU/UAEMLXSGs8QPxotSdz4VN/pt8gG
 bUe+HrEuJe5IJ9frdJFu9HcKU8xsUSsN1pto+heV5fgeXLLrlT255RC/mWyKwUGbPe25/yj
 t7XA5VnqvEK6Psog2HZORolEhl1IBMQhjJ0fKt1XHf0hEqiu0MdOb6pVNI5Oiyl9ZS2waLq
 D0pxe38/f91vHg4dwa+/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:NoYiJ7pL76Y=:cFgWgkXpeqrUwtzfhxgtW6
 jHGJuVXqtkyzFDumiWeF11aX1y5BiUlxG1wbukz44LL42qBsFv+ybDvx/EU0O0MqlKr5kK2nn
 Y5q86y8m1MugsiNPdGpG0wr/ZMRmaxBO2QxupLeGKQLZis/4RBmJEltkwCGrCE/k9j+37LG7f
 KFsDtMxeLg6Z0qREVLGZZg3d61wMzXNsztW6DigVjH0O/Zl7a1TR+bOrp4IpA1sj2jWORi/5X
 DTbioo15gGkaEsXqee2JXQONRVzqlcYWro1s+OKfy5Ugk2nEojo9lzWXm63wox2C67+RGawKv
 FiFyVDfT1aFsa6Qcgzj5KF/Gd0pcRfDpQ9H+jUIJ43roQlAn0bU0HKs51NeHs/QizXURkEqv9
 lB1m5qvEfv3pF271/qpKA/k0dvJ5t07S52UrnTxrnt3mxbbqTfnLaj3UMl7EcRQ+f2D/ayn+/
 kA+GK/wnVP5PP0H58GBiy0Zo6yWUG+Nppz0TLBK2wovJ3K4ps1xQZ54eBHQg1tstSeWfN+2Gq
 v2DxWNof+WYxcdaKeu5pD7P+W8twApWXPH0u8Ibmio9Ok2+ktJGsD6hsV0c/qbD7YPiPbOaks
 x4wgAonmysZSG+MJKjj2r6VsCdHBuf9NM9CMyv0s8+FxSP8iLOBQ9Jivc4lRDT4hIdRNvObnL
 s/pEeHOKRFyj34fvr9MjvtSzUtJyvUs/fos4TcrhqWqmsFEe+cYv0dl/i7hhOxfm/hRSaBumQ
 ImDMIiU3ECCFDcemPG2oDgRkUUEoHbWXOUvuFT/bDgI42MlhsqSLQLzut3EGLJy96iQujKKjb
 Nq77Gy1SKz+YBcwYkAtm7kSOQ315DgfLn3jotMIapu25RsnRL6NnZYM7MjOOpmTmWl1iV9O1A
 jGsN/D6mzvJgaS7hCjDNcVHPCLhhRs8Ni4/YFFaZfloS5pkpeDQkgmQag9eolpQAEEp124XVy
 n9K1vhAch2iDJeG3lUbbKxVj5i9j3LBhffENGOJToVfvUmLa/HjpFCN5IQqvl+5otxqOvayHN
 W6qVfGS/wYBeKaNqapzEpn11/rv8EZJmtd2MrHbylHj/O3Wd5RjfgxPhlUxgQCS6PSTyt/BO0
 r/qyr+X6+aKgW1kxhox6UehIjCTN7t46pmw12lraXOr+MSW5Lmv6TaiXZav1X3I8SXEp+/5Lo
 H7YDhWhiREKxk+ASQ/PvjbM+QY43jZP3E2qmRdr0yMo4f7E8/4iz0fBP8emkQ2UwTu3hnYZW4
 v+pSpLK9snYD7dESI
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> There exists potential resource leaks in the error path, fix them.

Would you like to reconsider this change description?
https://lore.kernel.org/linux-mips/be3acb13-2963-ddf1-a867-7e30fd23a0b4@lo=
ongson.cn/
https://lkml.org/lkml/2020/6/24/498


=E2=80=A6
> +++ b/drivers/irqchip/irq-davinci-aintc.c
=E2=80=A6
> @@ -160,4 +160,13 @@ void __init davinci_aintc_init(const struct davinci=
_aintc_config *config)
>  				       irq_base + irq_off, 32);
>
>  	set_handle_irq(davinci_aintc_handle_irq);
> +
> +err_domain_remove:
=E2=80=A6

Are you sure that you would to like to release the allocated system resour=
ces
always in this function implementation?

Otherwise, I suggest to add a return statement before the source code sect=
ion
for the desired exception handling.

Regards,
Markus
