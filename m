Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBB75911B2
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 17:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfHQPkM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 11:40:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:50741 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfHQPkL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Aug 2019 11:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566056394;
        bh=AT8tQ8sV2zOi6Dtc/VRg7C7E0nn4hiwSx3ciNzqfz0w=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=avVszXptm4G/mPAGm2B4LOJZFFvuTZCLjF1eUjNJn8lyOFZUxIRW4B/FhcEGtig4L
         AUbjclSp3MC/ovb3Kkbxbk/dJIcm1s/qqLYJS3hSd+l/CJfZhbf3amk09nN7MU/FUu
         ArjZpjqD0e1DJY4T5dmLrnolBCcWis32mnASaraM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.38] ([95.90.191.58]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59C2-1i06jm1htE-001EXn; Sat, 17
 Aug 2019 17:39:54 +0200
Subject: Re: [PATCH v2 4/6] dt: bindings: add mt7621-pll dt binding
 documentation
To:     Chuanhong Guo <gch981213@gmail.com>, Rob Herring <robh@kernel.org>
Cc:     "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
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
From:   Oleksij Rempel <fishor@gmx.net>
Message-ID: <2d48f4a4-7d30-547b-21ee-6aadabe7d7c3@gmx.net>
Date:   Sat, 17 Aug 2019 17:39:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KUmLKsF+HTyzMx/uyoNKutLyersnTtU0bdigAi87JdxCt+apx0p
 RVLj0qGlC+f5yfR4KdHtu1IM+omrhfvaVwW2MV4hi+r7opWxmVCN64gZ26VXAzcYviGctL3
 FSxjqt1KeAPEmF5+5FZgvYU+qKw6UHq/f5D4zpPwtZMtAomt6s8ew+XBo0O+PSYdk4Xytvy
 DcH09fsacZnm8/qW1JR9g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PVGbF0GK/B0=:/XleIUlOc/F0S93RM3xKFP
 Yk0/MDhFODIEuiZZcww7NTjHWHwDWdxM8cYONolAPNu0VCPPYdSiJfFCKczG9KSCeCkfTa68e
 BUYzoDm8eGiOO6Qj8llb6jENGpumkN+cpSaAGDyo1UoJRsGvvefcAKrMA9mhZH6z3W5O5oWwR
 En8YCmVkeLvuksHfK5WkRMHmuzZeEY/vuBmXy1nvm4FjyV2f3sixsJR3Ir7eyNsQsaKuHc8tO
 CfzxWR+89ES0BJjwtJXtR2+Ck08q0oHxqgqtdz3fiv8OcwEUqQi9a1UP81ksV35L8LvSxL7s9
 l4Q5lcPrN6cOAdiaHIETHkFnIF1toHQY9LLzx33lqQ5yv6squyKtZ2sQ2yF7oDeAXFrDlbZly
 9DBMuti1zkraj7yjtq2s0J9DqPzRD098MEIrO9lt9CUyv77dl5G5gzgylUTI5T9rEG4+55Gpg
 8QUwlTQuWtE7KHnpdPaOyY0UyfPtDYQD/TMUGcO90WrcO0oXUQX6PMx+xP0EfXi9D+g3VDkbX
 2W+S9U1cj6XhZWCmi5I1xIuQyjald7cvR9+r5+KoLP37BMC8cmwnR89svgYxLhG0kRbhtzWBU
 lVDxZZxLIefBix90CckokM5/X1yTdzobXQn01lJ1Vl+uqmqKAZTK65eK0oTkvGqlfr08bKubZ
 etVKkkBAEPbcJQ6TU1oeQcDD02EP2rOAIETe+dj7Gqf83ysXa8y6h3BA/YOylB3UQLbW8o/gZ
 YCL3COVx1QqOMoaykUsqbIXzSHJnXuTqBZsMuenKCxWbwaHfUskhyuX8vojcfgm4O12zVICC+
 TN6mRdqK9NmqH4ht1qAn3uc1zuKzCHZyK1dhZqdH2Qa+Gq5a9KCpHXtRGdiPXzlPZrFUcLz6n
 o/z2Jq8/hYOB4KZqljfBnvyNQISqVBjRRqStpYAquRyLfnDfrAOG2+U4+npUsJVtDWH6wduXT
 ZKV5mdDQfRl0K9s/u6VibTlEbVwpB59iIaZGG8MlSKhxd5QwPzGgo/BTpbgNFOmUKQ2SjTTZF
 bljFwecu85lqklhtdtyhFFy7zqwfACdZQcgOrx/L6lB2LwWzSHvl/kq3PG2JEyq1SbAHoehon
 OZ7D7OILi5flyJjgqkI+V+jsAqry203cx6fm+Akj3x3ucT6iUDYrtkuYnqORd6kbVOWyUZioz
 iDVMqIWG4cqo+Id6x4MCvLfVfz10fpRj6PYJHUFkzW6vnvQg==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Am 17.08.19 um 16:42 schrieb Chuanhong Guo:
> Hi!
>
> On Tue, Aug 13, 2019 at 11:51 PM Rob Herring <robh@kernel.org> wrote:
>> [...]
>>> +Example:
>>> +     pll {
>>> +             compatible =3D "mediatek,mt7621-pll";
>>
>> You didn't answer Stephen's question on v1.
>
> I thought he was asking why there's a syscon in compatible string. I
> noticed that the syscon in my previous patch is a copy-paste error
> from elsewhere and dropped it.
>
>>
>> Based on this binding, there is no way to control/program the PLL. Is
>> this part of some IP block?
>
> The entire section is called "system control" in datasheet and is
> occupied in arch/mips/ralink/mt7621.c [0]
> Two clocks provided here is determined by reading some read-only
> registers in this part.
> There's another register in this section providing clock gates for
> every peripherals, but MTK doesn't provide a clock plan in their
> datasheet. I can't determine corresponding clock frequencies for every
> peripherals, thus unable to write a working clock driver.

In provided link [0] the  ralink_clk_init function is reading SYSC_REG_CPL=
L_CLKCFG0 R/W register.
This register is used to determine clock source,  clock freq and CPU or bu=
s clocks.
SYSC_REG_CPLL_CLKCFG1 register is a clock gate controller. It is used to e=
nable or disable clocks.
Jist wild assumption. All peripheral devices are suing bus clock.

IMO - this information is enough to create full blown drivers/clk/mediatek=
/clk-mt7621.c

>>> +
>>> +             #clock-cells =3D <1>;
>>> +             clock-output-names =3D "cpu", "bus";
>>> +     };
>>> --
>>> 2.21.0
>>>
>
> Regards,
> Chuanhong Guo
>
> [0] https://elixir.bootlin.com/linux/latest/source/arch/mips/ralink/mt76=
21.c#L156
>

