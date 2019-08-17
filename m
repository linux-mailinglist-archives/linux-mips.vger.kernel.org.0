Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CBD891224
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 20:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfHQSGR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 14:06:17 -0400
Received: from mout.gmx.net ([212.227.17.21]:58569 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725945AbfHQSGR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Aug 2019 14:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566065152;
        bh=vSYsCixJLJnpRSljTPp8kFKIwSadm0PjfwdHKA7QVmw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=ZejHOatP7bSj0S0Ucj32TZ+h2ql5z9r1yPL2Fl6hVwG3p6wgIYnViIQOx+w9w70eK
         8r3/jQHyE2TC54I6wNUgP/WGDFfLNMuvjtrzmjAaXYjqxn9bvazT9kuFSCI6IOx+4r
         A8lkoMzH0YmWDOyk+KIx7msIkKAd7MAj0xLXhtvY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.28] ([95.90.191.58]) by mail.gmx.com (mrgmx101
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MC8iq-1i7sn21Xdo-008sBD; Sat, 17
 Aug 2019 20:05:52 +0200
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>
References: <20190724022310.28010-1-gch981213@gmail.com>
 <20190724022310.28010-5-gch981213@gmail.com> <20190813155143.GA19830@bogus>
 <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
 <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
 <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
From:   Oleksij Rempel <linux@rempel-privat.de>
Openpgp: preference=signencrypt
Autocrypt: addr=linux@rempel-privat.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6b6ee744-61d3-8848-19e7-0a301fe4d1b3@rempel-privat.de>
Date:   Sat, 17 Aug 2019 20:05:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJsYDVLq1-U_AngA4=YKHS_L=zurhLse9XwQ0Rzup9BdXfri-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CC11gXrH7PP7p0yZlLfF2cNZI7+ztNGmwpI1T5UQGc/7TVF8l91
 TYj3r/ZAZlhKB7EdxF/fSCWDMEyz1VXfex1KR/BAGNIP20RKjF8xXbRp5mlKxlX4AE7Zaeh
 CFeQgpMRZ/vWwTvlid3VPfoGry4hPAFxMgOQfNkZ8d6mdDRT9MZMYFfBszgDEkq53u465mS
 D7ZV8Yj9Da/cPqhcQTALw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6vv1h5HT6Iw=:aNYJ7XanBeXV+uSb+PW08L
 Yvq7ZvTFZzzmk3qH3Od2IIABigg+pE2PCRq4447KKb5WtTJPeG3Mcd2+c1xQkBFmFKhWG5SY2
 0CKKollCDbccdyKrDiRbYTtGttAAO0J7Dnxb2Onz+e3AuDwpkw4j23rQ7ri7AaxRzNu9P9myb
 wUlh8eh85nCecfAwphtAp/g2+u33BUuKV8UW9k1ddQBQAKmGm0idrCsjEZyoPawUvCEaKFqQT
 mVix2UP5esN0pF2qRXoViYmuM58g2hoALh8G+pZgtobDAXjOtc+ydNbXHa9NT1Bs9iqMhcfpk
 MxvpimXiJ/0vIr2oxrOQq1NevrLLW+OQvH785/bevVBQjQRMIGhxCU7xHej036LnV+SA4WsYI
 v8pCqzfUtmhSvP9U/hwyy/5RSXfJ8Tylj3Mn6JT/yUlD6JNjYlDq4EpUKR3H+VHa3M/FhZK4Q
 sH6N1xWE+rl1pGmlbs+fww/EjgEhQ6ZCwx+bcpJcVe4GRXui5FrEkv2t/BSpL0A7Zy8Ol4r2q
 k6HQdOhM9bxt09WHp6AQvIHbZySSx3OCgGY0gtGpaDCJhLQ3Df//6WC7yGfd+IYsrt9/wt/Nz
 szhxdECzoHPxNxHZZmMkhu4ETkPqV/MdVeJG4ZBTxwh2mUWn6TjvVVX1K0YIvNmOsTC/WplGA
 IxE7sHMMu2jmrEWo8KKvfKFJ+4z9DiyiNAAYOf1W5gCAlf21Oo6RELkiWLE1cr8yPtUndzDfa
 cvyF3xzzRy4CYSTcbR8Rj7W3NKvDzyhPlvd2+AZdjTnFqbkKEQkCLt6R+wtRuu71LKDcrKmhq
 +YcnEgwsuEb1jXydgnAaxR9RjEGxMqjwH66YyKZJWDSCc5HOxPJhgoVzlt9lxhtX3WOnO3Amg
 FzEZM8/29gCS34Bijm2vEMviqRyiB6cM+T0BktsIQhs6kXfQXfumyV0a3TydBSUW8SpnhDuWC
 mTEvcTIurjWpmbGBM/494VvmZsmtWPDp4ghyB9CDd6leXNYm+UmRil9ajZLKiKD16ybrvRJXf
 M/IMNcSgu7H157Lrpi+e4+8auiWTXYhjgpdxWvoxSeU/SFxr0igFFSTSowvHIP5YC6nZM4PJ2
 kDGWntutccpqYG1PiRGUf4snBfA5D9BWceTiZnKzYxSiCschkCEtpRWP0y9nF2YBmfGJzdvWy
 U/LYs=
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Am 17.08.19 um 18:22 schrieb Chuanhong Guo:
> Hi!
>
> On Sat, Aug 17, 2019 at 11:40 PM Oleksij Rempel <fishor@gmx.net> wrote:
>
>> In provided link [0] the  ralink_clk_init function is reading SYSC_REG_=
CPLL_CLKCFG0 R/W register.
>> This register is used to determine clock source,  clock freq and CPU or=
 bus clocks.
>
> This register should only be changed by bootloader, not kernel. So
> it's read-only in kernel's perspective.
there is no kernel perspective, until you have some kind of privilege
separation. There is only: "i decided not to write on to writeable
register".

>> SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used t=
o enable or disable clocks.
>> Jist wild assumption. All peripheral devices are suing bus clock.
>
> This assumption is incorrect. When this patchset is applied in
> OpenWrt, I asked the author why there's still a fixed clock in
> mt7621.dtsi, He told me that there's another clock for those unchanged
> peripherals and he doesn't have time to write a clock provider for it.

Can you please provide a link to this patch or email.

> I don't know how many undocumented clocks are there since this piece
> of info is missing in datasheet.
>
>>
>> IMO - this information is enough to create full blown drivers/clk/media=
tek/clk-mt7621.c
>
> And this information isn't enough because the assumption above is incorr=
ect :P

Ok, let's assume I accept this not technical argumentation.

We have at least 2 know registers:
SYSC_REG_CPLL_CLKCFG0 - it provides some information about boostrapped
refclock. PLL and dividers used for CPU and some sort of BUS (AHB?).
SYSC_REG_CPLL_CLKCFG1 - a banch of gates to enable/disable clocks for
all or some ip cores. What is probably missing is a set of dividers for
each ip core. From your words it is not document.

With this information the clk driver will provide gate functionality and
a set of hardcoded clocks. With this driver will work part of power
management and nice devicetree without fixed clocks.

=2D-
Regards,
Oleksij
