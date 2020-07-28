Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1FF5230AA4
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 14:51:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729562AbgG1Mvd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 08:51:33 -0400
Received: from crapouillou.net ([89.234.176.41]:43316 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729334AbgG1Mvd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jul 2020 08:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595940692; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d6LEaQ5QXtKpB7Ve+o/tB8JqiizNP+42SBXIHX8JWEg=;
        b=jSac2zYr62B8+eaewzOIX7FUJY6rr3kuCXlOd2qMiqxaPRWa164pnS8bp6AlwajurTWL2b
        7MSo5mzivOQGsoZW++dN4t9vaVYBUYyO1CKgBLEL1qxbY59HZAvTrWP+Iub5d7ye41cbc+
        NNJX4eBLSEUlUpKKyVC3KPbNdR6PJls=
Date:   Tue, 28 Jul 2020 14:51:23 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/2] MIPS: ingenic: Enable JZ4780_NEMC manually
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Message-Id: <NPJ6EQ.I4K2FZ2BHH1E@crapouillou.net>
In-Reply-To: <20200728120035.GA28766@kozik-lap>
References: <20200728104503.23655-1-krzk@kernel.org>
        <20200728104503.23655-2-krzk@kernel.org>
        <B4F6EQ.WB2WZOY40FDR@crapouillou.net> <20200728111935.GA26683@kozik-lap>
        <20200728113702.GB13443@alpha.franken.de> <20200728120035.GA28766@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mar. 28 juil. 2020 =E0 14:00, Krzysztof Kozlowski <krzk@kernel.org> a=20
=E9crit :
> On Tue, Jul 28, 2020 at 01:37:02PM +0200, Thomas Bogendoerfer wrote:
>>  On Tue, Jul 28, 2020 at 01:19:35PM +0200, Krzysztof Kozlowski wrote:
>>  > On Tue, Jul 28, 2020 at 01:12:11PM +0200, Paul Cercueil wrote:
>>  > > Hi Krzysztof,
>>  > >
>>  > > Le mar. 28 juil. 2020 =E0 12:45, Krzysztof Kozlowski=20
>> <krzk@kernel.org> a =E9crit
>>  > > :
>>  > > > The CONFIG_JZ4780_NEMC was previously a default on MIPS but=20
>> now it has
>>  > > > to be enabled manually.
>>  > > >
>>  > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>  > >
>>  > > I think you should swap the two so that there are no problems=20
>> when
>>  > > bisecting.
>>  >
>>  > Good point. I was thinking that it will go via some of MIPS trees=20
>> and
>>  > the patch #1 will just wait a cycle.  However with acks, I can=20
>> take it
>>  > through drivers/memory tree.
>>=20
>>  I've acked the patch.
>>=20
>>  Thomas.
>=20
> Thanks but now I noticed that one of changed configs
> (arch/mips/configs/rs90_defconfig) is only in MIPS tree.
>=20
> I think it is easier then to take the patch #2 (configs) via MIPS and
> wait with #1 for the next cycle or also take it via MIPS if it applies
> cleanly.

Why not take them both in the MIPS tree then? Would that conflict with=20
changes in your tree?

-Paul


