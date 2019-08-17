Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6F0911B5
	for <lists+linux-mips@lfdr.de>; Sat, 17 Aug 2019 17:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbfHQPkP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 17 Aug 2019 11:40:15 -0400
Received: from mout.gmx.net ([212.227.15.15]:59245 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726010AbfHQPkP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 17 Aug 2019 11:40:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566056403;
        bh=xLEnuBmrR/uFscSY3VPh/qzC4C+JNq9Vyo2I8dKS2YI=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=aA3hPGlbuVpiWKoc8wIDGR4Rg6xTPlSTJgdEPKIBVA43k6SKzNdD0udOR1RJ1yD02
         W1MOsNkehNZl7+/tKK2YeUWhm40lIJr5QvHlHaRWZWKN3ADgkrCUvOoHRp+8fpik7Y
         uqRLjZWUOsLQZiaG6+3Lo2Ro+zj5lmYlaoKqhIrI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.38] ([95.90.191.58]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MarNa-1hfoy1225S-00KPLm; Sat, 17
 Aug 2019 17:40:03 +0200
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
From:   Oleksij Rempel <linux@rempel-privat.de>
Message-ID: <f0743ace-0ca2-82a2-a162-aaa98c8925a8@rempel-privat.de>
Date:   Sat, 17 Aug 2019 17:40:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJsYDVKnf4M8jyVOyotRxs=SsHqjex_q60AwkX=QAPK33ivw-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Y7+/rIX/X/rHWVa8YAjwg6EVopQ5xqOASiWpAFiqfw3VZUxwevS
 XD/pjP+cds1KG21PWSwAduQgKrD5V5Js/ozzRzBAgpWEUlO2BDFsngZI9AzXfxu3gjMeXu6
 2MEa7u3TVzdqM6r8k8MVZKgk2M40uDJeUF3K1jRkrZMw8K7bozhkLHf0AS8PVq1qZpliVJX
 UayhG5CGqUZKsTzKGJu+Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:DxkriyoTxEM=:jHH5kZJfD8KOrC2FJjZYu6
 geOCCIB+Lkq2z/rSxuokzOy8KhH5c+L6qBqV/h66kCQpWNY1Ht5+qVgowyOii+C9L6zcA9bhs
 BDW8yHu07u0AtOYtRKxZQpX4wG0WOjaOOCr5CKh4ON600Vjso1aosZtlaT952SF6bi9ghB0eS
 43giVmSi0nA9gVv/Gbb/qFCq6QOWqMeWfZYZZ0DTD26vWxAxTRuVMk+bf5dUHamDnA+A3vvi8
 A7Y0f3FWbqt9cnaPQ8ToDMmIBJ+/+++l2joHOxmg7fflhTMLzN703Y65xAN8enfCJwC/OOWP0
 UF+spDJQdVc2s25B8YBU1jgY2Q2yJfEaU9wUw5wJtO3iTo2m0LLfRF1BkfcKVSj5CF4Fku0Vj
 YlLIqQYt65zhFqLeWp+Ay4Cwc8P0UqcOeP92G1mbJ9VCPB29Ca9e605tldCMlD3ZnFll7yVpp
 kBoYeb2No+CPXAFkTIiXECmWqg5RsammYQdbIcO6U+gTGazgsDM11D9XUtgKZvF+N/FN3IOov
 pu7pvlhV9ylrpHOVi6qQy1ZGBxJkUFjBgEdn3pJxkUCl6ssb7Ibh+F+oGk2qgxtybZyZFq8wg
 dlmtF3x8y0L79DToDloUWJE3yd6nTWvKeXWSf/1WS1KaCkqgok0wvQ4awJLAhCh+gzZE0O/Kp
 YxjI1iBFVVyVzl+KKv9lmKEx4vZK7E8il5tti7dtxZAiWk8ac8rXzYYc9QMu+azpNxTZDBmCm
 1o2/gTyD4p7vqs6Q+okvmPUKMwSdjxTYg8eGNsYnqfdnedvO+u39Y7zoKFm6sP3I0t3C8CvB/
 i3RjEFsytJ5ddbX5Dh+oeXOKkg7kkkYR4UilUZ9T5m3A4WNo6mjJRu8e+AAlSBTqLgFjMYNk0
 rXgRqXlbklmn6tAEIj9BD0pdS0nhoRfirVcgaUdhTgF23nBNJwqIAFmUApaOg4EQPmKyiU1QY
 6RqOKsMmOriCqZ5Pku10LIXbEctVjiS8HXZk1zICmnE+nYj82j/2fg5xfAOvNubV7fSZKGVXN
 fIZGZ7O6dFdKwr3KVAU0YSXdi5pBvpBl29ed2qkakMSt5ZU6442swA8M6EKM2RvUpR3fZp7GU
 DV/IcEdqg6bpspaX8YpUEXibFkeQTQaxrS+PXTPHhIULbtwfJJrJ4gF9Yp7a0p6P/KUSvyeEc
 j+FAo=
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


=2D-
Regards,
Oleksij
