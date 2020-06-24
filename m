Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043C02072E7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 14:09:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390052AbgFXMJQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 08:09:16 -0400
Received: from mout.web.de ([217.72.192.78]:46053 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389376AbgFXMJO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 08:09:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593000535;
        bh=uybshzasRqTcZW79c46LSh2lccop5yXtAJOR/YpgACY=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=eA28hmyU++R082r86ENS3Masxush3kNB+0tHDMtS+O+SScIbvRcUjW+XgaXaUx7vg
         z4J1cc4GXJ4Vwc+gl3ZYZVZo3G7xv2nnOnZR4qHbOrs9prcfA6eS0KLdDGRyvF8Rre
         mZ+UrdXqxrgxBgyVljJtt1RfXY9MJyFoj6zHmQ6E=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.175.204]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0hbG-1j06Fk3IJ4-00utiD; Wed, 24
 Jun 2020 14:08:54 +0200
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
 <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
 <423f83e0-c533-c346-ab8b-f2c6ccc828a2@loongson.cn>
 <37ff7ca4-dc7c-6a43-94a3-9628efe69b25@web.de>
 <8556e402-52ae-849f-2f6e-e56406057dce@loongson.cn>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <c425c66a-d2fc-dad2-dc98-31659342a5fb@web.de>
Date:   Wed, 24 Jun 2020 14:08:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <8556e402-52ae-849f-2f6e-e56406057dce@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TMrVdAMv2r4yE0IXrqu973sG93qI6PprVOuEjfmzb9NIxtkbnn5
 5Q/GJuiHLuSfVh/vFKw+nQ5H9KmvhwfP1U2y3dRlz8LLeNX4xa3Grr6yh3gc+TEpPBD4jxW
 09FlZ+eR9Fz5kfB3r/csqh8wdNiYEWe1INKsIJPjx/9UIbUYNapGFigNLJX9x2m2JK17FGZ
 oN9ntbjNcRhNizIx0Or3Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PGtDIMoWboA=:b2k3jubGkn3HRTxlmhNReY
 AuUb8DwjOxV1JTNnNf5X3q/4+2V25zjbQxvDXjAgtk5WMZMwvPZ0x3oaHFvpB/GM9h1UX0seE
 lxIph6q6ZusltwPzMvIC/JnSA8kSCkTPha6w3d+nJaZltvyMRzdGUlq8vMoj4A/CoUUDavtA2
 +gEnSK2tB/+QwiwDtfuWtXsXWAFY4cWGNBmVOrzdJiyagT2/xVP7oMq5XRdLcu9iu8My093Z9
 sW54rsBIUbWoYSM3z8wOgZzF0r+Nh17G8NJ6zgeG39gz4gX2tNloe8eVXo/JyjMHALK8VCJs8
 lI5rDndJDfaFHBbD+k6z4mt6v4tmto79GtYJ/aeWQGeQDKY+vneDd95Y0IKDN7K3e0zZNypNs
 rn2r2ssu2hn4D3W908tHbaMKWz0dqu+jlaQmG8uvm2dcqX7CW3t1LBkOzocA1znGHFqTZwpJi
 nGIjCBivUBtiVZgtyPz1UmAE/FWm534A+zAiGtpnY17rm4H12Ii7gLuZDAy0sc45oPMst6nPm
 GCY59YTe1TA3Y0bkyzUkcqLgTvm7OOn9JnoaOgq01X0mhTNVTAHPaAZYOG/QKtDBOcqqP1Lee
 tTr8oo40DmVN9idnmq9P1BHyVQqME97R3Rz1Xf5CHAcipW8jdo1bw+/2c1gHorwootGa9pECf
 fugiEozUJyBMOE3GymLWaGEF4Z+pG3nMZ2xRi46Aol7M04yoLnj8WGhpUYMvCrJj+4ta/f/Ga
 NMMzKiITIwpQBkaytmftu334aCDSx/tw3Nr1bPUWWOmeTOouTP5dmZUGm6mRWC8IV3GHNzDpF
 dD9aQrotHbQpJZtu3g9jjvRpqUaJOJ3HrYYfJ4PDP0pxdVz02H4XnEVjr90zCa8KFCrT4Uuli
 naglNF/xOFfYOpIlE4pZhhj0fHs6KdCAHWiP0C5r17zQI/IfNN7dKY2eRusnVMj3QyOB7/KQ8
 9jbrony9Oeb+B/dF2ph5A4YvAawFsjN92FeCWA/Mqrh4SuVcXQkPkx10EhNR4TR3RSvpdjn6W
 77BlSdm0Uyg0CciwMsti7c2a+K3yf4TdvJoI+ZRlmhfPdGufiErQrMBOSuT1S1L9Phs7cOr0r
 xw+epbsdsCUvw4KHeozp/gt4XWLEkBi/QJ7MaiBGTxNDHUlbkWBMjO8zc5lj+YLO6P5PNsDfa
 YpWAEF4tuPCn4RaZqnZVJQ5//yVZaxBu53qfJAuyejagYto/ss/Q2yL8pyMkZk5SsKv0OwZh8
 zJRdz/XVrq0c0jm8Q
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>> How do you think about to extend source code analysis tools accordingly=
?
>
> I have no good idea,
> maybe some simple match check tools can do this.

Would you like to help with any additional software development resources
(besides your current contribution)?

Have you heard anything according to recent research (from computer scienc=
e)
for this application domain?

Regards,
Markus
