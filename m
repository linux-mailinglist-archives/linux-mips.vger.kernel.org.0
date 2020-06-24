Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11AAC206F25
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 10:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388437AbgFXInb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 04:43:31 -0400
Received: from mout.web.de ([212.227.17.12]:58353 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728910AbgFXIn3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 04:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1592988184;
        bh=/LyapCeEGkBjJWsdgSZ9fvwivnH56N59T3IclNZa5Rg=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=YwSk4wA0zFOxK+CNXfnOG9rlGX4lfvSPpy+gZSRZl91vBBD/9Zm4k1E/qDjYYYpbT
         FyxPSo7T6cfKu43Lgvst8p1R6x0qiNZbuZAsdts/glL1CDjkxNhbDb7mMx9qHE1DRO
         sboJf1X7XlnwutNEebcyy64FDZgNBl/skMs/MIa4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LaCbS-1j8x1V3jry-00m5lb; Wed, 24
 Jun 2020 10:43:04 +0200
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
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
Date:   Wed, 24 Jun 2020 10:42:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RaN5aQNlq0epBP+lNrsK7RV/p4/eZ2bjrAh+VTsO2b92T2UgCD/
 rAwSx75cIV3HUIBlgqB76lKlob8Blyuxj+6Eg8hCRGFGmD0Vsl2EXVcpCNg0kOj5VwOAw8r
 ViPF19vdDrxMA73DNzfj0DX8H9n7lAxicSH49U/pY6QYggfLLiY6nk1Q0TOs9EtaPFa1Zd3
 wPaD+jMBL8QWIKyF9hzrw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vF/uD0RHjcI=:LYloBF5bLG2Jxlbb7Ihr/N
 DAsNHvlTidTtdeXGnrfWgfmxchDA+J8ayUzXM6ovKcHm+PbQzR/4uEOD/L/uS7aYhVbMjrI0B
 R2lbZnn0/FTgCh7jnCrmpF1xArVu03fTdI39wXrenK7R3KDXT6qyl2rbDo5K+o51IHvaeLiJ5
 vCK+Rmpia5F5PYctB2H5KjiKkmXAefHAuKY/s6Cxb6SCwRD9lV6A5D+JCt8oE4hgRMBI1XTKI
 4B8EAb8+h2QvRDaXqooHVXg8q9joT0k9Rbjcy6UO+9K69J/dMZ+IhMzcL9IWQATviIPRXisr3
 Lukp4UoAbKdlSph5d0LhIx4ooE20xlEcDwQTba6RXF4qxm2yi0MWReaD8ChKpYlXI3ZlvXOhw
 oHLJoU8g9n5z79SPA4C5WhTf6EIAB88GlSm8T84lSZOfLsr0iy84yJRxuRJ2LiE55o0QUXrS5
 YOhP6QR5/0KIoTZi2zdZ42+iIvqGkw9Qm14/EmHIR1Y2ydOic2XP3x1JIctwPb7sZJQPg6dax
 6Ex5Cpgf/oiVEwhZQiQ6gJMhERtfIcYKA857eiKJS1UeKZ6RDoSaI9R9O13DVt4RitrtDYF++
 j2HXPTmcbVTpgoYGisfpsGe7wy5JrgBjPI2mBfD3Rea1LR/w67ZbvrJuM8WCU3V+4w9FRhYTm
 tdBhbryNF5M04kIfAjeUnyssvyM3xeW13+N/nscf/96XJdSqlRwDVxLXnkHQE5RSduKip8UOe
 8l+DHDCA82JjyZ1ziH1Vgx0LDlX1qXCXsyjDlGJrZLA6MvTCVgkkyXtUEE5jSdSJnQ0WgX9WD
 +EW8cI6YlfwBKceQ9d2w89sn9NX/VEGKGd4J6ULmczu+t+NfSnYImx7Fph/Evd2mch6+jAl6D
 30N1Vp2MGXT+GK34W9+nCEbJC0sgh6+PPJH94gXE/LgHMJfHrgbrJZK42NbSqU4Rbr2L9GgMj
 87Mi22pPGNX5vbcVEZtdv9VtEwbFS5rCC8JOiykFMdb7Md7zuKwX/aQH9epLTl2K6xmL012B3
 ThgZV5FV2Ly9pWqpmqHBrDTccMCjyYu1HKusZe436dLYgStBEBRRkGH7OsCZcW5Q7oOTGRmIc
 J/ZlNrOQz3y0W7zvyX71oTHBM4fqj2bWbqd0G4rwRfqccH7PcO++rvnKT5GFrxH1PepRscKn3
 rkEaPIt3uY/H8GTpqUh6A77s9r8kMuAwnvvV8wEjyHS5rYeUNY65vtCxFDuTHb40E+xMk6gDb
 wPgQYFRS4X6dBMl8B
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>> Can it helpful to add jump targets so that a bit of exception handling
>> can be better reused at the end of this function?
>
> OK, no problem, I will do it in the v2.

It seems that the software evolution will be continued with another
update suggestion like the following.

[PATCH v3 10/14 RESEND] irqchip/nvic: Fix potential resource leaks
https://lore.kernel.org/linux-mips/1592984711-3130-11-git-send-email-yangt=
iezhu@loongson.cn/
https://lore.kernel.org/patchwork/patch/1263191/


Can it matter to omit the word =E2=80=9Cpotential=E2=80=9D from change des=
criptions
after you detected that specific function calls were missing
in if branches?

Regards,
Markus
