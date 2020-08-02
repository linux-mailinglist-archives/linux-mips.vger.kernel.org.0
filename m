Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDED2355DF
	for <lists+linux-mips@lfdr.de>; Sun,  2 Aug 2020 09:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbgHBH6C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 2 Aug 2020 03:58:02 -0400
Received: from crapouillou.net ([89.234.176.41]:54644 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgHBH6C (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 2 Aug 2020 03:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1596355079; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LlM/FDSTdbnkN4Hg3fJADY2E37puQzth4o+mF6JcZBI=;
        b=vO2casJmtUJRuUn4Jm6MSyp4/FO3SNGqgRTZOAH9KJDTdBLQFcBr2glnHB+xEcd+7LArwV
        osZBfPGQU3KAMKzZ7qItBJkM+nmTeo2vGTL9HluG58jmnX7ml08REP/w5khiXY9UURjJmZ
        8TZ+bRXwz6HCZ7HQly9exQv+FrqPTms=
Date:   Sun, 02 Aug 2020 09:57:49 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: Remove JZ4780 DMA driver entry
To:     "Maciej W. Rozycki" <macro@wdc.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Maciej W. Rozycki" <macro@linux-mips.org>
Message-Id: <DGFFEQ.RMDW72DK0U5B1@crapouillou.net>
In-Reply-To: <alpine.LFD.2.21.2008012327070.24175@redsun52.ssa.fujisawa.hgst.com>
References: <20200726155559.4650-1-krzk@kernel.org>
        <alpine.LFD.2.21.2008012327070.24175@redsun52.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maciej,

Le sam. 1 ao=FBt 2020 =E0 23:30, Maciej W. Rozycki <macro@wdc.com> a=20
=E9crit :
> On Sun, 26 Jul 2020, Krzysztof Kozlowski wrote:
>=20
>>  diff --git a/MAINTAINERS b/MAINTAINERS
>>  index cba0ed77775b..362863cae239 100644
>>  --- a/MAINTAINERS
>>  +++ b/MAINTAINERS
>>  @@ -8541,11 +8541,6 @@ F:	include/uapi/rdma/
>>   F:	samples/bpf/ibumad_kern.c
>>   F:	samples/bpf/ibumad_user.c
>>=20
>>  -INGENIC JZ4780 DMA Driver
>>  -M:	Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>>  -S:	Maintained
>>  -F:	drivers/dma/dma-jz4780.c
>>  -
>=20
>  FYI, the usual approach would be marking the entry "Orphan" rather=20
> than
> removing it entirely, so that the mapping remains and makes it easy=20
> for
> someone to pick it up.

This is OK in this case, as the driver is also listed as part of the=20
"INGENIC JZ47xx SoCs".

-Paul


