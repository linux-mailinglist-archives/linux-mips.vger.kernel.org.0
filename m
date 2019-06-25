Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 430445562A
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 19:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731131AbfFYRrq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 13:47:46 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40816 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729493AbfFYRrp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 13:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561484862; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EVTVbMsCSjQzsSGM7XCSUEIELSlkRRQLrdI9FXq1fYg=;
        b=I5VaVXau0WYEvLY0+ThTCn8lOoVV25LOpS4WXggxtDRrOTlkMd1je79pyQQADeqrXUuEDs
        4KVxkYs0sLV0LEQgVmb0LvE0ep2awhNb5yLGjDccUym35LLBRhSoRhcZyUcP3CQ9v1i+B9
        fero1NZR8XqCyr37PzfLE+FpxGb8NKE=
Date:   Tue, 25 Jun 2019 19:47:32 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v13 04/13] mfd: Add Ingenic TCU driver
To:     Paul Burton <paul.burton@mips.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
Message-Id: <1561484852.10069.0@crapouillou.net>
In-Reply-To: <20190625173026.dbvx44iwywnijjql@pburton-laptop>
References: <20190624225759.18299-1-paul@crapouillou.net>
        <20190624225759.18299-5-paul@crapouillou.net>
        <20190625173026.dbvx44iwywnijjql@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mar. 25 juin 2019 =E0 19:30, Paul Burton <paul.burton@mips.com> a=20
=E9crit :
> Hi Paul,
>=20
> On Tue, Jun 25, 2019 at 12:57:50AM +0200, Paul Cercueil wrote:
>>  +static const struct of_device_id ingenic_tcu_of_match[] =3D {
>>  +	{ .compatible =3D "ingenic,jz4740-tcu", .data =3D &jz4740_soc_info, }=
,
>>  +	{ .compatible =3D "ingenic,jz4725b-tcu", .data =3D &jz4725b_soc_info,=
=20
>> },
>>  +	{ .compatible =3D "ingenic,jz4770-tcu", .data =3D &jz4740_soc_info, }=
,
>>  +	{ }
>>  +};
>=20
> Nit: why not order these numerically? ie. 25b, 40, 70.

They are in chronological order - the jz4725b is newer than the jz4740.

>>  +static struct regmap * __init ingenic_tcu_create_regmap(struct=20
>> device_node *np)
>>  +{
>>  +	struct resource res;
>>  +	void __iomem *base;
>>  +	struct regmap *map;
>>  +
>>  +	if (!of_match_node(ingenic_tcu_of_match, np))
>>  +		return ERR_PTR(-EINVAL);
>>  +
>>  +	base =3D of_io_request_and_map(np, 0, "TCU");
>>  +	if (IS_ERR(base))
>>  +		return ERR_PTR(PTR_ERR(base));
>=20
> This is equivalent to:
>=20
>     return ERR_CAST(base);

Alright - I'll fix it in a following patch if this V13 gets merged,
or in the V14 patchset.

> Apart from those:
>=20
>     Reviewed-by: Paul Burton <paul.burton@mips.com>
>=20
> Thanks,
>     Paul

=

