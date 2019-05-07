Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235D816D57
	for <lists+linux-mips@lfdr.de>; Tue,  7 May 2019 23:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbfEGV7J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 May 2019 17:59:09 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:43110 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfEGV7J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 May 2019 17:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1557266348; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qJOc0mI6rKbS9KZpT/NZQTGLeLuiX36FeMX/6byAcIc=;
        b=H/AYKgnRpjRQd0G9XiwjfiXN1uJLh8nNSvT+Ev+l0flsCYHb7CEKm1q0m0AMoDkKkZSVnS
        s+4VZJr0DQPn3UlO7MxnmnjyYDHxx7vGUNkWaLj5T3R7wpXcREuuW6ArEFXdh0NaWaMMg7
        Py7ks4KSpou8RbCjiTtJ8HGhITK6H8E=
Date:   Tue, 07 May 2019 23:58:51 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] MIPS: jz4740: Fix Ingenic SoCs sometimes reporting wrong
 ISA
To:     Paul Burton <paul.burton@mips.com>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <1557266331.1784.0@crapouillou.net>
In-Reply-To: <20190507211534.ndtngk273ejrvfd2@pburton-laptop>
References: <20190507194101.17112-1-paul@crapouillou.net>
        <20190507211534.ndtngk273ejrvfd2@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



Le mar. 7 mai 2019 =E0 23:15, Paul Burton <paul.burton@mips.com> a=20
=E9crit :
> Hi Paul,
>=20
> On Tue, May 07, 2019 at 09:41:01PM +0200, Paul Cercueil wrote:
>>  The config0 register in the Xburst always reports a MIPS32r2
>>  ISA, but not all of them support it.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/mips/jz4740/setup.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>=20
>>  diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
>>  index 7e63c54eb8d2..2508c026bdfa 100644
>>  --- a/arch/mips/jz4740/setup.c
>>  +++ b/arch/mips/jz4740/setup.c
>>  @@ -64,6 +64,7 @@ static unsigned long __init=20
>> get_board_mach_type(const void *fdt)
>>=20
>>   void __init plat_mem_setup(void)
>>   {
>>  +	struct cpuinfo_mips *c =3D &current_cpu_data;
>>   	int offset;
>>   	void *dtb;
>>=20
>>  @@ -81,6 +82,18 @@ void __init plat_mem_setup(void)
>>   		jz4740_detect_mem();
>>=20
>>   	mips_machtype =3D get_board_mach_type(dtb);
>>  +
>>  +	switch (mips_machtype) {
>>  +	case MACH_INGENIC_JZ4740:
>>  +		/*
>>  +		 * The config0 register in the Xburst always reports a MIPS32r2
>>  +		 * ISA, but not all of them support it.
>>  +		 */
>>  +		c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;
>>  +		break;
>>  +	default:
>>  +		break;
>>  +	}
>>   }
>>=20
>>   void __init device_tree_init(void)
>>  --
>>  2.21.0.593.g511ec345e18
>=20
> Would it work to check the PRID instead? That way we could keep the=20
> CPU
> probing in cpu-probe.c, for example something like this in
> cpu_probe_ingenic():
>=20
>   if ((c->processor_id & PRID_COMP_MASK) =3D=3D PRID_COMP_INGENIC_D0)
>     c->isa_level &=3D ~MIPS_CPU_ISA_M32R2;

Smart!

> That relies on the D0 PRID always being MIPS32r1 & other PRIDs always
> being MIPS32r2 though - do you know whether that's the case? Our
> comments in asm/cpu.h mapping the various PRIDs to SoCs suggests this
> would be OK to me.

All the SoCs up to the jz4760 (included) have the D0 PRID and are=20
MIPS32r1,
and the first one to use a different PRID is the jz4770 which is also=20
the
first one which is MIPS32r2, so it works perfectly.

> Thanks,
>     Paul

=

