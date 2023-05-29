Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C2F714484
	for <lists+linux-mips@lfdr.de>; Mon, 29 May 2023 08:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjE2GZC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 May 2023 02:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjE2GYu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 29 May 2023 02:24:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F817EA;
        Sun, 28 May 2023 23:24:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 14E76612DB;
        Mon, 29 May 2023 06:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BE1C4339B;
        Mon, 29 May 2023 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685341457;
        bh=xZQ4c3sZfJ1nNEi2GqOvmmx6GGK5BJZioTZWTyJcUB4=;
        h=Date:From:To:CC:Subject:In-Reply-To:References:From;
        b=okzVTHJLaVvykLXWWqT9sSAnbTsG6R8QSNm5nJZtaHcteF7moKcxFof5iXFKkjQoP
         whTfYpmf7wITNgUeZQY3/CMYYN49UwsjXJ3N9bM/8nRTuCw/t7/QUfDdqEvZSqddUF
         ZJOtRGIRS0uEEhi1gPXod8SJaxKe+fbomEZCcXCqbr1jMi/j7R2mM3mAAy9DBg1TJ8
         RVTTT8q8CqdqA9wM2LtOhjbQv/1KYVFwqlHieMnihPuPdiBc6Jzcr82ySaf6LhcE5d
         13oAJ9Pk0IbwUXy+E2HVjxQYXO5Xo7Jx8mMudbiXoi7X4tziqATloY6krK3RITdE7g
         pTP8URjybR0HA==
Date:   Mon, 29 May 2023 07:24:12 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Keguang Zhang <keguang.zhang@gmail.com>
CC:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Binbin Zhou <zhoubb.aaron@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        zhao zhang <zhzhl555@gmail.com>,
        Yang Ling <gnaygnil@gmail.com>,
        loongson-kernel@lists.loongnix.cn
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_V4_1/5=5D_dt-bindings=3A_rtc=3A_?= =?US-ASCII?Q?Remove_the_LS2X_from_the_trivial_RTCs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
References: <cover.1684983279.git.zhoubinbin@loongson.cn> <9a2fbd6860f37760ca6089c150fd6f67628405f6.1684983279.git.zhoubinbin@loongson.cn> <20230525-custody-oversleep-f778eddf981c@spud> <CAMpQs4LuGAUfMNB93B=vgwJaLqEM6Cq5KyaCtnHOL7RWGuZy-w@mail.gmail.com> <20230526-dolly-reheat-06c4d5658415@wendy> <CAMpQs4KeHCW+9ssAn-jF0efiUOzERRFDu9Sjz1Mtv5Lk1uFuPA@mail.gmail.com> <A206E0A5-9BF0-4787-9B06-9F91FA3C60A3@flygoat.com> <20230527-passing-unfixed-39e01b787808@spud> <14EF9F21-8150-40D9-8870-E9151C4882CF@flygoat.com> <20230527-poet-antarctic-cc02aa60ab52@spud> <CAJhJPsU_qOJKO99S1xjJaSUqXsXAG7HpYbzs5wTb8J4-tQqSQA@mail.gmail.com>
Message-ID: <E229B204-1B00-4B24-B4BF-15277682FB4B@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 29 May 2023 03:59:57 IST, Keguang Zhang <keguang=2Ezhang@gmail=2Ecom> w=
rote:
>On Sun, May 28, 2023 at 6:22=E2=80=AFAM Conor Dooley <conor@kernel=2Eorg>=
 wrote:
>>
>> On Sat, May 27, 2023 at 10:59:48PM +0100, Jiaxun Yang wrote:
>> > > 2023=E5=B9=B45=E6=9C=8827=E6=97=A5 17:23=EF=BC=8CConor Dooley <cono=
r@kernel=2Eorg> =E5=86=99=E9=81=93=EF=BC=9A
>> > > On Sat, May 27, 2023 at 05:13:39PM +0100, Jiaxun Yang wrote:
>>
>> > >> My recommendation is leaving compatible string as is=2E
>> > >
>> > > "as is" meaning "as it is right now in Linus' tree", or "as it is i=
n
>> > > this patch"?
>> >
>> > Ah sorry I meant in this patch=2E
>> >
>> > Since there won=E2=80=99t be any new ls1x chip that will boot Linux a=
ny time soon (due to
>> > Loongson move away from MIPS but LoongArch32 is undefined for now), a=
nd
>> > rest compatible strings are wide enough to cover their family, I thin=
k the present
>> > compatible strings in this patch describes hardware best=2E
>>
>> I don't see why new bindings being written for old hardware should some=
how
>> be treated differently than new bindings for new hardware=2E
>
>Let me add that ls1b RTC and ls1c RTC are not exactly the same=2E
>The former supports RTC interrupt, while the latter does not=2E
>So my suggestion is to leave the compatible string as it is in this patch=
=2E

Just as a reminder, there are more than ls1b & c in the patch, lest we for=
get=2E
Also, fallback compatibles mean a compatible subset, not only that two dev=
ices are identical=2E
The interrupt is passed by the interrupts property=2E

